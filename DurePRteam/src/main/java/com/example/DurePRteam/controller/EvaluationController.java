package com.example.DurePRteam.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.DurePRteam.dto.Evaluation;
import com.example.DurePRteam.dto.Planning;
import com.example.DurePRteam.mapper.CommonCodeDetailMapper;
import com.example.DurePRteam.mapper.EvaluationMapper;
import com.example.DurePRteam.mapper.PlanningMapper;

@Controller
@RequestMapping("evaluation")
public class EvaluationController {

	@Autowired
	EvaluationMapper evaluationMapper;
	@Autowired
	PlanningMapper planningMapper;
	@Autowired
	CommonCodeDetailMapper commonCodeDetailMapper;

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
 			Evaluation eval = planningMapper.findByPlanNo(planNo);
 			evaluationMapper.insert(eval);
 		}
 		// 평가서 조회
 		Evaluation evaluation = evaluationMapper.findByPlanNo(planNo);
 		
 		model.addAttribute("evaluation", evaluation);
 		
 		// selectbox
 		// 단협, 매장 모델 추가
		model.addAttribute("selGubuns", commonCodeDetailMapper.findByMasterCode("PL0001")); // 행사구분
		model.addAttribute("selReasons", commonCodeDetailMapper.findByMasterCode("PL0002")); // 진행배경
 			

 		
 		return "evaluation/eval01";
 	}
 	
    @RequestMapping("/evaluation/eval01")
    public String eval01() throws Exception {

        return "evaluation/eval01";
    }    
    
    @RequestMapping("/evaluation/eval02")
    public String eval02() throws Exception {

        return "evaluation/eval02";
    }    
    
    @RequestMapping("/evaluation/eval03")
    public String eval03() throws Exception {

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