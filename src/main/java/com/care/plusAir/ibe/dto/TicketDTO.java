package com.care.plusAir.ibe.dto;

/*
 * 
ticketNo varchar2(20),
regNo varchar2(20),
flightRouteNo varchar2(50),
departDate varchar2(20),
departTime varchar2(10),
arrivalDate varchar2(20),
arrivalTime varchar2(10),
baggage varchar2(2),
seatNo varchar2(10),
seatClass varchar2(10),
checkIn varchar2(2),
flightNo varchar2(20),
flightPrice number,
pointSaved varchar2(2),
inOut varchar2(2),
memberNo varchar2(10),
constraint pk_testTicket foreign key(memberNo) references testPassenger(memberNo) on delete cascade
 */

public class TicketDTO {
	private String ticketNo;
	private String regNo;
	private String flightRouteNo;
	private String departDate;
	private String departTime;
	private String arrivalDate;
	private String arrivalTime;
	private String baggage;
	private String seatNo;
	private String seatClass;
	private String checkIn;
	private String flightNo;
	private int flightPrice;
	private String pointSaved;
	private String inOut;
	private String memberNo;
	

	public String getTicketNo() {
		return ticketNo;
	}
	public void setTicketNo(String ticketNo) {
		this.ticketNo = ticketNo;
	}
	public String getRegNo() {
		return regNo;
	}
	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}
	public String getFlightRouteNo() {
		return flightRouteNo;
	}
	public void setFlightRouteNo(String flightRouteNo) {
		this.flightRouteNo = flightRouteNo;
	}
	public String getDepartDate() {
		return departDate;
	}
	public void setDepartDate(String departDate) {
		this.departDate = departDate;
	}
	public String getDepartTime() {
		return departTime;
	}
	public void setDepartTime(String departTime) {
		this.departTime = departTime;
	}
	public String getArrivalDate() {
		return arrivalDate;
	}
	public void setArrivalDate(String arrivalDate) {
		this.arrivalDate = arrivalDate;
	}
	public String getArrivalTime() {
		return arrivalTime;
	}
	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}
	public String getBaggage() {
		return baggage;
	}
	public void setBaggage(String baggage) {
		this.baggage = baggage;
	}
	public String getSeatNo() {
		return seatNo;
	}
	public void setSeatNo(String seatNo) {
		this.seatNo = seatNo;
	}
	public String getSeatClass() {
		return seatClass;
	}
	public void setSeatClass(String seatClass) {
		this.seatClass = seatClass;
	}
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getFlightNo() {
		return flightNo;
	}
	public void setFlightNo(String flightNo) {
		this.flightNo = flightNo;
	}
	public int getFlightPrice() {
		return flightPrice;
	}
	public void setFlightPrice(int flightPrice) {
		this.flightPrice = flightPrice;
	}
	public String getPointSaved() {
		return pointSaved;
	}
	public void setPointSaved(String pointSaved) {
		this.pointSaved = pointSaved;
	}

	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getInOut() {
		return inOut;
	}
	public void setInOut(String inOut) {
		this.inOut = inOut;
	}

}
