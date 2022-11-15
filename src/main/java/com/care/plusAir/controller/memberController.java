package com.care.plusAir.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class memberController {

	@RequestMapping(value = "member/memberJoin/join")
	public String reservation() {
		
		return "member/memberJoin/join";
	}

}
