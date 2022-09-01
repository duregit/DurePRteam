package com.example.DurePRteam.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.DurePRteam.dto.CommonCode;
import com.example.DurePRteam.dto.CommonCodeDetail;
import com.example.DurePRteam.dto.UserMain;
import com.example.DurePRteam.mapper.CommonCodeDetailMapper;
import com.example.DurePRteam.mapper.CommonCodeMapper;

@Controller
@SessionAttributes("user")
@RequestMapping("admin")
public class CommonCodeDetailController {
    
	@Autowired CommonCodeMapper commonCodeMapper;
    @Autowired CommonCodeDetailMapper commonCodeDetailMapper;

	// 로그인 정보 없는 경우
	@ModelAttribute("user")
	public UserMain setUser() {
		//System.out.println("*********[상세 공통코드] 로그인정보 없음*******");
		return new UserMain();
	}
	
    // [상세 공통코드] 등록페이지
    @GetMapping("commonCodeDetail/create")
    public String create(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model, @RequestParam("masterCode") String masterCode) throws Exception {
    	
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
    			
    	CommonCode commonCode = commonCodeMapper.findOne(masterCode);
    	    	
    	model.addAttribute("commonCode", commonCode);
    	model.addAttribute("commonCodeDetail", new CommonCodeDetail());
    	
        return "admin/commonCodeDetail/edit";
    }

    // [상세 공통코드] 등록
    @PostMapping("commonCodeDetail/create")
    public String create(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model, CommonCodeDetail commonCodeDetail) throws IOException {
    	
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
    			
    	commonCodeDetailMapper.insert(commonCodeDetail, user.getUserId());
    	
        return "redirect:/admin/commonCode/list?masterCode=" + commonCodeDetail.getMasterCode();
    }
    
    // [상세 공통코드] 수정페이지
    @GetMapping("commonCodeDetail/edit")
    public String edit(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model, String masterCode, String detailCode) throws IOException {
    	
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
		
    	CommonCode commonCode = commonCodeMapper.findOne(masterCode);
    	CommonCodeDetail commonCodeDetail = commonCodeDetailMapper.findOne(masterCode, detailCode);
    	
    	model.addAttribute("commonCode", commonCode);
        model.addAttribute("commonCodeDetail", commonCodeDetail);
        
        return "admin/commonCodeDetail/edit";
    }
    
    // [상세 공통코드] 수정
    @PostMapping("commonCodeDetail/edit")
    public String edit(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model, CommonCodeDetail commonCodeDetail) throws IOException {

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
		
    	commonCodeDetailMapper.update(commonCodeDetail, user);
    	
        return "redirect:/admin/commonCode/list?masterCode=" + commonCodeDetail.getMasterCode();
    }
}