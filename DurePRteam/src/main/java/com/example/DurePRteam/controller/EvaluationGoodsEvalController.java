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
import com.example.DurePRteam.dto.EvaluationGoodsEval;
import com.example.DurePRteam.dto.EvaluationGoodsInfo;
import com.example.DurePRteam.mapper.EvaluationGoodsEvalMapper;
import com.example.DurePRteam.mapper.EvaluationGoodsInfoMapper;
import com.example.DurePRteam.mapper.GoodsMasterMapper;
import com.example.DurePRteam.mapper.PlanningGoodsInfoMapper;
import com.google.gson.Gson;

@Controller
@RequestMapping("evaluationGoodsEval")
public class EvaluationGoodsEvalController {
    
    @Autowired EvaluationGoodsEvalMapper evaluationGoodsEvalMapper; 
    
    // [평가서-생활재평가] 조회
    @PostMapping("goodsEval/select")
    @ResponseBody
    public String goodsEvalSelect(HttpServletResponse response, @RequestBody EvaluationGoodsEval eval) {
    	// 생활재평가 조회
    	List<EvaluationGoodsEval> evaluationGoodsEvals = evaluationGoodsEvalMapper.findByEvalNo(eval.getEvalNo());
    	
    	Gson gson = new Gson();
    	Map<String, Object> map = new HashMap<String, Object>();

    	for (int i = 0; i < evaluationGoodsEvals.size(); i++) {
    		map.put("evaluationGoodsEval"+i, evaluationGoodsEvals.get(i));
    	}
		
    	String jsonString = gson.toJson(map);
        
    	return jsonString;
    }
    
    // [평가서-생활재평가] 삽입
    @PostMapping("goodsEval/insert")
    @ResponseBody
    public void goodsEvalInsert(HttpServletResponse response, @RequestBody List<EvaluationGoodsEval> evals) {
    	// 생활재정보 삭제
    	evaluationGoodsEvalMapper.delete(evals.get(0).getEvalNo());
    	for (int i = 0; i < evals.size(); i++) {
        	// 생활재정보 삽입
    		evaluationGoodsEvalMapper.insert(evals.get(i));
    	}
    }
}