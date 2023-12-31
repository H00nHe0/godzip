package com.hoon.app.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hoon.app.common.page.vo.PageVo;
import com.hoon.app.grade.vo.GradeVo;
import com.hoon.app.inquiry.service.InquiryService;
import com.hoon.app.inquiry.vo.InquiryVo;
import com.hoon.app.member.service.MemberService;
import com.hoon.app.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Slf4j
@RequestMapping("member")
@Controller
public class MemberController {

	private MemberService ms;
	private InquiryService is;
	@Autowired
	public MemberController(MemberService ms, InquiryService is) {
		this.ms = ms;
		this.is = is;
	}
	//회원가입 화면
	@GetMapping("joinForm")
	public String joinForm() {
		
		return "member/joinForm";
	}
	//닉네임 중복 검사
	@GetMapping("nickDupChk")
	@ResponseBody
	public String nickDupChk(@RequestParam("nick")String nick) {
		
		MemberVo mvo = ms.nickDupChk(nick);
		if(mvo!=null) {      
			return "duplicate";
		}else {				
			return "success"; 		
		}
	}
	//아이디 중복 검사
	@GetMapping("idDupChk")
	@ResponseBody
	public String idDupChk(@RequestParam("id")String id) {
		MemberVo mvo = ms.idDupChk(id);
		if(mvo!=null) {      
			return "duplicate";
		}else {				
			return "success"; 		
		}
	}	
	//회원가입 처리
	@PostMapping("join")
	public String join(MemberVo mvo, Model model, HttpSession session) {
		int result = ms.join(mvo);
		
		if(result != 1) {
			model.addAttribute("errorMsg" , "회원 가입 실패..");
			return "common/error-page";			
		}
			session.setAttribute("successMsg", "회원가입성공! 다시로그인 해주세요");
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
		if(mvo.getId()==null||mvo.getId().equals("")||mvo.getPwd()==null||mvo.getPwd().equals("")) {
			rttr.addFlashAttribute("msgType", "errorMsg");
			rttr.addFlashAttribute("msg", "아이디와 비밀번호를 모두 입력해주세요");
			return "redirect:/member/loginForm";
		}
		MemberVo loginMember = ms.login(mvo);
		if(loginMember != null) {//로그인 성공
			int no = loginMember.getNo();
			//출석일수 변동(하루에 여러번 로그인해도 같은날이면 1 증가)
			LocalDate today = LocalDate.now();
			//날짜 포멧 정의&적용
			 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy/MM/dd");
			 String formatedToday = today.format(formatter);
			 //멤버가 첫 로그인하면 lastvisit아직 업데이트 안되어 있어서 에러남
			 if(!(loginMember.getLastVisit() == null)) {
				 String formatedLastVisit = loginMember.getLastVisit().substring(2,10).replace("-", "/");
				 //최근 로그아웃 날짜랑 오늘날짜 비교(문자열)
				 if(!formatedLastVisit.equals(formatedToday)) {
					 log.info("loginMember.getLastVisit() : "+loginMember.getLastVisit()+", formatedToday : "+formatedToday);
					 int alreadyVisit = ms.updateTotalVisit(no);
					 if (alreadyVisit == 1) {
						 log.info("Visited days column updated");
					 } else {
						 log.info("Error updating visited days column");
					 }
				 }else {
					 log.info("오늘 로그인  이미 함");
				 }
			 }else {//getLastVist이null이면(첫 로그인이면)
				 int result = ms.updatefirstVisit(no,formatedToday);
				 
			 }
			
			rttr.addFlashAttribute("msgType", "successMsg");
			rttr.addFlashAttribute("msg", "로그인 성공!");
			//총방문횟수 업뎃되면 업데이트 반영한 정보 세션에 담기
			loginMember = ms.login(mvo);
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
		//로그아웃 시 lastvisit칼럼 날짜 업데이트
		MemberVo mvo = (MemberVo) session.getAttribute("mvo");
		log.info("mvo :"+mvo);
		int memberNo = mvo.getNo();
		log.info("memberNo :"+memberNo);
		int result = ms.updateLastVisit(memberNo);
		if(result != 1) {
			log.info("error occurred when logout with updating last_visit column");
			session.setAttribute("alertMsg", "로그아웃 중에 문제가 발생하였습니다. 다시 시도해 주세요");
			return "redirect:/home";			
		}else {
			session.invalidate();
			return "redirect:/home";
		}
	}
	
	//마이페이지 비번확인 화면이동
	@GetMapping("myPagePwdChk")
	public String myPagePwdChk() {
		return "member/myPagePwdChk";
	}
	//마이페이지 비번확인
	@PostMapping("myPagePwdChk")
	public String myPagePwdChk(@RequestParam("pwd") String pwd, HttpSession session, RedirectAttributes rttr) {
		
		MemberVo mvo = (MemberVo) session.getAttribute("mvo");
		String loginId = mvo.getId();
		String loginPwd = mvo.getPwd();
		
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
	//마이페이지 화면이동
	@GetMapping("myPage")
	public String myPage(@RequestParam(defaultValue = "1") int page ,HttpSession session, Model model) {
		MemberVo loginMember = (MemberVo) session.getAttribute("mvo");		
		int no = loginMember.getNo();
		//최신 회원정보 반영(리뷰 등록 개수 등)
		loginMember = ms.updateMemberInfo(no);
		session.setAttribute("mvo", loginMember);
		//페이징
		int listCount = is.myQCnt(no);
		int currentPage = page;
		int pageLimit = 5;
		int boardLimit = 5;
		PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);	
		log.info("myQCnt:"+listCount);
		log.info("pv:"+pv);
		model.addAttribute("pv" , pv);
		List<InquiryVo> ivoList = is.myQList(pv, no);
		log.info("ivoList : "+ivoList);
		model.addAttribute("ivoList", ivoList);
		List<GradeVo> gradeList = ms.gradeList();
		model.addAttribute("gradeList", gradeList);
		
		return "member/myPage";
	}	
	
	//회원정보 수정 페이지 이동
	@GetMapping("editInfo")
	public String editInfo() {
		return "member/editInfo";
	}
	//프로파일 사진 업로드
	@PostMapping("uploadProfile")
	@ResponseBody
	public String uploadProfile(MultipartFile profile, @RequestParam int no, HttpSession session) throws Exception {
		String profileFolder = "C:\\dev\\sidePrjRepo\\godzipGit\\godZip\\src\\main\\webapp\\resources\\img\\memberImg";
			log.info("Uplodaed profile img :"+ profile.getOriginalFilename());
			log.info("Uplodaed profile size :"+ profile.getSize());
			String uploadedFileName = profile.getOriginalFilename();
			//IE has file path
			uploadedFileName = uploadedFileName.substring(uploadedFileName.lastIndexOf("//")+1);
			log.info("only file name: "+uploadedFileName);
			//중복방지를 위한 UUID적용
			UUID uuid = UUID.randomUUID();
			uploadedFileName = uuid.toString()+"_"+uploadedFileName;
			
			File thumbnail = null;
			try {
				File saveFile = new File(profileFolder, uploadedFileName);
				profile.transferTo(saveFile);
				//이미지 타입파일인지 확인
				if(checkImageType(saveFile)) {
					try{
						thumbnail = new File(profileFolder, "s_" + uploadedFileName);
						Thumbnailator.createThumbnail(saveFile, thumbnail, 100, 100);
					}catch (IOException e) {
					    log.error("Error creating thumbnail: " + e.getMessage());
					    e.printStackTrace();
					}
				}
			}catch (Exception e) {
				log.error(e.getMessage());
			}//end catch
			String profileImg = thumbnail.getName();
			int result = ms.insertThumbnail(profileImg, no);
			if(result != 1) {
				log.info("problem occur on inserting profileImg name");
				return "error";
			}else {
				log.info("Uplodaed profile name in DB :"+ profileImg);
			    // 파일이름 한글이면 안되서 인코딩
			    String encodedFileName = URLEncoder.encode(profileImg, "UTF-8");
				MemberVo mvo = ms.updatedInfo(no);
				session.setAttribute("mvo", mvo);
				System.out.println(mvo);
				return encodedFileName;
			}
		}//end
	//이미지 파일 판단->섬네일 위해
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//기본 프로필 사진으로 변경
	@PostMapping("toDefaultImg")
	@ResponseBody
	public String toDefaultImg(@RequestParam("no") int no, HttpSession session) {
		int result = ms.toDefaultImg(no);
		if(result == 1) {
			MemberVo mvo = ms.updatedInfo(no);
			session.setAttribute("mvo", mvo);
			return "success";
		}else {
			session.setAttribute("errorMsg", "프로필 사진변경 실패..");
			return "fail";
		}
	}
	
	//회원정보 수정
	@PostMapping("editInfo")
	public String editMemberInfo(MemberVo mvo, HttpSession session) {
		MemberVo loginMember = (MemberVo) session.getAttribute("mvo");		
		int no = loginMember.getNo();
		int result = ms.editMemberInfo(mvo, no);
		if(result != 1) {
			session.setAttribute("alertMsg", "회원정보수정 실패.. 다시 시도해주세요");
			return "redirect:/member/editInfo";
		}
		session.setAttribute("alertMsg" , "회원정보 수정 성공!");			
		mvo = ms.updatedInfo(no);
		session.setAttribute("mvo", mvo);
		return "redirect:/home";
	}	
	
	//회원탈퇴
	@PostMapping("withdrawalPwdChk")
	@ResponseBody
	public String withdrawalPwdChk(@RequestParam String pwd, HttpSession session) {
		System.out.println("값넘어옴");
		MemberVo mvo = (MemberVo)session.getAttribute("mvo");
		int no = mvo.getNo();
		String memberPwd = mvo.getPwd();
		System.out.println("memberpwd : "+memberPwd+"inputpwd : "+pwd);
		if(!memberPwd.equals(pwd)) {
			return "error";
		}else {
			int result = ms.withdrawal(no);
			if(result == 1) {
				session.invalidate();
				return "success";
			}
			return "error";			
		}
	}
	
}
