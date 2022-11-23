package com.care.plusAir.booking.dto;

public class FlightDTO {
	private String flightNo;
	private String flightRouteNo;
	private String mon;
	private String tue;
	private String wed;
	private String thu;
	private String fri;
	private String sat;
	private String sun;
	private String departTime;
	private String arrivalTime;
	private String flightTime;
	private String startFlight;
	private String endFlight;
	private String flightDistance;
	
//		CREATE TABLE flight(
//				flightNo varchar2(20),
//				flightRouteNo varchar2(50),
//				mon varchar2(10),
//				tue varchar2(10),
//				wed varchar2(10),
//				thu varchar2(10),
//				fri varchar2(10),
//				sat varchar2(10),
//				sun varchar2(10),
//				departTime varchar2(20),
//				arrivalTime varchar2(20),
//				flightTime varchar2(20),
//				startFlight varchar2(50),
//				endFlight varchar2(50),
//				flightDistance varchar2(20)
//				);
	public String getFlightNo() {
		return flightNo;
	}
	public void setFlightNo(String flightNo) {
		this.flightNo = flightNo;
	}
	public String getFlightRouteNo() {
		return flightRouteNo;
	}
	public void setFlightRouteNo(String flightRouteNo) {
		this.flightRouteNo = flightRouteNo;
	}
	public String getMon() {
		return mon;
	}
	public void setMon(String mon) {
		this.mon = mon;
	}
	public String getTue() {
		return tue;
	}
	public void setTue(String tue) {
		this.tue = tue;
	}
	public String getWed() {
		return wed;
	}
	public void setWed(String wed) {
		this.wed = wed;
	}
	public String getThu() {
		return thu;
	}
	public void setThu(String thu) {
		this.thu = thu;
	}
	public String getFri() {
		return fri;
	}
	public void setFri(String fri) {
		this.fri = fri;
	}
	public String getSat() {
		return sat;
	}
	public void setSat(String sat) {
		this.sat = sat;
	}
	public String getSun() {
		return sun;
	}
	public void setSun(String sun) {
		this.sun = sun;
	}
	public String getDepartTime() {
		return departTime;
	}
	public void setDepartTime(String departTime) {
		this.departTime = departTime;
	}
	public String getArrivalTime() {
		return arrivalTime;
	}
	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}
	public String getFlightTime() {
		return flightTime;
	}
	public void setFlightTime(String flightTime) {
		this.flightTime = flightTime;
	}
	public String getStartFlight() {
		return startFlight;
	}
	public void setStartFlight(String startFlight) {
		this.startFlight = startFlight;
	}
	public String getEndFlight() {
		return endFlight;
	}
	public void setEndFlight(String endFlight) {
		this.endFlight = endFlight;
	}
	public String getFlightDistance() {
		return flightDistance;
	}
	public void setFlightDistance(String flightDistance) {
		this.flightDistance = flightDistance;
	}
	
	
}
