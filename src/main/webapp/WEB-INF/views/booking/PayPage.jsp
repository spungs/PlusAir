<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function test(){
	var paymentType = document.getElementById('paymentType')
	$("input[name='inputRadio']:checked").val();
	paymentType.value = $("input[name='inputRadio']:checked").val()
}
</script>
<%@ include file="../common/include/header.jsp"%>
	<div id="body">
		<div class="wrap wrap--button NA NA_1_A">
			<div class="content" id="content" style="min-height: 0;">
			<main id="main" class="main">
				<div class="section-wrap">
					<div class="pc-pay-wrap">
						<div class="left">
							<div class="section-title">여정 상세</div><!-- 여정 상세 -->
						</div>
						<div class="right">
							<div class="journeys__title">
								<div class="journeys__heading">
										가는 편<!-- 가는 편 -->
								</div> 
								<div class="journeys__passengers">
									<div class="person">
										<div class="person__item">
											<i aria-label="성인" class="icon adult"></i><!-- 성인 -->
											<span>${downDto.adtNum}</span><span class="hidden">명</span>
										</div>
										<div class="person__item">
											<i aria-label="소아" class="icon child"></i><!-- 소아 -->
											<span>${downDto.chdNum}</span><span class="hidden">명</span>
										</div>
										<div class="person__item">
											<i aria-label="유아" class="icon baby"></i><!-- 유아 -->
											<span>${downDto.infNum}</span><span class="hidden">명</span>
										</div>
									</div>
								</div>
							</div>
							<div class="journeys boarding-list-pc">
								<div class="boarding-wrap reserve">
									<div class="boarding-box">
										<div class="boarding">
											<div class="boarding__header">
												<div class="boarding__header--item1">
													<span>${downDto.flightNo}</span>
												</div>
												<div class="boarding__header--item2">
													<span class="marked--brand">FLYBAG</span>
												</div>
											</div>
											<div class="boarding__info-wrap">
												<div class="boarding__info--top">
													<div class="boarding__info--top-item1">
														<span>${downDto.hidYear}.${downDto.hidMonth}.${downDto.hidDay} / <em class="mo-br">${downDto.departTime}</em></span>
													</div>
													<div class="boarding__info--top-item2">
														<div class="boarding__info-date">${downDto.hidYear}.${downDto.hidMonth}.${strhid} / <em class="mo-br">${downDto.arrivalTime}</em></div>
													</div>
												</div>
												<div class="boarding__info">
													<div class="boarding__info-before">
														<div class="boarding__info-title">${downDto.kode}</div>
													</div>
													<div aria-label="one-way" class="icon-mark one-way"></div>
													<div class="boarding__info-after">
														<div class="boarding__info-title">${downDto.koar}</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<c:choose>
								<c:when test="${downDto.hiddenItem == '왕복'}">
									<div class="journeys__title">
										<div class="journeys__heading">
												오는 편<!-- 가는 편 -->
										</div> 
										<div class="journeys__passengers">
											<div class="person">
												<div class="person__item">
													<i aria-label="성인" class="icon adult"></i><!-- 성인 -->
													<span>${downDto.adtNum}</span><span class="hidden">명</span>
												</div>
												<div class="person__item">
													<i aria-label="소아" class="icon child"></i><!-- 소아 -->
													<span>${downDto.chdNum}</span><span class="hidden">명</span>
												</div>
												<div class="person__item">
													<i aria-label="유아" class="icon baby"></i><!-- 유아 -->
													<span>${downDto.infNum}</span><span class="hidden">명</span>
												</div>
											</div>
										</div>
									</div>
									<div class="journeys boarding-list-pc">
										<div class="boarding-wrap reserve">
											<div class="boarding-box">
												<div class="boarding">
													<div class="boarding__header">
														<div class="boarding__header--item1">
															<span>${downDto.backflightNo}</span>
														</div>
														<div class="boarding__header--item2">
															<span class="marked--brand">FLYBAG</span>
														</div>
													</div>
													<div class="boarding__info-wrap">
														<div class="boarding__info--top">
															<div class="boarding__info--top-item1">
																<span>${downDto.backYear}.${downDto.backMonth}.${downDto.backDay} / <em class="mo-br">${downDto.backdepartTime}</em></span>
															</div>
															<div class="boarding__info--top-item2">
																<div class="boarding__info-date">${downDto.backYear}.${downDto.backMonth}.${strbackday} / <em class="mo-br">${downDto.backarrivalTime}</em></div>
															</div>
														</div>
														<div class="boarding__info">
															<div class="boarding__info-before">
																<div class="boarding__info-title">${downDto.koar}</div>
															</div>
															<div aria-label="one-way" class="icon-mark one-way"></div>
															<div class="boarding__info-after">
																<div class="boarding__info-title">${downDto.kode}</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
			</main>
			</div>
		</div>
		<div class="wrap wrap--booking NA_1_B step-ui">
			<div class="content" id="content">
				<main id="main" class="main ">
					<div class="page-title-wrap pc-only">
					<div class="page-title">결제</div><!-- 결제 -->
				</div>
				<div class="section-wrap">
				<!-- 항목별 운임 상세 -->
				<!-- 예상 결제금액 -->
					<div class="pc-pay-layout pc-30">
						<div class="layout-left">
							<div class="section-title">항목별 운임 상세</div>
						</div>
						<div class="layout-right">
							<div class="container--small">
								<div data-element="toggle" class="toggle-item pay">
									<div class="toggle-item__title">
										<button type="button" id="btnSummary" data-element="toggle__anchor" class="toggle-item__anchor is-active" aria-controls="toggle-2" aria-expanded="true">
											<div class="payment-amount">
												<div class="payment-amount__title">예상 결제금액</div>
												<p class="payment-amount__sum">
												<span class="price_txt pd0">${strlasttotal}</span>
												<span class="unit">원</span>
												</p>
											</div>
										</button>
									</div>
									<div data-element="toggle__panel" class="toggle-item__content" id="toggle-2" style="display: block;">
										<div class="itemize__item itemize__item--payment">
											<div class="group">
												<div class="group__title">항공 운송료</div><!-- 항공 운송료 -->
												<div class="group__info">
													<div class="flex-text">
														<div class="flex-text__title">항공운임</div><!-- 항공운임 -->
														<div class="flex-text__additional">
															<span class="price_txt pd0">${totalprice}</span>
															<span class="unit">원</span>
														</div>
													</div>
													<div class="flex-text">
														<div class="flex-text__title">유류할증료</div><!-- 유류할증료 -->
														<div class="flex-text__additional">
															<span class="price_txt pd0">${strextramoney}</span>
															<span class="unit">원</span>
														</div>
													</div>
													<div class="flex-text">
														<div class="flex-text__title">
															<div class="link-wrap--left">
																<a href="javascript:void(0)" id="taxInfo" class="link-wrap__underline link-wrap__underline--gray"><span>공항시설 사용료</span></a><!-- 공항시설 사용료 -->
															</div>
														</div>
														<div class="flex-text__additional">
															<span class="price_txt pd0">${strusagefee}</span>
															<span class="unit">원</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="guide-info guide-info--gray">
									<p class="guide-info__text">구매일 및 환율에 따라 차이가 있을 수 있으며, 일부 해외카드 결제수수료로 인해 실제 청구금액은 최종 결제금액과 다를 수 있습니다. 자세한 사항은 해당 카드사를 통해 확인하시기 바랍니다.
				  					</p>
				  					<p class="guide-info__text">구매 후 항공권의 결제 수단 변경은 불가합니다.</p>
				  				</div>
							</div>
						</div>
					</div>
				</div>
				<div class="section-wrap">
					<div class="pc-pay-layout section-wrap">
						<div class="layout-left">
							<div class="title">
								<h2 class="section-title pc-only mt10">결제방법</h2><!-- 결제방법 -->
								<div class="radio-flex mobile-only">
									<div class="radio-item">
										<h2 class="section-title">결제방법</h2><!-- 결제방법 -->
									</div>
								</div>
							</div>
						</div>
						<div class="layout-right">
							<div class="payment-use-wrap bottom2" data-element="inputToggle">
							<c:choose>
								<c:when test="${sessionScope.id != null}">
									<div class="radio-wrap m-15">
										<div class="radio-flex">
											<div class="radio-item">
												<span class="radio">
													<input type="checkbox" id="inputRadioJP" name="inputRadio" class="radio__input" data-toggle="toggle__anchor" data-mid="JJAIRWPAY2" data-pay-type-detail="JP1" aria-controls="inputRadioJP-0" aria-expanded="false">
													<label for="inputRadioJP" class="radio__label">
														<i aria-hidden="true" class="radio__ico"></i>
														<span>포인트 사용하기</span><!-- 빠른 결제 -->
													</label>
												</span>
											</div>
										</div>
									</div>
									<div class="radio-wrap">
										<div class="radio-flex">
											<div class="radio-item">
												<span class="radio">
													<input type="checkbox" id="inputRadioCL" name="inputRadio" class="radio__input" data-toggle="toggle__anchor" aria-controls="inputRadioJP-4" aria-expanded="false">
													<label for="inputRadioCL" class="radio__label">
														<i aria-hidden="true" class="radio__ico"></i>
														<span>쿠폰 사용하기</span><!-- 간편결제 -->
													</label>
												</span>
											</div>
											<div class="radio-item" style="display: none;">
												<div class="link-wrap--arrow">
													<button type="button" id="easyPayDiscount" class="link__text_arrow" aria-label="할인안내"><!-- 할인안내 -->
														<span>할인안내</span><!-- 할인안내 -->
													</button>
												</div>
											</div>
										</div>
									</div>
								</c:when>
							</c:choose>
								<div class="radio-wrap">
									<div class="radio-flex">
										<div class="radio-item">
											<span class="radio">
												<input type="radio" id="inputRadioCC" name="inputRadio" class="radio__input" value="카드 일반결제" onclick="test()">
												<label for="inputRadioCC" class="radio__label">
													<i aria-hidden="true" class="radio__ico"></i>
													<span>카드 일반결제</span><!-- 카드 일반결제 -->
												</label>
											</span>
										</div>
									</div>
								</div>
								<div class="radio-wrap">
									<div class="radio-item">
										<span class="radio">
											<input type="radio" id="inputRadioOC1" name="inputRadio" class="radio__input" value="해외카드 결제" onclick="test()">
											<label for="inputRadioOC1" class="radio__label">
												<i aria-hidden="true" class="radio__ico"></i>
												<span>해외카드 결제</span><!-- 해외카드 결제 -->
											</label>
										</span>
									</div>
									<div class="radio--toggle" data-toggle="toggle__panel" id="inputRadioJP-9" style="display: none;"></div>
								</div>
								<div class="radio-wrap">
									<div class="radio-item">
										<span class="radio">
											<input type="radio" id="inputRadioKC" name="inputRadio" class="radio__input" value="계좌이체" onclick="test()">
											<label for="inputRadioKC" class="radio__label">
												<i aria-hidden="true" class="radio__ico"></i>
												<span>계좌이체</span><!-- 계좌이체 -->
											</label>
										</span>
									</div>
								</div>
							</div>
							<div class="check-wrap">
								<span class="checkbox checkbox--small">
									<input type="checkbox" id="chkFavoritePayment" data-element="checkbox" class="checkbox__input" checked="">
									<label for="chkFavoritePayment" class="checkbox__label">
										<i aria-hidden="true" class="checkbox__ico"></i>
										<span>이 결제수단을 다음에도 사용합니다.</span><!-- 이 결제수단을 다음에도 사용합니다. -->
									</label>
								</span>
							</div>
						</div>
					</div>
				</div>
			<div class="booking-sticky booking-sticky--reservation pc-only">
				<div class="reservation-container">
					<div class="booking-sticky__top payment">
						<div class="toggle-wrap toggle-wrap--button">
							<div class="label no-icon">
								<span>총 결제금액</span><!-- 총 결제금액 -->
							</div>
							<div class="summary no-icon">
								<span class="cost">
									<span class="price_txt pd0">${strlasttotal}</span>
									<span class="unit">원</span>
								</span>
							</div>
						</div>
						<form action="payment" method="post">
						     	<!-- 비행편 정보 -->
								<input type="hidden" id="flightNo" name="flightNo" value="${downDto.flightNo}">
								<input type="hidden" id="departTime" name="departTime" value="${downDto.departTime}">
								<input type="hidden" id="arrivalTime" name="arrivalTime" value="${downDto.arrivalTime}">
								<input type="hidden" id="flightTime" name="flightTime" value="${downDto.flightTime}">
								<input type="hidden" id="totalprice" name="totalprice" value="${totalprice}">
								<input type="hidden" id="hiddenItem" name="hiddenItem" value="${downDto.hiddenItem}">	
								<input type="hidden" id="kode" name="kode" value="${downDto.kode}">	<!-- 출발지 한국어 -->	
								<input type="hidden" id="koar" name="koar" value="${downDto.koar}">	<!-- 도착지 한국어 -->	
								<input type="hidden" id="departureData" name="departureData" value="${downDto.departureData}">
								<input type="hidden" id="arrivalData" name="arrivalData" value="${downDto.arrivalData}">
								<input type="hidden" id="hidYear" name="hidYear" value="${downDto.hidYear}">
								<input type="hidden" id="hidMonth" name="hidMonth" value="${downDto.hidMonth}">
								<input type="hidden" id="hidDay" name="hidDay" value="${downDto.hidDay}">
								<input type="hidden" id="hidToYear" name="hidToYear" value="${downDto.hidToYear}">
								<input type="hidden" id="hidToMonth" name="hidToMonth" value="${downDto.hidToMonth}">
								<input type="hidden" id="hidToDay" name="hidToDay" value="${downDto.hidToDay}">
								<input type="hidden" id="flightRouteNo" name="flightRouteNo" value="${downDto.flightRouteNo}"><!-- 추가됨 -->
								<c:choose>
									<c:when test="${downDto.hiddenItem == '왕복'}">
										<input type="hidden" id="BackYear" name="BackYear" value="${downDto.backYear}">
										<input type="hidden" id="BackMonth" name="BackMonth" value="${downDto.backMonth}">
										<input type="hidden" id="BackDay" name="BackDay" value="${downDto.backDay}">
										<input type="hidden" id="BackflightNo" name="BackflightNo" value="${downDto.backflightNo}">
										<input type="hidden" id="backdepartTime" name="backdepartTime" value="${downDto.backdepartTime}">
										<input type="hidden" id="backarrivalTime" name="backarrivalTime" value="${downDto.backarrivalTime}">
										<input type="hidden" id="backflightTime" name="backflightTime" value="${downDto.backflightTime}">
										<input type="hidden" id="backflightRouteNo" name="backflightRouteNo" value="${downDto.backflightRouteNo}"><!-- 추가됨 -->
									</c:when>
								</c:choose>
								<input type="hidden" id="adtNum" name="adtNum" value="${downDto.adtNum}">
								<input type="hidden" id="chdNum" name="chdNum" value="${downDto.chdNum}">
								<input type="hidden" id="infNum" name="infNum" value="${downDto.infNum}">
								
								<!-- 탑승자 정보 -->
								<input type="hidden" id="psg0fname" name="psg0fname" value="${mainpsgDto.psg0fname}">
								<input type="hidden" id="psg0name" name="psg0name" value="${mainpsgDto.psg0name}">
								<input type="hidden" id="psg0gender" name="psg0gender" value="${mainpsgDto.psg0gender}">
								<input type="hidden" id="psg0year" name="psg0year" value="${mainpsgDto.psg0year}">
								<input type="hidden" id="psg0month" name="psg0month" value="${mainpsgDto.psg0month}">
								<input type="hidden" id="psg0day" name="psg0day" value="${mainpsgDto.psg0day}">
								<input type="hidden" id="psg0phon" name="psg0phon" value="${mainpsgDto.psg0phon}">
								<input type="hidden" id="psg0email" name="psg0email" value="${mainpsgDto.psg0email}">
								<input type="hidden" id="psg0seat" name="psg0seat" value="${mainpsgDto.psg0seat}">
							
								<input type="hidden" id="psg1fname" name="psg1fname" value="${psg1Dto.psg1fname}">
								<input type="hidden" id="psg1name" name="psg1name" value="${psg1Dto.psg1name}">
								<input type="hidden" id="psg1gender" name="psg1gender" value="${psg1Dto.psg1gender}">
								<input type="hidden" id="psg1year" name="psg1year" value="${psg1Dto.psg1year}">
								<input type="hidden" id="psg1month" name="psg1month" value="${psg1Dto.psg1month}">
								<input type="hidden" id="psg1day" name="psg1day" value="${psg1Dto.psg1day}">
								<input type="hidden" id="psg1seat" name="psg1seat" value="${psg1Dto.psg1seat}">
								
								<input type="hidden" id="psg2fname" name="psg2fname" value="${psg2Dto.psg2fname}">
								<input type="hidden" id="psg2name" name="psg2name" value="${psg2Dto.psg2name}">
								<input type="hidden" id="psg2gender" name="psg2gender" value="${psg2Dto.psg2gender}">
								<input type="hidden" id="psg2year" name="psg2year" value="${psg2Dto.psg2year}">
								<input type="hidden" id="psg2month" name="psg2month" value="${psg2Dto.psg2month}">
								<input type="hidden" id="psg2day" name="psg2day" value="${psg2Dto.psg2day}">
								<input type="hidden" id="psg2seat" name="psg2seat" value="${psg2Dto.psg2seat}">
								
								<input type="hidden" id="psg3fname" name="psg3fname" value="${psg3Dto.psg3fname}">
								<input type="hidden" id="psg3name" name="psg3name" value="${psg3Dto.psg3name}">
								<input type="hidden" id="psg3gender" name="psg3gender" value="${psg3Dto.psg3gender}">
								<input type="hidden" id="psg3year" name="psg3year" value="${psg3Dto.psg3year}">
								<input type="hidden" id="psg3month" name="psg3month" value="${psg3Dto.psg3month}">
								<input type="hidden" id="psg3day" name="psg3day" value="${psg3Dto.psg3day}">
								<input type="hidden" id="psg3seat" name="psg3seat" value="${psg3Dto.psg3seat}">
								
								<input type="hidden" id="psg4fname" name="psg4fname" value="${psg4Dto.psg4fname}">
								<input type="hidden" id="psg4name" name="psg4name" value="${psg4Dto.psg4name}">
								<input type="hidden" id="psg4gender" name="psg4gender" value="${psg4Dto.psg4gender}">
								<input type="hidden" id="psg4year" name="psg4year" value="${psg4Dto.psg4year}">
								<input type="hidden" id="psg4month" name="psg4month" value="${psg4Dto.psg4month}">
								<input type="hidden" id="psg4day" name="psg4day" value="${psg4Dto.psg4day}">
								<input type="hidden" id="psg4seat" name="psg4seat" value="${psg4Dto.psg4seat}">
								
								<input type="hidden" id="psg5fname" name="psg5fname" value="${psg5Dto.psg5fname}">
								<input type="hidden" id="psg5name" name="psg5name" value="${psg5Dto.psg5name}">
								<input type="hidden" id="psg5gender" name="psg5gender" value="${psg5Dto.psg5gender}">
								<input type="hidden" id="psg5year" name="psg5year" value="${psg5Dto.psg5year}">
								<input type="hidden" id="psg5month" name="psg5month" value="${psg5Dto.psg5month}">
								<input type="hidden" id="psg5day" name="psg5day" value="${psg5Dto.psg5day}">
								<input type="hidden" id="psg5seat" name="psg5seat" value="${psg5Dto.psg5seat}">
								
								<input type="hidden" id="psg6fname" name="psg6fname" value="${psg6Dto.psg6fname}">
								<input type="hidden" id="psg6name" name="psg6name" value="${psg6Dto.psg6name}">
								<input type="hidden" id="psg6gender" name="psg6gender" value="${psg6Dto.psg6gender}">
								<input type="hidden" id="psg6year" name="psg6year" value="${psg6Dto.psg6year}">
								<input type="hidden" id="psg6month" name="psg6month" value="${psg6Dto.psg6month}">
								<input type="hidden" id="psg6day" name="psg6day" value="${psg6Dto.psg6day}">
								<input type="hidden" id="psg6seat" name="psg6seat" value="${psg6Dto.psg6seat}">
								
								<input type="hidden" id="psg7fname" name="psg7fname" value="${psg7Dto.psg7fname}">
								<input type="hidden" id="psg7name" name="psg7name" value="${psg7Dto.psg7name}">
								<input type="hidden" id="psg7gender" name="psg7gender" value="${psg7Dto.psg7gender}">
								<input type="hidden" id="psg7year" name="psg7year" value="${psg7Dto.psg7year}">
								<input type="hidden" id="psg7month" name="psg7month" value="${psg7Dto.psg7month}">
								<input type="hidden" id="psg7day" name="psg7day" value="${psg7Dto.psg7day}">
								<input type="hidden" id="psg7seat" name="psg7seat" value="${psg7Dto.psg7seat}">
								
								<!-- 가격 부분 -->
								<input type="hidden" id="strhid" name="strhid" value="${strhid}"><!--출발하는편 도착 날짜  -->
								<input type="hidden" id="strbackday" name="strbackday" value="${strbackday}"><!--돌아오는편 도착 날짜  -->
								<input type="hidden" id="strextramoney" name="strextramoney" value="${strextramoney}"><!--수수료  -->
								<input type="hidden" id="strusagefee" name="strusagefee" value="${strusagefee}"><!--시설 이용료  -->
								<input type="hidden" id="strlasttotal" name="strlasttotal" value="${strlasttotal}"><!--모든 수수료+항공 운임료 더한값  -->
								
								<input type="hidden" id="paymentType" name="paymentType" value="">
								
						<button name="btnNext" type="submit" class="button button--primary pc-only button--active">
							<span class="button__text">결제하기</span><!-- 결제하기 -->
						</button>
						</form>
					</div>
				</div>
			</div>
			</main>
			</div>
		</div>
	</div>
<%@ include file="../common/include/footer.jsp"%>