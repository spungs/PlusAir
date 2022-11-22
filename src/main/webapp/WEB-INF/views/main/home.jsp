<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"><head>
<%@ include file="../common/include/header.jsp" %>

	
	<div id="body">
	<div class="wrap wrap--main GA">
		<div class="main-content" id="content">
			<main id="main" class="main">
				<form id="availSearchForm"><input type="hidden" id="availSearchData" name="availSearchData"></form>
				<div class="main-booking-visual open">
					<!-- quick-booking -->
					<div class="quick-booking quick-sticky-controller">
						<div class="dimmed"></div>
						<div class="inner">
							<div class="fixed-block">
								<div class="main-ticketing round">
									<div class="ticketing-in content-guide">
										<ul class="ticketing-type">
											<li class="item selected" data-triptype="RT"><a href="#" class="item-btn">왕복</a></li> <!-- 왕복 -->
											<li class="item" data-triptype="OW"><a href="#" class="item-btn">편도</a></li> <!-- 편도 -->
											<li class="item" data-triptype="MT"><a href="#" class="item-btn">다구간</a></li> <!-- 다구간 -->		 	
										</ul>
										
										<div class="ticketing-row-top single">
											<div class="ticketing-target">
												<button type="button" class="start js-target-pick"><span class="txt before-select" id="spanDepartureDesc">출발지</span></button> <!-- 출발지 -->	
												<input type="hidden" id="departureData">
												<button type="button" class="target js-target-pick"><span class="txt before-select" id="spanArrivalDesc">도착지</span></button> <!-- 도착지 -->
												<input type="hidden" id="arrivalData">
												<button type="button" class="btn-open js-target-pick" data-route="DEP" id="btnExchangeRoute1"><span class="blind">열기</span></button> <!--열기-->
											</div>
											<div class="ticketing-date">													
																	
													
												
																								
												
																																				
																				
												
												
																								
															
												<button type="button" class="btn-date" id="btnDatePicker"><span class="txt">2022.11.13(일) ~ 2022.11.20(일)</span></button>								
												<input type="hidden" id="departureDate" value="2022-11-13">
												<input type="hidden" id="arrivalDate" value="2022-11-20">
											</div>				
										</div>		
										
										<div class="ticketing-row-hidden single">
											<div class="flight-layer flight-start" id="depAirportLayer">		
												<div class="layer-header">
													<div class="header__input-wrap input is-focus" data-element="form">
														<button type="button" class="header__button" name="header_btn"><span class="hidden">이전으로</span></button> <!-- 이전으로 -->
														<button type="button" class="header__input-search"><img src="https://static.jejuair.net/hpgg/resources/images/icon/icon-header-search.png" alt="검색"></button>
														<input type="text" id="txtDEPAirport" class="header__input ui-autocomplete-input" data-element="input" placeholder="어디에서 출발하세요?" autocomplete="off"> <!-- 어디에서 출발하세요? -->
														<p class="map-list-txt" id="mapDEPAirport">어디에서 출발하세요?</p> <!-- 어디에서 출발하세요? -->
														<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button> <!-- 삭제 -->
													</div>									
													<div id="divDEPAirportAC" name="search_auto" target="txtDepAirport"><ul class="predictive-search ui-menu ui-widget ui-widget-content" id="ui-id-1" tabindex="0" style="display: none;"></ul></div>
												</div>
												<div class="txt-list">
													<div class="header-sub" data-element="tab">
														<div class="tab__buttons">
															<div data-element="tab__list" class="tab__button" role="presentation">
																<button type="button" class="tab__anchor is-active" id="selectTab01" data-element="tab__anchor" data-index="0" role="tab" tabindex="" aria-selected="true" aria-expanded="true">최근 검색</button> <!-- 최근 검색 -->
															</div>
															<div data-element="tab__list" class="tab__button" role="presentation">
																<button type="button" class="tab__anchor" id="selectTab02" data-element="tab__anchor" data-index="1" role="tab" tabindex="" aria-selected="false" aria-expanded="false">즐겨찾기</button> <!-- 즐겨찾기 -->
															</div>
															<div data-element="tab__list" class="tab__button" role="presentation" name="divPromotion">
																<button type="button" class="tab__anchor" id="selectTab03" data-element="tab__anchor" data-index="2" role="tab" tabindex="" aria-selected="false" aria-expanded="false">프로모션</button> <!-- 프로모션 -->
															</div>
														</div>														
														<div data-element="tab__panel" class="tab__panel is-active" aria-labelledby="selectTab01" role="tabpanel" tabindex="0">
															<div data-element="tab">
																<div class="tab__button-wrap">
																	<div class="tag-list" data-scroll="x" name="latelySearch"></div>
																</div>
															</div>
														</div>
														<div data-element="tab__panel" class="tab__panel" aria-labelledby="selectTab02" role="tabpanel" tabindex="0" style="display: none;">
															<div data-element="tab">
																<div class="tab__button-wrap">
																	<div class="tag-list" data-scroll="x" name="favorites"></div>
																</div>
															</div>
														</div>
														<div data-element="tab__panel" class="tab__panel" aria-labelledby="selectTab03" role="tabpanel" tabindex="0" style="display: none;">
															<div data-element="tab">
																<div class="tab__button-wrap">
																	<div class="tag-list" data-scroll="x" name="promotionSearch"></div>
																</div>
															</div>
														</div>														
													</div>
													<div class="main--destination-select">
														<hr class="booking-line">
														<div data-element="tab" class="tab tab--vertical tab--booking">
															<div class="tab__buttons vertical_scroll_set" id="divDepArea"><div data-element="tab__list" class="tab__button" role="presentation"><button type="button" tabindex="" data-element="tab__anchor" role="tab" data-index="0" id="plugin-DEPtab-2" class="tab__anchor is-active" aria-selected="true" aria-expanded="true">대한민국</button></div><div data-element="tab__list" class="tab__button" role="presentation"><button type="button" tabindex="" data-element="tab__anchor" role="tab" data-index="1" id="plugin-DEPtab-3" class="tab__anchor" aria-selected="false" aria-expanded="false">동북아시아</button></div><div data-element="tab__list" class="tab__button" role="presentation"><button type="button" tabindex="" data-element="tab__anchor" role="tab" data-index="2" id="plugin-DEPtab-4" class="tab__anchor" aria-selected="false" aria-expanded="false">동남아시아</button></div><div data-element="tab__list" class="tab__button" role="presentation"><button type="button" tabindex="" data-element="tab__anchor" role="tab" data-index="3" id="plugin-DEPtab-5" class="tab__anchor" aria-selected="false" aria-expanded="false">대양주/괌/사이판</button></div></div>
															<div class="tab__panel-wrap scrollbar-inner" data-element="tab__panel-wrap"><div data-element="tab__panel" class="tab__panel is-active" aria-labelledby="plugin-DEPtab-2" role="tabpanel" tabindex="0" style="display: block;"><div class="choise"><button type="button" class="choise__button" data-countrycode="KR" data-areacode="RGTP000001" data-onlyoneway="undefined" data-latitude="37.253" data-longitude="126.223" data-stationcode="ICN" data-stationtype="DEP" data-stationname="서울(인천)"><span class="stationName">서울(인천)</span><span class="airport">ICN</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="KR" data-areacode="RGTP000001" data-onlyoneway="undefined" data-latitude="37.330400000000004" data-longitude="126.47070000000001" data-stationcode="GMP" data-stationtype="DEP" data-stationname="서울(김포)"><span class="stationName">서울(김포)</span><span class="airport">GMP</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="KR" data-areacode="RGTP000001" data-onlyoneway="undefined" data-latitude="35.1015" data-longitude="129.07500000000002" data-stationcode="PUS" data-stationtype="DEP" data-stationname="부산"><span class="stationName">부산</span><span class="airport">PUS</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="KR" data-areacode="RGTP000001" data-onlyoneway="undefined" data-latitude="33.302" data-longitude="126.2942" data-stationcode="CJU" data-stationtype="DEP" data-stationname="제주"><span class="stationName">제주</span><span class="airport">CJU</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="KR" data-areacode="RGTP000001" data-onlyoneway="undefined" data-latitude="35.0724" data-longitude="126.4839" data-stationcode="KWJ" data-stationtype="DEP" data-stationname="광주"><span class="stationName">광주</span><span class="airport">KWJ</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="KR" data-areacode="RGTP000001" data-onlyoneway="undefined" data-latitude="35.59" data-longitude="126.45" data-stationcode="KUV" data-stationtype="DEP" data-stationname="군산"><span class="stationName">군산</span><span class="airport">KUV</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="KR" data-areacode="RGTP000001" data-onlyoneway="undefined" data-latitude="36.43" data-longitude="127.3024" data-stationcode="CJJ" data-stationtype="DEP" data-stationname="청주"><span class="stationName">청주</span><span class="airport">CJJ</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="KR" data-areacode="RGTP000001" data-onlyoneway="undefined" data-latitude="35.53" data-longitude="128.4" data-stationcode="TAE" data-stationtype="DEP" data-stationname="대구"><span class="stationName">대구</span><span class="airport">TAE</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div></div><div data-element="tab__panel" class="tab__panel" aria-labelledby="plugin-DEPtab-3" role="tabpanel" tabindex="0" style="display: none;"><div class="choise"><button type="button" class="choise__button" data-countrycode="JP" data-areacode="RGTP000002" data-onlyoneway="undefined" data-latitude="35.455" data-longitude="140.2328" data-stationcode="NRT" data-stationtype="DEP" data-stationname="도쿄(나리타)"><span class="stationName">도쿄(나리타)</span><span class="airport">NRT</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="JP" data-areacode="RGTP000002" data-onlyoneway="undefined" data-latitude="34.2526" data-longitude="135.1449" data-stationcode="KIX" data-stationtype="DEP" data-stationname="오사카(간사이)"><span class="stationName">오사카(간사이)</span><span class="airport">KIX</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="JP" data-areacode="RGTP000002" data-onlyoneway="undefined" data-latitude="33.345600000000005" data-longitude="130.2712" data-stationcode="FUK" data-stationtype="DEP" data-stationname="후쿠오카"><span class="stationName">후쿠오카</span><span class="airport">FUK</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="JP" data-areacode="RGTP000002" data-onlyoneway="undefined" data-latitude="34.511900000000004" data-longitude="136.483" data-stationcode="NGO" data-stationtype="DEP" data-stationname="나고야"><span class="stationName">나고야</span><span class="airport">NGO</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="JP" data-areacode="RGTP000002" data-onlyoneway="undefined" data-latitude="42.4745" data-longitude="141.4009" data-stationcode="CTS" data-stationtype="DEP" data-stationname="삿포로"><span class="stationName">삿포로</span><span class="airport">CTS</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="JP" data-areacode="RGTP000002" data-onlyoneway="undefined" data-latitude="26.12" data-longitude="127.39" data-stationcode="OKA" data-stationtype="DEP" data-stationname="오키나와"><span class="stationName">오키나와</span><span class="airport">OKA</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="CN" data-areacode="RGTP000002" data-onlyoneway="undefined" data-latitude="37.300000000000004" data-longitude="122.05000000000001" data-stationcode="WEH" data-stationtype="DEP" data-stationname="웨이하이"><span class="stationName">웨이하이</span><span class="airport">WEH</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="CN" data-areacode="RGTP000002" data-onlyoneway="undefined" data-latitude="45.45" data-longitude="126.4" data-stationcode="HRB" data-stationtype="DEP" data-stationname="하얼빈"><span class="stationName">하얼빈</span><span class="airport">HRB</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="CN" data-areacode="RGTP000002" data-onlyoneway="undefined" data-latitude="42.39" data-longitude="129.3" data-stationcode="YNJ" data-stationtype="DEP" data-stationname="옌지"><span class="stationName">옌지</span><span class="airport">YNJ</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div></div><div data-element="tab__panel" class="tab__panel" aria-labelledby="plugin-DEPtab-4" role="tabpanel" tabindex="0" style="display: none;"><div class="choise"><button type="button" class="choise__button" data-countrycode="VN" data-areacode="RGTP000003" data-onlyoneway="undefined" data-latitude="16.0232" data-longitude="108.1213" data-stationcode="DAD" data-stationtype="DEP" data-stationname="다낭"><span class="stationName">다낭</span><span class="airport">DAD</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="VN" data-areacode="RGTP000003" data-onlyoneway="undefined" data-latitude="11.5937" data-longitude="109.13300000000001" data-stationcode="CXR" data-stationtype="DEP" data-stationname="나트랑/냐짱"><span class="stationName">나트랑/냐짱</span><span class="airport">CXR</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="TH" data-areacode="RGTP000003" data-onlyoneway="undefined" data-latitude="13.4109" data-longitude="100.4456" data-stationcode="BKK" data-stationtype="DEP" data-stationname="방콕"><span class="stationName">방콕</span><span class="airport">BKK</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="TH" data-areacode="RGTP000003" data-onlyoneway="undefined" data-latitude="18.4619" data-longitude="98.5806" data-stationcode="CNX" data-stationtype="DEP" data-stationname="치앙마이"><span class="stationName">치앙마이</span><span class="airport">CNX</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="PH" data-areacode="RGTP000003" data-onlyoneway="undefined" data-latitude="14.303600000000001" data-longitude="121.01060000000001" data-stationcode="MNL" data-stationtype="DEP" data-stationname="마닐라"><span class="stationName">마닐라</span><span class="airport">MNL</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="PH" data-areacode="RGTP000003" data-onlyoneway="undefined" data-latitude="10.195400000000001" data-longitude="123.5424" data-stationcode="CEB" data-stationtype="DEP" data-stationname="세부"><span class="stationName">세부</span><span class="airport">CEB</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="PH" data-areacode="RGTP000003" data-onlyoneway="undefined" data-latitude="9.395100000000001" data-longitude="123.51150000000001" data-stationcode="TAG" data-stationtype="DEP" data-stationname="보홀"><span class="stationName">보홀</span><span class="airport">TAG</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="PH" data-areacode="RGTP000003" data-onlyoneway="undefined" data-latitude="15.110000000000001" data-longitude="120.33000000000001" data-stationcode="CRK" data-stationtype="DEP" data-stationname="클락"><span class="stationName">클락</span><span class="airport">CRK</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="SG" data-areacode="RGTP000003" data-onlyoneway="undefined" data-latitude="1.2129" data-longitude="103.5438" data-stationcode="SIN" data-stationtype="DEP" data-stationname="싱가포르"><span class="stationName">싱가포르</span><span class="airport">SIN</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="MY" data-areacode="RGTP000003" data-onlyoneway="undefined" data-latitude="5.5627" data-longitude="116.03" data-stationcode="BKI" data-stationtype="DEP" data-stationname="코타키나발루"><span class="stationName">코타키나발루</span><span class="airport">BKI</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div></div><div data-element="tab__panel" class="tab__panel" aria-labelledby="plugin-DEPtab-5" role="tabpanel" tabindex="0" style="display: none;"><div class="choise"><button type="button" class="choise__button" data-countrycode="GU" data-areacode="RGTP000004" data-onlyoneway="undefined" data-latitude="13.2848" data-longitude="144.4728" data-stationcode="GUM" data-stationtype="DEP" data-stationname="괌"><span class="stationName">괌</span><span class="airport">GUM</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div><div class="choise"><button type="button" class="choise__button" data-countrycode="MP" data-areacode="RGTP000004" data-onlyoneway="undefined" data-latitude="15.0722" data-longitude="145.4242" data-stationcode="SPN" data-stationtype="DEP" data-stationname="사이판"><span class="stationName">사이판</span><span class="airport">SPN</span></button><div class="fav-check"><button type="button" onclick="javascript:clickBtnFavorites(this);" class="button-favorites"><span class="hidden">즐겨찾기</span></button></div></div></div></div>
														</div>										
														<!--<button type="button" class="floating-button btn-map" onclick="viewTabMap('start','map')">
															<span class="hidden">지도보기</span>
								                    	</button>-->									
													</div>
												</div>
												<div class="map-list">
													<div class="map-wrap">
														<div id="map-start" class="flight-map"></div>
														<div class="tab-top"><ul class="tab-top-list"><li class="tab-top-item"><a href="#" class="tab-top-btn on" data-areacode="RGTP000001">대한민국</a></li><li class="tab-top-item"><a href="#" class="tab-top-btn" data-areacode="RGTP000002">동북아시아</a></li><li class="tab-top-item"><a href="#" class="tab-top-btn" data-areacode="RGTP000003">동남아시아</a></li><li class="tab-top-item"><a href="#" class="tab-top-btn" data-areacode="RGTP000004">대양주/괌/사이판</a></li></ul></div>
														<div class="tab-swipe"><div class="tab-swipe-wrapper swiper-wrapper"><a class="tab-swipe-item swiper-slide" style=""><div class="city-name">서울(인천)<span class="sub">ICN</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="KR" data-areacode="RGTP000001" data-latitude="37.453" data-longitude="126.423" data-stationcode="ICN" data-stationtype="DEP" data-stationname="서울(인천)">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style=""><div class="city-name">서울(김포)<span class="sub">GMP</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="KR" data-areacode="RGTP000001" data-latitude="37.53040000000001" data-longitude="126.67070000000001" data-stationcode="GMP" data-stationtype="DEP" data-stationname="서울(김포)">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style=""><div class="city-name">부산<span class="sub">PUS</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="KR" data-areacode="RGTP000001" data-latitude="35.301500000000004" data-longitude="129.275" data-stationcode="PUS" data-stationtype="DEP" data-stationname="부산">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style=""><div class="city-name">제주<span class="sub">CJU</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="KR" data-areacode="RGTP000001" data-latitude="33.502" data-longitude="126.4942" data-stationcode="CJU" data-stationtype="DEP" data-stationname="제주">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style=""><div class="city-name">광주<span class="sub">KWJ</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="KR" data-areacode="RGTP000001" data-latitude="35.272400000000005" data-longitude="126.68390000000001" data-stationcode="KWJ" data-stationtype="DEP" data-stationname="광주">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style=""><div class="city-name">군산<span class="sub">KUV</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="KR" data-areacode="RGTP000001" data-latitude="35.790000000000006" data-longitude="126.65" data-stationcode="KUV" data-stationtype="DEP" data-stationname="군산">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style=""><div class="city-name">청주<span class="sub">CJJ</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="KR" data-areacode="RGTP000001" data-latitude="36.63" data-longitude="127.50240000000001" data-stationcode="CJJ" data-stationtype="DEP" data-stationname="청주">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style=""><div class="city-name">대구<span class="sub">TAE</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="KR" data-areacode="RGTP000001" data-latitude="35.730000000000004" data-longitude="128.6" data-stationcode="TAE" data-stationtype="DEP" data-stationname="대구">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style="display: none;"><div class="city-name">도쿄(나리타)<span class="sub">NRT</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="JP" data-areacode="RGTP000002" data-latitude="35.655" data-longitude="140.4328" data-stationcode="NRT" data-stationtype="DEP" data-stationname="도쿄(나리타)">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style="display: none;"><div class="city-name">오사카(간사이)<span class="sub">KIX</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="JP" data-areacode="RGTP000002" data-latitude="34.452600000000004" data-longitude="135.3449" data-stationcode="KIX" data-stationtype="DEP" data-stationname="오사카(간사이)">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style="display: none;"><div class="city-name">후쿠오카<span class="sub">FUK</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="JP" data-areacode="RGTP000002" data-latitude="33.54560000000001" data-longitude="130.47119999999998" data-stationcode="FUK" data-stationtype="DEP" data-stationname="후쿠오카">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style="display: none;"><div class="city-name">나고야<span class="sub">NGO</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="JP" data-areacode="RGTP000002" data-latitude="34.71190000000001" data-longitude="136.683" data-stationcode="NGO" data-stationtype="DEP" data-stationname="나고야">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style="display: none;"><div class="city-name">삿포로<span class="sub">CTS</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="JP" data-areacode="RGTP000002" data-latitude="42.6745" data-longitude="141.6009" data-stationcode="CTS" data-stationtype="DEP" data-stationname="삿포로">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style="display: none;"><div class="city-name">오키나와<span class="sub">OKA</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="JP" data-areacode="RGTP000002" data-latitude="26.32" data-longitude="127.59" data-stationcode="OKA" data-stationtype="DEP" data-stationname="오키나와">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style="display: none;"><div class="city-name">웨이하이<span class="sub">WEH</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="CN" data-areacode="RGTP000002" data-latitude="37.50000000000001" data-longitude="122.25000000000001" data-stationcode="WEH" data-stationtype="DEP" data-stationname="웨이하이">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style="display: none;"><div class="city-name">하얼빈<span class="sub">HRB</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="CN" data-areacode="RGTP000002" data-latitude="45.650000000000006" data-longitude="126.60000000000001" data-stationcode="HRB" data-stationtype="DEP" data-stationname="하얼빈">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style="display: none;"><div class="city-name">옌지<span class="sub">YNJ</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="CN" data-areacode="RGTP000002" data-latitude="42.59" data-longitude="129.5" data-stationcode="YNJ" data-stationtype="DEP" data-stationname="옌지">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style="display: none;"><div class="city-name">다낭<span class="sub">DAD</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="VN" data-areacode="RGTP000003" data-latitude="16.2232" data-longitude="108.32130000000001" data-stationcode="DAD" data-stationtype="DEP" data-stationname="다낭">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style="display: none;"><div class="city-name">나트랑/냐짱<span class="sub">CXR</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="VN" data-areacode="RGTP000003" data-latitude="11.7937" data-longitude="109.33300000000001" data-stationcode="CXR" data-stationtype="DEP" data-stationname="나트랑/냐짱">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style="display: none;"><div class="city-name">방콕<span class="sub">BKK</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="TH" data-areacode="RGTP000003" data-latitude="13.610899999999999" data-longitude="100.6456" data-stationcode="BKK" data-stationtype="DEP" data-stationname="방콕">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style="display: none;"><div class="city-name">치앙마이<span class="sub">CNX</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="TH" data-areacode="RGTP000003" data-latitude="18.6619" data-longitude="98.7806" data-stationcode="CNX" data-stationtype="DEP" data-stationname="치앙마이">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style="display: none;"><div class="city-name">마닐라<span class="sub">MNL</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="PH" data-areacode="RGTP000003" data-latitude="14.5036" data-longitude="121.21060000000001" data-stationcode="MNL" data-stationtype="DEP" data-stationname="마닐라">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style="display: none;"><div class="city-name">세부<span class="sub">CEB</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="PH" data-areacode="RGTP000003" data-latitude="10.3954" data-longitude="123.7424" data-stationcode="CEB" data-stationtype="DEP" data-stationname="세부">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style="display: none;"><div class="city-name">보홀<span class="sub">TAG</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="PH" data-areacode="RGTP000003" data-latitude="9.5951" data-longitude="123.71150000000002" data-stationcode="TAG" data-stationtype="DEP" data-stationname="보홀">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style="display: none;"><div class="city-name">클락<span class="sub">CRK</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="PH" data-areacode="RGTP000003" data-latitude="15.31" data-longitude="120.53000000000002" data-stationcode="CRK" data-stationtype="DEP" data-stationname="클락">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style="display: none;"><div class="city-name">싱가포르<span class="sub">SIN</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="SG" data-areacode="RGTP000003" data-latitude="1.4129" data-longitude="103.74380000000001" data-stationcode="SIN" data-stationtype="DEP" data-stationname="싱가포르">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style="display: none;"><div class="city-name">코타키나발루<span class="sub">BKI</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="MY" data-areacode="RGTP000003" data-latitude="5.762700000000001" data-longitude="116.23" data-stationcode="BKI" data-stationtype="DEP" data-stationname="코타키나발루">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style="display: none;"><div class="city-name">괌<span class="sub">GUM</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="GU" data-areacode="RGTP000004" data-latitude="13.4848" data-longitude="144.6728" data-stationcode="GUM" data-stationtype="DEP" data-stationname="괌">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a><a class="tab-swipe-item swiper-slide" style="display: none;"><div class="city-name">사이판<span class="sub">SPN</span></div><button type="button" name="btnAAMChartAirport" class="btn-choose-city js-choose-city" data-countrycode="MP" data-areacode="RGTP000004" data-latitude="15.2722" data-longitude="145.6242" data-stationcode="SPN" data-stationtype="DEP" data-stationname="사이판">선택</button><button type="button" onclick="javascript:clickBtnFavorites(this);" class="btn-wish"><span class="hidden">즐겨찾기</span></button></a></div><div class="swiper-scrollbar"></div></div>
													</div>
													<button type="button" class="floating-button btn-list" onclick="viewTabMap('start', 'list')">
														<span class="hidden">리스트보기</span> <!-- 리스트보기 -->
													</button>
												</div>
												<a href="#a" class="layer-close"><span class="blind">닫기</span></a> <!-- 닫기 -->		 	
											</div>				
											<div class="flight-layer flight-target" id="arrAirportLayer">												
												<div class="layer-header">
													<div class="header__input-wrap input is-focus" data-element="form">
														<button type="button" class="header__button" name="header_btn"><span class="hidden">이전으로</span></button> <!-- 이전으로 -->
														<button type="button" class="header__input-search"><img src="https://static.jejuair.net/hpgg/resources/images/icon/icon-header-search.png" alt="검색"></button>
														<input type="text" id="txtARRAirport" class="header__input" data-element="input" placeholder="어디로 여행가세요?"> <!-- 어디로 여행가세요? -->
														<p class="map-list-txt" id="mapARRAirport">어디로 여행가세요?</p> <!-- 어디로 여행가세요? -->
														<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button> <!-- 삭제 -->	 									
													</div>									
													<div id="divARRAirportAC" name="search_auto" target="txtArrAirport"></div>									
												</div>												
												<div class="txt-list">
													<div class="header-sub" data-element="tab">
														<div class="tab__buttons">
														<div data-element="tab__list" class="tab__button" role="presentation">
															<button type="button" class="tab__anchor is-active" id="selectTab01" data-element="tab__anchor" data-index="0" role="tab" tabindex="" aria-selected="true" aria-expanded="true">최근 검색</button> <!-- 최근 검색 -->	
														</div>
														<div data-element="tab__list" class="tab__button" role="presentation">
															<button type="button" class="tab__anchor" id="selectTab02" data-element="tab__anchor" data-index="1" role="tab" tabindex="" aria-selected="false" aria-expanded="false">즐겨찾기</button> <!-- 즐겨찾기 -->	
														</div>
														<div data-element="tab__list" class="tab__button" role="presentation" name="divPromotion">								
															<button type="button" class="tab__anchor" id="selectTab03" data-element="tab__anchor" data-index="2" role="tab" tabindex="" aria-selected="false" aria-expanded="false">프로모션</button> <!-- 프로모션 -->	
														</div>
														</div>														
														<div data-element="tab__panel" class="tab__panel is-active" aria-labelledby="selectTab01" role="tabpanel" tabindex="0">
															<div data-element="tab">
																<div class="tab__button-wrap">
																	<div class="tag-list" data-scroll="x" name="latelySearch"></div>
																</div>
															</div>
														</div>
														<div data-element="tab__panel" class="tab__panel" aria-labelledby="selectTab02" role="tabpanel" tabindex="0" style="display: none;">
															<div data-element="tab">
																<div class="tab__button-wrap">
																	<div class="tag-list" data-scroll="x" name="favorites"></div>
																</div>
															</div>
														</div>
														<div data-element="tab__panel" class="tab__panel" aria-labelledby="selectTab03" role="tabpanel" tabindex="0" style="display: none;">
															<div data-element="tab">
																<div class="tab__button-wrap">
																	<div class="tag-list" data-scroll="x" name="promotionSearch"></div>
																</div>
															</div>
														</div>
													</div>
													<div class="main--destination-select">
														<hr class="booking-line">
														<div data-element="tab" class="tab tab--vertical tab--booking">
															<div class="tab__buttons vertical_scroll_set" id="divArrArea"></div>
															<div class="tab__panel-wrap scrollbar-inner" data-element="tab__panel-wrap"></div>
														</div>										
														<!--<button type="button" class="floating-button btn-map" onclick="viewTabMap('target','map')">
															<span class="hidden">지도보기</span>
								                    	</button>-->
													</div>
												</div>
												<div class="map-list">
													<div class="map-wrap">
														<div id="map-target" class="flight-map"></div>
														<div class="tab-top"><ul class="tab-top-list"></ul></div>
														<div class="tab-swipe"><div class="tab-swipe-wrapper swiper-wrapper"></div><div class="swiper-scrollbar"></div></div>
													</div>
													<button type="button" class="floating-button btn-list" onclick="viewTabMap('target', 'list')">
														<span class="hidden">리스트보기</span> <!-- 리스트보기 -->
													</button>
												</div>
												<a href="#a" class="layer-close"><span class="blind">닫기</span></a> <!-- 닫기 -->		 	
											</div>
											<div class="date-layer" id="dateLayer">
												<div class="layer-header">								
													<button type="button" class="header__button" name="header_btn">
													<span class="hidden">이전으로</span> <!-- 이전으로 -->
													</button>								
													<h2 class="customer-layer__title">언제 떠나세요?</h2> <!-- 언제 떠나세요? -->	
												</div>								
												<div class="layer-content">
													<div class="booking-trip mobile-only">
														<div class="booking-trip__from" name="divFromDate"><span class="location"></span></div>										
														<span class="booking-trip__direction round-trip"></span>																	
														<div class="booking-trip__to"><span class="location"></span></div>
													</div>
													<div class="picker picker--full"> 
														<div class="info-wrap"><span class="info">1인 편도 운임 기준</span><span class="currency" name="currency"></span></div> <!-- 1인 편도 운임  기준 -->
														<div class="flatpickr-wrapper"><input type="text" class="picker__input flatpickr-input" id="selectDate" data-picker="range" data-text="1인 편도 운임 기준" data-locale="ko" data-min-date="today" data-format="Y.m.d (D)" data-selected="" data-range-text="{&quot;start&quot;: &quot;가는 날&quot;, &quot;end&quot;: &quot;오는날&quot;, &quot;current&quot;: &quot;왕복&quot;}" readonly="readonly"><div class="flatpickr-calendar rangeMode animate multiMonth inline" tabindex="-1" style=""><div class="flatpickr-months"><span class="flatpickr-prev-month flatpickr-disabled"></span><div class="flatpickr-month"><div class="flatpickr-current-month"><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year" min="2022"><span class="arrowUp"></span><span class="arrowDown"></span></div><span class="cur-month">11월 </span></div></div><div class="flatpickr-month"><div class="flatpickr-current-month"><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year" min="2022"><span class="arrowUp"></span><span class="arrowDown"></span></div><span class="cur-month">12월 </span></div></div><span class="flatpickr-next-month"></span></div><div class="flatpickr-innerContainer"><div class="flatpickr-rContainer"><div class="flatpickr-weekdays"><div class="flatpickr-weekdaycontainer">
    <span class="flatpickr-weekday">
    일</span><span class="flatpickr-weekday">월</span><span class="flatpickr-weekday">화</span><span class="flatpickr-weekday">수</span><span class="flatpickr-weekday">목</span><span class="flatpickr-weekday">금</span><span class="flatpickr-weekday">토
    </span>
    </div><div class="flatpickr-weekdaycontainer">
    <span class="flatpickr-weekday">
    일</span><span class="flatpickr-weekday">월</span><span class="flatpickr-weekday">화</span><span class="flatpickr-weekday">수</span><span class="flatpickr-weekday">목</span><span class="flatpickr-weekday">금</span><span class="flatpickr-weekday">토
    </span>
    </div></div><div class="flatpickr-days" tabindex="-1"><div class="dayContainer"><span class="flatpickr-day prevMonthDay hidden flatpickr-disabled sun" aria-label="20221030">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day prevMonthDay hidden flatpickr-disabled mon" aria-label="20221031">31<span class="date" aria-hidden="true">31</span></span><span class="flatpickr-day flatpickr-disabled tue" aria-label="20221101">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day flatpickr-disabled wed" aria-label="20221102">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day flatpickr-disabled thu" aria-label="20221103">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day flatpickr-disabled fri" aria-label="20221104">4<span class="date" aria-hidden="true">4</span></span><span class="flatpickr-day flatpickr-disabled sat" aria-label="20221105">5<span class="date" aria-hidden="true">5</span></span><span class="flatpickr-day flatpickr-disabled sun" aria-label="20221106">6<span class="date" aria-hidden="true">6</span></span><span class="flatpickr-day flatpickr-disabled mon" aria-label="20221107">7<span class="date" aria-hidden="true">7</span></span><span class="flatpickr-day flatpickr-disabled tue" aria-label="20221108">8<span class="date" aria-hidden="true">8</span></span><span class="flatpickr-day flatpickr-disabled wed" aria-label="20221109">9<span class="date" aria-hidden="true">9</span></span><span class="flatpickr-day flatpickr-disabled thu" aria-label="20221110">10<span class="date" aria-hidden="true">10</span></span><span class="flatpickr-day flatpickr-disabled fri" aria-label="20221111">11<span class="date" aria-hidden="true">11</span></span><span class="flatpickr-day flatpickr-disabled sat" aria-label="20221112">12<span class="date" aria-hidden="true">12</span></span><span class="flatpickr-day today sun" aria-label="20221113" aria-current="date" tabindex="-1">13<span class="date" aria-hidden="true">13</span></span><span class="flatpickr-day mon" aria-label="20221114" tabindex="-1">14<span class="date" aria-hidden="true">14</span></span><span class="flatpickr-day tue" aria-label="20221115" tabindex="-1">15<span class="date" aria-hidden="true">15</span></span><span class="flatpickr-day wed" aria-label="20221116" tabindex="-1">16<span class="date" aria-hidden="true">16</span></span><span class="flatpickr-day thu" aria-label="20221117" tabindex="-1">17<span class="date" aria-hidden="true">17</span></span><span class="flatpickr-day fri" aria-label="20221118" tabindex="-1">18<span class="date" aria-hidden="true">18</span></span><span class="flatpickr-day sat" aria-label="20221119" tabindex="-1">19<span class="date" aria-hidden="true">19</span></span><span class="flatpickr-day sun" aria-label="20221120" tabindex="-1">20<span class="date" aria-hidden="true">20</span></span><span class="flatpickr-day mon" aria-label="20221121" tabindex="-1">21<span class="date" aria-hidden="true">21</span></span><span class="flatpickr-day tue" aria-label="20221122" tabindex="-1">22<span class="date" aria-hidden="true">22</span></span><span class="flatpickr-day wed" aria-label="20221123" tabindex="-1">23<span class="date" aria-hidden="true">23</span></span><span class="flatpickr-day thu" aria-label="20221124" tabindex="-1">24<span class="date" aria-hidden="true">24</span></span><span class="flatpickr-day fri" aria-label="20221125" tabindex="-1">25<span class="date" aria-hidden="true">25</span></span><span class="flatpickr-day sat" aria-label="20221126" tabindex="-1">26<span class="date" aria-hidden="true">26</span></span><span class="flatpickr-day sun" aria-label="20221127" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day mon" aria-label="20221128" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day tue" aria-label="20221129" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day wed" aria-label="20221130" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day nextMonthDay hidden thu" aria-label="20221201" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day nextMonthDay hidden fri" aria-label="20221202" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day nextMonthDay hidden sat" aria-label="20221203" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><div class="yearMonthContainer"><span class="year">2022</span><span class="sepherator">.</span><span class="month">11</span></div></div><div class="dayContainer"><span class="flatpickr-day prevMonthDay hidden sun" aria-label="20221127" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day prevMonthDay hidden mon" aria-label="20221128" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day prevMonthDay hidden tue" aria-label="20221129" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day prevMonthDay hidden wed" aria-label="20221130" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day thu" aria-label="20221201" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day fri" aria-label="20221202" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day sat" aria-label="20221203" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day sun" aria-label="20221204" tabindex="-1">4<span class="date" aria-hidden="true">4</span></span><span class="flatpickr-day mon" aria-label="20221205" tabindex="-1">5<span class="date" aria-hidden="true">5</span></span><span class="flatpickr-day tue" aria-label="20221206" tabindex="-1">6<span class="date" aria-hidden="true">6</span></span><span class="flatpickr-day wed" aria-label="20221207" tabindex="-1">7<span class="date" aria-hidden="true">7</span></span><span class="flatpickr-day thu" aria-label="20221208" tabindex="-1">8<span class="date" aria-hidden="true">8</span></span><span class="flatpickr-day fri" aria-label="20221209" tabindex="-1">9<span class="date" aria-hidden="true">9</span></span><span class="flatpickr-day sat" aria-label="20221210" tabindex="-1">10<span class="date" aria-hidden="true">10</span></span><span class="flatpickr-day sun" aria-label="20221211" tabindex="-1">11<span class="date" aria-hidden="true">11</span></span><span class="flatpickr-day mon" aria-label="20221212" tabindex="-1">12<span class="date" aria-hidden="true">12</span></span><span class="flatpickr-day tue" aria-label="20221213" tabindex="-1">13<span class="date" aria-hidden="true">13</span></span><span class="flatpickr-day wed" aria-label="20221214" tabindex="-1">14<span class="date" aria-hidden="true">14</span></span><span class="flatpickr-day thu" aria-label="20221215" tabindex="-1">15<span class="date" aria-hidden="true">15</span></span><span class="flatpickr-day fri" aria-label="20221216" tabindex="-1">16<span class="date" aria-hidden="true">16</span></span><span class="flatpickr-day sat" aria-label="20221217" tabindex="-1">17<span class="date" aria-hidden="true">17</span></span><span class="flatpickr-day sun" aria-label="20221218" tabindex="-1">18<span class="date" aria-hidden="true">18</span></span><span class="flatpickr-day mon" aria-label="20221219" tabindex="-1">19<span class="date" aria-hidden="true">19</span></span><span class="flatpickr-day tue" aria-label="20221220" tabindex="-1">20<span class="date" aria-hidden="true">20</span></span><span class="flatpickr-day wed" aria-label="20221221" tabindex="-1">21<span class="date" aria-hidden="true">21</span></span><span class="flatpickr-day thu" aria-label="20221222" tabindex="-1">22<span class="date" aria-hidden="true">22</span></span><span class="flatpickr-day fri" aria-label="20221223" tabindex="-1">23<span class="date" aria-hidden="true">23</span></span><span class="flatpickr-day sat" aria-label="20221224" tabindex="-1">24<span class="date" aria-hidden="true">24</span></span><span class="flatpickr-day sun" aria-label="20221225" tabindex="-1">25<span class="date" aria-hidden="true">25</span></span><span class="flatpickr-day mon" aria-label="20221226" tabindex="-1">26<span class="date" aria-hidden="true">26</span></span><span class="flatpickr-day tue" aria-label="20221227" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day wed" aria-label="20221228" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day thu" aria-label="20221229" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day fri" aria-label="20221230" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day sat" aria-label="20221231" tabindex="-1">31<span class="date" aria-hidden="true">31</span></span><div class="yearMonthContainer"><span class="year">2022</span><span class="sepherator">.</span><span class="month">12</span></div></div></div></div></div></div></div>
													</div>
													<div class="booking-button cal-button">
														<button type="button" id="dateClear" class="button button--primary button--black pc-only" data-station="DEP" data-reset-date="#selectDate">
															<span class="button__text">초기화</span> <!-- 초기화 -->
														</button>
														<button type="button" class="button button--primary button--active" data-select-date="#selectDate" rel="modal:close">
															<span class="button__text">선택</span> <!-- 선택 -->
														</button>              
													</div>
												</div>
												<a href="#a" class="layer-close"><span class="blind">닫기</span></a> <!-- 닫기 -->
											</div>
											<div class="customer-layer" id="customerLayer">
												<div class="layer-header">
													<button type="button" class="header__button" name="header_btn"><span class="hidden">이전으로</span></button> <!-- 이전으로 -->
													<h2 class="customer-layer__title">누구와 함께 떠나세요?</h2> <!-- 누구와 함께 떠나세요? -->
												</div>					
												<div class="layer-content">
													<div class="booking-trip">
														<div class="booking-trip__from" id="divFromPas"><span class="location"></span></div>
														<span class="booking-trip__switch"><span class="hidden">에서</span></span> <!-- 에서 -->
														<div class="booking-trip__to" id="divToPax"><span class="location"></span></div>							
													</div>																					
													<hr class="section-spacer">
													<div class="booking-members">
														<div class="input-wrap input--line">
															<div class="input-row input-row--number input-row--icon">																
																<label for="adtCount" class="input__label">성인</label> <!-- 성인 -->
																<div data-element="form" class="input input--number is-active">
																<button type="button" data-element="number__button" onclick="javascript:chkAdtCount('');" data-type="decrease" class="input__number input__number-minus" aria-label="빼기" disabled=""></button> <!-- 빼기 -->
																<input type="text" id="adtCount" placeholder="숫자입력" data-element="number__input" value="1" data-max="9" data-min="1" data-string-number="" class="input__number"> <!-- 숫자입력 -->
																<button type="button" data-element="number__button" data-type="increase" class="input__number input__number-plus" aria-label="더하기"></button> <!-- 더하기 -->
																</div>
																<p class="text__small text--color-gray" id="adtMsg">12세 이상</p> <!-- 12세 이상 -->
															</div>							
															<div class="input-row input-row--number input-row--icon">
																<label for="chdCount" class="input__label">소아</label> <!-- 소아 -->
																<div data-element="form" class="input input--number is-active">
																<button type="button" data-element="number__button" data-type="decrease" class="input__number input__number-minus" aria-label="빼기" disabled=""></button> <!-- 빼기 -->
																<input type="text" id="chdCount" placeholder="숫자입력" data-element="number__input" value="0" data-max="9" data-min="0" data-string-number="" class="input__number"> <!-- 숫자입력 -->
																<button type="button" data-element="number__button" data-type="increase" class="input__number input__number-plus" aria-label="더하기"></button> <!-- 더하기 -->
																</div>
																<p class="text__small text--color-gray" name="chdMsg">국제선 기준 만 2세~12세 미만</p><!-- 국제선 기준<br>만 2세 ~ 만 12세 미만 -->
															</div>						
															<div class="input-row input-row--number input-row--icon">																
																<label for="infCount" class="input__label">유아</label> <!-- 유아 -->
																<div data-element="form" class="input input--number is-active">
																<button type="button" data-element="number__button" data-type="decrease" class="input__number input__number-minus" aria-label="빼기" disabled=""></button> <!-- 빼기 -->
																<input type="text" id="infCount" placeholder="숫자입력" data-element="number__input" value="0" data-max="9" data-min="0" data-string-number="" class="input__number"> <!-- 숫자입력 -->
																<button type="button" id="btnInfCount" onclick="javascript:chkInfCount('');" data-element="number__button" data-type="increase" class="input__number input__number-plus" aria-label="더하기"></button> <!-- 더하기 -->
																</div>
																<p class="text__small text--color-gray" name="infantDesc">생후 7일 이상~만 2세 미만<br>(만 24개월 미만/최종 탑승일 기준)<br>유아의 여정이 동반 성인과 불일치 할 경우 환불 후 재구매해야 합니다.</p> <!-- 생후 7일 이상~만 2세 미만<br>(만 24개월 미만) -->
															</div>															
														</div>
													</div>
													
													
													<div class="pc-40 mo-30"><!--20210520 class명 변경-->
														<div data-element="toggle" class="toggle-item toggle-item--booking" data-options="{&quot;mode&quot;: &quot;slide&quot;}">
															<div class="toggle-item__title">
																<button type="button" data-element="toggle__anchor" class="toggle-item__anchor" aria-controls="toggle-2" aria-expanded="false">나이계산기</button> <!-- 나이계산기 -->
															</div>
															<div data-element="toggle__panel" class="toggle-item__content" id="toggle-2">
															<div class="input-wrap input--line">
															<div class="input-row input-row--label">
															<div class="input-label">생년월일</div> <!-- 생년월일 -->
															<div class="input-item">
															<div class="input-flex">
															<div class="input-box">
																<div class="input" data-element="form">
																	<input type="text" class="input__text input__text--placeholder" name="txtCalYear" maxlength="4" data-element="input" title="연도 입력" placeholder="년"> <!-- 연도 입력 년 -->
																	<button type="button" data-element="remove" class="input__remove-button">삭제</button> <!-- 삭제 -->
																</div>
															</div>
															<div class="input-box">
															<div class="select-wrap select-wrap--line">								
															<select class="select-wrap__select selected" title="월 선택" name="selCalMonth"> <!-- 월 선택 -->																
																<option value="0" disabled="" selected="" hidden="">월</option>
																<option value="1">1</option>
																<option value="2">2</option>
																<option value="3">3</option>
																<option value="4">4</option>
																<option value="5">5</option>
																<option value="6">6</option>
																<option value="7">7</option>
																<option value="8">8</option>
																<option value="9">9</option>
																<option value="10">10</option>
																<option value="11">11</option>
																<option value="12">12</option>
															</select>
															</div>
															</div>
															<div class="input-box">
															<div class="select-wrap select-wrap--line">
															<select class="select-wrap__select" title="일 선택" name="selCalDate"> <!-- 일 선택 -->
																<option>일</option>
															</select>
															</div>
															</div>
															</div>
															<p tabindex="0" class="input__error" id="calcError"></p>										
															</div>
															</div>
															</div>					
															<div class="button-wrap button-wrap--center mt10">														
															<button type="button" class="button button--optional" onclick="javascript:calcAge();"><span class="button__text">계산하기</span></button><!-- 계산하기 -->															
															</div>								
															<div class="notice-box--white" name="calcMsg" style="display: none;"></div>
															</div>
														</div>
													</div>									
												</div>
												<div class="fixed-wrap fixed-wrap--multi-line border-none">
													<div class="button-wrap">
														<button type="button" class="button button--active" name="btnSetPassenger"><span class="button__text">선택 완료</span></button> <!-- 선택 완료 -->
													</div>													
													</div>
													<a href="#a" class="layer-close"><span class="blind">닫기</span></a> <!-- 닫기 -->
												</div>												
											</div>
											<div class="ticketing-row-top multi" style="display: none;">
												<div class="ticketing-target">
													<button type="button" class="start js-target-pick">
														<span class="txt before-select" id="spanMultiDepartureDesc">출발지</span> <!-- 출발지 -->
													</button>
													<input type="hidden" id="multiDepartureData">
													<button type="button" class="target js-target-pick">
														<span class="txt before-select" id="spanMultiArrivalDesc">도착지</span> <!-- 도착지 -->
													</button>
													<input type="hidden" id="multiArrivalData">
													<button type="button" class="btn-open js-target-pick" data-route="Multi" id="btnExchangeRoute2"><span class="blind">열기</span></button> <!-- 열기 -->
												</div>
												<div class="ticketing-date">								
													
														
																																				
													<button type="button" class="btn-date" id="btnMultiDatePicker"><span class="txt">2022.11.13(일)</span></button>
													<input type="hidden" id="multiArrivalDate" value="2022-11-13">
												</div>
											</div>
											<div class="ticketing-row-hidden multi" style="display: none;">
												<div class="flight-layer flight-start flight-start01" id="depMultiAirportLayer" style="display: none;">							
													<div class="layer-header">
														<div class="header__input-wrap input is-focus" data-element="form">
															<button type="button" class="header__button" name="header_btn"><span class="hidden">이전으로</span></button><!-- 이전으로 -->
															<button type="button" class="header__input-search"><img src="https://static.jejuair.net/hpgg/resources/images/icon/icon-header-search.png" alt="검색"></button>
															<input type="text" id="txtMultiDEPAirport" class="header__input" data-element="input" placeholder="어디에서 출발하세요?">
															<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button><!-- 삭제 -->
														</div>									
														<div id="divMultiDEPAirportAC" name="search_auto" target="txtMultiDEPAirport"></div>
													</div>
													<div class="txt-list">
														<div class="header-sub" data-element="tab">
															<div class="tab__buttons">
																<div data-element="tab__list" class="tab__button" role="presentation">
																	<button type="button" class="tab__anchor is-active" id="dep_selectTab01" data-element="tab__anchor" data-index="0" role="tab" tabindex="" aria-selected="true" aria-expanded="true">최근 검색</button><!-- 최근 검색 -->
																</div>
																<div data-element="tab__list" class="tab__button" role="presentation">
																	<button type="button" class="tab__anchor" id="dep_selectTab02" data-element="tab__anchor" data-index="1" role="tab" tabindex="" aria-selected="false" aria-expanded="false">즐겨찾기</button><!-- 즐겨찾기 -->
																</div>								
															</div>
															<div data-element="tab__panel" class="tab__panel is-active" aria-labelledby="dep_selectTab01" role="tabpanel" tabindex="0">
																<div data-element="tab">
																	<div class="tab__button-wrap">
																		<div class="tag-list" data-scroll="x" name="latelySearch"></div>
																	</div>
																</div>
															</div>
															<div data-element="tab__panel" class="tab__panel" aria-labelledby="dep_selectTab02" role="tabpanel" tabindex="0" style="display: none;">
																<div data-element="tab">
																	<div class="tab__button-wrap">
																		<div class="tag-list" data-scroll="x" name="favorites"></div>
																	</div>
																</div>
															</div>							
														</div>
														<div class="main--destination-select">
															<hr class="booking-line">
															<div data-element="tab" class="tab tab--vertical tab--booking">
																<div class="tab__buttons vertical_scroll_set" id="divMultiDepArea"></div>
																<div class="tab__panel-wrap scrollbar-inner" data-element="tab__panel-wrap"></div>
															</div>										
															<!--<button type="button" class="floating-button btn-map" onclick="viewTabMap('start','map')">
																<span class="hidden">지도 보기</span>
									                    	</button>-->
														</div>
													</div>								
													<div class="map-list">
														<div class="map-wrap">
															<div id="map-start" class="flight-map"></div>
															<div class="tab-top"><ul class="tab-top-list"></ul></div>
															<div class="tab-swipe"><div class="tab-swipe-wrapper swiper-wrapper"></div><div class="swiper-scrollbar"></div></div>
														</div>
														<button type="button" class="floating-button btn-list" onclick="viewTabMap('start', 'list')">
															<span class="hidden">리스트보기</span>
														</button>
													</div>
													<a href="#a" class="layer-close"><span class="blind">닫기</span></a>			
												</div>								
												<div class="flight-layer flight-target flight-target01" id="arrMultiAirportLayer" style="display: none;">							
													<div class="layer-header">
														<div class="header__input-wrap input is-focus" data-element="form">
															<button type="button" class="header__button" name="header_btn"><span class="hidden">이전으로</span></button><!-- 이전으로 -->
															<button type="button" class="header__input-search"><img src="https://static.jejuair.net/hpgg/resources/images/icon/icon-header-search.png" alt="검색"></button>
															<input type="text" id="txtMultiARRAirport" class="header__input" data-element="input" placeholder="어디로 여행가세요?"><!--어디로 여행가세요?--> 
															<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button><!-- 삭제 -->										
														</div>									
														<div id="divMultiARRAirportAC" name="search_auto" target="txtMultiARRAirport"></div>									
													</div>
													<div class="txt-list">
														<div class="header-sub" data-element="tab">
															<div class="tab__buttons">
																<div data-element="tab__list" class="tab__button" role="presentation">
																	<button type="button" class="tab__anchor is-active" id="arr_selectTab01" data-element="tab__anchor" data-index="0" role="tab" tabindex="" aria-selected="true" aria-expanded="true">최근 검색</button><!-- 최근 검색 -->
																</div>
																<div data-element="tab__list" class="tab__button" role="presentation">
																	<button type="button" class="tab__anchor" id="arr_selectTab02" data-element="tab__anchor" data-index="1" role="tab" tabindex="" aria-selected="false" aria-expanded="false">즐겨찾기</button><!-- 즐겨찾기 -->
																</div>														
															</div>
															<div data-element="tab__panel" class="tab__panel is-active" aria-labelledby="arr_selectTab01" role="tabpanel" tabindex="0">
																<div data-element="tab">
																	<div class="tab__button-wrap">
																		<div class="tag-list" data-scroll="x" name="latelySearch"></div>
																	</div>
																</div>
															</div>
															<div data-element="tab__panel" class="tab__panel" aria-labelledby="arr_selectTab02" role="tabpanel" tabindex="0" style="display: none;">
																<div data-element="tab">
																	<div class="tab__button-wrap">
																		<div class="tag-list" data-scroll="x" name="favorites"></div>
																	</div>
																</div>
															</div>
														</div>
														<div class="main--destination-select">
															<hr class="booking-line">
															<div data-element="tab" class="tab tab--vertical tab--booking">
																<div class="tab__buttons vertical_scroll_set" id="divMultiArrArea"></div>
																<div class="tab__panel-wrap scrollbar-inner" data-element="tab__panel-wrap"></div>
															</div>										
															<!--<button type="button" class="floating-button btn-map" onclick="viewTabMap('target','map')">
																<span class="hidden">지도 보기</span>
									                    	</button>-->
														</div>
													</div>
													<div class="map-list">
														<div class="map-wrap">
															<div id="map-target" class="flight-map"></div>
															<div class="tab-top"><ul class="tab-top-list"></ul></div>
															<div class="tab-swipe"><div class="tab-swipe-wrapper swiper-wrapper"></div><div class="swiper-scrollbar"></div></div>
														</div>
														<button type="button" class="floating-button btn-list" onclick="viewTabMap('target', 'list')">
															<span class="hidden">리스트보기</span>
														</button>
													</div>
													<a href="#a" class="layer-close"><span class="blind">닫기</span></a>			
												</div>							
												<div class="date-layer date-layer02" id="multiDateLayer" style="display: none;">
													<div class="layer-header">								
														<button type="button" class="header__button" name="header_btn">
														<span class="hidden">이전으로</span>
														</button>								
														<h2 class="customer-layer__title">언제 떠나세요?</h2><!-- 언제 떠나세요? -->
													</div>								
													<div class="layer-content">
														<div class="booking-trip mobile-only">
															<div class="booking-trip__from" name="divFromDate"><span class="location"></span></div>										
															<span class="booking-trip__direction one-way"></span>																	
															<div class="booking-trip__to"><span class="location"></span></div>
														</div>
														<div class="picker picker--full"> 
															<div class="info-wrap"><span class="info">1인 편도 운임 기준</span><span class="currency" name="currency"></span></div> <!-- 1인 편도 운임  기준 -->
															<div class="flatpickr-wrapper"><input type="text" class="picker__input flatpickr-input" id="selectMultiDate" data-picker="single" data-text="1인 편도 운임 기준" data-locale="ko" data-min-date="today" data-format="Y.m.d (D)" data-selected="" readonly="readonly"><div class="flatpickr-calendar animate multiMonth inline" tabindex="-1" style=""><div class="flatpickr-months"><span class="flatpickr-prev-month flatpickr-disabled"></span><div class="flatpickr-month"><div class="flatpickr-current-month"><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year" min="2022"><span class="arrowUp"></span><span class="arrowDown"></span></div><span class="cur-month">11월 </span></div></div><div class="flatpickr-month"><div class="flatpickr-current-month"><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year" min="2022"><span class="arrowUp"></span><span class="arrowDown"></span></div><span class="cur-month">12월 </span></div></div><span class="flatpickr-next-month"></span></div><div class="flatpickr-innerContainer"><div class="flatpickr-rContainer"><div class="flatpickr-weekdays"><div class="flatpickr-weekdaycontainer">
    <span class="flatpickr-weekday">
    일</span><span class="flatpickr-weekday">월</span><span class="flatpickr-weekday">화</span><span class="flatpickr-weekday">수</span><span class="flatpickr-weekday">목</span><span class="flatpickr-weekday">금</span><span class="flatpickr-weekday">토
    </span>
    </div><div class="flatpickr-weekdaycontainer">
    <span class="flatpickr-weekday">
    일</span><span class="flatpickr-weekday">월</span><span class="flatpickr-weekday">화</span><span class="flatpickr-weekday">수</span><span class="flatpickr-weekday">목</span><span class="flatpickr-weekday">금</span><span class="flatpickr-weekday">토
    </span>
    </div></div><div class="flatpickr-days" tabindex="-1"><div class="dayContainer"><span class="flatpickr-day prevMonthDay hidden flatpickr-disabled sun" aria-label="20221030">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day prevMonthDay hidden flatpickr-disabled mon" aria-label="20221031">31<span class="date" aria-hidden="true">31</span></span><span class="flatpickr-day flatpickr-disabled tue" aria-label="20221101">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day flatpickr-disabled wed" aria-label="20221102">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day flatpickr-disabled thu" aria-label="20221103">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day flatpickr-disabled fri" aria-label="20221104">4<span class="date" aria-hidden="true">4</span></span><span class="flatpickr-day flatpickr-disabled sat" aria-label="20221105">5<span class="date" aria-hidden="true">5</span></span><span class="flatpickr-day flatpickr-disabled sun" aria-label="20221106">6<span class="date" aria-hidden="true">6</span></span><span class="flatpickr-day flatpickr-disabled mon" aria-label="20221107">7<span class="date" aria-hidden="true">7</span></span><span class="flatpickr-day flatpickr-disabled tue" aria-label="20221108">8<span class="date" aria-hidden="true">8</span></span><span class="flatpickr-day flatpickr-disabled wed" aria-label="20221109">9<span class="date" aria-hidden="true">9</span></span><span class="flatpickr-day flatpickr-disabled thu" aria-label="20221110">10<span class="date" aria-hidden="true">10</span></span><span class="flatpickr-day flatpickr-disabled fri" aria-label="20221111">11<span class="date" aria-hidden="true">11</span></span><span class="flatpickr-day flatpickr-disabled sat" aria-label="20221112">12<span class="date" aria-hidden="true">12</span></span><span class="flatpickr-day today sun" aria-label="20221113" aria-current="date" tabindex="-1">13<span class="date" aria-hidden="true">13</span></span><span class="flatpickr-day mon" aria-label="20221114" tabindex="-1">14<span class="date" aria-hidden="true">14</span></span><span class="flatpickr-day tue" aria-label="20221115" tabindex="-1">15<span class="date" aria-hidden="true">15</span></span><span class="flatpickr-day wed" aria-label="20221116" tabindex="-1">16<span class="date" aria-hidden="true">16</span></span><span class="flatpickr-day thu" aria-label="20221117" tabindex="-1">17<span class="date" aria-hidden="true">17</span></span><span class="flatpickr-day fri" aria-label="20221118" tabindex="-1">18<span class="date" aria-hidden="true">18</span></span><span class="flatpickr-day sat" aria-label="20221119" tabindex="-1">19<span class="date" aria-hidden="true">19</span></span><span class="flatpickr-day sun" aria-label="20221120" tabindex="-1">20<span class="date" aria-hidden="true">20</span></span><span class="flatpickr-day mon" aria-label="20221121" tabindex="-1">21<span class="date" aria-hidden="true">21</span></span><span class="flatpickr-day tue" aria-label="20221122" tabindex="-1">22<span class="date" aria-hidden="true">22</span></span><span class="flatpickr-day wed" aria-label="20221123" tabindex="-1">23<span class="date" aria-hidden="true">23</span></span><span class="flatpickr-day thu" aria-label="20221124" tabindex="-1">24<span class="date" aria-hidden="true">24</span></span><span class="flatpickr-day fri" aria-label="20221125" tabindex="-1">25<span class="date" aria-hidden="true">25</span></span><span class="flatpickr-day sat" aria-label="20221126" tabindex="-1">26<span class="date" aria-hidden="true">26</span></span><span class="flatpickr-day sun" aria-label="20221127" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day mon" aria-label="20221128" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day tue" aria-label="20221129" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day wed" aria-label="20221130" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day nextMonthDay hidden thu" aria-label="20221201" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day nextMonthDay hidden fri" aria-label="20221202" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day nextMonthDay hidden sat" aria-label="20221203" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><div class="yearMonthContainer"><span class="year">2022</span><span class="sepherator">.</span><span class="month">11</span></div></div><div class="dayContainer"><span class="flatpickr-day prevMonthDay hidden sun" aria-label="20221127" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day prevMonthDay hidden mon" aria-label="20221128" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day prevMonthDay hidden tue" aria-label="20221129" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day prevMonthDay hidden wed" aria-label="20221130" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day thu" aria-label="20221201" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day fri" aria-label="20221202" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day sat" aria-label="20221203" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day sun" aria-label="20221204" tabindex="-1">4<span class="date" aria-hidden="true">4</span></span><span class="flatpickr-day mon" aria-label="20221205" tabindex="-1">5<span class="date" aria-hidden="true">5</span></span><span class="flatpickr-day tue" aria-label="20221206" tabindex="-1">6<span class="date" aria-hidden="true">6</span></span><span class="flatpickr-day wed" aria-label="20221207" tabindex="-1">7<span class="date" aria-hidden="true">7</span></span><span class="flatpickr-day thu" aria-label="20221208" tabindex="-1">8<span class="date" aria-hidden="true">8</span></span><span class="flatpickr-day fri" aria-label="20221209" tabindex="-1">9<span class="date" aria-hidden="true">9</span></span><span class="flatpickr-day sat" aria-label="20221210" tabindex="-1">10<span class="date" aria-hidden="true">10</span></span><span class="flatpickr-day sun" aria-label="20221211" tabindex="-1">11<span class="date" aria-hidden="true">11</span></span><span class="flatpickr-day mon" aria-label="20221212" tabindex="-1">12<span class="date" aria-hidden="true">12</span></span><span class="flatpickr-day tue" aria-label="20221213" tabindex="-1">13<span class="date" aria-hidden="true">13</span></span><span class="flatpickr-day wed" aria-label="20221214" tabindex="-1">14<span class="date" aria-hidden="true">14</span></span><span class="flatpickr-day thu" aria-label="20221215" tabindex="-1">15<span class="date" aria-hidden="true">15</span></span><span class="flatpickr-day fri" aria-label="20221216" tabindex="-1">16<span class="date" aria-hidden="true">16</span></span><span class="flatpickr-day sat" aria-label="20221217" tabindex="-1">17<span class="date" aria-hidden="true">17</span></span><span class="flatpickr-day sun" aria-label="20221218" tabindex="-1">18<span class="date" aria-hidden="true">18</span></span><span class="flatpickr-day mon" aria-label="20221219" tabindex="-1">19<span class="date" aria-hidden="true">19</span></span><span class="flatpickr-day tue" aria-label="20221220" tabindex="-1">20<span class="date" aria-hidden="true">20</span></span><span class="flatpickr-day wed" aria-label="20221221" tabindex="-1">21<span class="date" aria-hidden="true">21</span></span><span class="flatpickr-day thu" aria-label="20221222" tabindex="-1">22<span class="date" aria-hidden="true">22</span></span><span class="flatpickr-day fri" aria-label="20221223" tabindex="-1">23<span class="date" aria-hidden="true">23</span></span><span class="flatpickr-day sat" aria-label="20221224" tabindex="-1">24<span class="date" aria-hidden="true">24</span></span><span class="flatpickr-day sun" aria-label="20221225" tabindex="-1">25<span class="date" aria-hidden="true">25</span></span><span class="flatpickr-day mon" aria-label="20221226" tabindex="-1">26<span class="date" aria-hidden="true">26</span></span><span class="flatpickr-day tue" aria-label="20221227" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day wed" aria-label="20221228" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day thu" aria-label="20221229" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day fri" aria-label="20221230" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day sat" aria-label="20221231" tabindex="-1">31<span class="date" aria-hidden="true">31</span></span><div class="yearMonthContainer"><span class="year">2022</span><span class="sepherator">.</span><span class="month">12</span></div></div></div></div></div></div></div>
														</div>
														<div class="booking-button cal-button">
															<button type="button" class="button button--primary button--black pc-only" data-station="MultiARR" data-reset-date="#selectMultiDate">
																<span class="button__text">초기화</span>
															</button>
															<button type="button" class="button button--primary button--active" data-select-date="#selectMultiDate" rel="modal:close">
																<span class="button__text">선택</span> <!-- 선택 -->
															</button>              
														</div>
													</div>
													<a href="#a" class="layer-close"><span class="blind">닫기</span></a>
												</div>
												<div class="customer-layer" id="multiCustomerLayer" style="display: none;">
													<div class="layer-header">
														<button type="button" class="header__button" name="header_btn"><span class="hidden">이전으로</span></button>														
														<h2 class="customer-layer__title">누구와 함께 떠나세요?</h2><!-- 누구와 함께 떠나세요? -->
													</div>					
													<div class="layer-content">
														<div class="booking-trip">
															<div class="booking-trip__from" id="divFromPas"><span class="location"></span></div>
															<span class="booking-trip__switch"><span class="hidden">에서</span></span>
															<div class="booking-trip__to" id="divToPax"><span class="location"></span></div>							
														</div>													
														<hr class="section-spacer">
														<div class="booking-members">
															<div class="input-wrap input--line">
																<div class="input-row input-row--number input-row--icon">							
																	<label for="adtCountMulti" class="input__label">성인</label><!-- 성인 -->
																	<div data-element="form" class="input input--number is-active">
																	<button type="button" data-element="number__button" onclick="javascript:chkAdtCount('Multi');" data-type="decrease" class="input__number input__number-minus" aria-label="빼기" disabled=""></button>
																	<input type="text" id="adtCountMulti" placeholder="숫자입력" data-element="number__input" value="1" data-max="9" data-min="1" data-string-number="" class="input__number">
																	<button type="button" data-element="number__button" data-type="increase" class="input__number input__number-plus" aria-label="더하기"></button>
																	</div>
																	<p class="text__small text--color-gray" id="adtMsg">12세 이상</p><!--12세 이상 -->
																</div>														
																<div class="input-row input-row--number input-row--icon">									
																	<label for="chdCountMulti" class="input__label">소아</label><!-- 소아 -->
																	<div data-element="form" class="input input--number is-active">
																	<button type="button" data-element="number__button" data-type="decrease" class="input__number input__number-minus" aria-label="빼기" disabled=""></button>
																	<input type="text" id="chdCountMulti" placeholder="숫자입력" data-element="number__input" value="0" data-max="9" data-min="0" data-string-number="" class="input__number">
																	<button type="button" data-element="number__button" data-type="increase" class="input__number input__number-plus" aria-label="더하기"></button>
																	</div>
																	<p class="text__small text--color-gray" name="chdMsg">국제선 기준 만 2세~12세 미만</p><!-- 국제선 기준<br>만 2세 ~ 만 12세 미만 -->
																</div>
																<div class="input-row input-row--number input-row--icon">
																	<label for="infCountMulti" class="input__label">유아</label><!-- 유아 -->
																	<div data-element="form" class="input input--number is-active">
																		<button type="button" data-element="number__button" data-type="decrease" class="input__number input__number-minus" aria-label="" disabled=""></button>
																		<input type="text" id="infCountMulti" placeholder="" data-element="number__input" value="0" data-max="9" data-min="0" data-string-number="" class="input__number">
																		<button type="button" id="btnInfCount" onclick="javascript:chkInfCount('Multi');" data-element="number__button" data-type="increase" class="input__number input__number-plus" aria-label="더하기"></button>
																	</div>
																	<p class="text__small text--color-gray" name="infantDesc">생후 7일 이상~만 2세 미만<br>(만 24개월 미만/최종 탑승일 기준)<br>유아의 여정이 동반 성인과 불일치 할 경우 환불 후 재구매해야 합니다.</p><!--생후 14일 이상~만 2세 미만-->
																</div>     																                    
															</div>
														</div>				
                                                        
														<div class="pc-40 mo-30"><!--20210520 class명 변경-->
															<div data-element="toggle" class="toggle-item toggle-item--booking" data-options="{&quot;mode&quot;: &quot;slide&quot;}">
																<div class="toggle-item__title">
																	<button type="button" data-element="toggle__anchor" class="toggle-item__anchor" aria-controls="toggle-3" aria-expanded="false">나이계산기</button><!-- 나이계산기 -->
																</div>						
																<div data-element="toggle__panel" class="toggle-item__content" id="toggle-3">
																<div class="input-wrap input--line">
																<div class="input-row input-row--label">
																<div class="input-label">생년월일</div><!-- 생년월일 -->
																<div class="input-item">
																<div class="input-flex">
																<div class="input-box">
																	<div class="input" data-element="form">
																		<input type="text" class="input__text input__text--placeholder" name="txtCalYear" maxlength="4" data-element="input" title="연도 입력" placeholder="년">
																		<button type="button" data-element="remove" class="input__remove-button">삭제</button><!-- 삭제 -->
																	</div>
																</div>
																<div class="input-box">
																<div class="select-wrap select-wrap--line">								
																<select class="select-wrap__select" title="월 선택" name="selCalMonth">																	
																	<option value="0">월</option>
																	<option value="1">1</option>
																	<option value="2">2</option>
																	<option value="3">3</option>
																	<option value="4">4</option>
																	<option value="5">5</option>
																	<option value="6">6</option>
																	<option value="7">7</option>
																	<option value="8">8</option>
																	<option value="9">9</option>
																	<option value="10">10</option>
																	<option value="11">11</option>
																	<option value="12">12</option>
																</select>
																</div>
																</div>
																<div class="input-box">
																<div class="select-wrap select-wrap--line">
																<select class="select-wrap__select" title="일 선택" name="selCalDate">
																	<option>일</option><!-- 일 -->
																</select>
																</div>
																</div>
																</div>
																<p tabindex="0" class="input__error" id="calcError"></p>										
																</div>
																</div>
																</div>					
																<div class="button-wrap button-wrap--center">
																<button type="button" class="button button--optional button--optional-black" onclick="javascript:calcAge();"><span class="button__text">계산하기</span></button><!-- 계산하기 -->
																</div>								
																<div class="notice-box--white" name="calcMsg" style="display: none;"></div>
																</div>
															</div>
														</div>									
													</div>
													<div class="fixed-wrap fixed-wrap--multi-line border-none">
													<div class="button-wrap">
														<button type="button" class="button button--active active" name="btnSetPassenger"><span class="button__text">선택 완료</span></button><!-- 선택 완료 -->
													</div>
													</div>
													<a href="#a" class="layer-close"><span class="blind">닫기</span></a>
												</div>
											</div>												
											<div class="ticketing-row-bot">
											<div class="ticketing-row-sub">
												<div class="ticketing-people">
													<button type="button" class="btn-passengers" data-adtcount="1" data-chdcount="0" data-infcount="0"><span class="txt">성인1</span></button><!-- 성인1 -->
												</div>
												<div class="payment">
												<div class="payment-head">
													<div class="payment-tit">결제 방법</div> <!-- 결제 방법 -->
													<span class="tooltip">
														<button type="button" class="tooltip__button" data-element="modal_anchor" data-target="#toolTipModalLayer2" data-modal-type="full"></button>	
													</span>
												</div>
												<div class="radio-wrap">
													<span class="radio payment-basic">
														<input type="radio" id="paymentRadio01" name="paymentMethod" class="radio__input" checked="">
														<label for="paymentRadio01" class="radio__label"><i aria-hidden="true" class="radio__ico"></i><span>일반</span></label> <!-- 일반 -->
													</span>
													<span class="radio">
														<input type="radio" id="paymentRadio02" name="paymentMethod" class="radio__input">
														<label for="paymentRadio02" class="radio__label">
															<i aria-hidden="true" class="radio__ico"></i>
															<span>포인트</span> <!-- 포인트 -->
														</label>
													</span>
													
														<span class="radio payment-giftticket">
															<input type="radio" id="paymentRadio03" name="paymentMethod" class="radio__input">
															<label for="paymentRadio03" class="radio__label">
																<i aria-hidden="true" class="radio__ico"></i>
																<span>기프티켓</span> <!-- 기프티켓 -->
															</label>
														</span>												
													
												</div>
												</div>
											</div>
											<div class="ticketing-row-sub">
												<div class="promotion">
													<!-- 프로모션 코드 입력 UI 변경 -->
										             <div class="promotion-head">
										               <div class="promotion-tit">프로모션 코드 입력</div> 
										               <span class="tooltip">
										                <button type="button" class="tooltip__button" data-element="modal_anchor" data-target="#toolTipModalLayer1" data-modal-type="full"></button>
										               </span>
										             </div> 
										             <!-- 프로모션 코드 인풋박스 -->
										             <div class="promotion-top">
										               <div class="promotion-inp"><input type="text" class="inp-txt" id="txtPromoCode"></div>
										             </div>
										             <!-- 프로모션 코드 안내글 -->
										             <p class="caution" id="WarnPromoCode" style="display:none;"><span class="txt">프로모션 코드를 정확히 입력해 주세요.</span></p> <!-- 프로모션 코드를 정확히 입력해 주세요. -->
										        </div>
												<div class="g-ticket">
													<select class="g-ticket-select" id="selectGifticket"></select>																																												
													<div class="g-ticket-select nodata" style="display:none;" name="nodataGift">선택 가능한 기프티켓이 없습니다.</div>
													<a href="/ko/additionalService/service/gifticket.do" target="_blank" class="go-detail" name="nodataGift" style="display:none;">기프티켓 자세히 보기 &gt;</a><!-- 선택 가능한 기프티켓이 없습니다. 기프티켓 자세히 보기  -->													
												</div>						
												<button type="button" id="searchFlight" onclick="javascript:setSearchAvailParam(true);" class="btn-flight-sch-again" disabled="">항공권 검색</button> <!-- 항공권  검색 -->
											</div>
										</div>
									</div>
								</div>				
								<!-- 최근 검색 노선 -->
								<div class="search" style="display: none;">
									<div class="search__label">최근 검색 노선</div> <!-- 최근 검색 노선 -->
									<div class="search__slide swiper-container-initialized swiper-container-horizontal" data-carousel="spaceItem">
										<div class="search__box-wrap swiper-wrapper" id="divRecentRoute"></div>
										<button type="button" class="carousel__button-next swiper-button-disabled" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></button>
										<button type="button" class="carousel__button-prev swiper-button-disabled" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></button>
									<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
								</div>
								<!-- 최근 검색 노선 -->																		
							</div>
						</div>
					</div>
					<!-- //quick-booking -->
				
					<!-- main-carousel -->
					<div class="main-carousel swiper-container swiper-container-fade swiper-container-initialized swiper-container-horizontal" data-carousel="mainItem">
						<div class="mobile-shawdow"></div> <!-- 20211109 모바일슬라이드 그림자추가 -->
						<!-- 개인화 타입 변수 설정 -->
						
						
						
						
						
						
						
						
						
						
						
						
					
						<div class="color-transfer swiper1" style="background: rgb(8, 1, 11);">
		              		<div class="bg-shape left   swiper1" style="background: rgb(8, 1, 11);"></div>
			              	<div class="bg-shape left2  swiper1" style="background: rgb(8, 1, 11);"></div>
			              	<div class="bg-shape left3  swiper1" style="background: rgb(8, 1, 11);"></div>
			              	<div class="bg-shape left4  swiper1" style="background: rgb(8, 1, 11);"></div>
			              	<div class="bg-shape right  swiper1" style="background: rgb(8, 1, 11);"></div>
			              	<div class="bg-shape right2 swiper1" style="background: rgb(8, 1, 11);"></div>
			              	<div class="bg-shape right3 swiper1" style="background: rgb(8, 1, 11);"></div>
			            </div>

			            <a class="main-carousel__text test" href="javascript:void(0);">
							
							
								<div class="title" style="background-color:; color:">
									핫한 일본 추천 노선	
								</div>
								<div class="title2" style="background-color:; color:">
									편도총액 74,800원~
								</div>
								<div class="link-wrap--arrow">
								






									<div class="link-wrap__text">
										<span style="background-color:; color:">일본 더블 할인받기</span>
									</div>

								</div>
							</a>

			            <div class="carousel-wrapper swiper-wrapper" style="transition-duration: 0ms;"><div class="main-carousel__item swiper-slide swiper-slide-duplicate" data-swiper-slide-index="8" style="width: 1256px; transition-duration: 0ms; opacity: 1; transform: translate3d(0px, 0px, 0px);">
								
								
								<a href="https://www.jejuair.net/ko/memberBenefit/refreshPoint/pointUse.do" class="main-carousell-link"></a>
								
									<div class="main-carousel__bg mobile-only">
										<div class="inner" style="background-image: url(https://static.jejuair.net/cms/images/main_ind_domain/20220215175517945.jpg);">
											<div class="hidden"></div>
										</div>
									</div>
									<div class="main-carousel__bg pc-only" style="background-image: url(https://static.jejuair.net/cms/images/main_ind_domain/20220215175517945.jpg);">
										<div class="hidden"></div>
									</div>
							</div>

							
							
							
							
							<!-- 개인화 타입 변수 설정 -->
							  
							  
							
							
							
							
							
							
							
							
							
							
								
							
							

							
							<a href="javascript:void(0);" onclick="URL_LINK.getI18Url('/event/eventDetail.do?eventNo=0000000395')" id="main-carousel__text_0" name="#323070" style="display:none;">
							
							
								<div class="title" style="background-color:; color:">
									여행자 보험 가입하고	
								</div>
								<div class="title2" style="background-color:; color:">
									안전한 여행 떠나요~
								</div>
								<div class="link-wrap--arrow">
								






									<div class="link-wrap__text">
										<span style="background-color:; color:">자세히 보기</span>
									</div>

								</div>
							</a>

							
							<div class="main-carousel__item swiper-slide" data-swiper-slide-index="0" style="width: 1256px; transition-duration: 0ms; opacity: 1; transform: translate3d(-1256px, 0px, 0px);">
								
								<a href="javascript:void(0);" onclick="URL_LINK.getI18Url('/event/eventDetail.do?eventNo=0000000395')" class="main-carousell-link"></a>
								
								
									<div class="main-carousel__bg mobile-only">
										<div class="inner" style="background-image: url(https://static.jejuair.net/cms/images/banner_image/20221110095524202.jpg);">
											<div class="hidden"></div>
										</div>
									</div>
									<div class="main-carousel__bg pc-only" style="background-image: url(https://static.jejuair.net/cms/images/banner_image/20221110095524202.jpg);">
										<div class="hidden"></div>
									</div>
							</div>

							
							
							
							

							
							<a href="javascript:void(0);" onclick="URL_LINK.getI18Url('/event/eventDetail.do?eventNo=0000000599')" id="main-carousel__text_1" name="#2ea3fd" style="display:none;">
							
							
								<div class="title" style="background-color:; color:">
									부산에서도 괌은	
								</div>
								<div class="title2" style="background-color:; color:">
									무조건 제주항공 
								</div>
								<div class="link-wrap--arrow">
								






									<div class="link-wrap__text">
										<span style="background-color:; color:">자세히 보기</span>
									</div>

								</div>
							</a>

							
							<div class="main-carousel__item swiper-slide swiper-slide-prev" data-swiper-slide-index="1" style="width: 1256px; transition-duration: 0ms; opacity: 1; transform: translate3d(-2512px, 0px, 0px);">
								
								<a href="javascript:void(0);" onclick="URL_LINK.getI18Url('/event/eventDetail.do?eventNo=0000000599')" class="main-carousell-link"></a>
								
								
									<div class="main-carousel__bg mobile-only">
										<div class="inner" style="background-image: url(https://static.jejuair.net/cms/images/banner_image/20221109174024600.jpg);">
											<div class="hidden"></div>
										</div>
									</div>
									<div class="main-carousel__bg pc-only" style="background-image: url(https://static.jejuair.net/cms/images/banner_image/20221109174024600.jpg);">
										<div class="hidden"></div>
									</div>
							</div>

							
							
							
							

							
							<a href="javascript:void(0);" onclick="URL_LINK.getI18Url('/event/eventDetail.do?eventNo=0000000583')" id="main-carousel__text_2" name="#08010b" style="display:none;">
							
							
								<div class="title" style="background-color:; color:">
									핫한 일본 추천 노선	
								</div>
								<div class="title2" style="background-color:; color:">
									편도총액 74,800원~
								</div>
								<div class="link-wrap--arrow">
								






									<div class="link-wrap__text">
										<span style="background-color:; color:">일본 더블 할인받기</span>
									</div>

								</div>
							</a>

							
							<div class="main-carousel__item swiper-slide swiper-slide-active" data-swiper-slide-index="2" style="width: 1256px; transition-duration: 0ms; opacity: 1; transform: translate3d(-3768px, 0px, 0px);">
								
								<a href="javascript:void(0);" onclick="URL_LINK.getI18Url('/event/eventDetail.do?eventNo=0000000583')" class="main-carousell-link"></a>
								
								
									<div class="main-carousel__bg mobile-only">
										<div class="inner" style="background-image: url(https://static.jejuair.net/cms/images/banner_image/20221109101201548.jpg);">
											<div class="hidden"></div>
										</div>
									</div>
									<div class="main-carousel__bg pc-only" style="background-image: url(https://static.jejuair.net/cms/images/banner_image/20221109101201548.jpg);">
										<div class="hidden"></div>
									</div>
							</div>

							
							
							
							

							
							<a href="javascript:void(0);" onclick="URL_LINK.getI18Url('/event/eventDetail.do?eventNo=0000000555')" id="main-carousel__text_3" name="#ead400" style="display:none;">
							
							
								<div class="title" style="background-color:; color:">
									카카오페이
								</div>
								<div class="title2" style="background-color:; color:">
									최대 2만원 즉시할인
								</div>
								<div class="link-wrap--arrow">
								






									<div class="link-wrap__text">
										<span style="background-color:; color:">바로가기</span>
									</div>

								</div>
							</a>

							
							<div class="main-carousel__item swiper-slide swiper-slide-next" data-swiper-slide-index="3" style="width: 1256px; transition-duration: 0ms; opacity: 0; transform: translate3d(-5024px, 0px, 0px);">
								
								<a href="javascript:void(0);" onclick="URL_LINK.getI18Url('/event/eventDetail.do?eventNo=0000000555')" class="main-carousell-link"></a>
								
								
									<div class="main-carousel__bg mobile-only">
										<div class="inner" style="background-image: url(https://static.jejuair.net/cms/images/banner_image/20220826140115121.jpg);">
											<div class="hidden"></div>
										</div>
									</div>
									<div class="main-carousel__bg pc-only" style="background-image: url(https://static.jejuair.net/cms/images/banner_image/20220826140115121.jpg);">
										<div class="hidden"></div>
									</div>
							</div>

							
							
							
							

							
							<a href="javascript:void(0);" onclick="URL_LINK.getI18Url('/event/eventDetail.do?eventNo=0000000496')" id="main-carousel__text_4" name="#ff5000" style="display:none;">
							
							
								<div class="title" style="background-color:; color:">
									New 제주항공 하나카드
								</div>
								<div class="title2" style="background-color:; color:">
									최대 5만원 청구할인
								</div>
								<div class="link-wrap--arrow">
								






									<div class="link-wrap__text">
										<span style="background-color:; color:">바로가기</span>
									</div>

								</div>
							</a>

							
							<div class="main-carousel__item swiper-slide" data-swiper-slide-index="4" style="width: 1256px; transition-duration: 0ms; opacity: 0; transform: translate3d(-6280px, 0px, 0px);">
								
								<a href="javascript:void(0);" onclick="URL_LINK.getI18Url('/event/eventDetail.do?eventNo=0000000496')" class="main-carousell-link"></a>
								
								
									<div class="main-carousel__bg mobile-only">
										<div class="inner" style="background-image: url(https://static.jejuair.net/cms/images/banner_image/20220908105027229.png);">
											<div class="hidden"></div>
										</div>
									</div>
									<div class="main-carousel__bg pc-only" style="background-image: url(https://static.jejuair.net/cms/images/banner_image/20220908105027229.png);">
										<div class="hidden"></div>
									</div>
							</div>

							
							
							
							

							
							<a href="javascript:void(0);" onclick="URL_LINK.getI18Url('/event/eventDetail.do?eventNo=0000000577')" id="main-carousel__text_5" name="#ce6125" style="display:none;">
							
							
								<div class="title" style="background-color:; color:">
									인생샷 찍으러
								</div>
								<div class="title2" style="background-color:; color:">
									코타키나발루~!
								</div>
								<div class="link-wrap--arrow">
								






									<div class="link-wrap__text">
										<span style="background-color:; color:">바로가기</span>
									</div>

								</div>
							</a>

							
							<div class="main-carousel__item swiper-slide" data-swiper-slide-index="5" style="width: 1256px; transition-duration: 0ms; opacity: 0; transform: translate3d(-7536px, 0px, 0px);">
								
								<a href="javascript:void(0);" onclick="URL_LINK.getI18Url('/event/eventDetail.do?eventNo=0000000577')" class="main-carousell-link"></a>
								
								
									<div class="main-carousel__bg mobile-only">
										<div class="inner" style="background-image: url(https://static.jejuair.net/cms/images/banner_image/20221108104637170.png);">
											<div class="hidden"></div>
										</div>
									</div>
									<div class="main-carousel__bg pc-only" style="background-image: url(https://static.jejuair.net/cms/images/banner_image/20221108104637170.png);">
										<div class="hidden"></div>
									</div>
							</div>

							
							
							
							

							
							<a href="javascript:void(0);" onclick="URL_LINK.getI18Url('/event/eventDetail.do?eventNo=0000000508')" id="main-carousel__text_6" name="#1c2e45" style="display:none;">
							
							
								<div class="title" style="background-color:; color:">
									더 편안한 여행의 시작
								</div>
								<div class="title2" style="background-color:; color:">
									라운지 이용권 특가 할인
								</div>
								<div class="link-wrap--arrow">
								






									<div class="link-wrap__text">
										<span style="background-color:; color:">바로가기</span>
									</div>

								</div>
							</a>

							
							<div class="main-carousel__item swiper-slide" data-swiper-slide-index="6" style="width: 1256px; transition-duration: 0ms; opacity: 0; transform: translate3d(-8792px, 0px, 0px);">
								
								<a href="javascript:void(0);" onclick="URL_LINK.getI18Url('/event/eventDetail.do?eventNo=0000000508')" class="main-carousell-link"></a>
								
								
									<div class="main-carousel__bg mobile-only">
										<div class="inner" style="background-image: url(https://static.jejuair.net/cms/images/banner_image/20220831110955969.jpg);">
											<div class="hidden"></div>
										</div>
									</div>
									<div class="main-carousel__bg pc-only" style="background-image: url(https://static.jejuair.net/cms/images/banner_image/20220831110955969.jpg);">
										<div class="hidden"></div>
									</div>
							</div>

							
							
							
							

							
							
							<a href="https://www.jejuair.net/ko/memberBenefit/memberBenefit.do?param=newMember" id="main-carousel__text_7" name="" style="display:none;">
							
								<div class="title" style="background-color:; color:">
									신규회원 특별혜택<br>운임 최대 7%할인
								</div>
								<div class="title2" style="background-color:; color:">
									
								</div>
								<div class="link-wrap--arrow">
								






									<div class="link-wrap__text">
										<span style="background-color:; color:">혜택 확인하기</span>
									</div>

								</div>
							</a>

							
							<div class="main-carousel__item swiper-slide" data-swiper-slide-index="7" style="width: 1256px; transition-duration: 0ms; opacity: 0; transform: translate3d(-10048px, 0px, 0px);">
								
								
								<a href="https://www.jejuair.net/ko/memberBenefit/memberBenefit.do?param=newMember" class="main-carousell-link"></a>
								
									<div class="main-carousel__bg mobile-only">
										<div class="inner" style="background-image: url(https://static.jejuair.net/cms/images/main_ind_domain/20220106103255812.png);">
											<div class="hidden"></div>
										</div>
									</div>
									<div class="main-carousel__bg pc-only" style="background-image: url(https://static.jejuair.net/cms/images/main_ind_domain/20220106103255812.png);">
										<div class="hidden"></div>
									</div>
							</div>

							
							
							
							

							
							
							<a href="https://www.jejuair.net/ko/memberBenefit/refreshPoint/pointUse.do" id="main-carousel__text_8" name="#897554" style="display:none;">
							
								<div class="title" style="background-color:; color:">
									항공운임 5% 기본 적립<br>리프레시 포인트
								</div>
								<div class="title2" style="background-color:; color:">
									
								</div>
								<div class="link-wrap--arrow">
								






									<div class="link-wrap__text">
										<span style="background-color:; color:">리프레시 포인트 보기</span>
									</div>

								</div>
							</a>

							
							<div class="main-carousel__item swiper-slide" data-swiper-slide-index="8" style="width: 1256px; transition-duration: 0ms; opacity: 0; transform: translate3d(-11304px, 0px, 0px);">
								
								
								<a href="https://www.jejuair.net/ko/memberBenefit/refreshPoint/pointUse.do" class="main-carousell-link"></a>
								
									<div class="main-carousel__bg mobile-only">
										<div class="inner" style="background-image: url(https://static.jejuair.net/cms/images/main_ind_domain/20220215175517945.jpg);">
											<div class="hidden"></div>
										</div>
									</div>
									<div class="main-carousel__bg pc-only" style="background-image: url(https://static.jejuair.net/cms/images/main_ind_domain/20220215175517945.jpg);">
										<div class="hidden"></div>
									</div>
							</div>

							

			            <div class="main-carousel__item swiper-slide swiper-slide-duplicate" data-swiper-slide-index="0" style="width: 1256px; transition-duration: 0ms; opacity: 0; transform: translate3d(-12560px, 0px, 0px);">
								
								<a href="javascript:void(0);" onclick="URL_LINK.getI18Url('/event/eventDetail.do?eventNo=0000000395')" class="main-carousell-link"></a>
								
								
									<div class="main-carousel__bg mobile-only">
										<div class="inner" style="background-image: url(https://static.jejuair.net/cms/images/banner_image/20221110095524202.jpg);">
											<div class="hidden"></div>
										</div>
									</div>
									<div class="main-carousel__bg pc-only" style="background-image: url(https://static.jejuair.net/cms/images/banner_image/20221110095524202.jpg);">
										<div class="hidden"></div>
									</div>
							</div></div>

			            <div class="carousel__pagination swiper-pagination swiper-pagination-clickable swiper-pagination-bullets"><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 1"></span><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 2"></span><span class="swiper-pagination-bullet swiper-pagination-bullet-active" tabindex="0" role="button" aria-label="Go to slide 3"></span><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 4"></span><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 5"></span><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 6"></span><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 7"></span><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 8"></span><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 9"></span></div>
			            <button type="button" class="carousel__button-next" tabindex="0" role="button" aria-label="Next slide"></button>
			            <button type="button" class="carousel__button-prev" tabindex="0" role="button" aria-label="Previous slide"></button>

	          		<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
				</div>

				<!-- pc-wrap -->
				<div class="pc-wrap">
				
				
					
				<!-- 개인화 타입 A : 로그인 N -->
				
					
					<!-- 추천 항공권: pc-only  -->    
					
					
					<div class="promotion-list pc-only">
					
						<div class="title">
							<h3 class="title__section">추천 항공권</h3> <!-- 추천 항공권 -->
						</div>
						
						<div class="swiper-container recommendTicket-pc swiper-container-initialized swiper-container-horizontal" data-carousel="recommendTicket">
							<div class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(-1757px, 0px, 0px);"><a href="/ko/ibe/booking/Availability.do?depStn=KUV&amp;arrStn=CJU&amp;depDate=2022-12-01&amp;arrDate=2022-12-15" class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" data-swiper-slide-index="3" style="width: 251px;">  
									<div class="carousel_bg" style="background-image: url(https://static.jejuair.net/cms/images/immigration_card/20220919175604209.png);">
										<div class="hidden">군산-제주</div>
									</div>
									<div class="txt-wrap"> 
										<div class="name">군산 - 제주</div>
										<div class="text">
											<span class="total_price_txt">편도총액</span> <!-- 편도총액 -->
											
												
													<span class="price_txt">45,300</span>
		                      						<span class="unit">원</span>
												
												
												
												
											~
										</div>
	                    				<div class="date">2022.12.01 ~ 2022.12.15</div>
									</div>
								</a><a href="/ko/ibe/booking/Availability.do?depStn=GMP&amp;arrStn=CJU&amp;depDate=2022-12-01&amp;arrDate=2022-12-15" class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" data-swiper-slide-index="4" style="width: 251px;">  
									<div class="carousel_bg" style="background-image: url(https://static.jejuair.net/cms/images/immigration_card/20220919180026606.png);">
										<div class="hidden">김포-제주</div>
									</div>
									<div class="txt-wrap"> 
										<div class="name">김포 - 제주</div>
										<div class="text">
											<span class="total_price_txt">편도총액</span> <!-- 편도총액 -->
											
												
													<span class="price_txt">31,300</span>
		                      						<span class="unit">원</span>
												
												
												
												
											~
										</div>
	                    				<div class="date">2022.12.01 ~ 2022.12.15</div>
									</div>
								</a><a href="/ko/ibe/booking/Availability.do?depStn=GMP&amp;arrStn=PUS&amp;depDate=2022-12-01&amp;arrDate=2022-12-15" class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="5" style="width: 251px;">  
									<div class="carousel_bg" style="background-image: url(https://static.jejuair.net/cms/images/immigration_card/20220927165351821.png);">
										<div class="hidden">김포-부산</div>
									</div>
									<div class="txt-wrap"> 
										<div class="name">김포 - 부산</div>
										<div class="text">
											<span class="total_price_txt">편도총액</span> <!-- 편도총액 -->
											
												
													<span class="price_txt">33,300</span>
		                      						<span class="unit">원</span>
												
												
												
												
											~
										</div>
	                    				<div class="date">2022.12.01 ~ 2022.12.15</div>
									</div>
								</a><a href="/ko/ibe/booking/Availability.do?depStn=PUS&amp;arrStn=CEB&amp;depDate=2022-12-01&amp;arrDate=2022-12-31" class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="6" style="width: 251px;">  
									<div class="carousel_bg" style="background-image: url(https://static.jejuair.net/cms/images/immigration_card/20220928113454374.jpg);">
										<div class="hidden">세부</div>
									</div>
									<div class="txt-wrap"> 
										<div class="name">부산 - 세부</div>
										<div class="text">
											<span class="total_price_txt">편도총액</span> <!-- 편도총액 -->
											
												
													<span class="price_txt">100,900</span>
		                      						<span class="unit">원</span>
												
												
												
												
											~
										</div>
	                    				<div class="date">2022.12.01 ~ 2022.12.31</div>
									</div>
								</a>
							
								
						
								<a href="/ko/ibe/booking/Availability.do?depStn=ICN&amp;arrStn=GUM&amp;depDate=2022-12-01&amp;arrDate=2022-12-31" class="swiper-slide" data-swiper-slide-index="0" style="width: 251px;">  
									<div class="carousel_bg" style="background-image: url(https://static.jejuair.net/cms/images/immigration_card/20220106104038372.png);">
										<div class="hidden">괌</div>
									</div>
									<div class="txt-wrap"> 
										<div class="name">서울(인천) - 괌</div>
										<div class="text">
											<span class="total_price_txt">편도총액</span> <!-- 편도총액 -->
											
												
													<span class="price_txt">155,200</span>
		                      						<span class="unit">원</span>
												
												
												
												
											~
										</div>
	                    				<div class="date">2022.12.01 ~ 2022.12.31</div>
									</div>
								</a>
									
								
						
								<a href="/ko/ibe/booking/Availability.do?depStn=ICN&amp;arrStn=OKA&amp;depDate=2022-12-01&amp;arrDate=2022-12-31" class="swiper-slide" data-swiper-slide-index="1" style="width: 251px;">  
									<div class="carousel_bg" style="background-image: url(https://static.jejuair.net/cms/images/immigration_card/20220426154305206.png);">
										<div class="hidden">오키나와</div>
									</div>
									<div class="txt-wrap"> 
										<div class="name">서울(인천) - 오키나와(나하)</div>
										<div class="text">
											<span class="total_price_txt">편도총액</span> <!-- 편도총액 -->
											
												
													<span class="price_txt">149,500</span>
		                      						<span class="unit">원</span>
												
												
												
												
											~
										</div>
	                    				<div class="date">2022.12.01 ~ 2022.12.31</div>
									</div>
								</a>
									
								
						
								<a href="/ko/ibe/booking/Availability.do?depStn=ICN&amp;arrStn=CXR&amp;depDate=2022-12-01&amp;arrDate=2022-12-31" class="swiper-slide swiper-slide-prev" data-swiper-slide-index="2" style="width: 251px;">  
									<div class="carousel_bg" style="background-image: url(https://static.jejuair.net/cms/images/immigration_card/20220503071042084.png);">
										<div class="hidden">나트랑</div>
									</div>
									<div class="txt-wrap"> 
										<div class="name">서울(인천) - 나트랑(깜란)</div>
										<div class="text">
											<span class="total_price_txt">편도총액</span> <!-- 편도총액 -->
											
												
													<span class="price_txt">123,100</span>
		                      						<span class="unit">원</span>
												
												
												
												
											~
										</div>
	                    				<div class="date">2022.12.01 ~ 2022.12.31</div>
									</div>
								</a>
									
								
						
								<a href="/ko/ibe/booking/Availability.do?depStn=KUV&amp;arrStn=CJU&amp;depDate=2022-12-01&amp;arrDate=2022-12-15" class="swiper-slide swiper-slide-active" data-swiper-slide-index="3" style="width: 251px;">  
									<div class="carousel_bg" style="background-image: url(https://static.jejuair.net/cms/images/immigration_card/20220919175604209.png);">
										<div class="hidden">군산-제주</div>
									</div>
									<div class="txt-wrap"> 
										<div class="name">군산 - 제주</div>
										<div class="text">
											<span class="total_price_txt">편도총액</span> <!-- 편도총액 -->
											
												
													<span class="price_txt">45,300</span>
		                      						<span class="unit">원</span>
												
												
												
												
											~
										</div>
	                    				<div class="date">2022.12.01 ~ 2022.12.15</div>
									</div>
								</a>
									
								
						
								<a href="/ko/ibe/booking/Availability.do?depStn=GMP&amp;arrStn=CJU&amp;depDate=2022-12-01&amp;arrDate=2022-12-15" class="swiper-slide swiper-slide-next" data-swiper-slide-index="4" style="width: 251px;">  
									<div class="carousel_bg" style="background-image: url(https://static.jejuair.net/cms/images/immigration_card/20220919180026606.png);">
										<div class="hidden">김포-제주</div>
									</div>
									<div class="txt-wrap"> 
										<div class="name">김포 - 제주</div>
										<div class="text">
											<span class="total_price_txt">편도총액</span> <!-- 편도총액 -->
											
												
													<span class="price_txt">31,300</span>
		                      						<span class="unit">원</span>
												
												
												
												
											~
										</div>
	                    				<div class="date">2022.12.01 ~ 2022.12.15</div>
									</div>
								</a>
									
								
						
								<a href="/ko/ibe/booking/Availability.do?depStn=GMP&amp;arrStn=PUS&amp;depDate=2022-12-01&amp;arrDate=2022-12-15" class="swiper-slide" data-swiper-slide-index="5" style="width: 251px;">  
									<div class="carousel_bg" style="background-image: url(https://static.jejuair.net/cms/images/immigration_card/20220927165351821.png);">
										<div class="hidden">김포-부산</div>
									</div>
									<div class="txt-wrap"> 
										<div class="name">김포 - 부산</div>
										<div class="text">
											<span class="total_price_txt">편도총액</span> <!-- 편도총액 -->
											
												
													<span class="price_txt">33,300</span>
		                      						<span class="unit">원</span>
												
												
												
												
											~
										</div>
	                    				<div class="date">2022.12.01 ~ 2022.12.15</div>
									</div>
								</a>
									
								
						
								<a href="/ko/ibe/booking/Availability.do?depStn=PUS&amp;arrStn=CEB&amp;depDate=2022-12-01&amp;arrDate=2022-12-31" class="swiper-slide" data-swiper-slide-index="6" style="width: 251px;">  
									<div class="carousel_bg" style="background-image: url(https://static.jejuair.net/cms/images/immigration_card/20220928113454374.jpg);">
										<div class="hidden">세부</div>
									</div>
									<div class="txt-wrap"> 
										<div class="name">부산 - 세부</div>
										<div class="text">
											<span class="total_price_txt">편도총액</span> <!-- 편도총액 -->
											
												
													<span class="price_txt">100,900</span>
		                      						<span class="unit">원</span>
												
												
												
												
											~
										</div>
	                    				<div class="date">2022.12.01 ~ 2022.12.31</div>
									</div>
								</a>
									
								
								
							<a href="/ko/ibe/booking/Availability.do?depStn=ICN&amp;arrStn=GUM&amp;depDate=2022-12-01&amp;arrDate=2022-12-31" class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="0" style="width: 251px;">  
									<div class="carousel_bg" style="background-image: url(https://static.jejuair.net/cms/images/immigration_card/20220106104038372.png);">
										<div class="hidden">괌</div>
									</div>
									<div class="txt-wrap"> 
										<div class="name">서울(인천) - 괌</div>
										<div class="text">
											<span class="total_price_txt">편도총액</span> <!-- 편도총액 -->
											
												
													<span class="price_txt">155,200</span>
		                      						<span class="unit">원</span>
												
												
												
												
											~
										</div>
	                    				<div class="date">2022.12.01 ~ 2022.12.31</div>
									</div>
								</a><a href="/ko/ibe/booking/Availability.do?depStn=ICN&amp;arrStn=OKA&amp;depDate=2022-12-01&amp;arrDate=2022-12-31" class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="1" style="width: 251px;">  
									<div class="carousel_bg" style="background-image: url(https://static.jejuair.net/cms/images/immigration_card/20220426154305206.png);">
										<div class="hidden">오키나와</div>
									</div>
									<div class="txt-wrap"> 
										<div class="name">서울(인천) - 오키나와(나하)</div>
										<div class="text">
											<span class="total_price_txt">편도총액</span> <!-- 편도총액 -->
											
												
													<span class="price_txt">149,500</span>
		                      						<span class="unit">원</span>
												
												
												
												
											~
										</div>
	                    				<div class="date">2022.12.01 ~ 2022.12.31</div>
									</div>
								</a><a href="/ko/ibe/booking/Availability.do?depStn=ICN&amp;arrStn=CXR&amp;depDate=2022-12-01&amp;arrDate=2022-12-31" class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-prev" data-swiper-slide-index="2" style="width: 251px;">  
									<div class="carousel_bg" style="background-image: url(https://static.jejuair.net/cms/images/immigration_card/20220503071042084.png);">
										<div class="hidden">나트랑</div>
									</div>
									<div class="txt-wrap"> 
										<div class="name">서울(인천) - 나트랑(깜란)</div>
										<div class="text">
											<span class="total_price_txt">편도총액</span> <!-- 편도총액 -->
											
												
													<span class="price_txt">123,100</span>
		                      						<span class="unit">원</span>
												
												
												
												
											~
										</div>
	                    				<div class="date">2022.12.01 ~ 2022.12.31</div>
									</div>
								</a><a href="/ko/ibe/booking/Availability.do?depStn=KUV&amp;arrStn=CJU&amp;depDate=2022-12-01&amp;arrDate=2022-12-15" class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" data-swiper-slide-index="3" style="width: 251px;">  
									<div class="carousel_bg" style="background-image: url(https://static.jejuair.net/cms/images/immigration_card/20220919175604209.png);">
										<div class="hidden">군산-제주</div>
									</div>
									<div class="txt-wrap"> 
										<div class="name">군산 - 제주</div>
										<div class="text">
											<span class="total_price_txt">편도총액</span> <!-- 편도총액 -->
											
												
													<span class="price_txt">45,300</span>
		                      						<span class="unit">원</span>
												
												
												
												
											~
										</div>
	                    				<div class="date">2022.12.01 ~ 2022.12.15</div>
									</div>
								</a></div>
						<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
						
						<button type="button" class="carousel__button-next2 show" tabindex="0" role="button" aria-label="Next slide"></button>
						<button type="button" class="carousel__button-prev2 show" tabindex="0" role="button" aria-label="Previous slide"></button>
					</div>

					
					
					<!-- 추천 항공권: mobile-only -->
					
					
					<div class="promotion-list mobile-only">
					
						<div class="title">
							<h3 class="title__section">추천 항공권</h3> <!-- 추천 항공권 -->
						</div>
						
						<div class="swiper-container recommendTicket-mobile" data-carousel="recommendTicket">
							<div class="swiper-wrapper">
								
								
								
								<a href="/ko/ibe/booking/Availability.do?depStn=ICN&amp;arrStn=GUM&amp;depDate=2022-12-01&amp;arrDate=2022-12-31" class="swiper-slide">  
									<div class="carousel_bg" style="background-image: url(https://static.jejuair.net/cms/images/immigration_card/20220106104038372.png);">
										<div class="hidden">괌</div>
									</div>
									<div class="txt-wrap"> 
										<div class="name">서울(인천) - 괌</div>
										<div class="text">
											<span class="total_price_txt">편도총액</span> <!-- 편도총액 -->
											
												
													<span class="price_txt">155,200</span>
		                      						<span class="unit">원</span>
												
												
												
												
											~
										</div>
	                    				<div class="date">2022.12.01 ~ 2022.12.31</div>
									</div>
								</a>	    
				
								
								
								<a href="/ko/ibe/booking/Availability.do?depStn=ICN&amp;arrStn=OKA&amp;depDate=2022-12-01&amp;arrDate=2022-12-31" class="swiper-slide">  
									<div class="carousel_bg" style="background-image: url(https://static.jejuair.net/cms/images/immigration_card/20220426154305206.png);">
										<div class="hidden">오키나와</div>
									</div>
									<div class="txt-wrap"> 
										<div class="name">서울(인천) - 오키나와(나하)</div>
										<div class="text">
											<span class="total_price_txt">편도총액</span> <!-- 편도총액 -->
											
												
													<span class="price_txt">149,500</span>
		                      						<span class="unit">원</span>
												
												
												
												
											~
										</div>
	                    				<div class="date">2022.12.01 ~ 2022.12.31</div>
									</div>
								</a>	    
				
								
								
								<a href="/ko/ibe/booking/Availability.do?depStn=ICN&amp;arrStn=CXR&amp;depDate=2022-12-01&amp;arrDate=2022-12-31" class="swiper-slide">  
									<div class="carousel_bg" style="background-image: url(https://static.jejuair.net/cms/images/immigration_card/20220503071042084.png);">
										<div class="hidden">나트랑</div>
									</div>
									<div class="txt-wrap"> 
										<div class="name">서울(인천) - 나트랑(깜란)</div>
										<div class="text">
											<span class="total_price_txt">편도총액</span> <!-- 편도총액 -->
											
												
													<span class="price_txt">123,100</span>
		                      						<span class="unit">원</span>
												
												
												
												
											~
										</div>
	                    				<div class="date">2022.12.01 ~ 2022.12.31</div>
									</div>
								</a>	    
				
								
								
								<a href="/ko/ibe/booking/Availability.do?depStn=KUV&amp;arrStn=CJU&amp;depDate=2022-12-01&amp;arrDate=2022-12-15" class="swiper-slide">  
									<div class="carousel_bg" style="background-image: url(https://static.jejuair.net/cms/images/immigration_card/20220919175604209.png);">
										<div class="hidden">군산-제주</div>
									</div>
									<div class="txt-wrap"> 
										<div class="name">군산 - 제주</div>
										<div class="text">
											<span class="total_price_txt">편도총액</span> <!-- 편도총액 -->
											
												
													<span class="price_txt">45,300</span>
		                      						<span class="unit">원</span>
												
												
												
												
											~
										</div>
	                    				<div class="date">2022.12.01 ~ 2022.12.15</div>
									</div>
								</a>	    
				
								
								
								<a href="/ko/ibe/booking/Availability.do?depStn=GMP&amp;arrStn=CJU&amp;depDate=2022-12-01&amp;arrDate=2022-12-15" class="swiper-slide">  
									<div class="carousel_bg" style="background-image: url(https://static.jejuair.net/cms/images/immigration_card/20220919180026606.png);">
										<div class="hidden">김포-제주</div>
									</div>
									<div class="txt-wrap"> 
										<div class="name">김포 - 제주</div>
										<div class="text">
											<span class="total_price_txt">편도총액</span> <!-- 편도총액 -->
											
												
													<span class="price_txt">31,300</span>
		                      						<span class="unit">원</span>
												
												
												
												
											~
										</div>
	                    				<div class="date">2022.12.01 ~ 2022.12.15</div>
									</div>
								</a>	    
				
								
								
								<a href="/ko/ibe/booking/Availability.do?depStn=GMP&amp;arrStn=PUS&amp;depDate=2022-12-01&amp;arrDate=2022-12-15" class="swiper-slide">  
									<div class="carousel_bg" style="background-image: url(https://static.jejuair.net/cms/images/immigration_card/20220927165351821.png);">
										<div class="hidden">김포-부산</div>
									</div>
									<div class="txt-wrap"> 
										<div class="name">김포 - 부산</div>
										<div class="text">
											<span class="total_price_txt">편도총액</span> <!-- 편도총액 -->
											
												
													<span class="price_txt">33,300</span>
		                      						<span class="unit">원</span>
												
												
												
												
											~
										</div>
	                    				<div class="date">2022.12.01 ~ 2022.12.15</div>
									</div>
								</a>	    
				
								
								
								<a href="/ko/ibe/booking/Availability.do?depStn=PUS&amp;arrStn=CEB&amp;depDate=2022-12-01&amp;arrDate=2022-12-31" class="swiper-slide">  
									<div class="carousel_bg" style="background-image: url(https://static.jejuair.net/cms/images/immigration_card/20220928113454374.jpg);">
										<div class="hidden">세부</div>
									</div>
									<div class="txt-wrap"> 
										<div class="name">부산 - 세부</div>
										<div class="text">
											<span class="total_price_txt">편도총액</span> <!-- 편도총액 -->
											
												
													<span class="price_txt">100,900</span>
		                      						<span class="unit">원</span>
												
												
												
												
											~
										</div>
	                    				<div class="date">2022.12.01 ~ 2022.12.31</div>
									</div>
								</a>	    
				
								
								
							</div>
						</div>
					</div>
					
					
					<!-- 회원혜택 -->
					

					<div class="main-banner">
			            <div class="title">
			              	<h3 class="title__section">회원혜택</h3> <!-- 회원혜택 -->
			            </div>

		            	<div class="swiper-container swiper-container-initialized swiper-container-horizontal" data-carousel="mainBanner">
		              		<div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
								
								
				                <div class="swiper-slide swiper-slide-active" style="width: 1004px;">

									<a href="javascript:void(0);" onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/main.do')" style="background-color:#f8c6cf">
					                    <div class="img-area"> <!-- 이미지 영역 110x120 -->
										<img src="https://static.jejuair.net/cms/images/banner_image/20220714074315116.png" alt="">
					                    </div> 
					                    <div class="txt-area" style="color:#000000">
                                            
                                                
                                                    <span class="one-line">제주항공 VIP 회원 혜택, <br>항공운임 5% + 5% 적립</span>
                                                
                                                
                                            
                                        </div>
				                  	</a>
				                </div>

		                		  

		              		</div>
							
								<button type="button" class="main-banner-next" style="display: none;"><span class="blind">다음</span></button>
								<button type="button" class="main-banner-prev" style="display: none;"><span class="blind">이전</span></button>
							
			            <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
		              
		            	<div class="carousel__pagination swiper-pagination"></div>
		          	</div>
					
					
					<!-- // 회원혜택 -->
	
				
				<!-- // 개인화 타입 A : 로그인 N -->
				
				<!-- 개인화 타입 B : 로그인 Y, 예매 : 無 -->
				
				<!-- // 개인화 타입 B : 로그인 Y, 예매 : 無 -->
				
				<!-- 개인화 타입 C : 로그인 : Y, 예매 : 有, 체크인 가능 (D-24h < now < D) : N, 여정 시작 전 -->
				
				<!-- // 개인화 타입 C : 로그인 : Y, 예매 : 有, 체크인 가능 (D-24h < now < D) : N, 여정 시작 전 -->
				
				<!-- 개인화 타입 D : 로그인 : Y, 예매 : 有, 체크인 가능 (D-24h < now < D) : N, 여정 중 -->
				
				<!-- // 개인화 타입 D : 로그인 : Y, 예매 : 有, 체크인 가능 (D-24h < now < D) : N, 여정 중 -->
				
				<!-- 개인화 타입 E : 로그인 : Y, 예매 : 有, 체크인 가능 (D-24h < now < D) : Y -->
				
				<!-- // 개인화 타입 E : 로그인 : Y, 예매 : 有, 체크인 가능 (D-24h < now < D) : Y -->
				
				<!-- everymundo airmodule 삽입 -->		
				<div data-container-id="em-7c-5d325c50-0d5b-40ec-be3e-edc862341b38" style="display: none;">
							
				</div>
				<!-- //pc-wrap -->
				
				<div class="simple-info mobile-only" data-element="toggle" data-options="{&quot;mode&quot;: &quot;move scroll&quot;}"><!-- 마케팅 제휴 모바일-->
					<div class="simple-info__header">
						<button type="button" class="simple-info__title" data-element="toggle__anchor" aria-controls="toggle-4" aria-expanded="false">마케팅 제휴</button>
					</div>
					<div class="simple-info__content" data-element="toggle__panel" id="toggle-4">
						<div class="contact">
							<a href="#" class="mailto">partnership@jejuair.net</a>
							<div class="contact__text">
								브랜드 협업, 미디어 노출, 제휴 프로모션 등 제안을 기다립니다. <br>제안별로 담당자 검토 후 제휴가 진행됩니다.
							</div>
							<div class="contact__mail">
								<a href="javascript:void(0);" class="block" data-element="modal_anchor" data-target="#divModalEmailNoTerms" data-modal-type="full">이메일 무단 수집 거부</a>
							</div>
						</div>
					</div>
				</div>
			</div></main>
		</div>

		
		




<div class="footer mobile-only">
	<footer class="footer__inner">
		
			<a href="javascript:void(0);" class="button-footer" data-action="menu" data-menu-name="esg">ESG 경영</a>
			<a href="javascript:void(0);" class="button-footer button-footer-biz" data-action="menu" data-menu-name="company">기업우대</a>
		
		<a href="https://cargo.jejuair.net" target="_black" class="button-footer" data-action="menu" data-menu-name="Cargo">Cargo</a>
		
		<hr>
		<div class="footer__link">
			<a href="javascript:void(0);" class="footer__link-item" data-action="menu" data-menu-name="homepageTerms">이용약관</a>
			<a href="javascript:void(0);" class="footer__link-item" data-action="menu" data-menu-name="carriageTemrs">여객운송약관</a>
			<a href="javascript:void(0);" class="footer__link-item bold" data-action="menu" data-menu-name="personalTerms">개인정보처리방침</a>
			
		</div>
		<hr>
		<p class="footer__copy">
			<a href="tel:1599-1500" class="block">고객센터 1599-1500 (09:00 ~ 19:00)</a><br>
			Copyright ⓒ JEJUAIR. All Rights Reserved.<br><!-- Copyright ⓒ JEJUair Inc. All rights reserved. -->
		</p>
	</footer>
</div>

<div class="main-util pc-only">
	<div class="main-util__inner">
	
		<div class="main-util__cs">
			<h4 class="main-util__title">고객센터 1599-1500 (09:00~19:00)</h4> <!-- 고객센터 -->
			<p class="main-util__text"></p> <!-- 도움이 필요하신가요? -->
			
			<div class="button-wrap">
				
					<button type="button" class="button button--small" onclick="location.href='/ko/customerService/csCenter/faqList.do'">
						<span class="button__text">고객센터 바로가기</span>  
					</button> <!-- 고객센터 바로가기 -->
				
			</div>
		</div>

		
		<div class="main-util__social">
		
			
			
				<h4 class="main-util__title">SNS</h4>
				<div class="main-social">
					
						<a href="https://www.facebook.com/funjejuair/" target="_blank" class="main-social__list">
							<i class="icon"><img src="https://static.jejuair.net/cms/images/sns_ch/20211027200713454.png" alt="" loading="lazy"></i>
							<span class="hidden">https://www.facebook.com/funjejuair/</span>  
						</a>
					
						<a href="https://www.youtube.com/user/funjejuair" target="_blank" class="main-social__list">
							<i class="icon"><img src="https://static.jejuair.net/cms/images/sns_ch/20211027200700139.png" alt="" loading="lazy"></i>
							<span class="hidden">https://www.youtube.com/user/funjejuair</span>  
						</a>
					
						<a href="https://instagram.com/jejuair_official" target="_blank" class="main-social__list">
							<i class="icon"><img src="https://static.jejuair.net/cms/images/sns_ch/20211027200545316.png" alt="" loading="lazy"></i>
							<span class="hidden">https://instagram.com/jejuair_official</span>  
						</a>
					
				</div>
			
		  
		</div>
		
		<div class="main-util__contact">
			<h4 class="main-util__title"> <!-- 마케팅 제휴 -->
				마케팅 제휴<span class="mailto">partnership@jejuair.net</span>
				<!--<a href="partnership@jejuair.net" class="mailto">partnership@jejuair.net</a> -->
			</h4>
			<p class="main-util__text">브랜드 협업, 미디어 노출, 제휴 프로모션 등 제안을 기다립니다. <br>제안별로 담당자 검토 후 제휴가 진행됩니다.</p> <!-- 브랜드 협업, 미디어 노출, 제휴 프로모션 등 제안을 기다립니다.<br>제안별로 담당자 검토 후 제휴가 진행됩니다. -->
			<div class="main-util__mail">  
				<a href="javascript:void(0);" class="block" data-element="modal_anchor" data-target="#divModalEmailNoTerms" data-modal-type="full">이메일 무단 수집 거부</a> <!-- 이메일 무단 수집 거부 -->
			</div>
		</div>
		
		<!-- 풀팝업 -->
	  	<div id="divModalEmailNoTerms" class="modal modal-full modal-scroll modal--fixed-multi">
		    <div class="modal-header">
		      	<div class="modal-header__title">이메일 무단 수집 거부</div> <!-- 이메일 무단 수집 거부 -->
		    </div>
		    <div class="modal-content">
		      	<div class="first-margin">
			        <div class="section-sub-txt">
						본 웹사이트는 게시된 이메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를 이용하여 무단 수집되는 것을 거부합니다.<br><br><!-- 본 웹사이트는 게시된 이메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를 이용하여 무단 수집되는 것을 거부합니다. -->
						이를 위반 시 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』 등에 의해 처벌을 받을 수 있습니다.<!-- 이를 위반 시 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』 등에 의해 처벌을 받을 수 있습니다. -->
					</div>
		      	</div>
		    </div>
		    <div class="fixed-wrap fixed-wrap--multi-line border-none">
		      	<!-- checkbox 없는 경우 border-none class 추가 -->
		      	<div class="button-wrap">
		        	<button type="button" rel="modal:close" class="button button--active"><span class="button__text">확인</span></button> <!-- 확인 -->
		      	</div>
		    </div>
	    	<a href="#" rel="modal:close" class="modal__close"><span class="blind">닫기</span></a> <!-- 닫기 -->
	  	</div>
	  	
	</div>
</div>
		
		
		



	
		<div id="cookieAgreeBox" class="default-message default-message--main" data-default-message="">
			<div class="default-message__inner">
				<p class="default-message__text">더 원활한 사용을 위해 쿠키를 허용하고 제주항공 웹 사이트를 사용해주세요.</p>
				<button type="button" class="default-message__permit" id="cookieAgreeSign" data-no="0000000049">허용</button>
				<button type="button" class="default-message__close" aria-label="닫기"></button>
			</div>
		</div>
	

	</div>
</div>
<div id="toolTipModalLayer1" class="modal modal-full modal-scroll">
	<div class="modal-header">
		<div class="modal-header__title">프로모션 코드 사용 안내</div> <!-- 프로모션 코드 사용 안내 -->
	</div>	
	<div class="modal-content multi-bottom">
		<div class="terms-item">
			<ul class="list-guide">
				<li class="list-guide__item">사전에 안내된 프로모션 코드를 입력하고 항공권을 검색하면 할인된 가격이 적용된 항공편을 선택할 수 있습니다.</li> <!-- 사전에 안내된 프로모션 코드를 입력하고 항공권을 검색하면 할인된 가격이 적용된 항공편을 선택할 수 있습니다. --> 
				<li class="list-guide__item">사용 가능한 조건에 맞는 프로모션 코드를 입력해야 할인이 적용됩니다.</li>
<li class="list-guide__item">프로모션 코드가 없으신가요? <a href="/ko/event/event.do" style="color:#FF5000;text-decoration: underline;">진행중인 이벤트 확인하고 프로모션 코드 받으러가기</a></li> <!-- 사용 가능한 조건에 맞는 프로모션 코드를 입력해야 할인이 적용됩니다. -->
			</ul>
	    </div>
    </div>
    <a href="#" rel="modal:close" class="modal__close"><span class="blind">닫기</span></a> <!-- 닫기 -->
</div>
<div id="toolTipModalLayer2" class="modal modal-full modal-scroll"> 
	<div class="modal-header">
		<div class="modal-header__title">결제방법 안내</div> 
	</div>	
	<div class="modal-content">
		<div class="first-margin">
	        <p class="section-title">포인트 결제</p> 
			<ul class="list-guide large list-guide--narrow">
				<li class="list-guide__item">보유하고 있는 포인트로 항공권 예매가 가능하며, 부족한 포인트는 구매 후 사용할 수 있습니다.</li> 
				<li class="list-guide__item">유류할증료 및 공항이용료는 포인트로 결제하실 수 없습니다.</li> 
			</ul>
	    </div>
	    
	    
		    <div class="sub-section"> <!--class추가-->
		        <p class="section-title">기프티켓 결제</p> 
				<ul class="list-guide large list-guide--narrow">
					<li class="list-guide__item">사전에 등록된 기프티켓이 있으면 선택하여 사용 가능합니다</li> 
					<li class="list-guide__item">기프티켓은 항공권 운임에만 적용되며, 유류할증료 및 공항이용료와 부가서비스는 별도 결제가 필요합니다.</li> 
				</ul>
		    </div>
		
    </div>
    <a href="#" rel="modal:close" class="modal__close"><span class="blind">닫기</span></a> 
</div>
<!-- alert 팝업 -->
<div id="alertModalLayer" class="modal modal--simple">
<div class="modal-content"><p class="alert-text"></p></div>
<div class="modal__button-area button-wrap">
<button type="button" class="button button--secondary button--active" rel="modal:close" onclick="javascript:closeCurrentModal(this);"><span class="button__text">확인</span></button><!-- 확인 -->
</div><!-- 확인 -->
</div>
<!-- 컨펌 팝업 -->
<div id="confirmModalLayer" class="modal modal--simple">
<div class="modal-content"><h2 class="alert-title">알림</h2><p class="alert-text">로그인이 필요한 서비스입니다. 로그인해주세요!</p></div><!-- 로그인이 필요한 서비스입니다.로그인해주세요 -->
<div class="modal__button-area button-wrap">
<button type="button" class="button button--secondary" rel="modal:close" onclick="javascript:closeLoginModal(this);"><span class="button__text">취소</span></button><!-- 취소 -->
<button type="button" onclick="javascript:loginModal();" class="button button--secondary button--active add--ml-10"><span class="button__text">확인</span></button><!-- 확인 -->
</div>
<a href="javascript:void(0);" rel="modal:close" onclick="closeLoginModal(this)" class="modal__close"><span class="blind">닫기</span></a>
</div>

	
	





<div id="footer" class="footer pc-only">
	
    <!-- pc -->
    <footer class="footer__inner">
		<div class="footer__top">
			<div class="footer__top-item">
				<a href="javascript:void(0);" class="footer__top-link" data-action="menu" data-menu-name="about">회사소개</a>
			</div>
			
			<div class="footer__top-item">
				<a href="javascript:void(0);" class="footer__top-link" data-action="menu" data-menu-name="esg">ESG 경영</a>
			</div>
			
			
				<div class="footer__top-item">
					<a href="javascript:void(0);" class="footer__top-link" data-action="menu" data-menu-name="irNotice">투자정보</a>
				</div>
			
			
				<div class="footer__top-item">
					<a href="javascript:void(0);" class="footer__top-link" data-action="menu" data-menu-name="incruit">채용안내</a>
				</div>
			
			<div class="footer__top-item">
				<a href="javascript:void(0);" class="footer__top-link" data-action="menu" data-menu-name="carriageTemrs">여객운송약관</a>
			</div>
			<div class="footer__top-item">
				<a href="javascript:void(0);" class="footer__top-link" data-action="menu" data-menu-name="homepageTerms">홈페이지 이용약관</a>
			</div>
			<div class="footer__top-item footer__top-item--privacy">
				<a href="javascript:void(0);" class="footer__top-link" data-action="menu" data-menu-name="personalTerms">개인정보처리방침</a>
			</div>
			<div class="footer__top-item">
				<a href="javascript:void(0);" class="footer__top-link" data-action="menu" data-menu-name="sitemap">사이트맵</a>
			</div>
			
			<div class="footer__top-item footer__top-item--family">
				<div class="family-wrap" data-element="toggle" data-options="{&quot;mode&quot;: &quot;slide&quot;, &quot;speed&quot;: 100, &quot;clickToClose&quot;: true}">
					<button type="button" class="button-family" data-element="toggle__anchor" aria-controls="toggle-5" aria-expanded="false">Family Site</button>
					<div class="family-list" data-element="toggle__panel" id="toggle-5">
						<a href="javascript:void(0);" class="family-link" data-action="menu" data-menu-name="familyAekyung">㈜애경산업</a>
						<a href="javascript:void(0);" class="family-link" data-action="menu" data-menu-name="familyAtecltd">㈜에이텍</a>
						<a href="javascript:void(0);" class="family-link" data-action="menu" data-menu-name="familyAekyngst">애경S.T</a>
						<a href="javascript:void(0);" class="family-link" data-action="menu" data-menu-name="familyAkis">에이케이아이에스㈜</a>
						<a href="javascript:void(0);" class="family-link" data-action="menu" data-menu-name="familyAdmission">애드미션</a>
						<a href="javascript:void(0);" class="family-link" data-action="menu" data-menu-name="familyNeopharm">네오팜</a>
						<a href="javascript:void(0);" class="family-link" data-action="menu" data-menu-name="familyAkp">애경유화㈜</a>
						<a href="javascript:void(0);" class="family-link" data-action="menu" data-menu-name="familyAkc">애경화학㈜</a>
						<a href="javascript:void(0);" class="family-link" data-action="menu" data-menu-name="familyAkchemtech">에이케이켐텍</a>
						<a href="javascript:void(0);" class="family-link" data-action="menu" data-menu-name="familyKospa">코스파</a>
						<a href="javascript:void(0);" class="family-link" data-action="menu" data-menu-name="familyAkplaza">AK PLAZA</a>
						<a href="javascript:void(0);" class="family-link" data-action="menu" data-menu-name="familyAekyunggroup">AK홀딩스</a>
						<a href="javascript:void(0);" class="family-link" data-action="menu" data-menu-name="familyAkdjbcc">애경개발</a>
					</div>
				</div>
			</div>
			
		</div>
		<hr class="footer__spacer">
		<div class="footer__bottom">
			
			<div class="footer__bottom-contents">
			    
				
					<div class="footer__bottom-info">
						
							
							
								
							
							<div class="info-item">
								<a href="javascript:URL_LINK.getI18Url('/terms/page/transportationServicePlan.do');" class="link">항공교통이용자 서비스 계획</a>
							</div>
						
							
							
								
									
								
							
							<div class="info-item">
								<a href="javascript:URL_LINK.getI18Url('https://static.jejuair.net/hpgg/resources/pdf/Application_for_Damage_Redress.pdf');" class="link">항공교통이용자 피해구제 계획</a>
							</div>
						
							
							
								
							
							<div class="info-item">
								<a href="javascript:URL_LINK.getI18Url('https://www.avsec365.or.kr/');" class="link">항공위험물안내 </a>
							</div>
						
							
							
								
							
							<div class="info-item">
								<a href="javascript:URL_LINK.getI18Url('http://static.jejuair.net/cms/images/file_upload/20220628173251946.pdf');" class="link">항공안전투자공시</a>
							</div>
						
					</div>
				
				
				  
				
				<div class="footer__bottom-recommand">
				
					
					   
					<h5 class="recommand-title">제주항공이 추천하는 최저가 여행</h5>
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					<div class="recommand-list">
						
						<div class="recommand-item">
							<a href="https://www.jejuair.net/flights/ko-kr/" class="link">최저 운임 항공권</a>
						</div>
						
						<div class="recommand-item">
							<a href="https://www.jejuair.net/flights/ko-kr/flights-from-seoul" class="link">서울 출발 항공권</a>
						</div>
						
						<div class="recommand-item">
							<a href="https://www.jejuair.net/flights/ko-kr/flights-from-jeju" class="link">제주 출발 항공권</a>
						</div>
						
						<div class="recommand-item">
							<a href="https://www.jejuair.net/flights/ko-kr/flights-from-busan" class="link">부산 출발 항공권</a>
						</div>
						
						<div class="recommand-item">
							<a href="https://www.jejuair.net/flights/ko-kr/flights-from-muan" class="link">무안 출발 항공권</a>
						</div>
						
						<div class="recommand-item">
							<a href="https://www.jejuair.net/flights/ko-kr/flights-from-cheongju-si" class="link">청주 출발 항공권</a>
						</div>
						
						<div class="recommand-item">
							<a href="https://www.jejuair.net/flights/ko-kr/flights-from-daegu" class="link">대구 출발 항공권</a>
						</div>
						
						<div class="recommand-item">
							<a href="https://www.jejuair.net/flights/ko-kr/flights-from-gwangju" class="link">광주 출발 항공권</a>
						</div>
						
					</div>
					 
				</div>
				
				
				
				<div class="footer__bottom-util">
					<a href="javascript:void(0);" class="util-app-ios" data-action="menu" data-menu-name="iOSBtn"><img src="https://static.jejuair.net/hpgg/resources/images/icon/icon-footer-app-ios.png" alt="" loading="lazy"> IOS</a>
					<a href="javascript:void(0);" class="util-app-aos" data-action="menu" data-menu-name="AndroidBtn"><img src="https://static.jejuair.net/hpgg/resources/images/icon/icon-footer-app-aos.png" alt="" loading="lazy"> Android</a>
				</div>
				
				<p class="footer__bottom-address">
				    <font class="mr15">(주)제주항공</font>
					<span text="사업자등록번호 : 616-81-50527">사업자등록번호 : 616-81-50527</span>
					<font class="" text="대표이사:김이배">대표이사 : 김이배</font><br>
	            	제주특별자치도 제주시 신대로 64(연동, 건설공제회관 3층)
            	</p>
          		<p class="footer__bottom-copy" text="Copyright ⓒ JEJUAIR. All Rights Reserved." :="" 616-81-50527"="">Copyright ⓒ JEJUAIR. All Rights Reserved.</p>
          		
			</div>
		</div>
    </footer>
    <!-- //pc -->
 
 </div>


	<div id="modalLayer01" class="modal modal-full" data-width="380">
		<div class="modal-header">
			<div class="modal-header__title">프로모션 운임 규정 안내</div>
		</div>
		<div class="modal-content" style="min-height: 500px;">
		</div>
		<a href="#" rel="modal:close" class="modal__close"><span class="blind">닫기</span></a>
	</div>

	<div id="modalLangType" class="modal modal-full modal-scroll">
		<div class="modal-header">
			<div class="modal-header__title">지역 및 언어 설정</div>
		</div>
		<div class="modal-content">
			<div class="input-wrap input--line select-type">
				<div class="input-row input-row--label">
					<div class="input-label">지역 설정</div>
					<div class="input-item">
						<div class="input-box">
							<select title="지역 설정" class="select-default">
								<option>대한민국</option>
								<option>미국</option>
								<option>일본</option>
							</select>
						</div>
					</div>
				</div>
				<div class="input-row input-row--label">
					<div class="input-label">언어 설정</div>
					<div class="input-item">
						<div class="input-box">
							<select title="언어 설정" class="select-default">
								<option>한국어</option>
								<option>영어</option>
								<option>일어</option>
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="fixed-wrap">
			<div class="button-wrap button-wrap--stick">
				<button type="button" class="button button--primary button--active"><span class="button__text">확인</span></button>
			</div>
		</div>
		<a href="#" rel="modal:close" class="modal__close"><span class="blind">닫기</span></a>
	</div>


	
	












<div class="quick-menu mobile-only hide">
	<!-- D : 활성화 클래스 on -->
	<a href="javascript:void(0);" class="quick-menu__item n1 on" onclick="URL_LINK.getI18Url('/main/base/index.do')">
		
			
				<img src="https://static.jejuair.net/hpgg/resources/images/upload/icon_bottombar_home_on_56x2.png" alt="홈" loading="lazy">
			
			
		
		<!--2021-04-13 이미지로 변경-->
		<span>홈</span> <!-- 홈 -->
	</a>
	<a href="javascript:void(0);" class="quick-menu__item n2 " onclick="URL_LINK.getI18Url('/ibe/booking/Availability.do')">
		
			
			
				<img src="https://static.jejuair.net/hpgg/resources/images/upload/icon_bottom	bar_reservation_off_56x2.png" alt="항공권예매" loading="lazy">
			
		
		<!--2021-04-13 이미지로 변경-->
		<span>예매</span> <!-- 항공권예매 -->
	</a>
	<a href="javascript:void(0);" class="quick-menu__item n3 " onclick="URL_LINK.getI18Url('/ibe/checkin/viewCheckin.do')">
		
			
			
				<img src="https://static.jejuair.net/hpgg/resources/images/upload/icon_bottombar_mboardingpass_off_56x2.png" alt="모바일 탑승권" loading="lazy">
			
		
		<!--2021-04-13 이미지로 변경-->
		<span>모바일 탑승권</span> <!-- 모바일 탑승권 -->
	</a>
	<a href="javascript:void(0);" class="quick-menu__item n4 " onclick="URL_LINK.getI18Url('/additionalService/service/main.do')">
		
			
			
				<img src="https://static.jejuair.net/hpgg/resources/images/upload/icon_bottombar_service_off_56x2.png" alt="부가서비스" loading="lazy">
			
		
		<!--2021-04-13 이미지로 변경-->
		<span>부가서비스</span> <!-- 부가서비스 -->
	</a>
	<a href="javascript:void(0);" class="quick-menu__item n5 " onclick="URL_LINK.getI18Url('/member/mypage/main.do')">
		
			
			
				<img src="https://static.jejuair.net/hpgg/resources/images/upload/icon_bottombar_mypage_off_56x2.png" alt="마이페이지" loading="lazy">
			
		
		<!--2021-04-13 이미지로 변경-->
		<span>마이페이지</span> <!-- 마이페이지 -->
	</a>
</div>
</body>
<%@ include file="../common/include/footer.jsp" %>
</html>