package com.hoon.app.review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hoon.app.review.vo.ReviewVo;

@Repository
public class ReviewDao {

	public int submitReview(SqlSessionTemplate sst, ReviewVo rvo) {

		return sst.insert("review.submitReview", rvo);
	}

	public List<ReviewVo> getRvoList(SqlSessionTemplate sst, int categoryNo) {
		return sst.selectList("review.getRvoList", categoryNo);
	}

}
