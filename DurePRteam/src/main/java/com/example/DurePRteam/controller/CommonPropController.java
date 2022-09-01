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

import com.example.DurePRteam.dto.CommonProp;
import com.example.DurePRteam.dto.CommonsSubProp;
import com.example.DurePRteam.dto.UserMain;
import com.example.DurePRteam.mapper.CommonPropMapper;
import com.example.DurePRteam.mapper.CommonSubPropMapper;
import com.example.DurePRteam.paging.Criteria;
import com.example.DurePRteam.paging.Paging;

@Controller
@SessionAttributes("user")
@RequestMapping("admin")
public class CommonPropController {

    @Autowired CommonPropMapper commonPropMapper;
    @Autowired CommonSubPropMapper commonSubPropMapper;

    // 로그인 정보 없는 경우
 	@ModelAttribute("user")
 	public UserMain setUser() {
 		//System.out.println("*********[단협코드] 로그인정보 없음*******");
 		return new UserMain();
 	}
 	
    // [공통코드] 리스트 + 상세리스트
    @RequestMapping("commonProp/list")
    public String list(@ModelAttribute("user") UserMain user, HttpServletResponse response,Criteria cri, Model model, String piProperty) throws IOException {

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
    public String edit(@ModelAttribute("user") UserMain user, HttpServletResponse response,Model model, String piProperty) throws IOException {
    	//System.out.println(piProperty);
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
    	CommonProp commonProp = commonPropMapper.findOne(piProperty);

        model.addAttribute("commonProp", commonProp);

        return "admin/commonProp/edit";
    }

    // [공통코드] 수정
    @PostMapping("commonProp/edit")
    public String edit(@ModelAttribute("user") UserMain user, HttpServletResponse response,Model model, CommonProp commonProp) throws IOException {
    	
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
    			
    	commonPropMapper.update(commonProp, user);

        return "redirect:list";
    }
}