package com.example.DurePRteam.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.example.DurePRteam.dto.CommonCode;
import com.example.DurePRteam.dto.CommonCodeDetail;
import com.example.DurePRteam.dto.CommonsSubProp;
import com.example.DurePRteam.dto.GoodsMaster;
import com.example.DurePRteam.dto.Planning;
import com.example.DurePRteam.dto.PlanningGoodsInfo;
import com.example.DurePRteam.dto.UserMain;
import com.example.DurePRteam.mapper.CommonCodeDetailMapper;
import com.example.DurePRteam.mapper.CommonPropMapper;
import com.example.DurePRteam.mapper.CommonSubPropMapper;
import com.example.DurePRteam.mapper.PlanningMapper;
import com.example.DurePRteam.paging.Criteria;
import com.example.DurePRteam.paging.Paging;
import com.google.gson.Gson;

@Controller
@SessionAttributes("user")
@RequestMapping("planning")
public class PlanningController {

	@Autowired PlanningMapper planningMapper;
	@Autowired CommonCodeDetailMapper commonCodeDetailMapper;
	@Autowired CommonPropMapper commonPropMapper;
	@Autowired CommonSubPropMapper commonSubPropMapper;

	// 로그인 정보 없는 경우
	@ModelAttribute("user")
	public UserMain setUser() {
		//System.out.println("*********[계획서] 로그인정보 없음*******");
		return new UserMain();
	}
	
	// [계획서 조회]
	@RequestMapping("list")
	public String list(@ModelAttribute("user") UserMain user, HttpServletResponse response, Criteria cri, Model model,
			@RequestParam(value="Apiproperty", required=false, defaultValue="0") String piproperty,
			@RequestParam(value="AsuPIProperty", required=false, defaultValue="0") String suPIProperty,
			@RequestParam(value="monthFrom", required=false, defaultValue="0") String monthFrom,
			@RequestParam(value="monthTo", required=false, defaultValue="0") String monthTo,
			@RequestParam(value="myPlan", required=false, defaultValue="") String myPlan) throws Exception {
		
		// 로그인정보 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return null;
		} 
		
		// 초기진입 검색조건
		// 1. 단협 조회 값 초기화(관리자는 전체조회)
//		if (piproperty.equals("0") && user.getUserLevel().equals("C")) {
//			piproperty = user.getPiproperty();
//		}
		
		// 오늘
		Date today = new Date();
	    SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	    String toDay = date.format(today);
		
	    //한달 전
	    Calendar mon = Calendar.getInstance();
	    mon.add(Calendar.MONTH , -1);
	    String beforeMonth = new SimpleDateFormat("yyyy-MM-dd").format(mon.getTime());
	    
		// 2-1. 시작일 값 초기화(한달 전)
		if (monthFrom.equals("0")) {
			monthFrom = beforeMonth;
		}
		
		// 2-2. 종료일 값 초기화(오늘)
		if (monthTo.equals("0")) {
			monthTo = toDay;
		}
		
		// 3. 내 계획서/평가서조회 값 초기화(관리자는 전체조회)
		if (myPlan.equals("")) {
			if (user.getUserLevel().equals("A")) {
				myPlan = "N";
			} else {
				myPlan = "Y";
			}
		}
		
		// 페이징 시작
		// 전체 글 개수
		int planningTotalCount = planningMapper.findAllCount(piproperty, suPIProperty, monthFrom, monthTo, myPlan, user.getUserId());

		// 페이징 객체
		Paging paging = new Paging();
		//cri.setCustomPerPageNum(3);	// 페이지 목록 개수
		paging.setCri(cri);
		paging.setTotalCount(planningTotalCount);

		// 리스트 조회쿼리
		List<Planning> plannings = planningMapper.findAll(cri, piproperty, suPIProperty, monthFrom, monthTo, myPlan, user.getUserId());
		
		// 페이징 소스 끝		

		// 사용자정보
		model.addAttribute("user", user);	// 로그인정보	
		model.addAttribute("Apiproperty", piproperty);		// 단협
		model.addAttribute("AsuPIProperty", suPIProperty);	// 매장
		model.addAttribute("monthFrom", monthFrom);			// 시작일
		model.addAttribute("monthTo", monthTo);				// 종료일
		model.addAttribute("myPlan", myPlan);			// 내 계획서 조회
		
		// selectbox
		model.addAttribute("selPIProperty", commonPropMapper.findAllS());					// 단협
		model.addAttribute("selSuPIProperty", commonSubPropMapper.findByPropCode(user.getPiproperty()));	// 매장(사용자 단협정보)
		
		model.addAttribute("plannings", plannings);
		model.addAttribute("paging", paging);
		model.addAttribute("criteria", cri);

		return "planning/list";
	}
	
	// [기본사항] 신규페이지
	@GetMapping("create")
	public String create(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model) throws Exception {
		
		// 로그인정보 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return null;
		}
		
		model.addAttribute("user", user);	// 로그인정보
		model.addAttribute("piProperty", user.getPiproperty());			// 단협
		model.addAttribute("suPIProperty", user.getSuPIProperty());		// 매장
		model.addAttribute("planning", new Planning());		

		// selectbox
		model.addAttribute("selPIProperty", commonPropMapper.findAllS());	// 단협
		model.addAttribute("selSuPIProperty", commonSubPropMapper.findByPropCode(user.getPiproperty()) );						// 매장
		model.addAttribute("selGubuns", commonCodeDetailMapper.findByMasterCode("PL0001")); // 행사구분
		model.addAttribute("selReasons", commonCodeDetailMapper.findByMasterCode("PL0002")); // 진행배경

		return "planning/plan01";
	}

	// [기본사항] 신규
	@PostMapping("create")
	public String create(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model, Planning planning) throws Exception {

		// 로그인정보 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return null;
		}
				
		// 사용자 초기화
		planning.setAddUser(user.getUserId());
		
		// (신규)다음 >>> 계획서 생성
		planningMapper.insert(planning);

		model.addAttribute("planning", planning);

		return "redirect:edit02?planNo=" + planning.getPlanNo();
	}

	// [기본사항] 수정페이지
	@GetMapping("edit01")
	public String edit01(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model, int planNo) throws Exception {
		
		// 세션 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return null;
		}
				
		model.addAttribute("user", user);	// 로그인정보
		
		Planning planning = planningMapper.findOne(planNo);
		model.addAttribute("piProperty", planning.getPiproperty());			// 단협
		model.addAttribute("suPIProperty", planning.getSuPIProperty());		// 매장
		model.addAttribute("planning", planning);

		// selectbox
		model.addAttribute("selPIProperty", commonPropMapper.findAllS()); 	// 단협
		model.addAttribute("selSuPIProperty", commonSubPropMapper.findByPropCode(planning.getPiproperty()));	// 매장
		model.addAttribute("selGubuns", commonCodeDetailMapper.findByMasterCode("PL0001")); // 행사구분
		model.addAttribute("selReasons", commonCodeDetailMapper.findByMasterCode("PL0002")); // 진행배경

		return "planning/plan01";
	}

	// [기본사항] 수정
	@PostMapping("edit01")
	public String edit01(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model, Planning planning) throws Exception {
		
		// 세션 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return null;
		}
		
		String state = planning.getState();
		if (state == null || state.equals("") || state == "W") {
			// 사용자 초기화
			planning.setModUser(user.getUserId());
			
			// 작성자만 수정
			if (planning.getAddUser().equals(user.getUserId()) ) {
				planningMapper.update01(planning);
			}			
		}

		return "redirect:edit02?planNo=" + planning.getPlanNo();
	}

	// [판매계획] 수정페이지
	@GetMapping("edit02")
	public String edit02(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model, int planNo) throws Exception {
		
		// 세션 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return null;
		}
				
		Planning planning = planningMapper.findOne(planNo);

		model.addAttribute("user", user);	// 로그인정보
		model.addAttribute("planning", planning);

		// selectbox
		model.addAttribute("selGmGubuns", commonCodeDetailMapper.findByMasterCode("PL0003")); // 생활재구분
		model.addAttribute("selStartTimes", commonCodeDetailMapper.findByMasterCode("PL0004")); // 시작시간
		model.addAttribute("selEndTimes", commonCodeDetailMapper.findByMasterCode("PL0005")); // 종료시간

		return "planning/plan02";
	}

	// [판매계획] 수정(임시저장)
	@PostMapping("save02")
	public String save02(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model, Planning planning) throws Exception {
		
		// 세션 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return null;
		}
				
		String state = planning.getState();
		if (state == null || state.equals("") || state == "W") {
			// 사용자 초기화
			planning.setModUser(user.getUserId());
			
			// 작성자만 수정
			if (planning.getModUser().equals(user.getUserId())) {
				planningMapper.update02(planning);
			}
		}

		return "redirect:edit02?planNo=" + planning.getPlanNo();
	}

	// [판매계획] 수정(다음)
	@PostMapping("edit02")
	public String edit02(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model, Planning planning) throws Exception {
		
		// 로그인정보 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return null;
		}
		
		String state = planning.getState();
		if (state == null || state.equals("") || state == "W") {
			// 사용자 초기화
			planning.setModUser(user.getUserId());
			
			// 작성자만 수정
			if (planning.getModUser().equals(user.getUserId())) {
				planningMapper.update02(planning);
			}
		}

		return "redirect:edit03?planNo=" + planning.getPlanNo();
	}

	// [홍보포인트] 수정페이지
	@GetMapping("edit03")
	public String edit03(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model, int planNo) throws Exception {
		
		// 로그인정보 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return null;
		}
				
		Planning planning = planningMapper.findOne(planNo);
		
		model.addAttribute("user", user);	// 로그인정보
		model.addAttribute("planning", planning);

		// selectbox
		model.addAttribute("selPRMethod", commonCodeDetailMapper.findByMasterCode("PL0006")); // 홍보방법

		return "planning/plan03";
	}

	// [홍보포인트] 수정(임시저장)
	@PostMapping("save03")
	public String save03(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model, Planning planning) throws Exception {
		
		// 로그인정보 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return null;
		}
				
		String state = planning.getState();
		if (state == null || state.equals("") || state == "W") {
			// 사용자 초기화
			planning.setModUser(user.getUserId());
						
			// 작성자만 수정
			if (planning.getModUser().equals(user.getUserId())) {
				planningMapper.save03(planning);
			}			
		}

		return "redirect:edit03?planNo=" + planning.getPlanNo();
	}

	// [홍보포인트] 수정(계획서등록)
	@PostMapping("edit03")
	public String edit03(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model, Planning planning) throws Exception {
		
		// 로그인정보 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return null;
		}
		
		String state = planning.getState();
		if (state == null || state.equals("") || state == "W") {
			// 사용자 초기화
			planning.setModUser(user.getUserId());
			
			// 작성자만 수정
			if (planning.getModUser().equals(user.getUserId())) {
				planningMapper.update03(planning);
			}			
		}

		return "redirect:list";
	}
	
	// [계획서조회] 검토요청
	@PostMapping("request")
	@ResponseBody
	public void request(@ModelAttribute("user") UserMain user, HttpServletResponse response, @RequestBody Planning planning) throws Exception {
		
		// 로그인정보 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return;
		}
		
		// 검토요청
		planningMapper.request(planning.getPlanNo(), user.getUserId());
	}
	
	// [계획서조회] 관리자반려
	@PostMapping("reject")
	@ResponseBody
	public void reject(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model, @RequestBody Planning planning) throws Exception {
		
		// 로그인정보 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return;
		}
				
		// 관리자반려
		planningMapper.reject(planning.getPlanNo(), user.getUserId());
	}
		
	// [계획서조회] 관리자승인
	@PostMapping("confirm")
	@ResponseBody
	public void confirm(@ModelAttribute("user") UserMain user, HttpServletResponse response, Model model, @RequestBody Planning planning) throws Exception {
		
		// 로그인정보 체크
		if (user.getUserId() == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인정보가 없습니다. 로그인페이지로 이동합니다.'); location.href='/login'; </script>");
			out.flush();
			return;
		}
		// 관리자승인
		planningMapper.confirm(planning.getPlanNo(), user.getUserId());
	}
}