package com.care.plusAir.booking.repository;

import java.util.ArrayList;

import com.care.plusAir.booking.dto.FlightDTO;
import com.care.plusAir.booking.dto.SearchServiceDTO;



public interface FlightDAO {
	public ArrayList<FlightDTO> selectCityAll(SearchServiceDTO ssdto);
}
