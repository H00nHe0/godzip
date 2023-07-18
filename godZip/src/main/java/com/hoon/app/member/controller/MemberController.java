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
	
	//회원가입 화면
	@GetMapping("joinForm")
	public String joinForm() {
		
		return "member/joinForm";
	}
	//닉네임 유효성 검사
	@GetMapping("nickDupChk")
	@ResponseBody
	public int nickDupChk(@RequestParam("nick")String nick) {
		System.out.println(nick);
		MemberVo mvo = ms.nickDupChk(nick);
		System.out.println(mvo);
		if(mvo!=null) { //이미존재하는 닉네임
			return 0;
		}else {			//사용가능한 닉네임
			return 1; 		
		}
	}
	//아이디 유효성 검사
	@GetMapping("idDupChk")
	@ResponseBody
	public int idDupChk(@RequestParam("id")String id) {
		System.out.println(id);
		MemberVo mvo = ms.idDupChk(id);
		System.out.println(mvo);
		if(mvo!=null) {      //이미존재하는 아이디
			return 0;
		}else {				//사용가능한 아이디
			return 1; 		
		}
	}	
	//회원가입 처리
	@PostMapping("join")
	public String join(MemberVo mvo, HttpSession session, Model model) {
		
		int result = ms.join(mvo);
		
		if(result != 1) {
			model.addAttribute("errorMsg" , "회원 가입 실패..");
			return "common/error-page";			
		}
			session.setAttribute("alertMsg", "회원가입 성공! 가입하신정보로 다시 로그인 해주세요");
			return "redirect:/home";		
			
	}
	//로그인
	@GetMapping("loginForm")
	public String loginForm() {
		
		return "member/loginForm";
	}
	//로그인 기능
	@PostMapping("login")
	public String login(MemberVo mvo, RedirectAttributes rttr, HttpSession session) {
		System.out.println(mvo);
		if(mvo.getId()==null||mvo.getId().equals("")||mvo.getPwd()==null||mvo.getPwd().equals("")) {
			rttr.addFlashAttribute("msgType", "errorMsg");
			rttr.addFlashAttribute("msg", "아이디와 비밀번호를 모두 입력해주세요");
			return "redirect:/member/loginForm";
		}
		MemberVo loginMember = ms.login(mvo);
		if(loginMember != null) {//로그인 성공
			//session.setAttribute("alertMsg", "로그인 성공!");			
			rttr.addFlashAttribute("msgType", "successMsg");
			rttr.addFlashAttribute("msg", "로그인 성공!");
			session.setAttribute("mvo", loginMember); //${!empty mvo}
			return "redirect:/home";
		}else {//로그인 실패
			rttr.addFlashAttribute("msgType", "errorMsg");
			rttr.addFlashAttribute("msg", "로그인에 실패하였습니다. 아이디와 비밀번호를 확인해 주세요");

			return "redirect:/member/loginForm";
		}
		
	}
	//로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home";
	}
	
	//마이페이지 비번확인 화면이동
	@GetMapping("myPagePwdChk")
	public String myPagePwdChk() {
		return "member/myPagePwdChk";
	}
	//마이페이지 화면이동
	@GetMapping("myPage")
	public String myPage() {
		return "member/myPage";
	}	
	
	//마이페이지 비번확인
	@PostMapping("myPagePwdChk")
	public String myPagePwdChk(@RequestParam("pwd") String pwd, HttpSession session, RedirectAttributes rttr) {
		
		MemberVo mvo = (MemberVo) session.getAttribute("mvo");
		String loginId = mvo.getId();
		String loginPwd = mvo.getPwd();
		System.out.println("loginId"+"="+loginId +","+"loginPwd"+"="+loginPwd+"inputPwd = "+pwd);

		if(!loginPwd.equals(pwd)) { // 비번 틀리면
			rttr.addFlashAttribute("msgType", "errorMsg");
			rttr.addFlashAttribute("msg", "비밀번호를 확인 해주세요");
			return "redirect:/member/myPagePwdChk";
		}else { //비번 맞으면
			rttr.addFlashAttribute("msgType", "successMsg");
			rttr.addFlashAttribute("msg", "본인확인이 완료되었습니다!");
			return "redirect:/member/myPage";
		}
	}
	//회원정보 수정 페이지 이동
	@GetMapping("editInfo")
	public String editInfo() {
		return "member/editInfo";
	}
	
		
	
}
