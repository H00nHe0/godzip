package com.hoon.app.review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hoon.app.common.page.vo.PageVo;
import com.hoon.app.review.vo.ReviewVo;

import lombok.extern.java.Log;

@Repository
public class ReviewDao {

	public int submitReview(SqlSessionTemplate sst, ReviewVo rvo) {

		return sst.insert("review.submitReview", rvo);
	}

	public List<ReviewVo> getRvoList(SqlSessionTemplate sst, int subCaNo, PageVo pv, Map<String, String> searchMap) {
		int limit = pv.getBoardLimit();
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset , limit);	
		RvoListParam rp = new RvoListParam(subCaNo,searchMap);
		
		return sst.selectList("review.getRvoList", rp, rb);
	}

	public int getCnt(SqlSessionTemplate sst,int subCaNo, Map<String, String> searchMap) {
		RvoListParam rp = new RvoListParam(subCaNo,searchMap);
		System.out.println("it is rp : "+rp.getSearchType()+rp.getSearchValue());
		return sst.selectOne("review.getCnt" ,rp);
	}

	public ReviewVo getDetail(SqlSessionTemplate sst, int no) {
		return sst.selectOne("review.getDetail", no);
	}

	public int growCnt(SqlSessionTemplate sst, int no) {
		return sst.update("review.growCnt", no);
	}

	public int likeManage(SqlSessionTemplate sst, int no) {
		return sst.update("revire.likeManage", no);
	}

}
