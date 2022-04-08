package com.example.DurePRteam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.DurePRteam.dto.CommonProp;
import com.example.DurePRteam.dto.CommonsSubProp;
import com.example.DurePRteam.mapper.CommonPropMapper;
import com.example.DurePRteam.mapper.CommonSubPropMapper;
import com.example.DurePRteam.paging.Criteria;
import com.example.DurePRteam.paging.Paging;

@Controller
@RequestMapping("admin")
public class CommonPropController {

    @Autowired CommonPropMapper commonPropMapper;
    @Autowired CommonSubPropMapper commonSubPropMapper;

    // [공통코드] 리스트 + 상세리스트
    @RequestMapping("commonProp/list")
    public String list(Criteria cri, Model model, String piProperty) {

    	// 페이징 시작
    	// 전체 글 개수
		int commonPropTotalCount = commonPropMapper.findAllCount();

		// 페이징 객체
		Paging paging = new Paging();
		paging.setCri(cri);
		paging.setTotalCount(commonPropTotalCount);

		// 리스트 조회쿼리
		List<CommonProp> commonProps = commonPropMapper.findAll(cri);

		// 리스트 조회쿼리
		//List<CommonProp> commonAllProps = commonPropMapper.findAllS();
		// 페이징 소스 끝

		// 상세정보 테이블은 페이징 X
        //List<CommonCode> commonCodes = commonCodeMapper.findAll();
        List<CommonsSubProp> commonSubProps = commonSubPropMapper.findByPropCode(piProperty);

        model.addAttribute("piProperty", piProperty);
        model.addAttribute("commonProps", commonProps);
        model.addAttribute("commonSubProps", commonSubProps);
        model.addAttribute("paging", paging);
        model.addAttribute("criteria", cri);

        return "admin/commonProp/list";
    }

    // [공통코드] 수정페이지
    @GetMapping("commonProp/edit")
    public String edit(Model model, String piProperty) {
    	System.out.println(piProperty);
    	CommonProp commonProp = commonPropMapper.findOne(piProperty);

        model.addAttribute("commonProp", commonProp);

        return "admin/commonProp/edit";
    }

    // [공통코드] 수정
    @PostMapping("commonProp/edit")
    public String edit(Model model, CommonProp commonProp) {
    	commonPropMapper.update(commonProp);

        return "redirect:list";
    }

}