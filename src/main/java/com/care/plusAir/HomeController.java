package com.care.plusAir;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	//MAIN
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "main/home";
	}
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String main() {
		return "main/home";
	}
	//MEMBER
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "member/auth/login";
	}
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "member/memberJoin/join";
	}
	@RequestMapping(value = "nameWrite", method = RequestMethod.GET)
	public String nameWrite() {
		return "member/memberJoin/nameWrite";
	}
	@RequestMapping(value = "emailWrite", method = RequestMethod.GET)
	public String emailWrite() {
		return "member/memberJoin/emailWrite";
	}
	@RequestMapping(value = "idPasswordWrite", method = RequestMethod.GET)
	public String idPasswordWrite() {
		return "member/memberJoin/idPasswordWrite";
	}
	@RequestMapping(value = "clauseAgree", method = RequestMethod.GET)
	public String clauseAgree() {
		return "member/memberJoin/clauseAgree";
	}
	@RequestMapping(value = "joinComplete", method = RequestMethod.GET)
	public String joinComplete() {
		return "member/memberJoin/joinComplete";
	}
	@RequestMapping(value = "optionalInfoWrite", method = RequestMethod.GET)
	public String optionalInfoWrite() {
		return "member/memberJoin/optionalInfoWrite";
	}
	@RequestMapping(value = "findUserInfo", method = RequestMethod.GET)
	public String findUserInfo() {
		return "member/find/findUserInfo";
	}
	@RequestMapping(value = "findEmailUserInfo", method = RequestMethod.GET)
	public String findEmailUserInfo() {
		return "member/find/findEmailUserInfo";
	}
	@RequestMapping(value = "findPhoneUserInfo", method = RequestMethod.GET)
	public String findPhoneUserInfo() {
		return "member/find/findPhoneUserInfo";
	}
	@RequestMapping(value = "findUserIdUserInfo", method = RequestMethod.GET)
	public String findUserIdUserInfo() {
		return "member/find/findUserIdUserInfo";
	}
	@RequestMapping(value = "findUserInfoList", method = RequestMethod.GET)
	public String findUserInfoList() {
		return "member/find/findUserInfoList";
	}
	@RequestMapping(value = "emailSendGuide", method = RequestMethod.GET)
	public String emailSendGuide() {
		return "member/login/emailSendGuide";
	}
	@RequestMapping(value = "passwordInit", method = RequestMethod.GET)
	public String passwordInit() {
		return "member/setup/passwordInit";
	}
	@RequestMapping(value = "passwordInitResult", method = RequestMethod.GET)
	public String passwordInitResult() {
		return "member/setup/passwordInitResult";
	}
	//MEMBERBENEFIT
	@RequestMapping(value = "newMember", method = RequestMethod.GET)
	public String newMember() {
		return "memberBenefit/memberBenefit";
	}
	@RequestMapping(value = "promotion", method = RequestMethod.GET)
	public String promotion() {
		return "memberBenefit/memberBenefit";
	}
	@RequestMapping(value = "refreshPoint", method = RequestMethod.GET)
	public String refreshPoint() {
		return "memberBenefit/refreshPoint/refreshPoint";
	}
	@RequestMapping(value = "refreshPointLogin", method = RequestMethod.GET)
	public String refreshPointLogin() {
		return "memberBenefit/refreshPoint/refreshPointLogin";
	}
	@RequestMapping(value = "pointBuy", method = RequestMethod.GET)
	public String pointBuy() {
		return "memberBenefit/refreshPoint/pointBuy";
	}
	@RequestMapping(value = "pointSearch", method = RequestMethod.GET)
	public String pointSearch() {
		return "memberBenefit/refreshPoint/pointSearch";
	}
	@RequestMapping(value = "gifticket", method = RequestMethod.GET)
	public String gifticket() {
		return "additionalService/service/gifticket";
	}
	@RequestMapping(value = "regCoupon", method = RequestMethod.GET)
	public String regCoupon() {
		return "memberBenefit/regCoupon";
	}
	@RequestMapping(value = "NewFile", method = RequestMethod.GET)
	public String newFile(Model model) {
		model.addAttribute("goback", "가는 편"); // 가는 편, 오는 편
		
		return "main/NewFile";
	}
}
