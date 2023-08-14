package com.hoon.app.inquiry.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoon.app.inquiry.dao.InquiryDao;
import com.hoon.app.inquiry.vo.FaqVo;

@Service
public class InquiryService {

	private final InquiryDao idao;
	private final SqlSessionTemplate sst;
	@Autowired
	public InquiryService(InquiryDao idao,SqlSessionTemplate sst) {
		this.idao = idao;
		this.sst = sst;
	}
	public List<FaqVo> getFAQList() {
		return idao.getFAQList(sst);
	}
	
}
