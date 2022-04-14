package com.example.DurePRteam.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.DurePRteam.dto.FileDto;
import com.example.DurePRteam.dto.GoodsEval;
import com.example.DurePRteam.mapper.CommonCodeDetailMapper;
import com.example.DurePRteam.mapper.FileMapper;
import com.example.DurePRteam.mapper.GoodsEvalMapper;
import com.example.DurePRteam.paging.Criteria;
import com.example.DurePRteam.paging.Paging;

@Controller
@RequestMapping("file")
public class FileController {
    
	@Autowired FileMapper fileMapper;
	
	// [운영2] 파일업로드
	@PostMapping("uploadFile")
	@ResponseBody
	public void uploadFile(Model model, @RequestParam("uploadFile") MultipartFile[] uploadFiles, @RequestParam("evalNo") int evalNo) throws IllegalStateException, IOException {

		if (!uploadFiles[0].isEmpty()) {
			// 파일테이블 삭제
			fileMapper.delete(evalNo);
		}
		
		List<FileDto> list = new ArrayList<>();
		for (MultipartFile file: uploadFiles) {
			if (!file.isEmpty()) {
				// UUID를 이용해 unique한 파일 이름을 만들어준다.
				FileDto dto = new FileDto();
				dto.setUuid(UUID.randomUUID().toString());
				dto.setEvalNo(evalNo);
				dto.setFileName(file.getOriginalFilename());
				dto.setContentType(file.getContentType());
				
				list.add(dto);
				
				File newFilename = new File(dto.getUuid() + "_" + dto.getFileName());
				// 전달된 내용을 실제 물리적인 파일로 저장해준다.
				file.transferTo(newFilename);
				
				// 파일테이블에 정보저장
				fileMapper.insert(dto);
			}
		}
		model.addAttribute("files", list);		
	}
}