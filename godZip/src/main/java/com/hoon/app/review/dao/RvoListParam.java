package com.hoon.app.review.dao;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RvoListParam {
	
	private String searchType;
	private String searchValue;
    private int subCaNo;
    private int memberNo;
    private Map<String, String> searchMap;
    
    @Autowired
    public RvoListParam(int no, Map<String, String> searchMap) {
        this.subCaNo = no;
        this.memberNo = no;
        this.searchMap = searchMap;
        this.searchType = searchMap.get("searchType");
        this.searchValue = searchMap.get("searchValue");

	}

}
