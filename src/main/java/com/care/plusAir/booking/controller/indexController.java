package com.care.plusAir.booking.controller;


import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.plusAir.booking.dto.DownDataDTO;
import com.care.plusAir.booking.dto.MainPsgDTO;
import com.care.plusAir.booking.dto.PirceFlightDTO;
import com.care.plusAir.booking.dto.Psg1DTO;
import com.care.plusAir.booking.dto.Psg2DTO;
import com.care.plusAir.booking.dto.Psg3DTO;
import com.care.plusAir.booking.dto.Psg4DTO;
import com.care.plusAir.booking.dto.Psg5DTO;
import com.care.plusAir.booking.dto.Psg6DTO;
import com.care.plusAir.booking.dto.Psg7DTO;
import com.care.plusAir.booking.service.indexService;


@Controller
public class indexController {
	@Autowired indexService indexservice;
	@Autowired private HttpSession session;
	@GetMapping("index")
	public String index() {
		return "booking/index";
	}
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
	public String test(String hiddenItem,String departureData,String arrivalData,String hidYear,String hidMonth,String hidDay,String BackYear,String BackMonth,String BackDay,Model model) {
		
		ArrayList<PirceFlightDTO> priceflights = indexservice.searchService(departureData,arrivalData,hidYear,hidMonth,hidDay);//service로가서 데이터 가공
		if(hiddenItem.equals("왕복")) {
		ArrayList<PirceFlightDTO> backflights = indexservice.searchBackService(departureData,arrivalData,BackYear,BackMonth,BackDay);//service로가서 데이터 가공
		model.addAttribute("backflights", backflights);
		}

		model.addAttribute("priceflights", priceflights);
		return "booking/AvailSearch";
	}
	@PostMapping("PsList")
	public String PsList(DownDataDTO downDto,Model model) {
		//session.setAttribute("memberNo", 123);
		//session.setAttribute("engFirstName", "KANG");
		//session.setAttribute("engLastName", "MINJAE");
		//session.setAttribute("mobile", "010-5919-7914");
		//session.setAttribute("email", "rkdalswoahdl@naver.com");
		
		System.out.println(downDto.getFlightNo());
		System.out.println(downDto.getBackflightNo());
		System.out.println(downDto.getArrivalData());
		System.out.println(downDto.getDepartureData());
		int adt = Integer.parseInt(downDto.getAdtNum());
		int chd = Integer.parseInt(downDto.getChdNum());
		int backtotal = 0;
		String test = downDto.getPrice().substring(0,3);
		String test2 = downDto.getPrice().substring(4,7);
		String test3 = test + test2;
		if(!downDto.getBackprice().equals("")) {
			String backtest = downDto.getBackprice().substring(0,3);
			String backtest2 = downDto.getBackprice().substring(4,7);
			String backtest3 = backtest + backtest2;
			int backtest4 = Integer.parseInt(backtest3);
			backtotal = backtest4*adt + backtest4*chd;
		}
		int test4 = Integer.parseInt(test3);
		int gototal = test4*adt + test4*chd;
		DecimalFormat decFormat = new DecimalFormat("###,###");
		String totalprice = decFormat.format(gototal+backtotal);
		model.addAttribute("downDto", downDto);
		model.addAttribute("totalprice",totalprice);
		return "booking/PsList";
	}
	@PostMapping("PsgData")
	public void PsgData(
			MainPsgDTO mainpsgDto,Psg1DTO psg1Dto,Psg2DTO psg2Dto,
			Psg3DTO psg3Dto,Psg4DTO psg4Dto,Psg5DTO psg5Dto,
			Psg6DTO psg6Dto,Psg7DTO psg7Dto,DownDataDTO downDto,String totalprice) {
		
	}
	@PostMapping("PayPage")
	public String PayPage(MainPsgDTO mainpsgDto,Psg1DTO psg1Dto,Psg2DTO psg2Dto,
			Psg3DTO psg3Dto,Psg4DTO psg4Dto,Psg5DTO psg5Dto,
			Psg6DTO psg6Dto,Psg7DTO psg7Dto,DownDataDTO downDto,String totalprice,Model model) {

		String[] price=totalprice.split(",");
		String strprice="";
		for(int i=0;i<=price.length-1;i++) {
			strprice=strprice+price[i];
		}
		DecimalFormat decFormat = new DecimalFormat("###,###");
		int inttotalprice = Integer.parseInt(strprice);
		int extramoney = inttotalprice / 4;//유료 할증료
		int usagefee = inttotalprice / 100 *18;//시설 사용료
		int lasttotal = inttotalprice+extramoney+usagefee;//모든 수수료+항공 운임료 더한값
		
		String strextramoney = decFormat.format(extramoney);
		String strusagefee = decFormat.format(usagefee);
		String strlasttotal = decFormat.format(lasttotal);
		
		
		String checkdetime = downDto.getDepartTime().substring(0, 2);//출발 시간
		String checkartime = downDto.getArrivalTime().substring(0, 2);//도착 시간
		int intcheckde = Integer.parseInt(checkdetime);
		int intcheckar = Integer.parseInt(checkartime);
		String strhid = downDto.getHidDay();
		if(intcheckde > intcheckar) { // 도착시간이 출발시간보다 이전이라면 선택한일에서 하루를 더해서 도착일 하루추가
			int inthid = Integer.parseInt(strhid);
			strhid = Integer.toString(inthid + 1);
		}
		String strbackday = downDto.getBackDay();
		if(downDto.getHiddenItem().equals("왕복")) {
			String checkbackdetime = downDto.getBackdepartTime().substring(0, 2);
			String checkbackartime = downDto.getBackarrivalTime().substring(0, 2);
			int intcheckbackde = Integer.parseInt(checkbackdetime);
			int intcheckbackar = Integer.parseInt(checkbackartime);
			if(intcheckbackde > intcheckbackar) { // 도착시간이 출발시간보다 이전이라면 선택한일에서 하루를 더해서 도착일 하루추가
				int inthid = Integer.parseInt(strbackday);
				strbackday = Integer.toString(inthid + 1);
			}
		}
		
		model.addAttribute("mainpsgDto", mainpsgDto);
		model.addAttribute("psg1Dto", psg1Dto);
		model.addAttribute("psg2Dto", psg2Dto);
		model.addAttribute("psg3Dto", psg3Dto);
		model.addAttribute("psg4Dto", psg4Dto);
		model.addAttribute("psg5Dto", psg5Dto);
		model.addAttribute("psg6Dto", psg6Dto);
		model.addAttribute("psg7Dto", psg7Dto);
		model.addAttribute("downDto", downDto);//탑승 항공편 데이터
		model.addAttribute("strhid", strhid); //출발하는편 도착 날짜
		model.addAttribute("strbackday", strbackday);//돌아오는편 도착 날짜
		model.addAttribute("totalprice", totalprice);//항공 운임료
		model.addAttribute("strextramoney", strextramoney);//수수료
		model.addAttribute("strusagefee", strusagefee);//시설 이용료
		model.addAttribute("strlasttotal", strlasttotal);//모든 수수료+항공 운임료 더한값
		return "booking/PayPage";
	}
}
