package com.care.plusAir.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class indexController {
	@GetMapping("index")
	public String index() {
		return "base/index";
	}
	@PostMapping("datatest")
	public void datatest(String hiddenItem,String departureData,String arrivalData,String hidYear,String hidMonth,String hidDay,
			String hidToYear,String hidToMonth,String hidToDay,String BackYear,String BackMonth,String BackDay,String adtNum,String chdNum,String infNum) {
		System.out.println("운행정보 : " + hiddenItem);
		System.out.println("출발지 : " + departureData);
		System.out.println("도착지 : " + arrivalData);
		System.out.println("출발년도 : " + hidYear);
		System.out.println("출발 월 : " + hidMonth);
		System.out.println("출발 일 : " + hidDay);
		System.out.println("현제 년도 : " + hidToYear);
		System.out.println("현제 월 : " + hidToMonth);
		System.out.println("현제 일 : " + hidToDay);
		System.out.println("돌아올 년도 : " + BackYear);
		System.out.println("돌아올 월 : " + BackMonth);
		System.out.println("돌아올 일 : " + BackDay);
		System.out.println("어른 수 : " + adtNum);
		System.out.println("소아 수 : " + chdNum);
		System.out.println("유아 수 : " + infNum);
	}
}
