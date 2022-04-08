package com.example.DurePRteam.dto;

import java.text.SimpleDateFormat;

import lombok.Data;

@Data
public class CommonsSubProp {
	// 공통코드 디테일
    String piProperty;
    String suPiproperty;
    String suPipropname;
    String supiActive;
    String addUser;
    SimpleDateFormat addDate;
    String modUser;
    SimpleDateFormat modDate;
}