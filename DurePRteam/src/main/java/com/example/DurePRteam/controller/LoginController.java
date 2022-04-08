package com.example.DurePRteam.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.DurePRteam.dto.Login;
import com.example.DurePRteam.mapper.LoginMapper;

@Controller
public class LoginController {

	@Autowired LoginMapper loginMapper;

	@RequestMapping("login")
    public String login() {
        return "login";
    }

	@PostMapping("login")
	public String loginCheck(HttpSession session, Login lg , HttpServletResponse response) throws IOException {
		int idChkCount = loginMapper.checkId(lg.getUserId());
		//loginMapper.checkPw(lg);
		String pwChk = loginMapper.checkPw(lg.getUserId());
		String inputPw = lg.getUserPW();

		System.out.println("입력한 비번 : "+inputPw);
		System.out.println("원래 비번 : "+pwChk);
		//System.out.println(idChkCount);

		if (idChkCount == 1) {
			//System.out.println("존재하는 아이디");
			if (inputPw.equals(pwChk)) {
				return "redirect:main";
			} else {
				response.setContentType("text/html; charset=euc-kr");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('회원정보가 일치하지 않습니다.'); location.href='login'; </script>");
				out.flush();

				return null;
			}

			//return "main";
		} else {
			System.out.println("존재하지 않는 아이디");

			return "login";
		}

		//System.out.println(lg.getUserId());
		//System.out.println(idChkCount);

	}

}
