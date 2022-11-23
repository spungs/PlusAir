package com.care.plusAir.dto.member;

/*
CREATE TABLE passenger(
memberNo varchar2(10),
id varchar2(20),
pw varchar2(70),
point NUMBER,
korName varchar2(60),
birth varchar2(20),
gender varchar2(10),
mobile varchar2(15),
email varchar2(50),
firstName varchar2(32),
lastName varchar2(32),
nationality varchar2(100),
totalSales NUMBER,
regDate varchar2(20),
constraint pk_passenger primary key(memberNo)
);	
 */

public class memberDTO {
	private String memberNo;
	private String id;
	private String pw;
	private String pwConfirm;
	private int point;
	private String korName;
	private String korFirstName;
	private String korLastName;
	private String engFirstName;
	private String engLastName;
	private String birth;
	private String mobile;
	private String gender;
	private String email;
	private String nationality;
	private int totalSales;
	private String regDate;

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getKorName() {
		return korName;
	}

	public void setKorName(String korName) {
		this.korName = korName;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public int getTotalSales() {
		return totalSales;
	}

	public void setTotalSales(int totalSales) {
		this.totalSales = totalSales;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getPwConfirm() {
		return pwConfirm;
	}

	public void setPwConfirm(String pwConfirm) {
		this.pwConfirm = pwConfirm;
	}

	public String getKorFirstName() {
		return korFirstName;
	}

	public void setKorFirstName(String korFirstName) {
		this.korFirstName = korFirstName;
	}

	public String getKorLastName() {
		return korLastName;
	}

	public void setKorLastName(String korLastName) {
		this.korLastName = korLastName;
	}

	public String getEngFirstName() {
		return engFirstName;
	}

	public void setEngFirstName(String engFirstName) {
		this.engFirstName = engFirstName;
	}

	public String getEngLastName() {
		return engLastName;
	}

	public void setEngLastName(String engLastName) {
		this.engLastName = engLastName;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
