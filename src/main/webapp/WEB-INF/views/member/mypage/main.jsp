<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<title>더한항공</title>

<%@ include file="../../common/include/header.jsp"%>


<div id="body">

	<div class="wrap GD">


		<div id="breadcrumb" class="breadcrumb pc-only"
			aria-label="breadcrumb">
			<nav class="breadcrumb__inner">
				<div class="breadcrumb__item">
					<a href="javascript:;" class="breadcrumb__link"
						style="cursor: default;">홈</a>
				</div>




				<div class="breadcrumb__item">
					<a href="javascript:;" class="breadcrumb__link"
						style="cursor: default;"> 마이페이지 </a>
				</div>







				<div class="breadcrumb__item breadcrumb__item--current"
					aria-current="page" data-element="toggle"
					data-options="{&quot;mode&quot;: &quot;slide&quot;, &quot;speed&quot;: 100, &quot;clickToClose&quot;: true}">
















					<button type="button"
						class="breadcrumb__link breadcrumb__link--list"
						data-element="toggle__anchor" aria-controls="toggle-2"
						aria-expanded="false">마이페이지 메인</button>







					<div class="breadcrumb__siblings-list" data-element="toggle__panel"
						id="toggle-2" style="display: none;">


						<a href="javascript:void(0);" class="item"
							onclick="URL_LINK.getI18Url('/member/mypage/myFlightList.do')">나의
							탑승 내역</a> <a href="javascript:void(0);" class="item"
							onclick="URL_LINK.getI18Url('/myPage/methodsPaymentMngm.do')">결제수단
							관리</a> <a href="javascript:void(0);" class="item"
							onclick="URL_LINK.getI18Url('/member/mypage/viewMyGiftTicketList.do')">나의
							기프티켓</a> <a href="javascript:void(0);" class="item"
							onclick="URL_LINK.getI18Url('/member/mypage/viewMyFavoritesList.do')">즐겨찾기</a>



						<a href="javascript:void(0);" class="item"
							onclick="URL_LINK.getI18Url('/member/mypage/viewMySportsCardList.do')">나의
							스포츠 멤버십</a> <a href="javascript:void(0);" class="item"
							onclick="URL_LINK.getI18Url('/member/mypage/viewMyPartnerCoupon.do')">나의
							쿠폰</a> <a href="javascript:void(0);" class="item"
							onclick="URL_LINK.getI18Url('/member/mypage/memberInfoModify.do')">회원정보
							수정</a> <a href="javascript:void(0);" class="item"
							onclick="URL_LINK.getI18Url('/ibe/mypage/viewReservationList.do')">나의
							예약 현황</a> <a href="javascript:void(0);" class="item"
							onclick="URL_LINK.getI18Url('/member/mypage/myCoupon.do')">에어카페
							쿠폰</a>


					</div>
				</div>




			</nav>
		</div>



		<div class="content" id="content">
			<main id="main" class="main ">

				<div class="mobile-only">
					<!-- 완료된 예약 탑승일로부터 알림 -->
					<div class="text container--default">
						<p class="text__large text--exbold">
							<span>김혜명</span>고객님
						</p>
						<div class="container--xsmall">
							<p class="text__large text--bold">어디로 여행가세요?</p>
						</div>
					</div>

					<div class="container--small">
						<div class="button-wrap">
							<a href="https://www.jejuair.net/ko/ibe/booking/Availability.do"
								class="button button--middle"><span class="button__text">항공권
									예약</span></a>
						</div>
					</div>

				</div>
				<div class="title pc-only">
					<div class="page-title-wrap">
						<div class="page-title">마이페이지</div>

						<div class="title__additional">
							<span>김혜명</span> 고객님, &nbsp;어디로 여행가세요?
						</div>
						<div class="button-wrap left">
							<button type="button"
								class="button button--primary button--black"
								onclick="location.href='https://www.jejuair.net/ko/ibe/booking/Availability.do'">
								<span class="button__text">항공권 예약</span>
							</button>
						</div>

					</div>
				</div>
				<div class="new-top-wrap">
					<div class="link-wrap--arrow link-wrap--right">
						<a href="javascript:void(0)"
							onclick="MEMBER_MYPAGE_MAIN_SCRIPT.popup();"
							class="link-wrap__text"><span>회원등급 안내</span></a>
					</div>
					<div class="new-top-box">
						<div class="new-top-box__inner">
							<div class="pc-left">
								<div class="mypage__grade">
									<a href="javascript:void(0)"
										onclick="MEMBER_MYPAGE_MAIN_SCRIPT.popup();"
										class="link-wrap__text"><span class="grade silver"
										aria-label="silver"></span></a>
								</div>
								<div class="mypage__info">
									<div class="name">회원번호</div>
									<div class="number">093495882</div>
									<div class="link-wrap link-wrap--arrow">
										<a href="javascript:void(0)" class="link-wrap__text"
											data-action="memberInfoModify"><span>회원정보 수정</span></a>
									</div>
								</div>
							</div>
							<div class="pc-right">
								<div class="pc-box">
									<div
										onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/main.do')"
										class="mypage__point">
										<strong class="mypage__point--title">사용가능 포인트</strong> <span>1,000</span>P
									</div>
									<div class="button-wrap GD">
										<button type="button" class="button button--optional"
											data-target="#myBenefit" data-element="modal_anchor"
											data-modal-type="full" data-width="640" style="color: #fff;">
											<span class="button__text">나의 혜택 확인</span>
										</button>
									</div>
								</div>
								<div class="box-link-list mypage__link">
									<a href="/ko/customerService/csCenter/qnaFormList.do">
										<div>나의 1:1 문의</div>
									</a> <a href="#none" data-action="passengerManager">
										<div>탑승객 관리</div>
									</a> <a href="#none" data-action="paymentManager">
										<div>결제수단 관리</div>
									</a>
								</div>
							</div>
						</div>
					</div>
					<!--앱 전용-->
					<button type="button" class="button--optional -w100 mycoupon-btn">
						<div onclick="APPCALL.goMyCoupon();">에어카페 쿠폰함</div>
					</button>
					<!--//앱 전용-->
				</div>
				<form id="frmForAvail" name="frmForAvail" method="post">
					<input type="hidden" id="availSearchData" name="availSearchData">
				</form>
				<form id="frmResvDetail" name="frmResvDetail" method="post">
					<input type="hidden" name="resvDetailReq" value=""> <input
						type="hidden" name="rpnr" value="">
				</form>
				<div id="divResvList" class="section-wrap">
					<div class="section-title">
						<span>예약 현황</span>
						<div class="link-wrap link-wrap--arrow">
							<a href="../../ibe/mypage/viewReservationList.do"
								class="link-wrap__text"><span>전체보기</span></a>
						</div>
					</div>







					<div class="boarding-slide boarding-slide01 swiper-container">
						<div
							class="pc-flex1 pc-flex--boarding1 boarding-list-pc swiper-wrapper">


							<div class="boarding-wrap swiper-slide">
								<div class="boarding-box">
									<div class="boarding">
										<div class="boarding__header">
											<div class="boarding__header--item1">
												<span>예약번호</span> : <span>P9G28D</span>
											</div>
										</div>

										<a href="javascript:void(0);">
											<div class="boarding__info-wrap" name="divReservationDetail"
												data-recordlocator="P9G28D" data-depdate="2023-03-19"
												data-culturecode="ko_KR">
												<div class="boarding__info--top">
													<div class="boarding__info--top-item1">
														<span>7C1102</span>
													</div>
													<div class="boarding__info--top-item2">
														<div class="boarding__info-date">2023.03.19 / 08:10</div>


														<div class="label label-blue">D-124</div>



													</div>
												</div>

												<div class="boarding__info">
													<div class="boarding__info-before">


														<div class="boarding__info-title">서울</div>
														<div class="boarding__info-text">인천</div>



													</div>





													<div aria-label="one-way" class="icon-mark round-trip"></div>






													<div class="boarding__info-after">


														<div class="boarding__info-title">도쿄</div>
														<div class="boarding__info-text">나리타</div>



													</div>
												</div>
												<div class="boarding__info--bot line--solid">
													<div class="boarding__info--bot-wrap">
														<div class="boarding__info--bot-item1 person">






															<div class="person__item">
																<i ar="" ia-label="성인" class="icon adult"></i> <span>1</span><span
																	class="hidden">명</span>
															</div>








														</div>
														<div class="boarding__info--bot-item2">
															<span class="text c-gray --bold">예약완료</span>
														</div>
													</div>
												</div>
											</div>
										</a>
									</div>
									<div class="boarding_end"></div>
								</div>
							</div>

						</div>
						<div class="boarding-wrap-pagination"></div>
					</div>




					<!-- <div class="boarding-no-data">
		<div class="box-no-data">
			<div class="box-no-data-txt" text="조회중입니다.">
				잠시만 기다려 주세요.</span>
			</div>
		</div>
	</div> -->



					<div class="button-wrap left sub-section">
						<button type="button" class="button button--optional -w100"
							data-action="boardingHistory">
							<span class="button__text">지난 탑승 내역 보기</span>
						</button>
					</div>
				</div>


				<div class="section-wrap">
					<div class="section-title">
						<span>즐겨찾기</span>
						<div class="link-wrap link-wrap--arrow">
							<a href="../mypage/viewMyFavoritesList.do"
								class="link-wrap__text"><span>전체보기</span></a>
						</div>
					</div>
					<div data-element="tab" class="tab tab--default">
						<div class="tab__buttons">
							<div data-element="tab__list" class="tab__button"
								role="presentation">
								<button type="button" data-element="tab__anchor"
									class="tab__anchor is-active" data-index="0" id="plugin-tab-5"
									role="tab" tabindex="" aria-selected="true"
									aria-expanded="true">항공편</button>
							</div>
							<div data-element="tab__list" class="tab__button"
								role="presentation">
								<button type="button" data-element="tab__anchor"
									class="tab__anchor" data-index="1" id="plugin-tab-6" role="tab"
									tabindex="" aria-selected="false" aria-expanded="false">여정</button>
							</div>
							<div data-element="tab__list" class="tab__button"
								role="presentation">
								<button type="button" data-element="tab__anchor"
									class="tab__anchor" data-index="2" id="plugin-tab-7" role="tab"
									tabindex="" aria-selected="false" aria-expanded="false">공항</button>
							</div>
						</div>
						<div id="divFlight" data-element="tab__panel"
							class="tab__panel type-over-hidden is-active"
							aria-labelledby="plugin-tab-5" role="tabpanel" tabindex="0">
							<div class="finish-item-wrap">
								<div class="finish-item nodata">
									<div class="finish-item__img">
										<img src="/resources/images/icon/icon-nodata-03.png" alt="">
									</div>
									<p class="finish-item__title">
										즐겨찾기는 예매 단계에서<br>등록할 수 있어요.
									</p>
									<p class="finish-item__text">
										고민 중인 여행이 있다면<br>언제든 저장하고 관리해 보세요:)
									</p>
									<div class="container--large pc-40">
										<div class="button-wrap--center">
											<button type="button"
												class="button button--secondary button--active"
												onclick="moveAvailability();">
												<span class="button__text">예매하러 가기</span>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="divJourney" data-element="tab__panel"
							class="tab__panel type-over-hidden"
							aria-labelledby="plugin-tab-6" role="tabpanel" tabindex="0"
							style="display: none;">
							<div class="finish-item-wrap">
								<div class="finish-item nodata">
									<div class="finish-item__img">
										<img src="/resources/images/icon/icon-nodata-03.png" alt="">
									</div>
									<p class="finish-item__title">
										즐겨찾기는 예매 단계에서<br>등록할 수 있어요.
									</p>
									<p class="finish-item__text">
										고민 중인 여행이 있다면<br>언제든 저장하고 관리해 보세요:)
									</p>
									<div class="container--large pc-40">
										<div class="button-wrap--center">
											<button type="button"
												class="button button--secondary button--active"
												onclick="moveAvailability();">
												<span class="button__text">예매하러 가기</span>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="divAirport" class="tab__panel type-over-hidden"
							data-element="tab__panel" aria-labelledby="plugin-tab-7"
							role="tabpanel" tabindex="0" style="display: none;">
							<div class="finish-item-wrap">
								<div class="finish-item nodata">
									<div class="finish-item__img">
										<img src="/resources/images/icon/icon-nodata-03.png" alt="">
									</div>
									<p class="finish-item__title">
										즐겨찾기는 예매 단계에서<br>등록할 수 있어요.
									</p>
									<p class="finish-item__text">
										고민 중인 여행이 있다면<br>언제든 저장하고 관리해 보세요:)
									</p>
									<div class="container--large pc-40">
										<div class="button-wrap button-wrap--center">
											<button type="button"
												class="button button--secondary button--active"
												onclick="moveAvailability();">
												<span class="button__text">예매하러 가기</span>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div id="confirmDelete" class="modal modal--simple">
					<div class="modal-content">
						<h2 class="alert-title">즐겨찾기 삭제</h2>
						<p class="alert-text">즐겨찾기를 삭제하시겠습니까?</p>
					</div>
					<div class="modal__button-area button-wrap">
						<button type="button" class="button button--secondary"
							onclick="closeModal('confirmDelete')">
							<span class="button__text">아니요</span>
						</button>
						<button type="button"
							class="button button--secondary button--active add--ml-10"
							onclick="deleteFavorite();">
							<span class="button__text">예</span>
						</button>
					</div>
					<a href="#" onclick="closeModal('confirmDelete')"
						class="modal__close"><span class="blind">닫기</span></a>
				</div>


				<div id="myGiftTicketDetailModalLayer"
					class="modal modal-full modal-scroll modal--fixed-multi">
					<div class="modal-header">
						<div class="modal-header__title" id="voucherName"></div>
					</div>
					<div class="modal-content">
						<div class="gray-box -dark gray-box--coupon">
							<div class="coupon-list coupon-list--large">
								<div id="couponEndDim" class="coupon-list-end"
									style="display: none;">이미 사용한 기프티켓입니다.</div>
								<div id="couponImg" class="coupon-list__item"></div>
							</div>
						</div>

						<div class="container--small container--small pc-35 mt30">
							<div class="table-horizontal">
								<table>
									<caption>쿠폰 상세 설명</caption>
									<colgroup>
										<col style="width: 35%">
										<col>
									</colgroup>
									<tbody class="table-horizontal__tbody">
										<tr>
											<th scope="row" class="table-horizontal__th">기프티켓 번호</th>
											<td id="voucherNumber" class="table-horizontal__td"></td>
										</tr>
										<tr>
											<th scope="row" class="table-horizontal__th">이용 가능 기간</th>
											<td id="ceDate" class="table-horizontal__td"></td>
										</tr>
										<tr>
											<th scope="row" class="table-horizontal__th">상태</th>
											<td id="statusName" class="table-horizontal__td"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div class="fixed-wrap fixed-wrap--multi-line border-none ">
						<div class="button-wrap">
							<button type="button" rel="modal:close"
								class="button button--primary button--active">
								<span class="button__text">확인</span>
							</button>
						</div>
					</div>
					<a href="javascript:void(0)" rel="modal:close" class="modal__close"><span
						class="blind">닫기</span></a>
				</div>
				<div id="myJJLoungeDetailModalLayer"
					class="modal modal-full modal--fixed-multi modal-scroll">
					<div class="modal-header">
						<div id="jjTitle" class="modal-header__title"></div>
					</div>
					<div class="modal-content">
						<div class="container--small">
							<div class="table-horizontal">
								<table>
									<caption>JJ 라운지이용권 상세보기</caption>
									<colgroup>
										<col style="width: 35%">
										<col>
									</colgroup>
									<tbody class="table-horizontal__tbody">
									</tbody>
								</table>
							</div>
						</div>
						<div id="loungePurCancelDiv"
							class="link-wrap link-wrap--left mt-20">
							<a href="javascript:void(0)" id="purCancel"
								class="link-wrap__underline"><span>구매취소</span></a>
						</div>
					</div>
					<div class="fixed-wrap fixed-wrap--multi-line border-none">
						<div class="button-wrap">
							<button type="button" rel="modal:close"
								class="button button--primary button--active">
								<span class="button__text">확인</span>
							</button>
						</div>
					</div>
					<a href="javascript:void(0)" rel="modal:close" class="modal__close"><span
						class="blind">닫기</span></a>

				</div>


				<div id="mySportsCardDetailModalLayer"
					class="modal modal-full modal--fixed-multi modal-scroll">
					<div class="modal-header">
						<div class="modal-header__title">스포츠 멤버십</div>
					</div>
					<div class="modal-content">
						<div class="container--small">
							<div class="table-horizontal">
								<table>
									<caption>쿠폰 상세 설명</caption>
									<colgroup>
										<col style="width: 120px">
										<col>
									</colgroup>
									<tbody class="table-horizontal__tbody">
										<tr>
											<th scope="row" class="table-horizontal__th">상품명</th>
											<td id="goodName" class="table-horizontal__td"></td>
										</tr>
										<tr>
											<th scope="row" class="table-horizontal__th">구입일자</th>
											<td id="orderDate" class="table-horizontal__td"></td>
										</tr>
										<tr>
											<th scope="row" class="table-horizontal__th">구입금액</th>
											<td id="goodPrice" class="table-horizontal__td"></td>
										</tr>
										<tr>
											<th scope="row" class="table-horizontal__th">사용기간</th>
											<td id="useDate" class="table-horizontal__td"></td>
										</tr>
										<tr>
											<th scope="row" class="table-horizontal__th">상태</th>
											<td id="sportsStatusName" class="table-horizontal__td"></td>
										</tr>
										<tr>
											<th scope="row" class="table-horizontal__th">구매번호</th>
											<td id="customerNumber" class="table-horizontal__td"></td>
										</tr>
										<tr>
											<th scope="row" class="table-horizontal__th">결제수단</th>
											<td id="currencyCode" class="table-horizontal__td"></td>
										</tr>
										<!-- 결제수단에 따른 정보 -->
										<!-- <tr class="currencyType">
							<th scope="row" class="table-horizontal__th">할부개월</th>
							<td id="installment" class="table-horizontal__td"></td>
						</tr> -->
										<tr class="currencyType">
											<th scope="row" class="table-horizontal__th">승인번호</th>
											<td id="approvalNumber" class="table-horizontal__td"></td>
										</tr>
										<tr class="currencyType">
											<th scope="row" class="table-horizontal__th">결제일</th>
											<td id="paymentDate" class="table-horizontal__td"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div id="sportsPurCancelDiv"
							class="link-wrap link-wrap--left mt-20">
							<a href="javascript:void(0)" id="purCancel"
								class="link-wrap__underline"><span>구매취소</span></a>
						</div>
					</div>
					<div class="fixed-wrap fixed-wrap--multi-line border-none ">
						<div class="button-wrap">
							<button type="button" rel="modal:close"
								class="button button--primary button--active">
								<span class="button__text">확인</span>
							</button>
						</div>
					</div>
					<a href="javascript:void(0)" rel="modal:close" class="modal__close"><span
						class="blind">닫기</span></a>

				</div>
				<button type="button" id="btnModalOpen" data-element="modal_anchor"
					style="display: none;"></button>



				<div id="friendConfirmDelete" class="modal modal--simple">
					<div class="modal-content">
						<h2 class="alert-title">탑승객 삭제</h2>
						<p class="alert-text">
							<span></span>님을 탑승객 목록에서 삭제하시겠습니까?
						</p>
					</div>
					<div class="modal__button-area button-wrap">
						<button type="button" class="button button--secondary"
							onclick="closeCurrentModal(this)">
							<span class="button__text">아니요</span>
						</button>
						<button name="btnDeleteConfirm" type="button"
							class="button button--secondary button--active add--ml-10">
							<span class="button__text">예</span>
						</button>
					</div>
					<a href="#" onclick="closeCurrentModal(this)" class="modal__close"><span
						class="blind">닫기</span></a>
				</div>
				<form role="form" method="post"></form>
			</main>
		</div>
	</div>
</div>
<%@ include file="../../common/include/footer.jsp"%>

</body>
</html>