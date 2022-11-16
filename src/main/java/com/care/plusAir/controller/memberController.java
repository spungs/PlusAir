package com.care.plusAir.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class memberController {
	
	// 회원가입 버튼 클릭 시 회원가입 화면
	@RequestMapping(value = "member/memberJoin/join")
	public String join() {

		return "member/memberJoin/join";
	}
	
	// 회원가입 화면에서 휴대폰으로 회원가입 클릭 시 이름 입력 화면
	@RequestMapping(value = "member/memberJoin/nameWrite")
	public String nameWrite(String korFirstName) {
		return "member/memberJoin/nameWrite";
	}
	
	// 회원가입에서 다음 클릭 시
	@RequestMapping(value = "member/memberJoin/emailWrite")
	public String emailWrite() {
		
		return "member/memberJoin/emailWrite";
	}

	@RequestMapping(value = "member/memberJoin/idPasswordWrite")
	public String idPasswordWrite() {

		return "member/memberJoin/idPasswordWrite";
	}

	@RequestMapping(value = "member/memberJoin/clauseAgree")
	public String clauseAgree() {

		return "member/memberJoin/clauseAgree";
	}

	@RequestMapping(value = "member/memberJoin/joinComplete")
	public String joinComplete() {

		return "member/memberJoin/joinComplete";
	}

	@RequestMapping(value = "member/memberJoin/optionalInfoWrite")
	public String optionalInfoWrite() {

		return "member/memberJoin/optionalInfoWrite";
	}
}
