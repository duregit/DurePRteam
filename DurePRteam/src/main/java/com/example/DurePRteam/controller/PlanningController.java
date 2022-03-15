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

    // [계획서 조회]
    @RequestMapping("list")
    public String list(Model model) {
        List<Planning> plannings = planningMapper.findAll();
        model.addAttribute("plannings", plannings);
        return "planning/list";
    }

    // [계획서 조회]
    // 신규 작성 버튼 클릭
    @GetMapping("create")
    public String create(Model model) throws Exception {
    	Planning planning = new Planning();
        model.addAttribute("planning", planning);
        
        // 단협, 매장, 행사구분, 진행배경 모델 추가
        
        return "planning/plan01";
    }
    
    // [계획서 조회]
    // 계획서 선택
    @GetMapping("editPlan01")
    public String edit(Model model, @RequestParam("planNo") int planNo) {
    	Planning planning = planningMapper.findOne(planNo);
        model.addAttribute("planning", planning);
        
        // 단협, 매장, 행사구분, 진행배경 모델 추가
        
        return "planning/plan01";
    }
    
    // [계획서(기본사항)]
    // 다음 or 임시저장 버튼 클릭
    @PostMapping("submit01")
    public ModelAndView submit01(Model model, Planning planning) throws Exception {
    	String viewUrl = "planning";
    	
    	// 다음 > 2페이지 or 임시저장 > 현재페이지
    	if (planning.getBtnGubun() == "next") {
    		viewUrl += "/plan02";
    	} else if (planning.getBtnGubun() == "save") {
    		viewUrl += "/plan01";
    	}
    
    	if (planning.getPlanNo() > 0 & planning.getAddUser() == "admin") {	// 생성자 수정 필요
    		// (수정)다음 >>> 계획서 수정 (작성자 본인만 수정가능)
    		planningMapper.update01(planning);
    	} else {
    		// (신규)다음 >>> 계획서 생성
        	planningMapper.insert(planning);
    	}
    	
    	return new ModelAndView(viewUrl, "planning", planning);
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

//    @PostMapping("edit")
//    public String edit(Model model, Planning planning) {
//    	planningMapper.update(planning);
//        return "redirect:list";
//    }
//
//    @RequestMapping("delete")
//    public String delete(Model model, @RequestParam("planNo") int planNo) {
//    	planningMapper.delete(planNo);
//        return "redirect:list";
//    }
    
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