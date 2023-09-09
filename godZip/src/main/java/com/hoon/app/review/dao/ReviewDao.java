package com.hoon.app.review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hoon.app.common.page.vo.PageVo;
import com.hoon.app.review.vo.CommentVo;
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
	public List<ReviewVo> myReviewList(SqlSessionTemplate sst, int memberNo, PageVo pv, Map<String, String> searchMap) {
		int limit = pv.getBoardLimit();
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset , limit);	
		RvoListParam rp = new RvoListParam(memberNo,searchMap);
		
		return sst.selectList("review.myReviewList", rp, rb);
	}
	public List<ReviewVo> searchList(SqlSessionTemplate sst, PageVo pv, String searchValue) {
		int limit = pv.getBoardLimit();
		int offset = (pv.getCurrentPage()-1) * limit;
		RowBounds rb = new RowBounds(offset , limit);	
		
		return sst.selectList("review.searchList",new HashMap<String, Object>() {{
	        put("pv", pv);
	        put("searchValue", searchValue);
	    }});
	}

	public int getCnt(SqlSessionTemplate sst,int subCaNo, Map<String, String> searchMap) {
		RvoListParam rp = new RvoListParam(subCaNo,searchMap);
		System.out.println("it is rp : "+rp.getSearchType()+rp.getSearchValue());
		return sst.selectOne("review.getCnt" ,rp);
	}
	public int getTotalCnt(SqlSessionTemplate sst, String searchValue) {
		return sst.selectOne("review.getTotalCnt", searchValue);
	}
	public int getMyReviewCnt(SqlSessionTemplate sst, int memberNo, Map<String, String> searchMap) {
		RvoListParam rp = new RvoListParam(memberNo,searchMap);
		System.out.println("it is rp : "+rp.getSearchType()+rp.getSearchValue());
		return sst.selectOne("review.getMyReviewCnt" ,rp);
	}

	public ReviewVo getDetail(SqlSessionTemplate sst, int no) {
		return sst.selectOne("review.getDetail", no);
	}

	public int growCnt(SqlSessionTemplate sst, int no) {
		return sst.update("review.growCnt", no);
	}
	public int likeManage(SqlSessionTemplate sst, int no, int memberNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("memberNo", memberNo);
		return sst.insert("review.likeManage", map);
	}

	public int addLike(SqlSessionTemplate sst, int no) {
		return sst.update("review.addLike", no);
	}

	public int likeChk(SqlSessionTemplate sst, int no, int memberNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("memberNo", memberNo);
		return sst.selectOne("review.likeChk", map);
	}

	public int cancelLike(SqlSessionTemplate sst, int no, int memberNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("memberNo", memberNo);
		return sst.delete("review.cancelLike", map);
	}

	public int downLike(SqlSessionTemplate sst, int no) {
		return sst.update("review.downLike", no);
	}

	public int insertComment(SqlSessionTemplate sst, int reviewNo,String content, int memberNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("reviewNo", reviewNo);
		map.put("content", content);
		map.put("memberNo", memberNo);
		return sst.insert("review.insertComment", map);
	}

	public List<CommentVo> getClist(SqlSessionTemplate sst, int reviewNo) {
		return sst.selectList("review.getClist", reviewNo);
	}

	public int growCommCnt(SqlSessionTemplate sst, int reviewNo) {
		return sst.update("review.growCommCnt", reviewNo);
	}

	public int selectCommCnt(SqlSessionTemplate sst, int reviewNo) {
		return sst.selectOne("review.selectCommCnt", reviewNo);
	}

	public List<ReviewVo> recentReview(SqlSessionTemplate sst) {
		return sst.selectList("review.recentReview");
	}

	public int deleteReview(SqlSessionTemplate sst, int reviewNo) {
		return sst.delete("review.deleteReview", reviewNo);
	}

	public int editReview(SqlSessionTemplate sst, ReviewVo rvo) {
		return sst.update("review.editReview", rvo);
	}


	}


