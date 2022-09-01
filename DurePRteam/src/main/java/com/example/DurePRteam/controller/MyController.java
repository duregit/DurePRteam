package com.example.DurePRteam.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.DurePRteam.dto.BCode;
import com.example.DurePRteam.dto.My;
import com.example.DurePRteam.dto.UserMain;
import com.example.DurePRteam.mapper.BCodeMapper;
import com.example.DurePRteam.mapper.MyMapper;

@Controller
@SessionAttributes("user")
@RequestMapping("my")
public class MyController {

	@Autowired MyMapper myMapper;
    @Autowired BCodeMapper bcodeMapper;

    
	// 로그인 정보 없는 경우
	@ModelAttribute("user")
	public UserMain setUser() {
		//System.out.println("*********[계획서조회] 로그인정보 없음*******");
		return new UserMain();
	}

    @RequestMapping("my01")
    //@ResponseBody
    public String my01(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model) throws Exception {
		// 로그인정보 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return null;
		}
		
		//System.out.println("user.getUserId(): "+ user.getUserId());
    	My my = myMapper.findUser(user.getUserId());
    	List<BCode> bCodes = bcodeMapper.findBCAll();
    	model.addAttribute("my", my);
		model.addAttribute("bCodes", bCodes); // 은행

        return "my/my01";
    }


    // 마이페이지 수정
	@PostMapping("my01")
	public String update(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model , My my) throws Exception {
		// 로그인정보 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return null;
		}
		
		myMapper.update(my);

		return "redirect:/my/my01";
	}


	// 비밀번호 변경
	@RequestMapping("updatePW")
	@ResponseBody
    public String updatePW(@ModelAttribute("user") UserMain user, HttpServletResponse response, @RequestBody My my) throws Exception {
		
		// 로그인정보 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return null;
		}
		
		myMapper.pwUpdate(my);

		//System.out.println(count);

		return null;
    }

}