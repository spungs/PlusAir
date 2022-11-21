package com.care.plusAir.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.plusAir.dto.indexDTO;
import com.care.plusAir.service.indexService;

@Controller
public class indexController {
	@Autowired indexService indexservice;
	@GetMapping("index")
	public String index() {
		return "base/index";
	}
//	@ResponseBody
//	@PostMapping(value="check",produces = "application/json; charset=UTF-8")
//	public void dataCheck(String hiddenItem,String departureData,String arrivalData,String hidYear,String hidMonth,String hidDay,
//			String hidToYear,String hidToMonth,String hidToDay,String BackYear,String BackMonth,String BackDay,String adtNum,String chdNum,String infNum) {
//		System.out.println("운행정보 : " + hiddenItem);
//		System.out.println("출발지 : " + departureData);
//		System.out.println("도착지 : " + arrivalData);
//		System.out.println("돌아올때 출발지 : " + arrivalData);//왕복일때
//		System.out.println("돌아올때 도착지 : " + departureData);//왕복일때
//		System.out.println("출발년도 : " + hidYear);
//		System.out.println("출발 월 : " + hidMonth);
//		System.out.println("출발 일 : " + hidDay);
//		System.out.println("현제 년도 : " + hidToYear);
//		System.out.println("현제 월 : " + hidToMonth);
//		System.out.println("현제 일 : " + hidToDay);
//		System.out.println("돌아올 년도 : " + BackYear);
//		System.out.println("돌아올 월 : " + BackMonth);
//		System.out.println("돌아올 일 : " + BackDay);
//		System.out.println("어른 수 : " + adtNum);
//		System.out.println("소아 수 : " + chdNum);
//		System.out.println("유아 수 : " + infNum);
//	}
	@ResponseBody
	@PostMapping(value="check",produces = "application/json; charset=UTF-8")
	public String dataCheck(@RequestBody HashMap<String,String> map,Model model) {//ArraylList값을 담아서 보낼 모델
		System.out.println("운행정보 : " + map.get("hiddenItem"));
		System.out.println("출발지 : " + map.get("departureData"));
		System.out.println("도착지 : " + map.get("arrivalData"));
		System.out.println("돌아올때 출발지 : " + map.get("arrivalData"));//왕복일때
		System.out.println("돌아올때 도착지 : " + map.get("departureData"));//왕복일때
		System.out.println("출발년도 : " + map.get("hidYear"));
		System.out.println("출발 월 : " + map.get("hidMonth"));
		System.out.println("출발 일 : " + map.get("hidDay"));
		System.out.println("현제 년도 : " + map.get("hidToYear"));
		System.out.println("현제 월 : " + map.get("hidToMonth"));
		System.out.println("현제 일 : " + map.get("hidToDay"));
		System.out.println("돌아올 년도 : " + map.get("BackYear"));
		System.out.println("돌아올 월 : " + map.get("BackMonth"));
		System.out.println("돌아올 일 : " + map.get("BackDay"));
		System.out.println("어른 수 : " + map.get("adtNum"));
		System.out.println("소아 수 : " + map.get("chdNum"));
		System.out.println("유아 수 : " + map.get("infNum"));
		System.out.println("출발지 한국어 : " + map.get("kode"));
		System.out.println("도착지 한국어 : " + map.get("koar"));
		
		if(map.get("hiddenItem").isEmpty() || map.get("departureData").isEmpty() || map.get("hidYear").isEmpty()  || map.get("hidMonth").isEmpty() || 
				map.get("hidDay").isEmpty() || map.get("hidYear").isEmpty() || map.get("hidMonth").isEmpty() || map.get("hidDay").isEmpty() || map.get("adtNum").isEmpty()) {
			return "여행정보를 정확히 선택해 주세요.";
		}
		return "test?hiddenItem=" + map.get("hiddenItem") +"&kode="+map.get("kode")+"&koar="+map.get("koar")
		+ "&departureData=" + map.get("departureData") + "&arrivalData=" + map.get("arrivalData") + "&hidYear=" + map.get("hidYear") + "&hidMonth="+ map.get("hidMonth") 
		+ "&hidDay=" + map.get("hidDay") + "&hidToYear=" +map.get("hidToYear") + "&hidToMonth=" + map.get("hidToMonth") + "&hidToDay=" + map.get("hidToDay") 
		+ "&BackYear="+map.get("BackYear") + "&BackMonth=" + map.get("BackMonth") + "&BackDay=" + map.get("BackDay")
		+ "&adtNum=" + map.get("adtNum") + "&chdNum=" + map.get("chdNum") + "&infNum=" + map.get("infNum");//가공된 데이터를  url에 파라미터로 담아 보냄
	}
	@GetMapping("AvailSearch")
	public String AvailSearch() {
		return "booking/AvailSearch";
	}
	@GetMapping("test")//model에 ArrayList 데이터를담기위해 페이지 이동전에 DB데이터가공하는 곳
	public String test(Model model) {
		ArrayList<indexDTO> indexs = indexservice.searchService();//service로가서 데이터 가공
		model.addAttribute("indexs", indexs);
		return "booking/AvailSearch";
	}
}
