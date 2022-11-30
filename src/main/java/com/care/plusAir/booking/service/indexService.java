package com.care.plusAir.booking.service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.plusAir.booking.dto.FlightDTO;
import com.care.plusAir.booking.dto.PirceFlightDTO;
import com.care.plusAir.booking.dto.SearchServiceDTO;
import com.care.plusAir.booking.repository.FlightDAO;


@Service
public class indexService {
	@Autowired FlightDAO fightDao;
	public ArrayList<PirceFlightDTO> searchService(String departureData,String arrivalData,String hidYear,String hidMonth,String hidDay){
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
			
			if(st>=se || se>=ed) {//선택한 날이 항공기 시작일과 끝나는일 밖이면 해당 항공기 dto를 지워준다
				flights.remove(i);
				i--;
			}
		}
		ArrayList<PirceFlightDTO> priceflights = new ArrayList<>();
		if(flights.size() > 0) {
			int FlightDistance = Integer.parseInt(flights.get(0).getFlightDistance());
			int DistancePrice = FlightDistance*30;
			for(int i=0;i<flights.size();i++) {
				PirceFlightDTO priceflight = new PirceFlightDTO();
				
				String stringtime = flights.get(i).getDepartTime().substring(0,2);
				int inttime = Integer.parseInt(stringtime);
				
				if(inttime > 13 && inttime <18) {
					String stringprice = Integer.toString(DistancePrice + 90000);
					String lastprice = stringprice.substring(0,3);
					priceflight.setPrice(lastprice);
				}
				else if(inttime >18) {
					String stringprice = Integer.toString(DistancePrice + 130000);
					String lastprice = stringprice.substring(0,3);
					priceflight.setPrice(lastprice);
				}else {
					String stringprice = Integer.toString(DistancePrice);
					String lastprice = stringprice.substring(0,3);
					priceflight.setPrice(lastprice);
				}
				priceflight.setArrivalTime(flights.get(i).getArrivalTime());
				priceflight.setDepartTime(flights.get(i).getDepartTime());
				priceflight.setStartFlight(flights.get(i).getStartFlight());
				priceflight.setEndFlight(flights.get(i).getEndFlight());
				priceflight.setFlightDistance(flights.get(i).getFlightDistance());
				priceflight.setFlightNo(flights.get(i).getFlightNo());
				priceflight.setFlightRouteNo(flights.get(i).getFlightRouteNo());
				priceflight.setFlightTime(flights.get(i).getFlightTime());
				priceflight.setMon(flights.get(i).getMon());
				priceflight.setTue(flights.get(i).getTue());
				priceflight.setWed(flights.get(i).getWed());
				priceflight.setThu(flights.get(i).getThu());
				priceflight.setFri(flights.get(i).getFri());
				priceflight.setSat(flights.get(i).getSat());
				priceflight.setSun(flights.get(i).getSun());
				priceflights.add(priceflight);
			}
		}
		return priceflights;
		}
	
	public ArrayList<PirceFlightDTO> searchBackService(String departureData,String arrivalData,String BackYear,String BackMonth,String BackDay){
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
		ArrayList<PirceFlightDTO> priceflights = new ArrayList<>();
		if(backflights.size() > 0) {
			int FlightDistance = Integer.parseInt(backflights.get(0).getFlightDistance());
			int DistancePrice = FlightDistance*30;
			for(int i=0;i<backflights.size();i++) {
				PirceFlightDTO priceflight = new PirceFlightDTO();
				
				String stringtime = backflights.get(i).getDepartTime().substring(0,2);
				int inttime = Integer.parseInt(stringtime);
				
				if(inttime > 13 && inttime <18) {
					String stringprice = Integer.toString(DistancePrice + 90000);
					String lastprice = stringprice.substring(0,3);
					priceflight.setPrice(lastprice);
				}
				else if(inttime >18) {
					String stringprice = Integer.toString(DistancePrice + 130000);
					String lastprice = stringprice.substring(0,3);
					priceflight.setPrice(lastprice);
				}else {
					String stringprice = Integer.toString(DistancePrice);
					String lastprice = stringprice.substring(0,3);
					priceflight.setPrice(lastprice);
				}
				priceflight.setArrivalTime(backflights.get(i).getArrivalTime());
				priceflight.setDepartTime(backflights.get(i).getDepartTime());
				priceflight.setStartFlight(backflights.get(i).getStartFlight());
				priceflight.setEndFlight(backflights.get(i).getEndFlight());
				priceflight.setFlightDistance(backflights.get(i).getFlightDistance());
				priceflight.setFlightNo(backflights.get(i).getFlightNo());
				priceflight.setFlightRouteNo(backflights.get(i).getFlightRouteNo());
				priceflight.setFlightTime(backflights.get(i).getFlightTime());
				priceflight.setMon(backflights.get(i).getMon());
				priceflight.setTue(backflights.get(i).getTue());
				priceflight.setWed(backflights.get(i).getWed());
				priceflight.setThu(backflights.get(i).getThu());
				priceflight.setFri(backflights.get(i).getFri());
				priceflight.setSat(backflights.get(i).getSat());
				priceflight.setSun(backflights.get(i).getSun());
				priceflights.add(priceflight);
			}
		}
		return priceflights;
		}

}
