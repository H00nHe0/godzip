package com.hoon.app.inquiry.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hoon.app.common.page.vo.PageVo;
import com.hoon.app.inquiry.vo.FaqVo;
import com.hoon.app.inquiry.vo.InquiryTypeVo;
import com.hoon.app.inquiry.vo.InquiryVo;

@Repository
public class InquiryDao {

	public List<FaqVo> getFAQList(SqlSessionTemplate sst) {
		return sst.selectList("inquiry.getFAQList");
	}

	public List<InquiryVo> getInquiryList(SqlSessionTemplate sst, PageVo pv, Map<String, String> searchMap) {
		int limit = pv.getBoardLimit();
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset , limit);
		return sst.selectList("inquiry.getInquiryList",searchMap, rb);
	}
	public List<InquiryVo> myQList(SqlSessionTemplate sst, PageVo pv, int no) {
		int limit = pv.getBoardLimit();
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset , limit);
		return sst.selectList("inquiry.myQList", no, rb);
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


	public int getCnt(SqlSessionTemplate sst, Map<String, String> searchMap) {
		return sst.selectOne("inquiry.getCnt" , searchMap);
	}

	public int myQCnt(SqlSessionTemplate sst, int no) {
		return sst.selectOne("inquiry.myQCnt", no);
	}

	public int answerInsert(SqlSessionTemplate sst, String answer, int no) {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("answer", answer);
	    paramMap.put("no", no);
	    return sst.update("inquiry.answerInsert", paramMap);
	}

}
