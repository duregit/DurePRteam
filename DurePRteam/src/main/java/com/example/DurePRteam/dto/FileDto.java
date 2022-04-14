package com.example.DurePRteam.dto;

import lombok.Data;

@Data
public class FileDto {

	String uuid;
	int evalNo;
	String filePath;
	String fileName;
	String contentType;
}