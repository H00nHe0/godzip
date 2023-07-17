package com.hoon.app.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String joinForm() {
		
		return "member/joinForm";
	}
	//�г��� ��ȿ�� �˻�
	@GetMapping("nickDupChk")
	@ResponseBody
	public int nickDupChk(@RequestParam("nick")String nick) {
		System.out.println(nick);
		MemberVo mvo = ms.nickDupChk(nick);
		System.out.println(mvo);
		if(mvo!=null) { //�̹������ϴ� �г���
			return 0;
		}else {			//��밡���� �г���
			return 1; 		
		}
	}
	//���̵� ��ȿ�� �˻�
	@GetMapping("idDupChk")
	@ResponseBody
	public int idDupChk(@RequestParam("id")String id) {
		System.out.println(id);
		MemberVo mvo = ms.idDupChk(id);
		System.out.println(mvo);
		if(mvo!=null) {     //�̹������ϴ� ���̵�
			return 0;
		}else {				//��밡���� ���̵�
			return 1; 		
		}
	}	
	//ȸ������ ó��
	@PostMapping("join")
	public String join(MemberVo mvo, HttpSession session, Model model) {
		
		int result = ms.join(mvo);
		
		if(result != 1) {
			model.addAttribute("errorMsg" , "ȸ������ ����...");
			return "common/error-page";			
		}
			session.setAttribute("alertMsg", "ȸ������ ����! �����Ͻ������� �ٽ� �α��� ���ּ���");
			return "redirect:/home";		
			
	}
	//�α��� ȭ�� �̵�
	@GetMapping("loginForm")
	public String loginForm() {
		
		return "member/loginForm";
	}
	//�α���
	@PostMapping("login")
	public String login(MemberVo mvo, RedirectAttributes rttr, HttpSession session) {
		System.out.println(mvo);
		if(mvo.getId()==null||mvo.getId().equals("")||mvo.getPwd()==null||mvo.getPwd().equals("")) {
			rttr.addFlashAttribute("msgType", "errorMsg");
			rttr.addFlashAttribute("msg", "��� ������ �Է��� �ּ���");
			return "redirect:/member/loginForm";
		}
		MemberVo loginMember = ms.login(mvo);
		if(loginMember != null) {//�α��� ����
			session.setAttribute("alertMsg", "�α��� ����!");			
			session.setAttribute("mvo", loginMember); //${!empty mvo}
			return "redirect:/home";
		}else {//�α��� ����
			rttr.addFlashAttribute("msgType", "errorMsg");
			rttr.addFlashAttribute("msg", "�α��ο� �����Ͽ����ϴ�. ���̵�� ��й�ȣ�� Ȯ���� �ּ���");
			return "redirect:/member/loginForm";
		}
		
	}
	//�α׾ƿ�
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home";
	}
	
	//���������� ȭ���̵�
	@GetMapping("myPagePwdChk")
	public String myPage() {
		return "member/myPagePwdChk";
	}
	
	//���������� ���Ȯ��
	@PostMapping("myPagePwdChk")
	public String myPagePwdChk(@RequestParam("pwd") String pwd, HttpSession session) {
		
		MemberVo mvo = (MemberVo) session.getAttribute("mvo");
		String loginId = mvo.getId();
		System.out.println("loginId"+"="+loginId +","+"pwd"+"="+pwd);
		MemberVo result = ms.myPagePwdChk(loginId, pwd);
		System.out.println(result);
		if(result != null) { // ��� ������
			
			return "redirect:/member/myPage";
		}else { //��� �ƴϸ�
			
			return "redirect:/member/myPagePwdChk";
		}
		
		
		
	}
	
		
	
}
