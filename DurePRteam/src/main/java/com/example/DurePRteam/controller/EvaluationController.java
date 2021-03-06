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
	
	// [????????? ??????]
	@RequestMapping("list")
	public String list(Criteria cri, Model model) {

		// ????????? ??????
		// ?????? ??? ??????
		int evaluationTotalCount = evaluationMapper.findAllCount();

		// ????????? ??????
		Paging paging = new Paging();
		paging.setCri(cri);
		paging.setTotalCount(evaluationTotalCount);

		// ????????? ????????????
		List<Evaluation> evaluations = evaluationMapper.findAll(cri);
		// ????????? ?????? ???
		

		// ???????????????
		model.addAttribute("piproperty", "000");	// ??????
		model.addAttribute("suPIProperty", "00");	// ??????
		
		// selectbox
		model.addAttribute("selPIProperty", commonPropMapper.findAllS());					// ??????
		model.addAttribute("selSuPIProperty", commonSubPropMapper.findByPropCode("000"));	// ??????(????????? ????????????)
		
		model.addAttribute("evaluations", evaluations);
		model.addAttribute("paging", paging);
		model.addAttribute("criteria", cri);

		return "evaluation/list";
	}
    
    // [????????????] ???????????????
 	@GetMapping("create")
 	public String create(Model model, int planNo) throws Exception {
 		int evalCnt = evaluationMapper.findByPlanNoCount(planNo);
 		
 		// ????????? ?????? ?????? ??????
 		if (evalCnt == 0) {
 			// ??????
 			Evaluation eval = planningMapper.findByPlanNo(planNo);
 			evaluationMapper.insert(eval);
 			
 			// ??????????????? ??????
 			List<PlanningGoodsInfo> planningGoodsInfos = planningGoodsInfoMapper.findByPlanNo(planNo); 			
 			for (PlanningGoodsInfo plan : planningGoodsInfos) {
 				evaluationGoodsInfoMapper.copy(plan, eval.getEvalNo());
 	        }
 		}
 		
 		// ????????? ??????
 		Evaluation evaluation = evaluationMapper.findByPlanNo(planNo);
 		
 		model.addAttribute("evaluation", evaluation);
 		
 		// selectbox
		model.addAttribute("selPIProperty", commonPropMapper.findAllS());	// ??????
		model.addAttribute("selSuPIProperty", null);						// ??????
		model.addAttribute("selGubuns", commonCodeDetailMapper.findByMasterCode("PL0001")); 		// ????????????
		model.addAttribute("selReasons", commonCodeDetailMapper.findByMasterCode("PL0002")); 		// ????????????
		model.addAttribute("selWeathers", commonCodeDetailMapper.findByMasterCode("EV0001")); 		// ??????
		model.addAttribute("selTemperatures", commonCodeDetailMapper.findByMasterCode("EV0002")); 	// ??????
 		
 		return "evaluation/eval01";
 	}
 	
	// [????????????] ??????
	@PostMapping("create")
	public String create(Model model, Evaluation evaluation) throws Exception {
		String state = evaluation.getState();
		if (state == null || state.equals("") || state == "W") {
			evaluationMapper.update01(evaluation);
		}

		return "redirect:edit02?evalNo=" + evaluation.getEvalNo();
	}
 	
	// [????????????] ???????????????
	@GetMapping("edit01")
	public String edit01(Model model, int evalNo) {
		Evaluation evaluation = evaluationMapper.findByEvalNo(evalNo);

		model.addAttribute("evaluation", evaluation);

		// selectbox
		model.addAttribute("selPIProperty", commonPropMapper.findAllS());	// ??????
		model.addAttribute("selSuPIProperty", commonSubPropMapper.findByPropCode(evaluation.getPiproperty()));	// ??????
		model.addAttribute("selGubuns", commonCodeDetailMapper.findByMasterCode("PL0001")); // ????????????
		model.addAttribute("selReasons", commonCodeDetailMapper.findByMasterCode("PL0002")); // ????????????
		model.addAttribute("selWeathers", commonCodeDetailMapper.findByMasterCode("EV0001")); 		// ??????
		model.addAttribute("selTemperatures", commonCodeDetailMapper.findByMasterCode("EV0002")); 	// ??????

		return "evaluation/eval01";
	}

	// [????????????] ??????
	@PostMapping("edit01")
	public String edit01(Model model, Evaluation evaluation) {
		String state = evaluation.getState();
		if (state == null || state.equals("") || state == "W") {
			evaluationMapper.update01(evaluation);
		}

		return "redirect:edit02?evalNo=" + evaluation.getEvalNo();
	}    
    
	// [????????????] ???????????????
	@GetMapping("edit02")
	public String edit02(Model model, int evalNo) throws Exception {
		Evaluation evaluation = evaluationMapper.findByEvalNo(evalNo);

		model.addAttribute("evaluation", evaluation);

		// selectbox
		model.addAttribute("selGmGubuns", commonCodeDetailMapper.findByMasterCode("PL0003")); // ???????????????
		model.addAttribute("selStartTimes", commonCodeDetailMapper.findByMasterCode("PL0004")); // ????????????
		model.addAttribute("selEndTimes", commonCodeDetailMapper.findByMasterCode("PL0005")); // ????????????
		model.addAttribute("selgoodsEvalGubuns", commonCodeDetailMapper.findByMasterCode("EV0003")); // ??????????????? ??????

		return "evaluation/eval02";
	}
	
	// [????????????] ??????(????????????)
	@PostMapping("save02")
	public String save02(Model model, Evaluation evaluation) {
		String state = evaluation.getState();
		if (state == null || state.equals("") || state == "W") {
			evaluationMapper.update02(evaluation);
		}

		return "redirect:edit02?evalNo=" + evaluation.getEvalNo();
	}

	// [????????????] ??????(??????)
	@PostMapping("edit02")
	public String edit02(Model model, Evaluation evaluation) {
		String state = evaluation.getState();
		if (state == null || state.equals("") || state == "W") {
			evaluationMapper.update02(evaluation);
		}
		
		return "redirect:edit03?evalNo=" + evaluation.getEvalNo();
	}
    
	// [????????????] ???????????????
	@GetMapping("edit03")
	public String edit03(Model model, int evalNo) throws Exception {
		Evaluation evaluation = evaluationMapper.findByEvalNo(evalNo);
		
		// ????????? ???????????? ?????????
		List<GoodsEval> goodsEvals = goodsEvalMapper.findByDetailCode(evaluation.getGoodsEvalGubun());
		List<EvaluationGoodsEval> eGoodsEvals = evaluationGoodsEvalMapper.findByEvalNo(evaluation.getEvalNo());
		
		model.addAttribute("evaluation", evaluation);
		model.addAttribute("goodsEvals", goodsEvals);

		// selectbox
		model.addAttribute("selEvalScores", commonCodeDetailMapper.findByMasterCodeDesc("EV0005")); // ??????????????? ??????

		return "evaluation/eval03";
	}
	
	// [???????????????] ??????(????????????)
	@PostMapping("save03")
	public String save03(Model model, Evaluation evaluation) {
		String state = evaluation.getState();
		if (state == null || state.equals("") || state == "W") {
			evaluationMapper.update03(evaluation);
		}

		return "redirect:edit03?evalNo=" + evaluation.getEvalNo();
	}

	// [???????????????] ??????(??????)
	@PostMapping("edit03")
	public String edit03(Model model, Evaluation evaluation) {
		String state = evaluation.getState();
		if (state == null || state.equals("") || state == "W") {
			evaluationMapper.update03(evaluation);
		}

		return "redirect:edit04?evalNo=" + evaluation.getEvalNo();
	}
    
	// [??????1] ???????????????
	@GetMapping("edit04")
	public String edit04(Model model, int evalNo) throws Exception {
		Evaluation evaluation = evaluationMapper.findByEvalNo(evalNo);
		
		model.addAttribute("evaluation", evaluation);

		// selectbox
		model.addAttribute("selP4Weathers", commonCodeDetailMapper.findByMasterCodeDesc("EV0006")); 	// ??????1 ??????/??????
		model.addAttribute("selP4Settings", commonCodeDetailMapper.findByMasterCodeDesc("EV0007")); 	// ??????1 ??????/??????
		model.addAttribute("selP4Ments", commonCodeDetailMapper.findByMasterCodeDesc("EV0008")); 		// ??????1 ?????????/??????
		model.addAttribute("selP4Supports", commonCodeDetailMapper.findByMasterCodeDesc("EV0009")); 	// ??????1 ????????????
		model.addAttribute("selP4PRMethods", commonCodeDetailMapper.findByMasterCodeDesc("EV0010")); 	// ??????1 ????????????
		model.addAttribute("selP4GoodsSels", commonCodeDetailMapper.findByMasterCodeDesc("EV0011")); 	// ??????1 ???????????????
		model.addAttribute("selP4Ages", commonCodeDetailMapper.findByMasterCode("EV0012")); 			// ??????1 ???????????????
		model.addAttribute("selP4Genders", commonCodeDetailMapper.findByMasterCode("EV0013")); 			// ??????1 ???????????????
		model.addAttribute("selP4Responses", commonCodeDetailMapper.findByMasterCodeDesc("EV0014")); 	// ??????1 ??????????????????
		model.addAttribute("selP4Times", commonCodeDetailMapper.findByMasterCode("EV0015")); 			// ??????1 ???????????????

		return "evaluation/eval04";
	}
    
	// [??????1] ??????(????????????)
	@PostMapping("save04")
	public String save04(Model model, Evaluation evaluation) {
		String state = evaluation.getState();
		if (state == null || state.equals("") || state == "W") {
			evaluationMapper.update04(evaluation);
		}

		return "redirect:edit04?evalNo=" + evaluation.getEvalNo();
	}

	// [??????1] ??????(??????)
	@PostMapping("edit04")
	public String edit04(Model model, Evaluation evaluation) {
		String state = evaluation.getState();
		if (state == null || state.equals("") || state == "W") {
			evaluationMapper.update04(evaluation);
		}

		return "redirect:edit05?evalNo=" + evaluation.getEvalNo();
	}
	
	// [??????2] ???????????????
	@GetMapping("edit05")
	public String edit05(Model model, int evalNo) throws Exception {
		Evaluation evaluation = evaluationMapper.findByEvalNo(evalNo);
		
		// ????????? ??????
		
		model.addAttribute("evaluation", evaluation);

		return "evaluation/eval05";
	}
	
	// [??????2] ??????(????????????)
	@PostMapping("save05")
	public String save05(Model model, Evaluation evaluation) {
		String state = evaluation.getState();
		if (state == null || state.equals("") || state == "W") {
			evaluationMapper.update05(evaluation);
		}

		return "redirect:edit05?evalNo=" + evaluation.getEvalNo();
	}

	// [??????2] ??????(??????)
	@PostMapping("edit05")
	public String edit05(Model model, Evaluation evaluation) {
		String state = evaluation.getState();
		if (state == null || state.equals("") || state == "W") {
			evaluationMapper.update05(evaluation);
		}

		return "redirect:list";
	}
	
	// [???????????????] ????????????
	@PostMapping("request")
	@ResponseBody
	public void request(HttpServletResponse response, @RequestBody Evaluation evaluation) throws Exception {
		// ????????????
		evaluationMapper.request(evaluation.getEvalNo());
	}
	
	// [???????????????] ???????????????
	@PostMapping("reject")
	@ResponseBody
	public void reject(Model model, @RequestBody Evaluation evaluation) throws Exception {
		// ???????????????
		evaluationMapper.reject(evaluation.getEvalNo());
	}
	
	// [???????????????] ???????????????
	@PostMapping("confirm")
	@ResponseBody
	public void confirm(Model model, @RequestBody Evaluation evaluation) throws Exception {
		// ???????????????
		evaluationMapper.confirm(evaluation.getEvalNo());
	}
}