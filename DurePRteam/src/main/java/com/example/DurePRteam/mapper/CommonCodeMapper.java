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
import com.example.DurePRteam.paging.Criteria;

@Mapper
public interface CommonCodeMapper {
	
	// [공통코드] 전체조회
	@Select("SELECT * FROM pr_code_master "
			+ "LIMIT #{pageStart}, #{perPageNum}")
    List<CommonCode> findAll(Criteria cri);
	
	// [공통코드] 전체조회 count
	@Select("SELECT COUNT(*) FROM pr_code_master")
    int findAllCount();
	
	// [공통코드] 하나만조회
	@Select("SELECT * FROM pr_code_master WHERE MasterCode = #{masterCode}")
    CommonCode findOne(String masterCode);

	// [공통코드] 생성 #{addUser}
    @Insert("INSERT pr_code_master (MasterCode, Text, ActiveYN, Remark, AddUser, AddDate) "
    		+ "VALUES (#{masterCode}, #{text}, #{activeYN}, #{remark}, 'IT관리자', SYSDATE() )")
    //@Options(useGeneratedKeys=true, keyProperty="id") 설명: id필드는 Auto Increment 속성
    void insert(CommonCode commonCode);
    
	// [공통코드] 수정 #{modUser}
	@Update("UPDATE pr_code_master SET          " +
            "  Text = #{text}, 			        " +
            "  ActiveYN = #{activeYN},          " +
            "  Remark = #{remark},   	        " +
            "  ModUser = 'IT관리자',                " +
            "  ModDate = SYSDATE()              " +
            "WHERE MasterCode = #{masterCode}	")
    void update(CommonCode commonCode);

}