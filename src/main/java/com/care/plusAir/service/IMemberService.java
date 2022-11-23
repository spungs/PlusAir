package com.care.plusAir.service;

import com.care.plusAir.dto.member.memberDTO;

public interface IMemberService {
	
	// 아이디 중복 확인
	public String isExistId(String id);
	// 아이디 중복 확인
	public String isExistMobile(String mobile);
	
	// 회원가입
	public String register(memberDTO member);
	
	// 로그인
	public String login(memberDTO member);
}
