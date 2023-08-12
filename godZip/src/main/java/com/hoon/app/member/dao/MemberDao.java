package com.hoon.app.member.dao;

import java.io.File;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

	public int editMemberInfo(SqlSessionTemplate sst, MemberVo mvo, int no) {
		mvo.setNo(no);
		return sst.update("member.editMemberInfo", mvo);
	}

	public MemberVo updatedInfo(SqlSessionTemplate sst, int no) {
		// TODO Auto-generated method stub
		return sst.selectOne("member.updatedInfo", no);
	}

	public int insertThumbnail(SqlSessionTemplate sst, String profileImg, int no) {
	    return sst.update("member.insertThumbnail", new HashMap<String, Object>() {{
	        put("profileImg", profileImg);
	        put("no", no);
	    }});
	}



}
