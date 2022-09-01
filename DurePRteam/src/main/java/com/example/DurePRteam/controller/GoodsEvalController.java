package com.example.DurePRteam.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.DurePRteam.dto.GoodsEval;
import com.example.DurePRteam.dto.UserMain;
import com.example.DurePRteam.mapper.CommonCodeDetailMapper;
import com.example.DurePRteam.mapper.GoodsEvalMapper;
import com.example.DurePRteam.paging.Criteria;
import com.example.DurePRteam.paging.Paging;

@Controller
@SessionAttributes("user")
@RequestMapping("admin")
public class GoodsEvalController {
    
	@Autowired GoodsEvalMapper goodsEvalMapper;
	@Autowired CommonCodeDetailMapper commonCodeDetailMapper;
    
	// 로그인 정보 없는 경우
	@ModelAttribute("user")
	public UserMain setUser() {
		//System.out.println("*********[생활재평가 구분별 항목] 로그인정보 없음*******");
		return new UserMain();
	}
		
    // [관리자페이지-생활재평가 구분별 항목] 리스트
    @GetMapping("goodsEval/list")
    public String list(@ModelAttribute("user") UserMain user, HttpServletResponse response, Criteria cri, Model model) throws IOException {    	

    	// 로그인정보 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return null;
		}
		
		// 관리자 체크
		if (!user.getUserLevel().equals("A")) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('권한이 없습니다. 메인페이지로 이동합니다.'); location.href='/'; </script>");
			out.flush();
			return null;
		}
		
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
    public String create(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model) throws IOException {
    	
    	// 로그인정보 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return null;
		}
		
		// 관리자 체크
		if (!user.getUserLevel().equals("A")) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('권한이 없습니다. 메인페이지로 이동합니다.'); location.href='/'; </script>");
			out.flush();
			return null;
		}
        model.addAttribute("goodsEval", new GoodsEval());
        
		// selectbox
		model.addAttribute("selGubuns", commonCodeDetailMapper.findByMasterCode("EV0003")); // 생활재평가 구분
		model.addAttribute("selItems", commonCodeDetailMapper.findByMasterCode("EV0004")); // 생활재평가 항목
		
        return "admin/goodsEval/edit";
    }

    // [관리자페이지-생활재평가 구분별 항목] 등록
    @PostMapping("goodsEval/create")
    public String create(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model, GoodsEval goodsEval) throws IOException {
    	
    	// 로그인정보 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return null;
		}
		
		// 관리자 체크
		if (!user.getUserLevel().equals("A")) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('권한이 없습니다. 메인페이지로 이동합니다.'); location.href='/'; </script>");
			out.flush();
			return null;
		}
    	goodsEvalMapper.insert(goodsEval, user);
    	
        return "redirect:list";
    }
    
    // [관리자페이지-생활재평가 구분별 항목] 수정페이지
    @GetMapping("goodsEval/edit")
    public String edit(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model, int cgeNo) throws IOException {
    	
    	// 로그인정보 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return null;
		}
		
		// 관리자 체크
		if (!user.getUserLevel().equals("A")) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('권한이 없습니다. 메인페이지로 이동합니다.'); location.href='/'; </script>");
			out.flush();
			return null;
		}
		
    	GoodsEval goodsEval = goodsEvalMapper.findOne(cgeNo);
    	
        model.addAttribute("goodsEval", goodsEval);
        
        return "admin/goodsEval/edit";
    }
    
    // [관리자페이지-생활재평가 구분별 항목] 삭제
    @RequestMapping("goodsEval/delete")
    public String delete(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model, GoodsEval goodsEval) throws IOException {
    	
    	// 로그인정보 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return null;
		}
		
		// 관리자 체크
		if (!user.getUserLevel().equals("A")) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('권한이 없습니다. 메인페이지로 이동합니다.'); location.href='/'; </script>");
			out.flush();
			return null;
		}    	
    	goodsEvalMapper.delete(goodsEval);
    	
        return "redirect:list";
    }
}