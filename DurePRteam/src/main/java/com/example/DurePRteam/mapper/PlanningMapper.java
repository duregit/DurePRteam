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
public interface PlanningMapper {
	
	// 조건조회
	@Select("SELECT A.*, "
		+ "		(SELECT SuPIPropName FROM pr_subproperty WHERE A.PIProperty = PIProperty AND A.SuPIProperty = SuPIProperty LIMIT 1) AS SUPIPropName, "
		+ " 	(SELECT GmDesc FROM pr_planning_goods_info WHERE A.PlanNo = PlanNo LIMIT 1) AS GmDesc "
		+ "	FROM pr_planning A "
		+ "	WHERE 1 = 1 "
		+ "		AND IF(#{piproperty}='0', TRUE, PIProperty = #{piproperty}) "
		+ "		AND IF(#{suPIProperty}='0', TRUE, SUPIProperty = #{suPIProperty}) "
		+ "		AND IF(#{monthFrom}='0', TRUE, PRDate >= #{monthFrom}) "
		+ "		AND IF(#{monthTo}='0', TRUE, PRDate <= #{monthTo}) "
		+ "		AND IF(#{myPlan}='Y', AddUser = #{userId}, TRUE) "
		+ "ORDER BY A.AddDate DESC "
		+ "LIMIT #{cri.pageStart}, #{cri.perPageNum} ")
	List<Planning> findAll(Criteria cri, String piproperty, String suPIProperty, String monthFrom, String monthTo, String myPlan, String userId);
	
		
	// 조건조회 count
	@Select("SELECT COUNT(*) FROM pr_planning "
			+ "WHERE 1 = 1 "			
			+ "		AND IF(#{piproperty}='0', TRUE, PIProperty = #{piproperty}) "
			+ "		AND IF(#{suPIProperty}='0', TRUE, SUPIProperty = #{suPIProperty}) "
			+ "		AND IF(#{monthFrom}='0', TRUE, PRDate >= #{monthFrom}) "
			+ "		AND IF(#{monthTo}='0', TRUE, PRDate <= #{monthTo}) "
			+ "		AND IF(#{myPlan}='Y', AddUser = #{userId}, TRUE) ")
    int findAllCount(String piproperty, String suPIProperty, String monthFrom, String monthTo, String myPlan, String userId);
	
	// 특정조회
    @Select("SELECT * FROM pr_planning WHERE PlanNo = #{planNo}")
    Planning findOne(int planNo);

	// 특정조회(평가서 dto로 리턴)
    @Select("SELECT * FROM pr_planning WHERE PlanNo = #{planNo}")
    Evaluation findByPlanNo(int planNo);
    
    // 계획서 신규 생성 
    @Insert("INSERT pr_planning (AddUser, AddDate, PRName, PIProperty, SuPIProperty, PRDate, PRDay, Gubun, Reason)"
    		+ " VALUES (#{addUser}, SYSDATE(), #{prName}, #{piproperty}, #{suPIProperty}, #{prDate}, #{prDay}, #{gubun}, #{reason})")
    @Options(useGeneratedKeys=true, keyProperty="planNo")
    void insert(Planning planning);
	
    // [기본사항] 수정(다음) 
    @Update("UPDATE pr_planning SET "
    		+ "PRName = #{prName}, "
    		+ "PIProperty = #{piproperty}, "
    		+ "SuPIProperty = #{suPIProperty}, "
    		+ "PRDate = #{prDate}, "
    		+ "PRDay = #{prDay}, "
    		+ "Gubun = #{gubun}, "
    		+ "Reason = #{reason}, "
    		+ "ModUser = #{modUser}, ModDate = SYSDATE() "
    		+ "WHERE PlanNo = #{planNo} "
    		+ "AND (State IS NULL OR State = '' OR State = 'W') "
    		+ "AND AddUser = #{modUser} ")    
    void update01(Planning planning);
    
    // [판매계획] 수정(임시저장 or 다음) 
    @Update("UPDATE pr_planning SET "
    		+ "StartTime = #{startTime}, "
    		+ "EndTime = #{endTime}, "
    		+ "ModUser = #{modUser}, ModDate = SYSDATE() "
    		+ "WHERE PlanNo = #{planNo} " 
    		+ "AND (State IS NULL OR State = '' OR State = 'W') ")
    void update02(Planning planning);
    
    // [홍보포인트] 수정(임시저장) 
    @Update("UPDATE pr_planning SET "
    		+ "LinkedGoods = #{linkedGoods}, "
    		+ "PRMethod = #{prMethod}, "
    		+ "PRTools = #{prTools}, "
    		+ "PRMessage = #{prMessage}, "
    		+ "Etc = #{etc}, "
    		+ "ModUser = #{modUser}, ModDate = SYSDATE() "
    		+ "WHERE PlanNo = #{planNo} "
    		+ "AND (State IS NULL OR State = ''OR State = 'W') ")
    void save03(Planning planning);
    
    // [홍보포인트] 수정(계획서작성) 
    @Update("UPDATE pr_planning SET "
    		+ "LinkedGoods = #{linkedGoods}, "
    		+ "PRMethod = #{prMethod}, "
    		+ "PRTools = #{prTools}, "
    		+ "PRMessage = #{prMessage}, "
    		+ "Etc = #{etc}, "
    		+ "State = 'W', "
    		+ "ModUser = #{modUser}, ModDate = SYSDATE() "
    		+ "WHERE PlanNo = #{planNo} "
    		+ "AND (State IS NULL OR State = '' OR State = 'W') ")
    void update03(Planning planning);
    
    // [계획서조회] 검토요청 
    @Update("UPDATE pr_planning SET "    		
    		+ "State = 'R', "
    		+ "ModUser = #{userId}, ModDate = SYSDATE() "
    		+ "WHERE PlanNo = #{planNo} ")
    void request(int planNo, String userId);

    // [계획서조회] 반려
    @Update("UPDATE pr_planning SET "    		
    		+ "State = 'N', "
    		+ "ModUser = #{userId}, ModDate = SYSDATE() "
    		+ "WHERE PlanNo = #{planNo} ")
    void reject(int planNo, String userId);
    
    // [계획서조회] 관리자승인
    @Update("UPDATE pr_planning SET "    		
    		+ "State = 'C', "
    		+ "ConfirmUser = #{userId}, ConfirmDate = SYSDATE() "
    		+ "WHERE PlanNo = #{planNo} ")
    void confirm(int planNo, String userId);
    

//    @Delete("DELETE FROM pr_planning WHERE PlanNo = #{planNo}")
//    void delete(int planNo);

}