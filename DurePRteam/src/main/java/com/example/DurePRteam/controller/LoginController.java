package com.example.DurePRteam.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.DurePRteam.dto.Login;
import com.example.DurePRteam.mapper.LoginMapper;

@Controller
public class LoginController {
	//로깅을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired LoginMapper loginMapper;

	@RequestMapping("login")
    public String login() {
        return "login";
    }

	@PostMapping("login")
	public String loginCheck(HttpServletRequest request, HttpSession session, Login lg , HttpServletResponse response) throws IOException {
		int idChkCount = loginMapper.checkId(lg.getUserId());
		String id = request.getParameter("userId");
		//System.out.println(lg.getUserId());
		System.out.println("내가 입력한 아이디 : " + id);

		String pwChk = loginMapper.checkPw(lg.getUserId());
		String inputPw = lg.getUserPW();

		//System.out.println("입력한 비번 : "+inputPw);
		//System.out.println("원래 비번 : "+pwChk);
		//System.out.println(idChkCount);

		if (idChkCount == 1) {
			//System.out.println("존재하는 아이디");
			if (inputPw.equals(pwChk)) {
				//String userId = SessionConfig.getSessionidCheck("login_id", id);
				//System.out.println(id + " : " +userId);
				session.setMaxInactiveInterval(60 * 60);
				session.setAttribute("login_id", id);

				//System.out.println("userId : " + userId);
				System.out.println(session.getAttribute("login_id"));
				//System.out.println(SessionConfig.getSessionidCheck("login_id", id));

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
