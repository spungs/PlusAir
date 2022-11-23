package com.care.plusAir.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.care.plusAir.dto.memberDTO;
import com.care.plusAir.repository.IMemberDAO;

@Service
public class MemberServiceImpl implements IMemberService {
	@Autowired
	IMemberDAO dao;

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
		// 중복가입 방지,새로고침 시 계속 insert되는거 방지 return (전화번호 하나에 회원가입 하나)
		if(dao.isExistMobile(member.getMobile()) != 0 || dao.isExistId(member.getId()) != 0) {
			System.out.println("in");
			return "이미 가입되어 있습니다.";
		}
		System.out.println("out");
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
		
		// korName = korLastName + korFirstName;
		String korName = member.getKorLastName()+member.getKorFirstName();
		member.setKorName(korName.toUpperCase());
		
		// 가입일
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date date = new Date();
		String today = sdf.format(date);
		member.setRegDate(today);
		
		dao.register(member);
		
		return "가입완료";
	}

}
