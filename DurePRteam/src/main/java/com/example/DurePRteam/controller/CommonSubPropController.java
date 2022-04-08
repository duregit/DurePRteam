package com.example.DurePRteam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.DurePRteam.dto.CommonProp;
import com.example.DurePRteam.dto.CommonsSubProp;
import com.example.DurePRteam.mapper.CommonCodeMapper;
import com.example.DurePRteam.mapper.CommonPropMapper;
import com.example.DurePRteam.mapper.CommonSubPropMapper;

@Controller
@RequestMapping("admin")
public class CommonSubPropController {

    @Autowired CommonCodeMapper commonCodeMapper;
    @Autowired CommonPropMapper commonPropMapper;
    @Autowired CommonSubPropMapper commonSubPropMapper;

    // [상세 공통코드] 등록페이지
    @GetMapping("commonSubProp/create")
    public String create(Model model, @RequestParam("piProperty") String piProperty) {
    	//CommonCode commonCode = commonCodeMapper.findOne(piProperty);
    	CommonProp commonProp = commonPropMapper.findOne(piProperty);

    	model.addAttribute("commonProp", commonProp);
    	model.addAttribute("commonsSubProp", new CommonsSubProp());

        return "admin/commonSubProp/edit";
    }

    // [상세 공통코드] 등록
    @PostMapping("commonSubProp/create")
    public String create(Model model, CommonsSubProp commonsSubProp) {
    	commonSubPropMapper.insert(commonsSubProp);
    	System.out.println("생성");

        return "redirect:/admin/commonProp/list?piProperty=" + commonsSubProp.getPiProperty();
    }

    // [상세 공통코드] 수정페이지
    @GetMapping("commonSubProp/edit")
    public String edit(Model model, String piProperty, String suPiproperty) {
    	//CommonCode commonCode = commonCodeMapper.findOne(masterCode);
    	CommonProp commonProp = commonPropMapper.findOne(piProperty);
    	//CommonCodeDetail commonCodeDetail = commonCodeDetailMapper.findOne(masterCode, detailCode);
    	CommonsSubProp commonsSubProp = commonSubPropMapper.findOne(piProperty, suPiproperty);

    	//model.addAttribute("commonCode", commonCode);
    	model.addAttribute("commonProp", commonProp);
        //model.addAttribute("commonCodeDetail", commonCodeDetail);
    	model.addAttribute("commonsSubProp", commonsSubProp);

        return "admin/commonSubProp/edit";
    }

    // [상세 공통코드] 수정
    @PostMapping("commonSubProp/edit")
    public String edit(Model model, CommonsSubProp commonsSubProp) {
    	commonSubPropMapper.update(commonsSubProp);

        return "redirect:/admin/commonSubProp/edit?piProperty=" + commonsSubProp.getPiProperty() + "&suPiproperty=" + commonsSubProp.getSuPiproperty();
    }
}