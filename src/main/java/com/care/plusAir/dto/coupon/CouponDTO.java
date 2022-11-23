package com.care.plusAir.dto.coupon;

/*
 * SQL> create table coupon(
  2  couponType varchar2(10),
  3  couponNo varchar2(20),
  4  couponName varchar2(100),
  5  discountRate number,
  6  availableTime number,
  7  memberNo varchar2(10),
  8  startDate varchar2(20),
  9  usedCoupon varchar2(5),
  10 constraint pk_coupon foreign key(memberNo) references passenger(memberNo) on delete cascade
  11 );
 */

public class CouponDTO {
	private String couponType;
	private String couponNo;
	private String couponName;
	private int discountRate;
	private int availableTime;
	
	private String memberNo;
	private String startDate;
	private String usedCoupon;
	
	
	public String getCouponNo() {
		return couponNo;
	}
	public void setCouponNo(String couponNo) {
		this.couponNo = couponNo;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getUsedCoupon() {
		return usedCoupon;
	}
	public void setUsedCoupon(String usedCoupon) {
		this.usedCoupon = usedCoupon;
	}

	public String getCouponType() {
		return couponType;
	}
	public void setCouponType(String couponType) {
		this.couponType = couponType;
	}
	public int getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}
	public int getAvailableTime() {
		return availableTime;
	}
	public void setAvailableTime(int availableTime) {
		this.availableTime = availableTime;
	}

}
