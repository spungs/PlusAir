package com.care.plusAir.booking.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.care.plusAir.booking.dto.FlightDTO;
import com.care.plusAir.booking.dto.SearchServiceDTO;


@Repository
public interface FlightDAO {
	public ArrayList<FlightDTO> selectCityAll(SearchServiceDTO ssdto);
}
