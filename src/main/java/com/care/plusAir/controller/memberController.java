package com.care.plusAir.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.plusAir.service.MailService;

@Controller
public class memberController {
	@Autowired HttpSession session;

	// 회원가입 버튼 클릭 시 회원가입 화면
	@RequestMapping(value = "member/memberJoin/join")
	public String join() {

		return "member/memberJoin/join";
	}

	// 회원가입 화면에서 휴대폰으로 회원가입 클릭 시 이름 입력 화면
	@RequestMapping(value = "member/memberJoin/joinInfo")
	public String nameWrite(String korFirstName) {
		return "member/memberJoin/joinInfo";
	}

	// 회원가입에서 인증번호 전송 버튼 클릭 시
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

	// 회원가입에서 인증번호 확인 버튼 클릭 시
	@ResponseBody
	@PostMapping(value = "member/memberJoin/checkAuth", produces = "text/html; charset=UTF-8")
	public String checkAuth(@RequestBody(required = false) String inputNum) {
		String authNum = (String) session.getAttribute("authNum");

		session.setAttribute("authStatus", false); // 인증 체크여부 session 처음엔 false
		if (inputNum == null)
			return "인증번호를 입력하세요 ";
		if (inputNum.equals(authNum)) {
			session.setAttribute("authStatus", true); // 인증 체크하면 true
			return "인증 성공";
		}
		return "인증번호를 다시 확인해주세요.";
	}

	// 회원가입 성공 페이지
	@RequestMapping(value = "member/memberJoin/joinComplete")
	public String joinComplete() {

		return "member/memberJoin/joinComplete";
	}

}
