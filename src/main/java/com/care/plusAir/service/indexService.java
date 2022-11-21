package com.care.plusAir.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.care.plusAir.dto.indexDTO;

@Service
public class indexService {
	public ArrayList<indexDTO> searchService(){
		indexDTO indexDto = new indexDTO();
		ArrayList<indexDTO> indexs = new ArrayList<>();
		indexDto.setFlightNo("KE645");
		indexDto.setFlightDep("ICN");
		indexDto.setFlightAri("PEK");
		indexDto.setMon("월");
		indexDto.setTue("화");
		indexDto.setWed("수");
		indexDto.setThu("목");
		indexDto.setFri("금");
		indexDto.setSat("토");
		indexDto.setSun("일");
		indexDto.setDepartTime("14:20");
		indexDto.setArrivalTime("15:50");
		indexDto.setFlightTime("1시간30분");
		indexs.add(indexDto);
		indexDTO indexDto2 = new indexDTO();
		indexDto2.setFlightNo("KE345");
		indexDto2.setFlightDep("ICN");
		indexDto2.setFlightAri("PEK");
		indexDto2.setMon("월");
		indexDto2.setTue("화");
		indexDto2.setWed("수");
		indexDto2.setThu("목");
		indexDto2.setFri("금");
		indexDto2.setSat("토");
		indexDto2.setSun("일");
		indexDto2.setDepartTime("16:30");
		indexDto2.setArrivalTime("18:00");
		indexDto2.setFlightTime("1시간30분");
		indexs.add(indexDto2);
		indexDTO indexDto3 = new indexDTO();
		indexDto3.setFlightNo("KE325");
		indexDto3.setFlightDep("ICN");
		indexDto3.setFlightAri("JFK");
		indexDto3.setMon("월");
		indexDto3.setTue("화");
		indexDto3.setWed("수");
		indexDto3.setThu("목");
		indexDto3.setFri("금");
		indexDto3.setSat("토");
		indexDto3.setSun("일");
		indexDto3.setDepartTime("06:40");
		indexDto3.setArrivalTime("20:50");
		indexDto3.setFlightTime("14시간10분");
		indexs.add(indexDto3);
		return indexs;
	}

}
