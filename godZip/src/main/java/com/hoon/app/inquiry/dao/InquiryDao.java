package com.hoon.app.inquiry.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hoon.app.inquiry.vo.FaqVo;
import com.hoon.app.inquiry.vo.InquiryTypeVo;
import com.hoon.app.inquiry.vo.InquiryVo;

@Repository
public class InquiryDao {

	public List<FaqVo> getFAQList(SqlSessionTemplate sst) {
		return sst.selectList("inquiry.getFAQList");
	}

	public List<InquiryVo> getInquiryList(SqlSessionTemplate sst) {
		return sst.selectList("inquiry.getInquiryList");
	}

	public int inquiryInsert(SqlSessionTemplate sst, InquiryVo ivo) {
		return sst.insert("inquiry.inquiryInsert", ivo);
	}

	public List<InquiryTypeVo> selectType(SqlSessionTemplate sst) {
		return sst.selectList("inquiry.selectType");
	}

	public InquiryVo inquiryContent(SqlSessionTemplate sst, int no) {
		return sst.selectOne("inquiry.inquiryContent",no);
	}

	public int growCnt(SqlSessionTemplate sst, int no) {
		return sst.update("inquiry.growCnt", no);
	}

	public int inquiryDelete(SqlSessionTemplate sst, int no) {
		return sst.update("inquiry.inquiryDelete", no);
	}

	public int boardEdit(SqlSessionTemplate sst, InquiryVo ivo) {
		return sst.update("inquiry.boardEdit", ivo);
	}

	public List<InquiryVo> myQList(SqlSessionTemplate sst, int no) {
		return sst.selectList("inquiry.myQList", no);
	}

}
