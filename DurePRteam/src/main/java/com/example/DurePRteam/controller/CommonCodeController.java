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

import com.example.DurePRteam.dto.CommonCode;
import com.example.DurePRteam.dto.CommonCodeDetail;
import com.example.DurePRteam.dto.UserMain;
import com.example.DurePRteam.mapper.CommonCodeDetailMapper;
import com.example.DurePRteam.mapper.CommonCodeMapper;
import com.example.DurePRteam.paging.Criteria;
import com.example.DurePRteam.paging.Paging;

@Controller
@SessionAttributes("user")
@RequestMapping("admin")
public class CommonCodeController {

    @Autowired CommonCodeMapper commonCodeMapper;
    @Autowired CommonCodeDetailMapper commonCodeDetailMapper;

	// 로그인 정보 없는 경우
	@ModelAttribute("user")
	public UserMain setUser() {
		//System.out.println("*********[공통코드] 로그인정보 없음*******");
		return new UserMain();
	}
	
    // [공통코드] 리스트 + 상세리스트
    @RequestMapping("commonCode/list")
    public String list(@ModelAttribute("user") UserMain user, HttpServletResponse response, Criteria cri, Model model, String masterCode) throws IOException {

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
		int commonCodeTotalCount = commonCodeMapper.findAllCount();

		// 페이징 객체
		Paging paging = new Paging();
		cri.setCustomPerPageNum(20);	// 페이지 목록 개수
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
		
        model.addAttribute("commonCode", new CommonCode());

        return "admin/commonCode/edit";
    }

    // [공통코드] 등록
    @PostMapping("commonCode/create")
    public String create(@ModelAttribute("user") UserMain user, HttpServletResponse response,Model model, CommonCode commonCode) throws IOException {
    	
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
		
    	commonCodeMapper.insert(commonCode, user.getUserId());

        return "redirect:list";
    }

    // [공통코드] 수정페이지
    @GetMapping("commonCode/edit")
    public String edit(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model, String masterCode) throws IOException {
    	//System.out.println(masterCode);
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

        return "admin/commonCode/edit";
    }

    // [공통코드] 수정
    @PostMapping("commonCode/edit")
    public String edit(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model, CommonCode commonCode) throws IOException {

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
		
    	commonCodeMapper.update(commonCode, user);

        return "redirect:list";
    }
}