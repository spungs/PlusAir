package com.care.plusAir.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class memberController {

	//회원가입(샘플)
	@RequestMapping(value = "member/memberJoin/join")
	public String reservation() { 
		
		return "member/memberJoin/join";
	}
	
	//마이페이지_메인
	@RequestMapping(value = "member/mypage/main")
	public String mypageMain() {
		 
		return "member/mypage/main";
	}
	
	//마이페이지_메인 tmp
	@RequestMapping(value = "member/mypage/tmp")
	public String mypageTmp() {
		 
		return "member/mypage/tmp";
	}
	
	//마이페이지_나의 탑승 내역
	@RequestMapping(value = "member/mypage/myFlightList")
	public String myFlightList() {
		
		return "member/mypage/myFlightList";
	}
	
	//마이페이지_나의 쿠폰 -> 문자 깨지는 현상
	@RequestMapping(value = "member/mypage/viewMyPartnerCoupon")
	public String viewMyPartnerCoupon() {
		
		return "member/mypage/viewMyPartnerCoupon";
	}
	//마이페이지_나의 쿠폰(민재)
	@RequestMapping(value = "member/mypage/myCoupon")
	public String myCoupon() {
		
		return "member/mypage/myCoupon";
	}
	

}
