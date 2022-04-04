package com.example.DurePRteam.mapper;
 
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.example.DurePRteam.dto.GoodsMaster;

@Mapper
public interface GoodsMasterMapper {
	
	// [생활재정보] 검색
	@Select("SELECT * FROM pr_goodsmaster")
    List<GoodsMaster> findAll();	
	
	// [생활재정보] 하나만조회
	@Select("SELECT * FROM pr_goodsmaster WHERE GmSeq = #{gmSeq}")
	GoodsMaster findOne(int gmSeq);
}