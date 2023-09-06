package com.hoon.app.review.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoon.app.common.page.vo.PageVo;
import com.hoon.app.member.dao.MemberDao;
import com.hoon.app.review.dao.ReviewDao;
import com.hoon.app.review.vo.CommentVo;
import com.hoon.app.review.vo.ReviewVo;

@Service
public class ReviewService {
	
	private final ReviewDao rdao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public ReviewService(ReviewDao rdao, SqlSessionTemplate sst) {
		this.rdao = rdao;
		this.sst = sst;
	}

	public int submitReview(ReviewVo rvo) {
		return rdao.submitReview(sst, rvo);
	}

	public List<ReviewVo> getRvoList(int subCaNo, PageVo pv, Map<String, String> searchMap) {
		return rdao.getRvoList(sst, subCaNo, pv, searchMap);
	}

	public int getCnt(int subCaNo, Map<String, String> searchMap) {
		return rdao.getCnt(sst,subCaNo, searchMap);
	}

	public ReviewVo getDetail(int no) {
		return rdao.getDetail(sst, no);
	}

	public int growCnt(int no) {
		return rdao.growCnt(sst, no);
	}

	public int likeManage(int no, int memberNo) {
		return rdao.likeManage(sst, no, memberNo);
	}

	public int addLike(int no) {
		return rdao.addLike(sst, no);
	}

	public int likeChk(int no, int memberNo) {
		return rdao.likeChk(sst, no, memberNo);
	}

	public int cancelLike(int no, int memberNo) {
		return rdao.cancelLike(sst, no, memberNo);
	}

	public int downLike(int no) {
		return rdao.downLike(sst, no);
		
	}

	public int insertComment(int reviewNo,String content, int memberNo) {
		return rdao.insertComment(sst, reviewNo,content, memberNo);
	}

	public List<CommentVo> getClist(int reviewNo) {
		return rdao.getClist(sst, reviewNo);
	}

	public int growCommCnt(int reviewNo) {
		return rdao.growCommCnt(sst,reviewNo );
		
	}

	public int selectCommCnt(int reviewNo) {
		return rdao.selectCommCnt(sst, reviewNo);
	}

	public List<ReviewVo> recentReview() {
		return rdao.recentReview(sst);
	}

}
