package com.example.DurePRteam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.DurePRteam.dto.GoodsEval;
import com.example.DurePRteam.mapper.CommonCodeDetailMapper;
import com.example.DurePRteam.mapper.GoodsEvalMapper;
import com.example.DurePRteam.paging.Criteria;
import com.example.DurePRteam.paging.Paging;

@Controller
@RequestMapping("admin")
public class GoodsEvalController {
    
	@Autowired GoodsEvalMapper goodsEvalMapper;
	@Autowired CommonCodeDetailMapper commonCodeDetailMapper;
    
    // [관리자페이지-생활재평가 구분별 항목] 리스트
    @GetMapping("goodsEval/list")
    public String list(Criteria cri, Model model) {    	

    	// 페이징 시작
    	// 전체 글 개수
		int totalCount = goodsEvalMapper.findAllCount();

		// 페이징 객체
		Paging paging = new Paging();
		cri.setCustomPerPageNum(20);	// 페이지 목록 개수
		paging.setCri(cri);
		paging.setTotalCount(totalCount);

		// 리스트 조회쿼리
		List<GoodsEval> goodsEvals = goodsEvalMapper.findAll(cri);
		// 페이징 소스 끝
		
        model.addAttribute("goodsEvals", goodsEvals);
        model.addAttribute("paging", paging);
        model.addAttribute("criteria", cri);
        
        return "admin/goodsEval/list";
    }

    // [관리자페이지-생활재평가 구분별 항목] 등록페이지
    @GetMapping("goodsEval/create")
    public String create(Model model) {
        model.addAttribute("goodsEval", new GoodsEval());
        
		// selectbox
		model.addAttribute("selGubuns", commonCodeDetailMapper.findByMasterCode("EV0003")); // 생활재평가 구분
		model.addAttribute("selItems", commonCodeDetailMapper.findByMasterCode("EV0004")); // 생활재평가 항목
		
        return "admin/goodsEval/edit";
    }

    // [관리자페이지-생활재평가 구분별 항목] 등록
    @PostMapping("goodsEval/create")
    public String create(Model model, GoodsEval goodsEval) {
    	goodsEvalMapper.insert(goodsEval);
    	
        return "redirect:list";
    }
    
    // [관리자페이지-생활재평가 구분별 항목] 수정페이지
    @GetMapping("goodsEval/edit")
    public String edit(Model model, int cgeNo) {
    	GoodsEval goodsEval = goodsEvalMapper.findOne(cgeNo);
    	
        model.addAttribute("goodsEval", goodsEval);
        
        return "admin/goodsEval/edit";
    }
    
    // [관리자페이지-생활재평가 구분별 항목] 삭제
    @RequestMapping("goodsEval/delete")
    public String delete(Model model, GoodsEval goodsEval) {
    	goodsEvalMapper.delete(goodsEval);
    	
        return "redirect:list";
    }
}