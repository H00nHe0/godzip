package com.hoon.app.inquiry.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hoon.app.inquiry.vo.FaqVo;

@Repository
public class InquiryDao {

	public List<FaqVo> getFAQList(SqlSessionTemplate sst) {
		return sst.selectList("inquiry.getFAQList");
	}

}
