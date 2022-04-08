package com.example.DurePRteam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.DurePRteam.dto.CommonCode;
import com.example.DurePRteam.dto.CommonCodeDetail;
import com.example.DurePRteam.mapper.CommonCodeDetailMapper;
import com.example.DurePRteam.mapper.CommonCodeMapper;
import com.example.DurePRteam.paging.Criteria;
import com.example.DurePRteam.paging.Paging;

@Controller
@RequestMapping("admin")
public class CommonCodeController {

    @Autowired CommonCodeMapper commonCodeMapper;
    @Autowired CommonCodeDetailMapper commonCodeDetailMapper;

    // [공통코드] 리스트 + 상세리스트
    @RequestMapping("commonCode/list")
    public String list(Criteria cri, Model model, String masterCode) {

    	// 페이징 시작
    	// 전체 글 개수
		int commonCodeTotalCount = commonCodeMapper.findAllCount();

		// 페이징 객체
		Paging paging = new Paging();
		paging.setCri(cri);
		paging.setTotalCount(commonCodeTotalCount);

		// 리스트 조회쿼리
		List<CommonCode> commonCodes = commonCodeMapper.findAll(cri);
		// 페이징 소스 끝

		// 상세정보 테이블은 페이징 X
        //List<CommonCode> commonCodes = commonCodeMapper.findAll();
        List<CommonCodeDetail> commonCodeDetails = commonCodeDetailMapper.findByMasterCode(masterCode);

        model.addAttribute("masterCode", masterCode);
        model.addAttribute("commonCodes", commonCodes);
        model.addAttribute("commonCodeDetails", commonCodeDetails);
        model.addAttribute("paging", paging);
        model.addAttribute("criteria", cri);

        return "admin/commonCode/list";
    }

    // [공통코드] 등록페이지
    @GetMapping("commonCode/create")
    public String create(Model model) {
        model.addAttribute("commonCode", new CommonCode());

        return "admin/commonCode/edit";
    }

    // [공통코드] 등록
    @PostMapping("commonCode/create")
    public String create(Model model, CommonCode commonCode) {
    	commonCodeMapper.insert(commonCode);

        return "redirect:list";
    }

    // [공통코드] 수정페이지
    @GetMapping("commonCode/edit")
    public String edit(Model model, String masterCode) {
    	System.out.println(masterCode);
    	CommonCode commonCode = commonCodeMapper.findOne(masterCode);

        model.addAttribute("commonCode", commonCode);

        return "admin/commonCode/edit";
    }

    // [공통코드] 수정
    @PostMapping("commonCode/edit")
    public String edit(Model model, CommonCode commonCode) {
    	commonCodeMapper.update(commonCode);

        return "redirect:list";
    }
}