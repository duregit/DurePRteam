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
	
	// 전체조회
	@Select("SELECT A.*, "
			+ "'희망도화점' AS SUPIPropName, "
			//+ "(SELECT GmDesc FROM pr_planning_goods_info WHERE A.PlanNo = PlanNo LIMIT 1) AS GmDesc "	// 매장명
			+ "(SELECT GmDesc FROM pr_planning_goods_info WHERE A.PlanNo = PlanNo LIMIT 1) AS GmDesc "	// 생활재명
			+ "FROM pr_planning A "
			+ "ORDER BY A.PlanNo DESC "
			+ "LIMIT #{pageStart}, #{perPageNum} ")
    List<Planning> findAll(Criteria cri);
	
	// 전체조회 count
	@Select("SELECT COUNT(*) FROM pr_planning")
    int findAllCount();
	
	// 특정조회
    @Select("SELECT * FROM pr_planning WHERE PlanNo = #{planNo}")
    Planning findOne(int planNo);

	// 특정조회(평가서 dto로 리턴)
    @Select("SELECT * FROM pr_planning WHERE PlanNo = #{planNo}")
    Evaluation findByPlanNo(int planNo);
    
    // 계획서 신규 생성 #{addUser}
    @Insert("INSERT pr_planning (AddUser, AddDate, PRName, PIProperty, SuPIProperty, PRDate, PRDay, Gubun, Reason)"
    		+ " VALUES ('장우진', SYSDATE(), #{prName}, #{piproperty}, #{suPIProperty}, #{prDate}, #{prDay}, #{gubun}, #{reason})")
    @Options(useGeneratedKeys=true, keyProperty="planNo")
    void insert(Planning planning);
	
    // [기본사항] 수정(다음) #{modUser}
    @Update("UPDATE pr_planning SET "
    		+ "PRName = #{prName}, "
    		+ "PIProperty = #{piproperty}, "
    		+ "SuPIProperty = #{suPIProperty}, "
    		+ "PRDate = #{prDate}, "
    		+ "PRDay = #{prDay}, "
    		+ "Gubun = #{gubun}, "
    		+ "Reason = #{reason}, "
    		+ "ModUser = '장우진', ModDate = SYSDATE() "
    		+ "WHERE PlanNo = #{planNo} "
    		+ "AND (State IS NULL OR State = 'W') ")
    void update01(Planning planning);
    
    // [판매계획] 수정(임시저장 or 다음) #{modUser}
    @Update("UPDATE pr_planning SET "
    		+ "StartTime = #{startTime}, "
    		+ "EndTime = #{endTime}, "
    		+ "ModUser = '장우진', ModDate = SYSDATE() "
    		+ "WHERE PlanNo = #{planNo} " 
    		+ "AND (State IS NULL OR State = 'W') ")
    void update02(Planning planning);
    
    // [홍보포인트] 수정(임시저장) #{modUser}
    @Update("UPDATE pr_planning SET "
    		+ "LinkedGoods = #{linkedGoods}, "
    		+ "PRMethod = #{prMethod}, "
    		+ "PRTools = #{prTools}, "
    		+ "PRMessage = #{prMessage}, "
    		+ "Etc = #{etc}, "
    		+ "ModUser = '장우진', ModDate = SYSDATE() "
    		+ "WHERE PlanNo = #{planNo} "
    		+ "AND (State IS NULL OR State = 'W') ")
    void save03(Planning planning);
    
    // [홍보포인트] 수정(계획서작성) #{modUser}
    @Update("UPDATE pr_planning SET "
    		+ "LinkedGoods = #{linkedGoods}, "
    		+ "PRMethod = #{prMethod}, "
    		+ "PRTools = #{prTools}, "
    		+ "PRMessage = #{prMessage}, "
    		+ "Etc = #{etc}, "
    		+ "State = 'W', "
    		+ "ModUser = '장우진', ModDate = SYSDATE() "
    		+ "WHERE PlanNo = #{planNo} "
    		+ "AND (State IS NULL OR State = 'W') ")
    void update03(Planning planning);
    
    // [계획서조회] 검토요청 #{modUser}
    @Update("UPDATE pr_planning SET "    		
    		+ "State = 'R' "
    		+ "WHERE PlanNo = #{planNo}")
    void request(int planNo);

    // [계획서조회] 관리자승인 #{ConfirmUser}
    @Update("UPDATE pr_planning SET "    		
    		+ "State = 'C' "
    		+ "ConfirmUser = '장우진', ConfirmDate = SYSDATE() "
    		+ "WHERE PlanNo = #{planNo}")
    void confirm(int planNo);
    

//    @Delete("DELETE FROM pr_planning WHERE PlanNo = #{planNo}")
//    void delete(int planNo);

}