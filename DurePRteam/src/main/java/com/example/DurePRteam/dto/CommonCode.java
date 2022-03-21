package com.example.DurePRteam.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CommonCode {
	// 공통코드 마스터	
    String masterCode;
    String text;
    String remark;
    String activeYN;
    String addUser;
    Date addDate;
    String modUser;
    Date modDate;
}