package com.care.plusAir.repository;

import org.springframework.stereotype.Repository;

import com.care.plusAir.dto.member.memberDTO;

@Repository
public interface IMemberDAO {
	
	// 아이디 중복 확인
	public int isExistId(String id);
	// mobile 중복 확인
	public int isExistMobile(String mobile);
	// 회원번호 중복 확인
	public int isExistMemberNo(String memberNo);
	// 회원가입
	public void register(memberDTO member);
	// 신규 쿠폰
	public void coupon(memberDTO member);
	public void coupon2(memberDTO member);
	// 로그인
	public memberDTO login(memberDTO member);
}
