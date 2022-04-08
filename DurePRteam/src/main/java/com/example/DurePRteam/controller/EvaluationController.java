package com.example.DurePRteam.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.DurePRteam.dto.Evaluation;
import com.example.DurePRteam.dto.GoodsEval;
import com.example.DurePRteam.dto.Planning;
import com.example.DurePRteam.dto.PlanningGoodsInfo;
import com.example.DurePRteam.mapper.CommonCodeDetailMapper;
import com.example.DurePRteam.mapper.EvaluationGoodsInfoMapper;
import com.example.DurePRteam.mapper.EvaluationMapper;
import com.example.DurePRteam.mapper.GoodsEvalMapper;
import com.example.DurePRteam.mapper.PlanningGoodsInfoMapper;
import com.example.DurePRteam.mapper.PlanningMapper;

@Controller
@RequestMapping("evaluation")
public class EvaluationController {

	@Autowired EvaluationMapper evaluationMapper;
	@Autowired EvaluationGoodsInfoMapper evaluationGoodsInfoMapper;
	
	@Autowired PlanningMapper planningMapper;
	@Autowired PlanningGoodsInfoMapper planningGoodsInfoMapper;
	
	@Autowired CommonCodeDetailMapper commonCodeDetailMapper;
	@Autowired GoodsEvalMapper goodsEvalMapper;

    @RequestMapping("evalList")
    public String evalList() throws Exception {

        return "evaluation/evalList";
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
 		// 단협, 매장 모델 추가
		model.addAttribute("selGubuns", commonCodeDetailMapper.findByMasterCode("PL0001")); 		// 행사구분
		model.addAttribute("selReasons", commonCodeDetailMapper.findByMasterCode("PL0002")); 		// 진행배경
		model.addAttribute("selWeathers", commonCodeDetailMapper.findByMasterCode("EV0001")); 		// 날씨
		model.addAttribute("selTemperatures", commonCodeDetailMapper.findByMasterCode("EV0002")); 	// 기온
 		
 		return "evaluation/eval01";
 	}
 	
	// [기본사항] 신규
	@PostMapping("create")
	public String create(Model model, Evaluation evaluation) throws Exception {
		evaluationMapper.update01(evaluation);

		return "redirect:edit02?evalNo=" + evaluation.getEvalNo();
	}
 	
	// [기본사항] 수정페이지
	@GetMapping("edit01")
	public String edit01(Model model, int evalNo) {
		Evaluation evaluation = evaluationMapper.findByEvalNo(evalNo);

		model.addAttribute("evaluation", evaluation);

		// 단협, 매장 모델 추가

		// selectbox
		model.addAttribute("selGubuns", commonCodeDetailMapper.findByMasterCode("PL0001")); // 행사구분
		model.addAttribute("selReasons", commonCodeDetailMapper.findByMasterCode("PL0002")); // 진행배경
		model.addAttribute("selWeathers", commonCodeDetailMapper.findByMasterCode("EV0001")); 		// 날씨
		model.addAttribute("selTemperatures", commonCodeDetailMapper.findByMasterCode("EV0002")); 	// 기온

		return "evaluation/eval01";
	}

	// [기본사항] 수정
	@PostMapping("edit01")
	public String edit01(Model model, Evaluation evaluation) {
		evaluationMapper.update01(evaluation);

		return "redirect:edit02?evalNo=" + evaluation.getEvalNo();
	}    
    
	// [판매결과] 수정페이지
	@GetMapping("edit02")
	public String edit02(Model model, int evalNo) throws Exception {
		Evaluation evaluation = evaluationMapper.findByEvalNo(evalNo);

		model.addAttribute("evaluation", evaluation);

		// 단협, 매장 모델 추가

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
		evaluationMapper.update02(evaluation);

		return "redirect:edit02?evalNo=" + evaluation.getEvalNo();
	}

	// [판매결과] 수정(다음)
	@PostMapping("edit02")
	public String edit02(Model model, Evaluation evaluation) {
		evaluationMapper.update02(evaluation);

		return "redirect:edit03?evalNo=" + evaluation.getEvalNo();
	}
    
	// [판매결과] 수정페이지
	@GetMapping("edit03")
	public String edit03(Model model, int evalNo) throws Exception {
		Evaluation evaluation = evaluationMapper.findByEvalNo(evalNo);
		
		// 구분별 평가항목 리스트
		List<GoodsEval> goodsEvals = goodsEvalMapper.findByDetailCode(evaluation.getGoodsEvalGubun());
		
		model.addAttribute("evaluation", evaluation);
		model.addAttribute("goodsEvals", goodsEvals);

		// selectbox
		model.addAttribute("selEvalScores", commonCodeDetailMapper.findByMasterCodeDesc("EV0005")); // 생활재평가 점수

		return "evaluation/eval03";
	}  
    
    @RequestMapping("/evaluation/eval04")
    public String eval04() throws Exception {

        return "evaluation/eval04";
    }    
    
    @RequestMapping("/evaluation/eval05")
    public String eval05() throws Exception {

        return "evaluation/eval05";
    }    
}