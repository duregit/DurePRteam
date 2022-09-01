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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.example.DurePRteam.dto.Login;
import com.example.DurePRteam.dto.UserList;
import com.example.DurePRteam.dto.UserMain;
import com.example.DurePRteam.mapper.LoginMapper;
import com.example.DurePRteam.mapper.MainMapper;
import com.example.DurePRteam.mapper.MemberMapper;

@SessionAttributes("user")
@Controller
public class LoginController {
	//로깅을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired LoginMapper loginMapper;
	@Autowired MainMapper mainMapper;
    
	// 로그인 정보 없는 경우
	@ModelAttribute("user")
	public UserMain setUser() {
		//System.out.println("*********[로그인] 로그인정보 없음*******");
		return new UserMain();
	}
	
	@RequestMapping("/")
    public String main(@ModelAttribute("user") UserMain user, HttpServletResponse response) throws Exception {
		
		// 로그인정보 체크
		if (user.getUserId() == null) {
			return "login";
		} else {
			return "redirect:/planning/list";
		}
    }
	
	@GetMapping("login")
    public String login(@ModelAttribute("user") UserMain user, HttpServletResponse response) throws Exception {
        
		// 로그인정보 체크
		if (user.getUserId() == null) {
			return "login";
		} else if (user.getUserActive() == "Y") {
			return "redirect:/planning/list";
		} else if (user.getUserActive() == "N") {
			return "redirect:/my/my01";
		} else {
			return "redirect:/login";
		}
    }

	@GetMapping("loginCheck")
	public String loginCheck2(HttpServletRequest request, HttpSession session, Login lg , HttpServletResponse response, Model model) throws IOException {
		int idChkCount = 1;
		
		String id = "it";
		String pwChk = "1234";
		String inputPw = "1234";

		if (idChkCount == 1) {
			if (inputPw.equals(pwChk)) {
				// 세션 저장
				UserMain user = mainMapper.findUser(id);				
				model.addAttribute("user", user);

				// 로그인 후 계획서 조회페이지로 이동
				return "redirect:/planning/list";
			} else {
				response.setContentType("text/html; charset=euc-kr");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('아이디 패스워드가 일치하지 않습니다.'); location.href='login'; </script>");
				out.flush();

				return null;
			}
		} else {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('존재하지 않는 아이디입니다.'); location.href='login'; </script>");
			out.flush();
			return "login";
		}
	}
	
	@PostMapping("loginCheck")
	public String loginCheck(HttpServletRequest request, HttpSession session, Login lg , HttpServletResponse response, Model model) throws IOException {
		int idChkCount = loginMapper.checkId(lg.getUserId());
		
		String id = request.getParameter("userId");
		String pwChk = loginMapper.checkPw(lg.getUserId());
		String inputPw = lg.getUserPW();

		if (idChkCount == 1) {
			if (inputPw.equals(pwChk)) {
<<<<<<< HEAD
				// 세션 저장
				UserMain user = mainMapper.findUser(id);				
				model.addAttribute("user", user);

				// 로그인 후 페이지 이동
				if (user.getUserActive().equals("Y")) {
					return "redirect:/planning/list";
				} else {
					return "redirect:/my/my01";
				}
=======
				//String userId = SessionConfig.getSessionidCheck("login_id", id);
				//System.out.println(id + " : " +userId);
				session.setMaxInactiveInterval(60 * 60);
				session.setAttribute("login_id", id);

				//System.out.println("userId : " + userId);
				System.out.println(session.getAttribute("login_id"));
				//System.out.println(SessionConfig.getSessionidCheck("login_id", id));

				return "redirect:planning/list";
>>>>>>> 5ebb79388a8e2e4bfe3fa9a27eae787168d4cc9a
			} else {
				response.setContentType("text/html; charset=euc-kr");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('아이디 패스워드가 일치하지 않습니다.'); location.href='login'; </script>");
				out.flush();

				return null;
			}
		} else {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('존재하지 않는 아이디입니다.'); location.href='login'; </script>");
			out.flush();
			return "login";
		}
	}
	
	// 로그아웃 처리
	@GetMapping("logout")
	public String logout(HttpSession session, SessionStatus status) {
		/*session에 해당하는 이름을 매개변수로 넣어줘야 한다*/
		status.setComplete();
		return "redirect:login";
	}
}
