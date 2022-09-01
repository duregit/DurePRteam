package com.example.DurePRteam.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.DurePRteam.dto.Evaluation;
import com.example.DurePRteam.dto.EvaluationGoodsInfo;
import com.example.DurePRteam.dto.FileDto;
import com.example.DurePRteam.dto.GoodsEval;
import com.example.DurePRteam.mapper.CommonCodeDetailMapper;
import com.example.DurePRteam.mapper.FileMapper;
import com.example.DurePRteam.mapper.GoodsEvalMapper;
import com.example.DurePRteam.paging.Criteria;
import com.example.DurePRteam.paging.Paging;
import com.google.gson.Gson;

@Controller
@RequestMapping("file")
public class FileController {
		
	@Autowired FileMapper fileMapper;
	
	@Value("${filePath}")
	private String filePath;	// 파일경로
	
	// [운영2] 파일업로드
	@PostMapping("uploadFile")
	@ResponseBody
	public void uploadFile(Model model, @RequestParam("uploadFile") MultipartFile[] uploadFiles, @RequestParam("evalNo") int evalNo) throws IllegalStateException, IOException {
		if (!uploadFiles[0].isEmpty()) {
			
			// 파일 삭제
			List<FileDto> files = fileMapper.findByEvalNo(evalNo);
			for (FileDto file : files) {
				File delFile = new File(file.getFilePath());
				
				if (delFile.exists()) {
					if (delFile.delete()) { // f.delete 파일 삭제에 성공하면 true, 실패하면 false
		                System.out.println("파일을 삭제하였습니다");
		            } else {
		                System.out.println("파일 삭제에 실패하였습니다");
		            } 
				} else {
	                System.out.println("파일이 존재하지 않습니다.");
	            }
	    	}
			
			fileMapper.delete(evalNo);			
		}
		
		List<FileDto> list = new ArrayList<>();
		for (MultipartFile file: uploadFiles) {
			if (!file.isEmpty()) {				
				// UUID를 이용해 unique한 파일 이름을 만들어준다.
				FileDto dto = new FileDto();
				dto.setUuid(UUID.randomUUID().toString());
				dto.setEvalNo(evalNo);
				dto.setFilePath(filePath + dto.getUuid() + "_" + file.getOriginalFilename());
				dto.setFileName(dto.getUuid() + "_" + file.getOriginalFilename());
				dto.setOriginName(file.getOriginalFilename());
				dto.setContentType(file.getContentType());
				
				list.add(dto);
				
				File newFilename = new File(dto.getFileName());
				// 전달된 내용을 실제 물리적인 파일로 저장해준다.
				file.transferTo(newFilename);
				
				// 파일테이블에 정보저장
				fileMapper.insert(dto);
			}
		}
		model.addAttribute("files", list);		
	}
	
	// [운영2] 파일정보 조회
    @PostMapping("fileSelect")
    @ResponseBody
    public String fileSelect(HttpServletResponse response, @RequestBody Evaluation eval) {
    	// 생활재정보 조회
    	List<FileDto> files = fileMapper.findByEvalNo(eval.getEvalNo());
    	
    	Gson gson = new Gson();
    	Map<String, Object> map = new HashMap<String, Object>();

    	for (int i = 0; i < files.size(); i++) {
    		map.put("files"+i, files.get(i));
    	}
		
    	String jsonString = gson.toJson(map);
        
    	return jsonString;
    }
}