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
		
	// 전체조회
	@Select("SELECT A.*, "
			+ "(SELECT SuPIPropName FROM pr_subproperty WHERE A.PIProperty = PIProperty AND A.SuPIProperty = SuPIProperty LIMIT 1) AS SUPIPropName, "	// 매장명
			+ "(SELECT GmDesc FROM pr_evaluation_goods_info WHERE A.EvalNo = EvalNo LIMIT 1) AS GmDesc "	// 생활재명
			+ "FROM pr_evaluation A "
			+ "ORDER BY A.EvalNo DESC "
			+ "LIMIT #{pageStart}, #{perPageNum} ")
    List<Evaluation> findAll(Criteria cri);
	
	// 전체조회 count
	@Select("SELECT COUNT(*) FROM pr_evaluation")
    int findAllCount();
	
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
    		+ "VALUES ('IT관리자', SYSDATE(), #{planNo}, #{prName}, #{piproperty}, #{suPIProperty}, #{prDate}, #{prDay}, #{gubun}, #{reason}, "
    		+ "#{startTime}, #{endTime}, "
    		+ "#{linkedGoods}, #{prMethod}, #{prTools}, #{prMessage}, #{etc} )")
    @Options(useGeneratedKeys=true, keyProperty="evalNo")
    void insert(Evaluation eval);
	
    // [기본사항] 수정(다음) #{modUser}
    @Update("UPDATE pr_evaluation SET "
    		+ "PRName = #{prName}, "
    		+ "PIProperty = #{piproperty}, "
    		+ "SuPIProperty = #{suPIProperty}, "
    		+ "PRDate = #{prDate}, "
    		+ "PRDay = #{prDay}, "
    		+ "Gubun = #{gubun}, "
    		+ "Weather = #{weather}, "
    		+ "Temperatures = #{temperatures}, "
    		//+ "Reason = #{reason}, "
    		+ "ModUser = 'IT관리자', ModDate = SYSDATE() "
    		+ "WHERE EvalNo = #{evalNo} "
    		+ "AND (State IS NULL OR State = '' OR State = 'W') ")
    void update01(Evaluation evaluation);
    
    // [판매결과] 수정(임시저장 or 다음) #{modUser}
    @Update("UPDATE pr_evaluation SET "
    		+ "OrderCnt = #{orderCnt}, "
    		+ "SalesCnt = #{salesCnt}, "
    		+ "StartTime = #{startTime}, "
    		+ "EndTime = #{endTime}, "
    		+ "GoodsEvalGubun = #{goodsEvalGubun}, "
    		+ "ModUser = 'IT관리자', ModDate = SYSDATE() "
    		+ "WHERE EvalNo = #{evalNo} "
    		+ "AND (State IS NULL OR State = '' OR State = 'W') ")
    void update02(Evaluation evaluation);
    
    // [생활재평가] 수정(임시저장 or 다음) #{modUser}
    @Update("UPDATE pr_evaluation SET "
    		+ "TotalScore = #{totalScore}, "
    		+ "TotalAVG = #{totalAVG}, "
    		+ "TotalText = #{totalText}, "
    		+ "ModUser = 'IT관리자', ModDate = SYSDATE() "
    		+ "WHERE EvalNo = #{evalNo} "
    		+ "AND (State IS NULL OR State = '' OR State = 'W') ")
    void update03(Evaluation evaluation);
    
    // [운영1] 수정(임시저장 or 다음) #{modUser}
    @Update("UPDATE pr_evaluation SET "
    		+ "P4Weather = #{p4Weather}, "
    		+ "P4Setting = #{p4Setting}, "
    		+ "P4Ment = #{p4Ment}, "
    		+ "P4Support = #{p4Support}, "
    		+ "P4PRMethod = #{p4PRMethod}, "
    		+ "P4GoodsSel = #{p4GoodsSel}, "
    		+ "P4Age = #{p4Age}, "
    		+ "P4Gender = #{p4Gender}, "
    		+ "P4Response = #{p4Response}, "
    		+ "P4Time = #{p4Time}, "
    		+ "P4TotalScore = #{p4TotalScore}, "
    		+ "P4TotalAVG = #{p4TotalAVG}, "
    		+ "ModUser = 'IT관리자', ModDate = SYSDATE() "
    		+ "WHERE EvalNo = #{evalNo} "
    		+ "AND (State IS NULL OR State = '' OR State = 'W') ")
    void update04(Evaluation evaluation);
    
    // [운영2] 수정(임시저장) #{modUser}
    @Update("UPDATE pr_evaluation SET "
    		+ "SalesTip = #{salesTip}, "
    		+ "GuestOpinion = #{guestOpinion}, "
    		+ "RequestList = #{requestList}, "
    		+ "Suggestion = #{suggestion}, "
    		// 이미지 첨부내용
    		+ "ModUser = 'IT관리자', ModDate = SYSDATE() "
    		+ "WHERE EvalNo = #{evalNo} "
    		+ "AND (State IS NULL OR State = '' OR State = 'W') ")
    void save05(Evaluation evaluation);
    
    // [운영2] 수정(완료) #{modUser}
    @Update("UPDATE pr_evaluation SET "
    		+ "SalesTip = #{salesTip}, "
    		+ "GuestOpinion = #{guestOpinion}, "
    		+ "RequestList = #{requestList}, "
    		+ "Suggestion = #{suggestion}, "
    		// 이미지 첨부내용
    		+ "State = 'W', "
    		+ "ModUser = 'IT관리자', ModDate = SYSDATE() "
    		+ "WHERE EvalNo = #{evalNo} "
    		+ "AND (State IS NULL OR State = '' OR State = 'W') ")
    void update05(Evaluation evaluation);
    
    // [평가서조회] 검토요청 #{modUser}
    @Update("UPDATE pr_evaluation SET "    		
    		+ "State = 'R', "
    		+ "ModUser = 'IT관리자', ModDate = SYSDATE() "
    		+ "WHERE EvalNo = #{evalNo} ")
    void request(int evalNo);

    // [평가서조회] 반려 #{ConfirmUser}
    @Update("UPDATE pr_evaluation SET "    		
    		+ "State = 'N', "
    		+ "ConfirmUser = 'IT관리자', ConfirmDate = SYSDATE() "
    		+ "WHERE EvalNo = #{evalNo} ")
    void reject(int evalNo);
    
    // [평가서조회] 관리자승인 #{ConfirmUser}
    @Update("UPDATE pr_evaluation SET "    		
    		+ "State = 'C', "
    		+ "ConfirmUser = 'IT관리자', ConfirmDate = SYSDATE() "
    		+ "WHERE EvalNo = #{evalNo} ")
    void confirm(int evalNo);
}