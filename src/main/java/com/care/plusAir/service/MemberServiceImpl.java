package com.care.plusAir.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.plusAir.repository.IMemberDAO;

@Service
public class MemberServiceImpl implements IMemberService{
	@Autowired IMemberDAO dao;

	@Override
	public String isExistId(String id) {
		if(dao.isExistId(id) != 0) {
			return "중복 아이디";
		}
		return "사용가능";
	}
	
}
