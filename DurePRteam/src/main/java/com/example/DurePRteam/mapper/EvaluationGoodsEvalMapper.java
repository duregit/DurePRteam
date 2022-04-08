package com.example.DurePRteam.mapper;
 
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.example.DurePRteam.dto.CommonCode;
import com.example.DurePRteam.dto.EvaluationGoodsEval;
import com.example.DurePRteam.dto.EvaluationGoodsInfo;
import com.example.DurePRteam.dto.GoodsMaster;
import com.example.DurePRteam.dto.PlanningGoodsInfo;

@Mapper
public interface EvaluationGoodsEvalMapper {
	
	// [판매계획] 생활재평가 검색
	@Select("SELECT * FROM pr_evaluation_goods_eval WHERE EvalNo = #{evalNo} ORDER BY EGENo DESC")
    List<EvaluationGoodsEval> findByEvalNo(int evalNo);
	
	// [판매계획] 생활재평가 생성
    @Insert("INSERT pr_evaluation_goods_eval (EvalNo, Item, Score, Text) "
    		+ "VALUES (#{evalNo}, #{item}, #{score}, #{text})")
    @Options(useGeneratedKeys=true, keyProperty="egeNo") // 설명: id필드는 Auto Increment 속성
    void insert(EvaluationGoodsEval evaluationGoodsEval);
    
	// [판매계획] 생활재평가 삭제  
    @Delete("DELETE FROM pr_evaluation_goods_eval WHERE EvalNo = #{evalNo}")
    void delete(int evalNo);
}