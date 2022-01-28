package com.example.DurePRteam.dao;
 
import java.util.List;

import com.example.DurePRteam.dto.TestDTO;
 
public interface DbMapper {
    public List<TestDTO> getList() throws Exception;
}
 
