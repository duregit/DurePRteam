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
import com.example.DurePRteam.dto.GoodsMaster;
import com.example.DurePRteam.dto.PlanningGoodsInfo;

@Mapper
public interface PlanningGoodsInfoMapper {
	
	// [판매계획] 생활재정보 검색
	@Select("SELECT * FROM pr_planning_goods_info WHERE PlanNo = #{planNo} ORDER BY PGNo DESC")
    List<PlanningGoodsInfo> findByPlanNo(int planNo);
	
	// [판매계획] 생활재 생성
    @Insert("INSERT pr_planning_goods_info (PlanNo, PIProperty, GmSeq, GmDesc, GmNo, GmName, GmGubun, SalesTarget) "
    		+ "VALUES (#{planNo}, #{piproperty}, #{gmSeq}, #{gmDesc}, #{gmNo}, #{gmName}, #{gmGubun}, #{salesTarget} )")
    @Options(useGeneratedKeys=true, keyProperty="pgNo") // 설명: id필드는 Auto Increment 속성
    void insert(PlanningGoodsInfo planningGoodsInfo);
    
	// [판매계획] 생활재 생성    
    @Delete("DELETE FROM pr_planning_goods_info WHERE PlanNo = #{planNo}")
    void delete(int planNo);
}