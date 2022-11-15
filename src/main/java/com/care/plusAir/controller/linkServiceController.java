package com.care.plusAir.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class linkServiceController {
	
	//boardingProcessGuide_수하물 안내
	@RequestMapping(value = "linkService/boardingProcessGuide/baggageGuide")
	public String baggageGuide() {
		
		return "linkService/boardingProcessGuide/baggageGuide";
	}
	
	//fastProcedure_빠른 수속
	@RequestMapping(value = "linkService/fastProcedure/guide")
	public String fastProcedure() {
		
		return "linkService/fastProcedure/guide";
	}
	
	//airport_공항정보 안내
	@RequestMapping(value = "linkService/airport/info")
	public String airportInfo() {
		
		return "linkService/airport/info";
	}
	
	//help_도움이 필요한 고객
	@RequestMapping(value = "linkService/help/main")
	public String help() {
		
		return "linkService/help/main";
	}

}
