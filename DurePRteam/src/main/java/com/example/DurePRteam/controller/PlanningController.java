package com.example.DurePRteam.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.DurePRteam.dto.CommonCode;
import com.example.DurePRteam.dto.CommonCodeDetail;
import com.example.DurePRteam.dto.CommonsSubProp;
import com.example.DurePRteam.dto.GoodsMaster;
import com.example.DurePRteam.dto.Planning;
import com.example.DurePRteam.dto.PlanningGoodsInfo;
import com.example.DurePRteam.mapper.CommonCodeDetailMapper;
import com.example.DurePRteam.mapper.CommonPropMapper;
import com.example.DurePRteam.mapper.CommonSubPropMapper;
import com.example.DurePRteam.mapper.PlanningMapper;
import com.example.DurePRteam.paging.Criteria;
import com.example.DurePRteam.paging.Paging;
import com.google.gson.Gson;

@Controller
@RequestMapping("planning")
public class PlanningController {

	@Autowired PlanningMapper planningMapper;
	@Autowired CommonCodeDetailMapper commonCodeDetailMapper;
	@Autowired CommonPropMapper commonPropMapper;
	@Autowired CommonSubPropMapper commonSubPropMapper;

	// [계획서 조회]
	@RequestMapping("list")
	public String list(Criteria cri, Model model) {

		// 페이징 시작
		// 전체 글 개수
		int planningTotalCount = planningMapper.findAllCount();

		// 페이징 객체
		Paging paging = new Paging();
		paging.setCri(cri);
		paging.setTotalCount(planningTotalCount);

		// 리스트 조회쿼리
		List<Planning> plannings = planningMapper.findAll(cri);
		// 페이징 소스 끝		

		// 사용자정보
		model.addAttribute("piproperty", "000");	// 단협
		model.addAttribute("suPIProperty", "00");	// 매장
		
		// selectbox
		model.addAttribute("selPIProperty", commonPropMapper.findAllS());					// 단협
		model.addAttribute("selSuPIProperty", commonSubPropMapper.findByPropCode("000"));	// 매장(사용자 단협정보)
		
		model.addAttribute("plannings", plannings);
		model.addAttribute("paging", paging);
		model.addAttribute("criteria", cri);

		return "planning/list";
	}
	
	// [기본사항] 신규페이지
	@GetMapping("create")
	public String create(Model model) throws Exception {
		model.addAttribute("planning", new Planning());

		// selectbox
		model.addAttribute("selPIProperty", commonPropMapper.findAllS());	// 단협
		model.addAttribute("selSuPIProperty", null);						// 매장
		model.addAttribute("selGubuns", commonCodeDetailMapper.findByMasterCode("PL0001")); // 행사구분
		model.addAttribute("selReasons", commonCodeDetailMapper.findByMasterCode("PL0002")); // 진행배경

		return "planning/plan01";
	}

	// [기본사항] 신규
	@PostMapping("create")
	public String create(Model model, Planning planning) throws Exception {
		// (신규)다음 >>> 계획서 생성
		planningMapper.insert(planning);

		model.addAttribute("planning", planning);

		return "redirect:edit02?planNo=" + planning.getPlanNo();
	}

	// [기본사항] 수정페이지
	@GetMapping("edit01")
	public String edit01(Model model, int planNo) {
		Planning planning = planningMapper.findOne(planNo);

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
	public String edit01(Model model, Planning planning) {
		String state = planning.getState();
		if (state == null || state.equals("") || state == "W") {
			planningMapper.update01(planning);
		}

		return "redirect:edit02?planNo=" + planning.getPlanNo();
	}

	// [판매계획] 수정페이지
	@GetMapping("edit02")
	public String edit02(Model model, int planNo) throws Exception {
		Planning planning = planningMapper.findOne(planNo);

		model.addAttribute("planning", planning);

		// 단협, 매장 모델 추가

		// selectbox
		model.addAttribute("selGmGubuns", commonCodeDetailMapper.findByMasterCode("PL0003")); // 생활재구분
		model.addAttribute("selStartTimes", commonCodeDetailMapper.findByMasterCode("PL0004")); // 시작시간
		model.addAttribute("selEndTimes", commonCodeDetailMapper.findByMasterCode("PL0005")); // 종료시간

		return "planning/plan02";
	}

	// [판매계획] 수정(임시저장)
	@PostMapping("save02")
	public String save02(Model model, Planning planning) {
		String state = planning.getState();
		if (state == null || state.equals("") || state == "W") {
			planningMapper.update02(planning);
		}

		return "redirect:edit02?planNo=" + planning.getPlanNo();
	}

	// [판매계획] 수정(다음)
	@PostMapping("edit02")
	public String edit02(Model model, Planning planning) {
		String state = planning.getState();
		if (state == null || state.equals("") || state == "W") {
			planningMapper.update02(planning);
		}

		return "redirect:edit03?planNo=" + planning.getPlanNo();
	}

	// [홍보포인트] 수정페이지
	@GetMapping("edit03")
	public String edit03(Model model, int planNo) {
		Planning planning = planningMapper.findOne(planNo);

		model.addAttribute("planning", planning);

		// selectbox
		model.addAttribute("selPRMethod", commonCodeDetailMapper.findByMasterCode("PL0006")); // 홍보방법

		return "planning/plan03";
	}

	// [홍보포인트] 수정(임시저장)
	@PostMapping("save03")
	public String save03(Model model, Planning planning) {
		String state = planning.getState();
		if (state == null || state.equals("") || state == "W") {
			planningMapper.save03(planning);
		}

		return "redirect:edit03?planNo=" + planning.getPlanNo();
	}

	// [홍보포인트] 수정(계획서등록)
	@PostMapping("edit03")
	public String edit03(Model model, Planning planning) {
		String state = planning.getState();
		if (state == null || state.equals("") || state == "W") {
			planningMapper.update03(planning);
		}

		return "redirect:list";
	}
	
	// [계획서조회] 검토요청
	@PostMapping("request")
	@ResponseBody
	public void request(HttpServletResponse response, @RequestBody Planning planning) throws Exception {
		// 검토요청
		planningMapper.request(planning.getPlanNo());
	}
	
	// [계획서조회] 관리자반려
	@PostMapping("reject")
	@ResponseBody
	public void reject(Model model, @RequestBody Planning planning) throws Exception {
		// 관리자반려
		planningMapper.reject(planning.getPlanNo());
	}
		
	// [계획서조회] 관리자승인
	@PostMapping("confirm")
	@ResponseBody
	public void confirm(Model model, @RequestBody Planning planning) throws Exception {
		// 관리자승인
		planningMapper.confirm(planning.getPlanNo());
	}
}