package com.care.plusAir.booking.repository;

import org.springframework.stereotype.Repository;
import com.care.plusAir.ibe.dto.ReservationDTO;

@Repository
public interface PayMentDAO {
	public void insert(ReservationDTO reserDto);
}
