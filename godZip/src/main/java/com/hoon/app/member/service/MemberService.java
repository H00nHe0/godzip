package com.hoon.app.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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


}
