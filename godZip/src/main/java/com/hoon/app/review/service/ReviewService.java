package com.hoon.app.review.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoon.app.member.dao.MemberDao;
import com.hoon.app.review.dao.ReviewDao;
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

	public List<ReviewVo> getRvoList(int categoryNo) {
		return rdao.getRvoList(sst, categoryNo);
	}

}
