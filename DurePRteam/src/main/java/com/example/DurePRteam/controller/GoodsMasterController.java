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
import com.example.DurePRteam.mapper.GoodsMasterMapper;
import com.google.gson.Gson;

@Controller
@RequestMapping("goodsMaster")
public class GoodsMasterController {
    
    @Autowired GoodsMasterMapper goodsMasterMapper;
    
    // [생활재] 검색
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

//    // [공통코드] 등록페이지
//    @GetMapping("commonCode/create")
//    public String create(Model model) {
//        model.addAttribute("commonCode", new CommonCode());
//        
//        return "admin/commonCode/edit";
//    }
//
//    // [공통코드] 등록
//    @PostMapping("commonCode/create")
//    public String create(Model model, CommonCode commonCode) {
//    	commonCodeMapper.insert(commonCode);
//    	
//        return "redirect:list";
//    }
//    
//    // [공통코드] 수정페이지
//    @GetMapping("commonCode/edit")
//    public String edit(Model model, String masterCode) {
//    	CommonCode commonCode = commonCodeMapper.findOne(masterCode);
//    	
//        model.addAttribute("commonCode", commonCode);
//        
//        return "admin/commonCode/edit";
//    }
//    
//    // [공통코드] 수정
//    @PostMapping("commonCode/edit")
//    public String edit(Model model, CommonCode commonCode) {
//    	commonCodeMapper.update(commonCode);
//    	
//        return "redirect:list";
//    }
}