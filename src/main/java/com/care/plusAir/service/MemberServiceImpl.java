package com.care.plusAir.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.care.plusAir.dto.member.memberDTO;
import com.care.plusAir.repository.IMemberDAO;

@Service
public class MemberServiceImpl implements IMemberService {
	@Autowired
	IMemberDAO dao;
	@Autowired
	HttpSession session;

	@Override
	public String isExistId(String id) {
		if (dao.isExistId(id) != 0) {
			return "중복 아이디";
		}
		return "사용가능";
	}
	@Override
	public String isExistMobile(String mobile) {
		if (dao.isExistMobile(mobile) != 0) {
			return "이미 가입된 전화번호";
		}
		return "사용가능";
	}

	@Override
	public String register(memberDTO member) {
		// 새로고침 시 계속 insert되는거 방지 return
		if(dao.isExistId(member.getId()) != 0) {
			return "이미 가입되어 있습니다.";
		}
		// 비밀번호 암호화
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String cipherPassword = encoder.encode(member.getPw());
		member.setPw(cipherPassword);
		
		// 회원번호 생성
		String memberNo = "";
		while(true) {
			// Math.random() : 0~1사이의 실수를 생성(대략 소숫점 16자리까지)
			double n = Math.random();
			// 생성된 랜덤 실수를 substring으로 2번째 인덱스부터 10번째 인덱스 전까지 추출해서 문자열로 형변환
			memberNo = Double.toString(n).substring(2, 10);
			if(dao.isExistMemberNo(memberNo) == 0)
				break;
			else
				continue;
		}
		member.setMemberNo(memberNo);
		session.setAttribute("authNum", memberNo);
		
		// korName = korLastName + korFirstName;
		String korName = member.getKorLastName()+member.getKorFirstName();
		member.setKorName(korName.toUpperCase());
		
		// 가입일
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date date = new Date();
		String today = sdf.format(date);
		member.setRegDate(today);
		
		dao.register(member);
		dao.coupon(member);
		dao.coupon2(member);
		return "가입완료";
	}
	
	@Override
	public String login(memberDTO member) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		memberDTO getLogin = dao.login(member);
		if(dao.login(member) != null && encoder.matches(member.getPw(), getLogin.getPw())) {
			session.setAttribute("memberNo", member.getMemberNo());
			session.setAttribute("id", member.getId());
			session.setAttribute("korFirstName", member.getKorFirstName());
			session.setAttribute("korLastName", member.getKorLastName());
			session.setAttribute("engFirstName", member.getEngFirstName());
			session.setAttribute("engLastName", member.getEngLastName());
			session.setAttribute("birth", member.getBirth());
			session.setAttribute("mobile", member.getMobile());
			session.setAttribute("email", member.getEmail());
			session.setAttribute("gender", member.getGender());
			return "로그인 완료";
		}
		else
			return "아이디 또는 비밀번호를 확인하세요.";
	}

}
