package com.care.plusAir.service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.plusAir.dto.FlightDTO;
import com.care.plusAir.dto.SearchServiceDTO;
import com.care.plusAir.repository.FlightDAO;

@Service
public class indexService {
	@Autowired FlightDAO fightDao;
	public ArrayList<FlightDTO> searchService(String departureData,String arrivalData,String hidYear,String hidMonth,String hidDay,String BackYear,String BackMonth,String BackDay){
		String flightRouteNo = departureData + arrivalData;
		String stringYear = hidYear;
		String stringMonth = hidMonth;
		String stringDay = hidDay;
		int year = Integer.parseInt(stringYear);
		int month = Integer.parseInt(stringMonth);
		int days = Integer.parseInt(stringDay);
		LocalDate now = LocalDate.of(year, month, days);
		DayOfWeek dayOfWeek = now.getDayOfWeek();
		String day = dayOfWeek.getDisplayName(TextStyle.FULL, Locale.US);
		if(day.equals("Monday")) {
			day = "mon";
		}
		if(day.equals("Tuesday")) {
			day = "tue";
		}
		if(day.equals("Wednesday")) {
			day = "wed";
		}
		if(day.equals("Thursday")) {
			day = "thu";
		}
		if(day.equals("Friday")) {
			day = "fri";
		}
		if(day.equals("Saturday")) {
			day = "sat";
		}
		if(day.equals("Sunday")) {
			day = "sun";
		}
//		if(운항년도 > 현재년도) {
//			담기
//		}else if(운항년도 == 현재년도){
//			if(운항월 > 현재월) {
//			담기
//			}else if(운항일 >= 현재일){
//			담기
//			}else{
//			버리기
//			}
//		}else if(운항년도 < 현재년도){
//			버리기
//			}
		SearchServiceDTO ssdto = new SearchServiceDTO();
		ssdto.setDay(day);
		ssdto.setFlightRouteNo(flightRouteNo);
		ArrayList<FlightDTO> flights = fightDao.selectCityAll(ssdto);
		String msg="";
		for(int i = 0;i<flights.size();i++) {
			
			String startsub = flights.get(i).getStartFlight();
			String startYearString = startsub.substring(0, 4);
			String startMonthString = startsub.substring(5,7);
			String startDayString = startsub.substring(8,10);
			
			String endsub = flights.get(i).getEndFlight();
			String endYearString = endsub.substring(0, 4);
			String endMonthString = endsub.substring(5, 7);
			String endDayString = endsub.substring(8,10);
			
			String yearString = hidYear;
			String monthString = hidMonth;
			String dayString = hidDay;
			System.out.println(yearString);
			System.out.println(endYearString);
			if(Integer.parseInt(yearString) > Integer.parseInt(endYearString) || Integer.parseInt(yearString) < Integer.parseInt(startYearString)) {
				msg = "버리기";
			}else if(Integer.parseInt(yearString) == Integer.parseInt(startYearString) && Integer.parseInt(yearString) == Integer.parseInt(endYearString)) {
				if(Integer.parseInt(monthString) >= Integer.parseInt(startMonthString) && Integer.parseInt(monthString) <= Integer.parseInt(endMonthString)) {
					msg = "담기";
					if(Integer.parseInt(monthString) == Integer.parseInt(startMonthString)) {
						if(Integer.parseInt(dayString) >= Integer.parseInt(startDayString)) {
							msg = "담기";
						}else {
							msg = "버리기";
						}
					}else if(Integer.parseInt(monthString) == Integer.parseInt(endMonthString)) {
						if(Integer.parseInt(dayString) <= Integer.parseInt(endDayString)) {
							msg = "담기";
						}else {
							msg = "버리기";
						}
					}
				}else {
					msg = "버리기";
				}
			}else if(Integer.parseInt(yearString) == Integer.parseInt(startYearString) && Integer.parseInt(yearString) != Integer.parseInt(endYearString)){
				if(Integer.parseInt(monthString) >= Integer.parseInt(startMonthString)) {
					if(Integer.parseInt(dayString) >= Integer.parseInt(startDayString)) {
						msg = "담기";
					}else {
						msg = "버리기";
					}
				}else {
					msg = "버리기";
				}
			}else if(Integer.parseInt(yearString) == Integer.parseInt(endYearString) && Integer.parseInt(yearString) != Integer.parseInt(startYearString)) {
				if(Integer.parseInt(monthString) <= Integer.parseInt(endMonthString)) {
					if(Integer.parseInt(dayString) <= Integer.parseInt(endDayString)) {
						msg = "담기";
					}else {
						msg = "버리기";
					}
				}else {
					msg = "버리기";
				}
			}else {
				msg = "담기";
			}
			System.out.println(msg);
			if(msg.equals("버리기")) {
				//System.out.println(flights.get(i));
				flights.remove(i);
				i--;
			}
		}
		return flights;
		}

}
