package com.example.DurePRteam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.DurePRteam.dto.CommonCode;
import com.example.DurePRteam.dto.CommonCodeDetail;
import com.example.DurePRteam.dto.Planning;
import com.example.DurePRteam.mapper.CommonCodeDetailMapper;
import com.example.DurePRteam.mapper.PlanningMapper;

@Controller
@RequestMapping("planning")
public class PlanningController {
    
    @Autowired PlanningMapper planningMapper;
    @Autowired CommonCodeDetailMapper commonCodeDetailMapper;

    // [계획서 조회]
    @RequestMapping("list")
    public String list(Model model) {
        List<Planning> plannings = planningMapper.findAll();
        model.addAttribute("plannings", plannings);
        return "planning/list";
    }

    // [기본사항] 신규페이지
    @GetMapping("create")
    public String create(Model model) throws Exception {
        model.addAttribute("planning", new Planning());
        
        // 단협, 매장 모델 추가
        
        // selectbox
        model.addAttribute("selGubuns", commonCodeDetailMapper.findByMasterCode("PL0001")); 	// 행사구분
        model.addAttribute("selReasons", commonCodeDetailMapper.findByMasterCode("PL0002"));	// 진행배경
        
        return "planning/plan01";
    }
    
    // [기본사항] 신규
    @PostMapping("create")
    public String create(Model model, Planning planning) throws Exception {
    	// (신규)다음 >>> 계획서 생성
    	planningMapper.insert(planning);
    	
    	model.addAttribute("planning", planning);
    	
    	return "redirect:plan02?planNo=" + planning.getPlanNo();
    }
    
    // [기본사항] 수정페이지
    @GetMapping("edit01")
    public String edit01(Model model, int planNo) {
    	Planning planning = planningMapper.findOne(planNo);
    	
        model.addAttribute("planning", planning);
        
        // 단협, 매장 모델 추가
        
        // selectbox
        model.addAttribute("selGubuns", commonCodeDetailMapper.findByMasterCode("PL0001")); 	// 행사구분
        model.addAttribute("selReasons", commonCodeDetailMapper.findByMasterCode("PL0002"));	// 진행배경
        
        return "planning/plan01";
    }
    
    // [기본사항] 수정
    @PostMapping("edit01")
    public String edit01(Model model, Planning planning) {
    	planningMapper.update01(planning);
    	
    	return "redirect:edit02?planNo=" + planning.getPlanNo();
    }
    
    // [판매계획] 수정페이지
    @RequestMapping("edit02")
    public String edit02(Model model, int planNo) throws Exception {
    	Planning planning = planningMapper.findOne(planNo);
    	
        model.addAttribute("planning", planning);
        
        // 단협, 매장 모델 추가
        
        // selectbox
        model.addAttribute("selGmGubuns", commonCodeDetailMapper.findByMasterCode("PL0003")); 	// 생활재구분
        model.addAttribute("selStartTimes", commonCodeDetailMapper.findByMasterCode("PL0004"));	// 시작시간
        model.addAttribute("selEndTimes", commonCodeDetailMapper.findByMasterCode("PL0005"));	// 종료시간
        
        return "planning/plan02";
    }
    
    // [판매계획] 수정
    @PostMapping("edit02")
    public String edit02(Model model, Planning planning) {
    	planningMapper.update01(planning);
    	
    	return "redirect:edit02?planNo=" + planning.getPlanNo();
    }    
    
//    // [기본사항] 수정
//    @PostMapping("edit02")
//    public String edit02(Model model, Planning planning) {
//    	planningMapper.update02(planning);
//    	
//    	return "redirect:edit03?planNo=" + planning.getPlanNo();
//    }
    
}