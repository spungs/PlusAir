package com.care.plusAir.dto;

public class SearchServiceDTO {
	private String flightRouteNo;
	private String day;
	private String hidYear;
	private String hidMonth;
	private String hidDay;
	private String BackYear;
	private String BackMonth;
	private String BackDay;
	public String getBackYear() {
		return BackYear;
	}
	public void setBackYear(String backYear) {
		BackYear = backYear;
	}
	public String getBackMonth() {
		return BackMonth;
	}
	public void setBackMonth(String backMonth) {
		BackMonth = backMonth;
	}
	public String getBackDay() {
		return BackDay;
	}
	public void setBackDay(String backDay) {
		BackDay = backDay;
	}
	public String getHidYear() {
		return hidYear;
	}
	public void setHidYear(String hidYear) {
		this.hidYear = hidYear;
	}
	public String getHidMonth() {
		return hidMonth;
	}
	public void setHidMonth(String hidMonth) {
		this.hidMonth = hidMonth;
	}
	public String getHidDay() {
		return hidDay;
	}
	public void setHidDay(String hidDay) {
		this.hidDay = hidDay;
	}
	public String getFlightRouteNo() {
		return flightRouteNo;
	}
	public void setFlightRouteNo(String flightRouteNo) {
		this.flightRouteNo = flightRouteNo;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
}
