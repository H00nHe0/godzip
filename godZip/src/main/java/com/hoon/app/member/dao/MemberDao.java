package com.hoon.app.member.dao;

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

	public MemberVo myPagePwdChk(SqlSessionTemplate sst, String loginId, String pwd) {
		return sst.selectOne("member.myPagePwdChk",loginId, pwd);
	}

}