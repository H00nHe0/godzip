package com.hoon.app.member.service;

import java.io.File;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoon.app.grade.vo.GradeVo;
import com.hoon.app.member.dao.MemberDao;
import com.hoon.app.member.vo.MemberVo;

@Service
public class MemberService {
	
	private final MemberDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public MemberService(MemberDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	public int join(MemberVo mvo) {
		return dao.join(sst, mvo);
	}

	public MemberVo nickDupChk(String nick) {
		return dao.nickDupChk(sst,nick);
	}

	public MemberVo idDupChk(String id) {
		return dao.idDupChk(sst,id);
	}

	public MemberVo login(MemberVo mvo) {
		return dao.login(sst,mvo);
	}
	public int updateTotalVisit(int no) {
		return dao.updateTotalVisit(sst, no);
	}
	public int editMemberInfo(MemberVo mvo, int no) {
		return dao.editMemberInfo(sst,mvo, no);
	}

	public MemberVo updatedInfo(int no) {
		return dao.updatedInfo(sst, no);
	}

	public int insertThumbnail(String profileImg, int no) {

		return dao.insertThumbnail(sst, profileImg, no);
	}

	public int updateLastVisit(int memberNo) {
		return dao.updateLastVisit(sst,memberNo);
	}


	public List<GradeVo> gradeList() {
		return dao.gradeList(sst);
	}

	public int withdrawal(int no) {
		return dao.withdrawal(sst, no);
	}

	public int toDefaultImg(int no) {
		return dao.toDefaultImg(sst, no);
	}

	public int updatefirstVisit(int no, String formatedToday) {
		return dao.updatefirstVisit(sst, no, formatedToday);
	}


}
