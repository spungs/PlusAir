package com.care.plusAir.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.plusAir.dto.memberDTO;
import com.care.plusAir.service.IMemberService;
import com.care.plusAir.service.MailService;

@Controller
public class memberController {
	@Autowired HttpSession session;
	@Autowired IMemberService service;

	// 회원가입 버튼 클릭 시 회원가입 화면
	@RequestMapping(value = "member/memberJoin/join")
	public String join() {

		return "member/memberJoin/join";
	}

	// join페이지 휴대폰으로 회원가입 클릭 시 이름 입력 화면
	@RequestMapping(value = "member/memberJoin/joinInfo")
	public String nameWrite(String korFirstName) {
		return "member/memberJoin/joinInfo";
	}

	// 회원가입페이지 인증번호 전송 버튼 클릭 시
	@Autowired private MailService mailService;
	@ResponseBody
	@PostMapping(value = "member/memberJoin/sendAuth", produces = "text/html; charset=UTF-8")
	public String sendAuth(@RequestBody(required = false) String email) {
		// Math.random() : 0~1사이의 실수를 생성(대략 소숫점 16자리까지)
		double n = Math.random();
		// 생성된 랜덤 실수를 substring으로 2번째 인덱스부터 8번째 인덱스 전까지 추출해서 문자열로 형변환
		String authNum = Double.toString(n).substring(2, 8);
		// 인증번호는 사용자별 정보이기에 session에 꼭 저장해야함.
		session.setAttribute("authNum", authNum);
		System.out.println("authNum : " + authNum);
		mailService.sendMail(email, "[인증번호]", authNum);
		return "인증번호를 이메일로 전송했습니다.";
	}

	// 회원가입페이지 인증번호 확인 버튼 클릭 시
	@ResponseBody
	@PostMapping(value = "member/memberJoin/checkAuth", produces = "text/html; charset=UTF-8")
	public String checkAuth(@RequestBody(required = false) String inputAuthNum) {
		String authNum = (String) session.getAttribute("authNum");

		session.setAttribute("authStatus", false); // 인증 체크여부 session 처음엔 false
		if (inputAuthNum == null)
			return "인증번호를 입력하세요. ";
		if (inputAuthNum.equals(authNum)) {
			session.setAttribute("authStatus", true); // 인증 체크하면 true
			return "인증 성공";
		}
		return "인증번호를 다시 확인해주세요.";
	}
	
	// 회원가입페이지 아이디 중복 확인 ajax
	@ResponseBody
	@PostMapping(value = "member/memberJoin/isExistId", produces = "text/html; charset=UTF-8")
	public String isExistId(@RequestBody(required = false) String id) {
		if(id == null)
			return "입력해주세요.";
		return service.isExistId(id);
	}
	// 회원가입에서 전화번호 중복 확인 버튼 클릭 시
	@ResponseBody
	@PostMapping(value = "member/memberJoin/isExistMobile", produces = "text/html; charset=UTF-8")
	public String isExistMobile(@RequestBody(required = false) String mobile) {
		if(mobile == null)
			return "입력해주세요.";
		return service.isExistMobile(mobile);
	}

	// 회원가입 성공 페이지
	@RequestMapping("member/memberJoin/joinComplete")
	public String joinComplete(memberDTO member) {
		String result = service.register(member);
		System.out.println(result);
		if(result == "이미 가입되어 있습니다.") {
			return "member/memberJoin/already";
		}
		
		return "member/memberJoin/joinComplete";
	}
	
	// 추가정보 입력하는 페이지
	@GetMapping("member/memberJoin/optionalInfoWrite")
	public String optionalInfoWrite() {
		return "member/memberJoin/optionalInfoWrite";
	}
	
	// 로그인 페이지
	@GetMapping("member/auth/login")
	public String login() {
		
		return "member/auth/login";
	}
}
