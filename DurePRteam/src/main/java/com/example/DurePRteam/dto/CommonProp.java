package com.example.DurePRteam.dto;

import java.text.SimpleDateFormat;

import lombok.Data;

@Data
public class CommonProp {
	// 공통코드 마스터
    String piProperty;
    String piPropname;
    String piActive;
    String piAddUser;
    SimpleDateFormat piAddDate;
    String piModUser;
    SimpleDateFormat piModDate;
}