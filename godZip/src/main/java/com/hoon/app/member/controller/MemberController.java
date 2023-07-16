package com.hoon.app.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hoon.app.member.service.MemberService;
import com.hoon.app.member.vo.MemberVo;

@RequestMapping("member")
@Controller
public class MemberController {

	private final MemberService ms; 
	
	@Autowired
	public MemberController(MemberService ms) {
		this.ms = ms;
	}
	
	//ȸ������ ȭ��
	@GetMapping("joinForm")
	public String loginForm() {
		
		return "member/joinForm";
	}
	//ȸ������ ó��
	@PostMapping("join")
	public String join(MemberVo mvo, HttpSession session, Model model) {
		
		int result = ms.join(mvo);
		
		if(result != 1) {
			model.addAttribute("errorMsg" , "ȸ������ ����...");
			return "common/error-page";			
		}
			session.setAttribute("alertMsg", "ȸ������ ����!");
			return "redirect:/home";		
			
	}
	
}
