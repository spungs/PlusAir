package com.care.plusAir.repository;

import org.springframework.stereotype.Repository;

@Repository
public interface IMemberDAO {

	public int isExistId(String id);
}
