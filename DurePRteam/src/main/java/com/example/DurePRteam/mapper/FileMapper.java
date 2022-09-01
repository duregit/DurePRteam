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
import com.example.DurePRteam.dto.FileDto;
import com.example.DurePRteam.dto.GoodsEval;
import com.example.DurePRteam.paging.Criteria;

@Mapper
public interface FileMapper {
	
	// 특정조회(평가서번호로 조회)
    @Select("SELECT * FROM pr_evaluation_file WHERE EvalNo = #{evalNo}")
    List<FileDto> findByEvalNo(int evalNo);
    
    // 파일 업로드 생성
    @Insert("INSERT pr_evaluation_file (Uuid, EvalNo, FilePath, FileName, OriginName, ContentType) "
    		+ "VALUES (#{uuid}, #{evalNo}, #{filePath}, #{fileName}, #{originName}, #{contentType} )")
    //@Options(useGeneratedKeys=true, keyProperty="evalNo")
    void insert(FileDto file);
    
	// 파일 업로드 전 삭제
    @Delete("DELETE FROM pr_evaluation_file WHERE EvalNo = #{evalNo}")
    void delete(int evalNo);
}