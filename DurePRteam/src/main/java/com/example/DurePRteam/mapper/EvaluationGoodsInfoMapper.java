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
import com.example.DurePRteam.dto.EvaluationGoodsInfo;
import com.example.DurePRteam.dto.GoodsMaster;
import com.example.DurePRteam.dto.PlanningGoodsInfo;

@Mapper
public interface EvaluationGoodsInfoMapper {
	
	// [판매계획] 생활재정보 검색
	@Select("SELECT * FROM pr_evaluation_goods_info WHERE EvalNo = #{evalNo} ORDER BY EGINo DESC")
    List<EvaluationGoodsInfo> findByEvalNo(int evalNo);
	
	// [판매계획] 생활재정보 생성
    @Insert("INSERT pr_evaluation_goods_info (EvalNo, PIProperty, GmSeq, GmDesc, GmNo, GmName, GmGubun, SalesTarget) "
    		+ "VALUES (#{evalNo}, #{piproperty}, #{gmSeq}, #{gmDesc}, #{gmNo}, #{gmName}, #{gmGubun}, #{salesTarget} )")
    @Options(useGeneratedKeys=true, keyProperty="egiNo") // 설명: id필드는 Auto Increment 속성
    void insert(EvaluationGoodsInfo evaluationGoodsInfo);
    
	// [판매계획] 생활재정보 삭제  
    @Delete("DELETE FROM pr_evaluation_goods_info WHERE EvalNo = #{evalNo}")
    void delete(int evalNo);
    
	// [판매계획] 생활재정보 복사
    @Insert("INSERT pr_evaluation_goods_info (EvalNo, PIProperty, GmSeq, GmDesc, GmNo, GmName, GmGubun, SalesTarget) "
    		+ "VALUES (#{evalNo}, #{plan.piproperty}, #{plan.gmSeq}, #{plan.gmDesc}, #{plan.gmNo}, #{plan.gmName}, #{plan.gmGubun}, #{plan.salesTarget} )")
    //@Options(useGeneratedKeys=true, keyProperty="egiNo") // 설명: id필드는 Auto Increment 속성
    void copy(PlanningGoodsInfo plan, int evalNo);
}