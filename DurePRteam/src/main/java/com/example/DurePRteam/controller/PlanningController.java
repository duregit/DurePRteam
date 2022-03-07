package com.example.DurePRteam.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.DurePRteam.dao.PlanningMapper;
import com.example.DurePRteam.dto.Planning;
import com.example.DurePRteam.dto.TestDTO;
import com.example.DurePRteam.service.DbService;

@Controller
@RequestMapping("planning")
public class PlanningController {
    
    @Autowired PlanningMapper planningMapper;

    @RequestMapping("list")
    public String list(Model model) {
        List<Planning> plannings = planningMapper.findAll();
        model.addAttribute("plannings", plannings);
        return "planning/list";
    }

    // 계획서 조회 > 신규 작성
    @GetMapping("create")
    public ModelAndView create() throws Exception {
    	Planning planning = new Planning();
    	return new ModelAndView("planning/plan01", "planning", planning);
    }
    
    // 계획서 조회 > 계획서 선택
    @GetMapping("editPlan01")
    public String edit(Model model, @RequestParam("planNo") int planNo) {
    	Planning planning = planningMapper.findOne(planNo);
        model.addAttribute("planning", planning);
        return "planning/plan01";
    }
    
    // 계획서(기본사항) > 다음
    @RequestMapping("nextStep01")
    public ModelAndView nextStep01(Model model, Planning planning) throws Exception {    	    	
    	if (planning.getPlanNo() > 0) {
    		// 계획서 선택 > 다음 >>> 계획서 수정
    		//planningMapper.update01(planning);
    	} else {
    		// 신규 작성 > 다음 >>> 계획서 신규 생성
        	planningMapper.insert(planning);
    	}
    	
    	return new ModelAndView("planning/plan02", "planning", planning);
    }
    
    // 계획서(기본사항) > 임시저장
    @RequestMapping("tempSave01")
    public ModelAndView tempSave01(Model model, Planning planning) throws Exception {
    	if (planning.getPlanNo() > 0) {
    		// 계획서 선택 >>> 계획서 수정
    		//planningMapper.update01(planning);
    	} else {
    		// 신규 작성 >>> 계획서 신규 생성
        	planningMapper.insert(planning);
    	}
    	
    	return new ModelAndView("planning/plan01", "planning", planning);
    }
    
//    @PostMapping("create")
//    public String create(Model model, Planning planning) {
//    	planningMapper.insert(planning);
//        return "redirect:list";
//    }

//    @GetMapping("edit")
//    public String edit(Model model, @RequestParam("planNo") int planNo) {
//    	Planning planning = planningMapper.findOne(planNo);
//        model.addAttribute("planning", planning);
//        return "planning/plan01";
//    }

    @PostMapping("edit")
    public String edit(Model model, Planning planning) {
    	planningMapper.update(planning);
        return "redirect:list";
    }

    @RequestMapping("delete")
    public String delete(Model model, @RequestParam("planNo") int planNo) {
    	planningMapper.delete(planNo);
        return "redirect:list";
    }
    
//    @RequestMapping("list")
//    public String list() throws Exception {
//
//        return "planning/list";
//    }
    
//    @RequestMapping("plan01")
//    public String plan01() throws Exception {
//
//        return "planning/plan01";
//    }
    
    @RequestMapping("plan02")
    public String plan02() throws Exception {

        return "planning/plan02";
    }
    
    @RequestMapping("plan03")
    public String plan03() throws Exception {

        return "planning/plan03";
    }
    
}