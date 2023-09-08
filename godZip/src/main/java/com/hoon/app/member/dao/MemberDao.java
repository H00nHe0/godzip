package com.hoon.app.member.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.hoon.app.grade.vo.GradeVo;
import com.hoon.app.member.vo.MemberVo;

@Repository
public class MemberDao {

	public int join(SqlSessionTemplate sst, MemberVo mvo) {
		return sst.insert("member.join",mvo);
	}

	public MemberVo nickDupChk(SqlSessionTemplate sst, String nick) {
		return sst.selectOne("member.nickDupChk", nick);
	}

	public MemberVo idDupChk(SqlSessionTemplate sst, String id) {
		return sst.selectOne("member.idDupChk", id);
	}

	public MemberVo login(SqlSessionTemplate sst, MemberVo mvo) {
		return sst.selectOne("member.login", mvo);
	}
	public int updateTotalVisit(SqlSessionTemplate sst, int no) {
		return sst.update("member.updateTotalVisit", no);
	}

	public int editMemberInfo(SqlSessionTemplate sst, MemberVo mvo, int no) {
		mvo.setNo(no);
		return sst.update("member.editMemberInfo", mvo);
	}

	public MemberVo updatedInfo(SqlSessionTemplate sst, int no) {
		return sst.selectOne("member.updatedInfo", no);
	}

	public int insertThumbnail(SqlSessionTemplate sst, String profileImg, int no) {
	    return sst.update("member.insertThumbnail", new HashMap<String, Object>() {{
	        put("profileImg", profileImg);
	        put("no", no);
	    }});
	}

	public int updateLastVisit(SqlSessionTemplate sst, int memberNo) {
		return sst.update("member.updateLastVisit", memberNo);
	}


	public List<GradeVo> gradeList(SqlSessionTemplate sst) {
		return sst.selectList("member.gradeList");
	}

	public int withdrawal(SqlSessionTemplate sst,int no) {
		return sst.update("member.withdrawal", no);
	}

	public int toDefaultImg(SqlSessionTemplate sst, int no) {
		return sst.update("member.toDefaultImg", no);
	}

	public int updatefirstVisit(SqlSessionTemplate sst, int no, String formatedToday) {
		return sst.update("member.updateLastVisit", no);
	}

	public MemberVo updateMemberInfo(SqlSessionTemplate sst, int no) {
		return sst.selectOne("member.updateMemberInfo",no);
	}



}
