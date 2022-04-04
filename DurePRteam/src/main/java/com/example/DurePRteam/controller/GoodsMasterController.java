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
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.DurePRteam.dto.GoodsMaster;
import com.example.DurePRteam.dto.PlanningGoodsInfo;
import com.example.DurePRteam.mapper.GoodsMasterMapper;
import com.example.DurePRteam.mapper.PlanningGoodsInfoMapper;
import com.google.gson.Gson;

@Controller
@RequestMapping("goodsMaster")
public class GoodsMasterController {
    
    @Autowired GoodsMasterMapper goodsMasterMapper;
    @Autowired PlanningGoodsInfoMapper planningGoodsInfoMapper;
    
    // [판매계획] 생활재 검색
    @PostMapping("searchGoods")
    @ResponseBody
    public String searchGoods(HttpServletResponse response, @RequestBody GoodsMaster gm) {
    	// 리스트 조회쿼리
    	GoodsMaster goodsMaster = goodsMasterMapper.findOne(gm.getGmSeq());
    	
    	Gson gson = new Gson();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("goodsMaster", goodsMaster);
		
    	String jsonString = gson.toJson(map);
        
    	return jsonString;
    }
    
    // [판매계획] 생활재정보 조회
    @PostMapping("planningSelect")
    @ResponseBody
    public String planningSelect(HttpServletResponse response, @RequestBody PlanningGoodsInfo plan) {
    	// 생활재정보 조회
    	List<PlanningGoodsInfo> planningGoodsInfos = planningGoodsInfoMapper.findByPlanNo(plan.getPlanNo());
    	
    	Gson gson = new Gson();
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	for(int i = 0; i < planningGoodsInfos.size(); i++) {
    		map.put("planningGoodsInfo"+i, planningGoodsInfos.get(i));
    	}
		
    	String jsonString = gson.toJson(map);
        
    	return jsonString;
    }
    
    // [판매계획] 생활재정보 삽입
    @PostMapping("planningInsert")
    @ResponseBody
    public void planningInsert(HttpServletResponse response, @RequestBody List<PlanningGoodsInfo> plans) {
    	// 생활재 정보 삭제
    	planningGoodsInfoMapper.delete(plans.get(0).getPlanNo());
    	for(int i = 0; i < plans.size(); i++) {
	    	//System.out.println(planningGoodsInfos.get(i));
        	// 생활재 정보 삽입
        	planningGoodsInfoMapper.insert(plans.get(i));
    	}
    }
}