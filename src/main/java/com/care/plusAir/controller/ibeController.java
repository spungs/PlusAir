package com.care.plusAir.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ibeController {
	
	//mypage_마이페이지_예약조회
	@RequestMapping(value = "ibe/mypage/viewOnOffReservationList")
	public String viewOnOffReservationList() {
		
		return "ibe/mypage/viewOnOffReservationList";
	}
	
	//mypage_마이페이지_예약현황 -> 예약 내용 안나옴
	@RequestMapping(value = "ibe/mypage/viewReservationList")
	public String viewReservationList() {
		
		return "ibe/mypage/viewReservationList";
	}
	
	//mypage_마이페이지_예약현황(민재)
	@RequestMapping(value = "ibe/mypage/ReservationList")
	public String ReservationList() {
		
		return "ibe/mypage/ReservationList";
	}
	
	//checkin_탑승 수속 안내_모바일 탑승권 -> No mapping for POST /plusAir/ibe/checkin/getCheckinList.json
	@RequestMapping(value = "ibe/checkin/viewCheckin")
	public String viewCheckin() {
		
		return "ibe/checkin/viewCheckin";
	}

}
