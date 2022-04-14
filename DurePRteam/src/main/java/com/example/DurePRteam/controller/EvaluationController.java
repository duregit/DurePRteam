package com.example.DurePRteam.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.DurePRteam.dto.Evaluation;
import com.example.DurePRteam.dto.EvaluationGoodsEval;
import com.example.DurePRteam.dto.FileDto;
import com.example.DurePRteam.dto.GoodsEval;
import com.example.DurePRteam.dto.Planning;
import com.example.DurePRteam.dto.PlanningGoodsInfo;
import com.example.DurePRteam.mapper.CommonCodeDetailMapper;
import com.example.DurePRteam.mapper.CommonPropMapper;
import com.example.DurePRteam.mapper.CommonSubPropMapper;
import com.example.DurePRteam.mapper.EvaluationGoodsEvalMapper;
import com.example.DurePRteam.mapper.EvaluationGoodsInfoMapper;
import com.example.DurePRteam.mapper.EvaluationMapper;
import com.example.DurePRteam.mapper.GoodsEvalMapper;
import com.example.DurePRteam.mapper.PlanningGoodsInfoMapper;
import com.example.DurePRteam.mapper.PlanningMapper;
import com.example.DurePRteam.paging.Criteria;
import com.example.DurePRteam.paging.Paging;

@Controller
@RequestMapping("evaluation")
public class EvaluationController {

	@Autowired EvaluationMapper evaluationMapper;
	@Autowired EvaluationGoodsInfoMapper evaluationGoodsInfoMapper;
	@Autowired EvaluationGoodsEvalMapper evaluationGoodsEvalMapper;
	
	@Autowired PlanningMapper planningMapper;
	@Autowired PlanningGoodsInfoMapper planningGoodsInfoMapper;
	
	@Autowired CommonCodeDetailMapper commonCodeDetailMapper;
	@Autowired GoodsEvalMapper goodsEvalMapper;
	@Autowired CommonPropMapper commonPropMapper;
	@Autowired CommonSubPropMapper commonSubPropMapper;
	
	// [평가서 조회]
	@RequestMapping("list")
	public String list(Criteria cri, Model model) {

		// 페이징 시작
		// 전체 글 개수
		int evaluationTotalCount = evaluationMapper.findAllCount();

		// 페이징 객체
		Paging paging = new Paging();
		paging.setCri(cri);
		paging.setTotalCount(evaluationTotalCount);

		// 리스트 조회쿼리
		List<Evaluation> evaluations = evaluationMapper.findAll(cri);
		// 페이징 소스 끝
		

		// 사용자정보
		model.addAttribute("piproperty", "000");	// 단협
		model.addAttribute("suPIProperty", "00");	// 매장
		
		// selectbox
		model.addAttribute("selPIProperty", commonPropMapper.findAllS());					// 단협
		model.addAttribute("selSuPIProperty", commonSubPropMapper.findByPropCode("000"));	// 매장(사용자 단협정보)
		
		model.addAttribute("evaluations", evaluations);
		model.addAttribute("paging", paging);
		model.addAttribute("criteria", cri);

		return "evaluation/list";
	}
    
    // [기본사항] 신규페이지
 	@GetMapping("create")
 	public String create(Model model, int planNo) throws Exception {
 		int evalCnt = evaluationMapper.findByPlanNoCount(planNo);
 		
 		// 평가서 없는 경우 생성
 		if (evalCnt == 0) {
 			// 생성
 			Evaluation eval = planningMapper.findByPlanNo(planNo);
 			evaluationMapper.insert(eval);
 			
 			// 생활재정보 복사
 			List<PlanningGoodsInfo> planningGoodsInfos = planningGoodsInfoMapper.findByPlanNo(planNo); 			
 			for (PlanningGoodsInfo plan : planningGoodsInfos) {
 				evaluationGoodsInfoMapper.copy(plan, eval.getEvalNo());
 	        }
 		}
 		
 		// 평가서 조회
 		Evaluation evaluation = evaluationMapper.findByPlanNo(planNo);
 		
 		model.addAttribute("evaluation", evaluation);
 		
 		// selectbox
		model.addAttribute("selPIProperty", commonPropMapper.findAllS());	// 단협
		model.addAttribute("selSuPIProperty", null);						// 매장
		model.addAttribute("selGubuns", commonCodeDetailMapper.findByMasterCode("PL0001")); 		// 행사구분
		model.addAttribute("selReasons", commonCodeDetailMapper.findByMasterCode("PL0002")); 		// 진행배경
		model.addAttribute("selWeathers", commonCodeDetailMapper.findByMasterCode("EV0001")); 		// 날씨
		model.addAttribute("selTemperatures", commonCodeDetailMapper.findByMasterCode("EV0002")); 	// 기온
 		
 		return "evaluation/eval01";
 	}
 	
	// [기본사항] 신규
	@PostMapping("create")
	public String create(Model model, Evaluation evaluation) throws Exception {
		String state = evaluation.getState();
		if (state == null || state.equals("") || state == "W") {
			evaluationMapper.update01(evaluation);
		}

		return "redirect:edit02?evalNo=" + evaluation.getEvalNo();
	}
 	
	// [기본사항] 수정페이지
	@GetMapping("edit01")
	public String edit01(Model model, int evalNo) {
		Evaluation evaluation = evaluationMapper.findByEvalNo(evalNo);

		model.addAttribute("evaluation", evaluation);

		// selectbox
		model.addAttribute("selPIProperty", commonPropMapper.findAllS());	// 단협
		model.addAttribute("selSuPIProperty", commonSubPropMapper.findByPropCode(evaluation.getPiproperty()));	// 매장
		model.addAttribute("selGubuns", commonCodeDetailMapper.findByMasterCode("PL0001")); // 행사구분
		model.addAttribute("selReasons", commonCodeDetailMapper.findByMasterCode("PL0002")); // 진행배경
		model.addAttribute("selWeathers", commonCodeDetailMapper.findByMasterCode("EV0001")); 		// 날씨
		model.addAttribute("selTemperatures", commonCodeDetailMapper.findByMasterCode("EV0002")); 	// 기온

		return "evaluation/eval01";
	}

	// [기본사항] 수정
	@PostMapping("edit01")
	public String edit01(Model model, Evaluation evaluation) {
		String state = evaluation.getState();
		if (state == null || state.equals("") || state == "W") {
			evaluationMapper.update01(evaluation);
		}

		return "redirect:edit02?evalNo=" + evaluation.getEvalNo();
	}    
    
	// [판매결과] 수정페이지
	@GetMapping("edit02")
	public String edit02(Model model, int evalNo) throws Exception {
		Evaluation evaluation = evaluationMapper.findByEvalNo(evalNo);

		model.addAttribute("evaluation", evaluation);

		// selectbox
		model.addAttribute("selGmGubuns", commonCodeDetailMapper.findByMasterCode("PL0003")); // 생활재구분
		model.addAttribute("selStartTimes", commonCodeDetailMapper.findByMasterCode("PL0004")); // 시작시간
		model.addAttribute("selEndTimes", commonCodeDetailMapper.findByMasterCode("PL0005")); // 종료시간
		model.addAttribute("selgoodsEvalGubuns", commonCodeDetailMapper.findByMasterCode("EV0003")); // 생활재평가 구분

		return "evaluation/eval02";
	}
	
	// [판매결과] 수정(임시저장)
	@PostMapping("save02")
	public String save02(Model model, Evaluation evaluation) {
		String state = evaluation.getState();
		if (state == null || state.equals("") || state == "W") {
			evaluationMapper.update02(evaluation);
		}

		return "redirect:edit02?evalNo=" + evaluation.getEvalNo();
	}

	// [판매결과] 수정(다음)
	@PostMapping("edit02")
	public String edit02(Model model, Evaluation evaluation) {
		String state = evaluation.getState();
		if (state == null || state.equals("") || state == "W") {
			evaluationMapper.update02(evaluation);
		}
		
		return "redirect:edit03?evalNo=" + evaluation.getEvalNo();
	}
    
	// [판매결과] 수정페이지
	@GetMapping("edit03")
	public String edit03(Model model, int evalNo) throws Exception {
		Evaluation evaluation = evaluationMapper.findByEvalNo(evalNo);
		
		// 구분별 평가항목 리스트
		List<GoodsEval> goodsEvals = goodsEvalMapper.findByDetailCode(evaluation.getGoodsEvalGubun());
		List<EvaluationGoodsEval> eGoodsEvals = evaluationGoodsEvalMapper.findByEvalNo(evaluation.getEvalNo());
		
		model.addAttribute("evaluation", evaluation);
		model.addAttribute("goodsEvals", goodsEvals);

		// selectbox
		model.addAttribute("selEvalScores", commonCodeDetailMapper.findByMasterCodeDesc("EV0005")); // 생활재평가 점수

		return "evaluation/eval03";
	}
	
	// [생활재평가] 수정(임시저장)
	@PostMapping("save03")
	public String save03(Model model, Evaluation evaluation) {
		String state = evaluation.getState();
		if (state == null || state.equals("") || state == "W") {
			evaluationMapper.update03(evaluation);
		}

		return "redirect:edit03?evalNo=" + evaluation.getEvalNo();
	}

	// [생활재평가] 수정(다음)
	@PostMapping("edit03")
	public String edit03(Model model, Evaluation evaluation) {
		String state = evaluation.getState();
		if (state == null || state.equals("") || state == "W") {
			evaluationMapper.update03(evaluation);
		}

		return "redirect:edit04?evalNo=" + evaluation.getEvalNo();
	}
    
	// [운영1] 수정페이지
	@GetMapping("edit04")
	public String edit04(Model model, int evalNo) throws Exception {
		Evaluation evaluation = evaluationMapper.findByEvalNo(evalNo);
		
		model.addAttribute("evaluation", evaluation);

		// selectbox
		model.addAttribute("selP4Weathers", commonCodeDetailMapper.findByMasterCodeDesc("EV0006")); 	// 운영1 날씨/기후
		model.addAttribute("selP4Settings", commonCodeDetailMapper.findByMasterCodeDesc("EV0007")); 	// 운영1 준비/세팅
		model.addAttribute("selP4Ments", commonCodeDetailMapper.findByMasterCodeDesc("EV0008")); 		// 운영1 홍보물/멘트
		model.addAttribute("selP4Supports", commonCodeDetailMapper.findByMasterCodeDesc("EV0009")); 	// 운영1 매장협조
		model.addAttribute("selP4PRMethods", commonCodeDetailMapper.findByMasterCodeDesc("EV0010")); 	// 운영1 홍보방법
		model.addAttribute("selP4GoodsSels", commonCodeDetailMapper.findByMasterCodeDesc("EV0011")); 	// 운영1 생활재선택
		model.addAttribute("selP4Ages", commonCodeDetailMapper.findByMasterCode("EV0012")); 			// 운영1 주요연령대
		model.addAttribute("selP4Genders", commonCodeDetailMapper.findByMasterCode("EV0013")); 			// 운영1 조합원성별
		model.addAttribute("selP4Responses", commonCodeDetailMapper.findByMasterCodeDesc("EV0014")); 	// 운영1 조합원호응도
		model.addAttribute("selP4Times", commonCodeDetailMapper.findByMasterCode("EV0015")); 			// 운영1 주요시간대

		return "evaluation/eval04";
	}
    
	// [운영1] 수정(임시저장)
	@PostMapping("save04")
	public String save04(Model model, Evaluation evaluation) {
		String state = evaluation.getState();
		if (state == null || state.equals("") || state == "W") {
			evaluationMapper.update04(evaluation);
		}

		return "redirect:edit04?evalNo=" + evaluation.getEvalNo();
	}

	// [운영1] 수정(다음)
	@PostMapping("edit04")
	public String edit04(Model model, Evaluation evaluation) {
		String state = evaluation.getState();
		if (state == null || state.equals("") || state == "W") {
			evaluationMapper.update04(evaluation);
		}

		return "redirect:edit05?evalNo=" + evaluation.getEvalNo();
	}
	
	// [운영2] 수정페이지
	@GetMapping("edit05")
	public String edit05(Model model, int evalNo) throws Exception {
		Evaluation evaluation = evaluationMapper.findByEvalNo(evalNo);
		
		// 이미지 객체
		
		model.addAttribute("evaluation", evaluation);

		return "evaluation/eval05";
	}
	
	// [운영2] 수정(임시저장)
	@PostMapping("save05")
	public String save05(Model model, Evaluation evaluation) {
		String state = evaluation.getState();
		if (state == null || state.equals("") || state == "W") {
			evaluationMapper.update05(evaluation);
		}

		return "redirect:edit05?evalNo=" + evaluation.getEvalNo();
	}

	// [운영2] 수정(완료)
	@PostMapping("edit05")
	public String edit05(Model model, Evaluation evaluation) {
		String state = evaluation.getState();
		if (state == null || state.equals("") || state == "W") {
			evaluationMapper.update05(evaluation);
		}

		return "redirect:list";
	}
	
	// [평가서조회] 검토요청
	@PostMapping("request")
	@ResponseBody
	public void request(HttpServletResponse response, @RequestBody Evaluation evaluation) throws Exception {
		// 검토요청
		evaluationMapper.request(evaluation.getEvalNo());
	}
	
	// [평가서조회] 관리자반려
	@PostMapping("reject")
	@ResponseBody
	public void reject(Model model, @RequestBody Evaluation evaluation) throws Exception {
		// 관리자반려
		evaluationMapper.reject(evaluation.getEvalNo());
	}
	
	// [평가서조회] 관리자승인
	@PostMapping("confirm")
	@ResponseBody
	public void confirm(Model model, @RequestBody Evaluation evaluation) throws Exception {
		// 관리자승인
		evaluationMapper.confirm(evaluation.getEvalNo());
	}
}