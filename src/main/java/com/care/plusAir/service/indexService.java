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
	public ArrayList<FlightDTO> searchService(String departureData,String arrivalData,String hidYear,String hidMonth,String hidDay){
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
			if(hidMonth.length() == 1) {
				monthString = "0" + hidMonth;
			}
			if(hidDay.length() == 1) {
				dayString = "0" + hidDay;
			}
			String start = startYearString + startMonthString + startDayString;
			String end = endYearString + endMonthString + endDayString;
			String sel = yearString + monthString + dayString;
			int st = Integer.parseInt(start);
			int ed = Integer.parseInt(end);
			int se = Integer.parseInt(sel);
			System.out.println("시작일 : " + st);
			System.out.println("끝나는일 : " + ed);
			System.out.println("내가 선택한 날 : " + se);
			if(st>=se || se>=ed) {//선택한 날이 항공기 시작일과 끝나는일 밖이면 해당 항공기 dto를 지워준다
				flights.remove(i);
				i--;
			}
		}
		return flights;
		}
	public ArrayList<FlightDTO> searchBackService(String departureData,String arrivalData,String BackYear,String BackMonth,String BackDay){
		String flightRouteNo = arrivalData + departureData;
		String stringYear = BackYear;
		String stringMonth = BackMonth;
		String stringDay = BackDay;
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
		SearchServiceDTO ssdto = new SearchServiceDTO();
		ssdto.setDay(day);
		ssdto.setFlightRouteNo(flightRouteNo);
		ArrayList<FlightDTO> backflights = fightDao.selectCityAll(ssdto);
		String msg="";
		for(int i = 0;i<backflights.size();i++) {
			
			String startsub = backflights.get(i).getStartFlight();
			String startYearString = startsub.substring(0, 4);
			String startMonthString = startsub.substring(5,7);
			String startDayString = startsub.substring(8,10);
			
			String endsub = backflights.get(i).getEndFlight();
			String endYearString = endsub.substring(0, 4);
			String endMonthString = endsub.substring(5, 7);
			String endDayString = endsub.substring(8,10);
			
			String yearString = BackYear;
			String monthString = BackMonth;
			String dayString = BackDay;
			if(BackMonth.length() == 1) {
				monthString = "0" + BackMonth;
			}
			if(BackDay.length() == 1) {
				dayString = "0" + BackDay;
			}
			String start = startYearString + startMonthString + startDayString;
			String end = endYearString + endMonthString + endDayString;
			String sel = yearString + monthString + dayString;
			int st = Integer.parseInt(start);
			int ed = Integer.parseInt(end);
			int se = Integer.parseInt(sel);
			
			if(st>=se || se>=ed) {//선택한 날이 항공기 시작일과 끝나는일 밖이면 해당 항공기 dto를 지워준다
				backflights.remove(i);
				i--;
			}
		}
		return backflights;
		}

}
