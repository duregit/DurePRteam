package com.example.DurePRteam.mapper;
 
import java.util.List;


import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.DurePRteam.dto.GoodsEval;
import com.example.DurePRteam.dto.UserMain;
import com.example.DurePRteam.paging.Criteria;

@Mapper
public interface GoodsEvalMapper {
	
	// [생활재평가 구분별 항목] 전체 조회
	@Select("SELECT CGENo, "
			+ "GubunDCode, (SELECT Text FROM pr_code_detail WHERE MasterCode = GubunMCode AND DetailCode = GubunDCode) AS GubunDText, "
			+ "ItemDCode, (SELECT Text FROM pr_code_detail WHERE MasterCode = ItemMCode AND DetailCode = ItemDCode) AS ItemDText, "
			+ "AddUser, ADDDATE, ModUser, ModDate "
			+ "FROM pr_code_goods_eval "
			+ "LIMIT #{pageStart}, #{perPageNum}")
    List<GoodsEval> findAll(Criteria cri);
	
	// [생활재평가 구분별 항목] 전체 조회 count
	@Select("SELECT COUNT(*) FROM pr_code_goods_eval")
    int findAllCount();
	
	// [생활재평가 구분별 항목] 하나만 조회
	@Select("SELECT CGENo, "
			+ "GubunDCode, (SELECT Text FROM pr_code_detail WHERE MasterCode = GubunMCode AND DetailCode = GubunDCode) AS GubunDText, "
			+ "ItemDCode, (SELECT Text FROM pr_code_detail WHERE MasterCode = ItemMCode AND DetailCode = ItemDCode) AS ItemDText, "
			+ "AddUser, ADDDATE, ModUser, ModDate "
			+ "FROM pr_code_goods_eval "
			+ "WHERE CGENo = #{cgeNo}")
	GoodsEval findOne(int cgeNo);

	// [생활재평가 구분별 항목] 구분별 평가항목 리스트
	@Select("SELECT CGENo, "
			+ "GubunDCode, (SELECT Text FROM pr_code_detail WHERE MasterCode = GubunMCode AND DetailCode = GubunDCode) AS GubunDText, "
			+ "ItemDCode, (SELECT Text FROM pr_code_detail WHERE MasterCode = ItemMCode AND DetailCode = ItemDCode) AS ItemDText, "
			+ "AddUser, ADDDATE, ModUser, ModDate "
			+ "FROM pr_code_goods_eval "
			+ "WHERE GubunDCode = #{detailCode}")
	List<GoodsEval> findByDetailCode(String detailCode);
	
	// [생활재평가 구분별 항목] 생성
    @Insert("INSERT pr_code_goods_eval (GubunMCode, GubunDCode, ItemMCode, ItemDCode, AddUser, AddDate, ModUser, ModDate) "
    		+ "VALUES (#{goodsEval.gubunMCode}, #{goodsEval.gubunDCode}, #{goodsEval.itemMCode}, #{goodsEval.itemDCode}, #{user.userId}, SYSDATE(), #{user.userId}, SYSDATE() )")
    @Options(useGeneratedKeys=true, keyProperty="goodsEval.cgeNo")// 설명: id필드는 Auto Increment 속성
    void insert(@RequestParam("goodsEval") GoodsEval goodsEval, UserMain user);
    
//	// [생활재평가 구분별 항목] 수정 #{modUser}
//	@Update("UPDATE pr_code_goods_eval SET          " +
//            "  Text = #{text}, 			        " +
//            "  ActiveYN = #{activeYN},          	" +
//            "  Remark = #{remark},   	        	" +
//            "  ModUser = #{modUser},            	" +
//            "  ModDate = SYSDATE()              	" +
//            "WHERE MasterCode = #{masterCode}	")
//    void update(CommonCode commonCode);
    
 // [생활재평가 구분별 항목] 삭제
    @Delete("DELETE FROM pr_code_goods_eval WHERE CGENo = #{cgeNo}")    
    void delete(GoodsEval goodsEval);
}