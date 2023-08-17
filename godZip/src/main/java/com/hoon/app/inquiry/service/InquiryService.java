package com.hoon.app.inquiry.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoon.app.inquiry.dao.InquiryDao;
import com.hoon.app.inquiry.vo.FaqVo;
import com.hoon.app.inquiry.vo.InquiryTypeVo;
import com.hoon.app.inquiry.vo.InquiryVo;

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
	public List<InquiryVo> getInquiryList() {
		return idao.getInquiryList(sst);
	}
	public int inquiryInsert(InquiryVo ivo) {
		return idao.inquiryInsert(sst, ivo);
	}
	public List<InquiryTypeVo> selectType() {
		return idao.selectType(sst);
	}
	public InquiryVo inquiryContent(int no) {
		return idao.inquiryContent(sst, no);
	}
	public int growCnt(int no) {
		return idao.growCnt(sst, no);
	}
	public int inquiryDelete(int no) {
		return idao.inquiryDelete(sst,no);
	}
	public int boardEdit(InquiryVo ivo) {
		return idao.boardEdit(sst, ivo);
	}
	
}
