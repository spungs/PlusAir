package com.care.plusAir.repository;

import java.util.ArrayList;

import com.care.plusAir.dto.FlightDTO;
import com.care.plusAir.dto.SearchServiceDTO;

public interface FlightDAO {
	public ArrayList<FlightDTO> selectCityAll(SearchServiceDTO ssdto);
}
