package com.example.DurePRteam.mapper;
 
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.example.DurePRteam.dto.Evaluation;
import com.example.DurePRteam.dto.Planning;
import com.example.DurePRteam.paging.Criteria;

@Mapper
public interface EvaluationMapper {
		
	// 특정조회(평가서번호로 조회)
    @Select("SELECT * FROM pr_evaluation WHERE EvalNo = #{evalNo}")
    Evaluation findByEvalNo(int evalNo);
    
	// 특정조회(계획서번호로 조회)
    @Select("SELECT * FROM pr_evaluation WHERE PlanNo = #{planNo}")
    Evaluation findByPlanNo(int planNo);
    
	// 특정조회 count
	@Select("SELECT COUNT(*) FROM pr_evaluation WHERE PlanNo = #{planNo}")
    int findByPlanNoCount(int planNo);
    
    // 평가서 신규 생성 #{addUser}
    @Insert("INSERT pr_evaluation (AddUser, AddDate, PlanNo, PRName, PIProperty, SuPIProperty, PRDate, PRDay, Gubun, Reason, "
    		+ "StartTime, EndTime, "
    		+ "LinkedGoods, PRMethod, PRTools, PRMessage, Etc) "
    		+ "VALUES ('장우진', SYSDATE(), #{planNo}, #{prName}, #{piproperty}, #{suPIProperty}, #{prDate}, #{prDay}, #{gubun}, #{reason}, "
    		+ "#{startTime}, #{endTime}, "
    		+ "#{linkedGoods}, #{prMethod}, #{prTools}, #{prMessage}, #{etc} )")
    @Options(useGeneratedKeys=true, keyProperty="evalNo")
    void insert(Evaluation eval);
	
}