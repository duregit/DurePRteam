package com.example.DurePRteam.mapper;
 
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.mybatis.spring.annotation.MapperScan;

import com.example.DurePRteam.dto.GoodsMaster;

@MapperScan
public interface GoodsMasterMapper {
	
	// [생활재정보] 검색
	@Select("SELECT * FROM pr_goodsmaster")
    List<GoodsMaster> findAll();	
	
	// [생활재정보] 하나만조회
	@Select("SELECT * FROM pr_goodsmaster WHERE GmSeq = #{gmSeq}")
	GoodsMaster findOne(int gmSeq);
	
//
//	// [공통코드] 생성
//    @Insert("INSERT pr_code_master (MasterCode, Text, ActiveYN, Remark, AddUser, AddDate) "
//    		+ "VALUES (#{masterCode}, #{text}, #{activeYN}, #{remark}, '장우진', SYSDATE() )")
//    //@Options(useGeneratedKeys=true, keyProperty="id") 설명: id필드는 Auto Increment 속성
//    void insert(CommonCode commonCode);
//    
//	// [공통코드] 수정
//	@Update("UPDATE pr_code_master SET          " +
//            "  Text = #{text}, 			        " +
//            "  ActiveYN = #{activeYN},          " +
//            "  Remark = #{remark},   	        " +
//            "  ModUser = '장우진',                " +
//            "  ModDate = SYSDATE()              " +
//            "WHERE MasterCode = #{masterCode}	")
//    void update(CommonCode commonCode);

}