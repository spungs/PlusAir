package com.care.plusAir.booking.dto;

public class DownDataDTO {
	private String flightNo; //항공편 명
	private String BackflightNo;//돌아오는 항공편 명
	private String departTime;//비행기 출발지 출발시간
	private String backdepartTime;//돌아오는 비행기 출발지 출발시간
	private String arrivalTime;//비행기 목적지 도착시간
	private String backarrivalTime;//돌아오는 비행기 목적지 도착시간
	private String flightTime;//비행 시간
	private String backflightTime;//돌아오는 비행기 비행 시간
	private String price;
	private String backprice;
	private String hiddenItem;//선택한 운항(왕복 또는 편도)가 담겨있음
	private String kode;//출발지 한국어(인천 또는 김포)
	private String koar;//도착지 한국어(방콕,뉴욕 등등)
	private String departureData;//출발지 영어(ICN 등)
	private String arrivalData;//도착지 영어(BKK 등)
	private String hidYear;//선택한 출발 년도
	private String hidMonth;//선택한 출발 월
	private String hidDay;//선택한 출발 일
	private String hidToYear;//현제 년도
	private String hidToMonth;//현제 월
	private String hidToDay;//현제 일
	private String BackYear;//왕복일 경우 돌아오는 년도
	private String BackMonth;//왕복일 경우 돌아오는 월 
	private String BackDay;//왕복일 경우 돌아오는 일
	private String adtNum;//탑승 어른 수
	private String chdNum;//탑승 소아 수
	private String infNum;//탑승 유아 수
	private String seatprice;
	private String flightRouteNo;
	private String backflightRouteNo;
	
	public String getFlightNo() {
		return flightNo;
	}
	public void setFlightNo(String flightNo) {
		this.flightNo = flightNo;
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getHiddenItem() {
		return hiddenItem;
	}
	public void setHiddenItem(String hiddenItem) {
		this.hiddenItem = hiddenItem;
	}
	public String getKode() {
		return kode;
	}
	public void setKode(String kode) {
		this.kode = kode;
	}
	public String getKoar() {
		return koar;
	}
	public void setKoar(String koar) {
		this.koar = koar;
	}
	public String getDepartureData() {
		return departureData;
	}
	public void setDepartureData(String departureData) {
		this.departureData = departureData;
	}
	public String getArrivalData() {
		return arrivalData;
	}
	public void setArrivalData(String arrivalData) {
		this.arrivalData = arrivalData;
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
	public String getHidToYear() {
		return hidToYear;
	}
	public void setHidToYear(String hidToYear) {
		this.hidToYear = hidToYear;
	}
	public String getHidToMonth() {
		return hidToMonth;
	}
	public void setHidToMonth(String hidToMonth) {
		this.hidToMonth = hidToMonth;
	}
	public String getHidToDay() {
		return hidToDay;
	}
	public void setHidToDay(String hidToDay) {
		this.hidToDay = hidToDay;
	}
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
	public String getAdtNum() {
		return adtNum;
	}
	public void setAdtNum(String adtNum) {
		this.adtNum = adtNum;
	}
	public String getChdNum() {
		return chdNum;
	}
	public void setChdNum(String chdNum) {
		this.chdNum = chdNum;
	}
	public String getInfNum() {
		return infNum;
	}
	public void setInfNum(String infNum) {
		this.infNum = infNum;
	}
	public String getBackprice() {
		return backprice;
	}
	public void setBackprice(String backprice) {
		this.backprice = backprice;
	}
	public String getBackflightNo() {
		return BackflightNo;
	}
	public void setBackflightNo(String backflightNo) {
		BackflightNo = backflightNo;
	}
	public String getBackdepartTime() {
		return backdepartTime;
	}
	public void setBackdepartTime(String backdepartTime) {
		this.backdepartTime = backdepartTime;
	}
	public String getBackarrivalTime() {
		return backarrivalTime;
	}
	public void setBackarrivalTime(String backarrivalTime) {
		this.backarrivalTime = backarrivalTime;
	}
	public String getBackflightTime() {
		return backflightTime;
	}
	public void setBackflightTime(String backflightTime) {
		this.backflightTime = backflightTime;
	}
	public String getSeatprice() {
		return seatprice;
	}
	public void setSeatprice(String seatprice) {
		this.seatprice = seatprice;
	}
	public String getBackflightRouteNo() {
		return backflightRouteNo;
	}
	public void setBackflightRouteNo(String backflightRouteNo) {
		this.backflightRouteNo = backflightRouteNo;
	}
	public String getFlightRouteNo() {
		return flightRouteNo;
	}
	public void setFlightRouteNo(String flightRouteNo) {
		this.flightRouteNo = flightRouteNo;
	}
}
