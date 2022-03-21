package com.example.DurePRteam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.DurePRteam.dao.CommonCodeDetailMapper;
import com.example.DurePRteam.dao.CommonCodeMapper;
import com.example.DurePRteam.dto.CommonCode;
import com.example.DurePRteam.dto.CommonCodeDetail;

@Controller
@RequestMapping("admin")
public class CommonCodeDetailController {
    
	@Autowired CommonCodeMapper commonCodeMapper;
    @Autowired CommonCodeDetailMapper commonCodeDetailMapper;

    // [상세 공통코드] 등록페이지
    @GetMapping("commonCodeDetail/create")
    public String create(Model model, @RequestParam("masterCode") String masterCode) {
    	CommonCode commonCode = commonCodeMapper.findOne(masterCode);
    	    	
    	model.addAttribute("commonCode", commonCode);
    	model.addAttribute("commonCodeDetail", new CommonCodeDetail());
    	
        return "admin/commonCodeDetail/edit";
    }

    // [상세 공통코드] 등록
    @PostMapping("commonCodeDetail/create")
    public String create(Model model, CommonCodeDetail commonCodeDetail) {
    	commonCodeDetailMapper.insert(commonCodeDetail);
    	
        return "redirect:/admin/commonCode/list?masterCode=" + commonCodeDetail.getMasterCode();
    }
    
    // [상세 공통코드] 수정페이지
    @GetMapping("commonCodeDetail/edit")
    public String edit(Model model, String masterCode, String detailCode) {
    	CommonCode commonCode = commonCodeMapper.findOne(masterCode);
    	CommonCodeDetail commonCodeDetail = commonCodeDetailMapper.findOne(masterCode, detailCode);
    	
    	model.addAttribute("commonCode", commonCode);
        model.addAttribute("commonCodeDetail", commonCodeDetail);
        
        return "admin/commonCodeDetail/edit";
    }
    
    // [상세 공통코드] 수정
    @PostMapping("commonCodeDetail/edit")
    public String edit(Model model, CommonCodeDetail commonCodeDetail) {
    	commonCodeDetailMapper.update(commonCodeDetail);
    	
        return "redirect:/admin/commonCode/list?masterCode=" + commonCodeDetail.getMasterCode();
    }
}