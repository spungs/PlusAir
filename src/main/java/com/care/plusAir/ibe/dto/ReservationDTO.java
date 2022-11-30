package com.care.plusAir.ibe.dto;

/*
SQL> create table reservation(
2 regNo varchar2(8),
3 memberNo varchar2(10),
4 engLastName varchar2(20),
5 engFirstName varchar2(50),
6 regDate varchar2(20),
7 regType varchar2(10),
8 priceTotal number,
9 couponNo varchar2(20),
10 pointUsed number,
11 paymentDate varchar2(20),
12 paymentType varchar2(50),
13 paymentNo varchar2(8),
14 constraint pk_testReservation foreign key(memberNo) references testPassenger(memberNo) on delete cascade
15 );
 * 
 */

public class ReservationDTO {
	
	private String regNo;
	private String memberNo;
	private String engLastName;
	private String engFirstName;
	private String regDate;
	private String regType;
	private int priceTotal;
	private String couponNo;
	private int pointUsed;
	private String paymentDate;
	private String paymentType;
	private String paymentNo;

	public String getRegNo() {
		return regNo;
	}
	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getEngLastName() {
		return engLastName;
	}
	public void setEngLastName(String engLastName) {
		this.engLastName = engLastName;
	}
	public String getEngFirstName() {
		return engFirstName;
	}
	public void setEngFirstName(String engFirstName) {
		this.engFirstName = engFirstName;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getRegType() {
		return regType;
	}
	public void setRegType(String regType) {
		this.regType = regType;
	}
	public int getPriceTotal() {
		return priceTotal;
	}
	public void setPriceTotal(int priceTotal) {
		this.priceTotal = priceTotal;
	}
	public String getCouponNo() {
		return couponNo;
	}
	public void setCouponNo(String couponNo) {
		this.couponNo = couponNo;
	}
	public int getPointUsed() {
		return pointUsed;
	}
	public void setPointUsed(int pointUsed) {
		this.pointUsed = pointUsed;
	}
	public String getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public String getPaymentNo() {
		return paymentNo;
	}
	public void setPaymentNo(String paymentNo) {
		this.paymentNo = paymentNo;
	}


}
