<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<script>
function DepPlace() {//출발지 검색 버튼 액션
	  const depAirportLayer = document.getElementById('depAirportLayer');//출발지 선택 div
	  const AriAirportLayer = document.getElementById('AriAirportLayer');//도착지 선택 div
	  
	  if(depAirportLayer.style.display !== 'none') {
		  depAirportLayer.style.display = 'none';
	  }
	  else {
		  depAirportLayer.style.display = 'block';
		  AriAirportLayer.style.display = 'none';
		}
	}
function selectICN() {//출발지 선택후 출발지 텍스트에 담아주는 함수
	const Dep = document.getElementById('spanDepartureDesc');//출발지 텍스트
	const depAirportLayer = document.getElementById('depAirportLayer');
	const departureData = document.getElementById('departureData').value='ICN';//출발지 공항정보 히든태그
	Dep.innerHTML='서울(인천)'
	depAirportLayer.style.display = 'none';
}
function selectGMP() {//출발지 선택후 출발지 텍스트에 담아주는 함수
	const Dep = document.getElementById('spanDepartureDesc');//출발지 텍스트
	const depAirportLayer = document.getElementById('depAirportLayer');
	const departureData = document.getElementById('departureData').value='GMP';//출발지 공항정보 히든태그
	Dep.innerHTML='서울(김포)'
	depAirportLayer.style.display = 'none';
}

function AriPlace() {//도착지 검색 버튼 함수
	  const depAirportLayer = document.getElementById('depAirportLayer');//출발지 선택 div
	  const AriAirportLayer = document.getElementById('AriAirportLayer');//도착지 선택 div
	  const koplace = document.getElementById('koplace');//국내 행성지 div
	  var Dep = document.getElementById('spanDepartureDesc').innerHTML;

	  if(Dep == '서울(인천)'){
		  koplace.style.display = 'none';//출발지가 인천일땐 국내선 비행기가 없으므로 숨겨줌
	  }
	  if(Dep == '서울(김포)'){
		  koplace.style.display = 'block';//출발지가 김포 선택시 국내선 보여줌
	  }
	  if(AriAirportLayer.style.display !== 'none') {
		  AriAirportLayer.style.display = 'none';
	  }
	  else {
		  AriAirportLayer.style.display = 'block';
		  depAirportLayer.style.display = 'none';
		}
	}
function selectPUS() {//도착지 선택후 도착지 텍스트에 담아주는 함수
	const Ari = document.getElementById('spanArrivalDesc');//도착지 텍스트
	const AriAirportLayer = document.getElementById('AriAirportLayer');
	const arrivalData = document.getElementById('arrivalData').value='PUS';//도착지 공항정보 히든태그
	//console.log(arrivalData)
	Ari.innerHTML='부산'
	AriAirportLayer.style.display = 'none';
}
function selectCJU() {//도착지 선택후 도착지 텍스트에 담아주는 함수
	const Ari = document.getElementById('spanArrivalDesc');//도착지 텍스트
	const AriAirportLayer = document.getElementById('AriAirportLayer');
	const arrivalData = document.getElementById('arrivalData').value='CJU';//도착지 공항정보 히든태그
	//console.log(arrivalData)
	Ari.innerHTML='제주'
	AriAirportLayer.style.display = 'none';
}
function selectNRT() {//도착지 선택후 도착지 텍스트에 담아주는 함수
	const Ari = document.getElementById('spanArrivalDesc');//도착지 텍스트
	const AriAirportLayer = document.getElementById('AriAirportLayer');
	const arrivalData = document.getElementById('arrivalData').value='NRT';//도착지 공항정보 히든태그
	//console.log(arrivalData)
	Ari.innerHTML='도쿄(나리타)'
	AriAirportLayer.style.display = 'none';
}
function selectKIX() {//도착지 선택후 도착지 텍스트에 담아주는 함수
	const Ari = document.getElementById('spanArrivalDesc');//도착지 텍스트
	const AriAirportLayer = document.getElementById('AriAirportLayer');
	const arrivalData = document.getElementById('arrivalData').value='KIX';//도착지 공항정보 히든태그
	//console.log(arrivalData)
	Ari.innerHTML='오사카(간사이)'
	AriAirportLayer.style.display = 'none';
}
function person() {//인원 추가 div 여는 버튼
	const customerLayer = document.getElementById('customerLayer');
	customerLayer.style.display = 'block';
	
}
function SetPersonProc(){//인원추가후 확인 버튼 클릭
	const customerLayer = document.getElementById('customerLayer');
	const adtCount = document.getElementById('adtCount').value//어른수
	const chdCount = document.getElementById('chdCount').value//소아수
	const infCount = document.getElementById('infCount').value//유아수
	const personText = document.getElementById('personText')//인원분류와 명수 텍스트  
	
	console.log(adtCount)
	console.log(chdCount)
	console.log(infCount)
	personText.innerHTML="성인 : "+adtCount+"소아 : "+chdCount+"유아 : "+infCount
	customerLayer.style.display = 'none';
}
</script>
<%@ include file="../common/include/header.jsp"%>
	
		
		<div id="body">
			
			<!-- Google Tag Manager (noscript) -->
			<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PD2BQQ4" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
			<!-- End Google Tag Manager (noscript) -->
			
				<div class="main-ticketing round open">
					<div class="ticketing-in content-guide">
						<ul class="ticketing-type">
							<li class="item selected" data-triptype="RT"><a href="#" class="item-btn">왕복</a></li> <!-- 왕복 -->
							<li class="item" data-triptype="OW"><a href="#" class="item-btn">편도</a></li> <!-- 편도 --> 	
						</ul>
						
						<div class="ticketing-row-top single">
							<div class="ticketing-target">
								<button type="button" class="start js-target-pick active" onclick="DepPlace()"><span class="txt" id="spanDepartureDesc">출발지</span></button> <!-- 출발지 -->	
								<input type="hidden" id="departureData" value="">
								<button type="button" class="target js-target-pick active" onclick="AriPlace()"><span class="txt" id="spanArrivalDesc">도착지</span></button> <!-- 도착지 -->
								<input type="hidden" id="arrivalData">
								<button type="button" class="btn-open js-target-pick" data-route="DEP" id="btnExchangeRoute1"><span class="blind">열기</span></button> <!--열기-->
							</div>
							<div class="ticketing-date">													
								<button type="button" class="btn-date" id="btnDatePicker"><span class="txt">2022.12.08 (목)  ~ 2022.12.10 (토) </span></button>								
								<input type="hidden" id="departureDate" value="2022-12-08">
								<input type="hidden" id="arrivalDate" value="2022-12-10">
							</div>				
						</div>		
										
						<div class="ticketing-row-hidden single">
						
						<!-- 출발지 선택 -->
						
							<div class="flight-layer flight-start" id="depAirportLayer" style="display: none;">		
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
										</div>														
										<div data-element="tab__panel" class="tab__panel is-active" aria-labelledby="selectTab01" role="tabpanel" tabindex="0">
											<div data-element="tab">
												<div class="tab__button-wrap">
													<div class="tag-list" data-scroll="x" name="latelySearch">
														<div class="tag-list__item tag-list__item--tag" data-element="tab__list" role="presentation">
														<button type="button" name="btnLatelyAirport" class="tag-list__text">오사카(간사이)
														<span class="airport" style="display: none;">KIX</span>
														</button>
														<button type="button" class="tag-list__remove" onclick="javascript:deletelatelySearch(this);">
														<span class="hidden">적용할 조건을 선택해 주세요.</span>
														</button>
														</div>
														<div class="tag-list__item tag-list__item--tag" data-element="tab__list" role="presentation">
														<button type="button" name="btnLatelyAirport" class="tag-list__text">도쿄(나리타)
														<span class="airport" style="display: none;">NRT</span>
														</button>
														<button type="button" class="tag-list__remove" onclick="javascript:deletelatelySearch(this);">
														<span class="hidden">적용할 조건을 선택해 주세요.</span>
														</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="main--destination-select">
										<hr class="booking-line">
										<div data-element="tab" class="tab tab--vertical tab--booking">
											<div class="tab__buttons vertical_scroll_set" id="divDepArea">
												<div data-element="tab__list" class="tab__button" role="presentation"><button type="button" tabindex="" data-element="tab__anchor" role="tab" data-index="0" id="plugin-DEPtab-2" class="tab__anchor is-active" aria-selected="true" aria-expanded="true">대한민국</button></div>
											</div>
											<div class="tab__panel-wrap scrollbar-inner" data-element="tab__panel-wrap">
											<div data-element="tab__panel" class="tab__panel is-active" aria-labelledby="plugin-DEPtab-2" role="tabpanel" tabindex="0" style="display: block;">
											<div class="choise">
												<button type="button" class="choise__button" onclick="selectICN()">
												<span class="stationName">서울(인천)</span>
												<span class="airport">ICN</span>
												</button>
											</div>
											<div class="choise">
												<button type="button" class="choise__button" onclick="selectGMP()">
												<span class="stationName">서울(김포)</span>
												<span class="airport">GMP</span>
												</button>
											</div>
											</div>
											</div>
										
								<div class="map-list">
									<div class="map-wrap">
										<div id="map-start" class="flight-map"></div>
										
									</div>
									<button type="button" class="floating-button btn-list" onclick="viewTabMap('start', 'list')">
										<span class="hidden">리스트보기</span> <!-- 리스트보기 -->
									</button>
								</div>
								<a href="#a" class="layer-close on"><span class="blind">닫기</span></a> <!-- 닫기 -->		 	
							</div>				
							
							<div class="date-layer" id="dateLayer" style="display: none;">
								<div class="layer-header">								
									<button type="button" class="header__button" name="header_btn">
									<span class="hidden">이전으로</span> <!-- 이전으로 -->
									</button>								
									<h2 class="customer-layer__title">언제 떠나세요?</h2> <!-- 언제 떠나세요? -->	
								</div>								
								<div class="layer-content">
									<div class="picker picker--full"> 
										<div class="info-wrap"><span class="info">1인 편도 운임 기준</span><span class="currency" name="currency">통화 : 원</span></div> <!-- 1인 편도 운임  기준 -->
										<div class="flatpickr-wrapper"><input type="text" class="picker__input flatpickr-input" id="selectDate" data-picker="range" data-text="1인 편도 운임 기준" data-locale="ko" data-min-date="today" data-format="Y.m.d (D)" data-selected="" data-range-text="{&quot;start&quot;: &quot;가는 날&quot;, &quot;end&quot;: &quot;오는날&quot;, &quot;current&quot;: &quot;왕복&quot;}" readonly="readonly"><div class="flatpickr-calendar rangeMode animate multiMonth inline" tabindex="-1" style=""><div class="flatpickr-months"><span class="flatpickr-prev-month"></span><div class="flatpickr-month"><div class="flatpickr-current-month"><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year" min="2022"><span class="arrowUp"></span><span class="arrowDown"></span></div><span class="cur-month">12월 </span></div></div><div class="flatpickr-month"><div class="flatpickr-current-month"><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year" min="2022"><span class="arrowUp"></span><span class="arrowDown"></span></div><span class="cur-month">1월 </span></div></div><span class="flatpickr-next-month"></span></div><div class="flatpickr-innerContainer"><div class="flatpickr-rContainer"><div class="flatpickr-weekdays"><div class="flatpickr-weekdaycontainer">
<span class="flatpickr-weekday">
일</span>
</div></div></div></div></div></div>
									</div>
									<div class="booking-button cal-button">
										<button type="button" class="button button--primary button--active" data-select-date="#selectDate" rel="modal:close">
											<span class="button__text">선택</span> <!-- 선택 -->
										</button>              
									</div>
								</div>
								<a href="#a" class="layer-close on"><span class="blind">닫기</span></a> <!-- 닫기 -->
							</div>
																		
							</div>
							</div>
							</div>
							
							
							<!-- 도착지 선택 -->
							
							<div class="flight-layer flight-start" id="AriAirportLayer" style="display: none;">		
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
										</div>														
										<div data-element="tab__panel" class="tab__panel is-active" aria-labelledby="selectTab01" role="tabpanel" tabindex="0">
											<div data-element="tab">
												<div class="tab__button-wrap">
													<div class="tag-list" data-scroll="x" name="latelySearch">
														<div class="tag-list__item tag-list__item--tag" data-element="tab__list" role="presentation">
														<button type="button" name="btnLatelyAirport" class="tag-list__text">오사카(간사이)
														<span class="airport" style="display: none;">KIX</span>
														</button>
														<button type="button" class="tag-list__remove" onclick="javascript:deletelatelySearch(this);">
														<span class="hidden">적용할 조건을 선택해 주세요.</span>
														</button>
														</div>
														<div class="tag-list__item tag-list__item--tag" data-element="tab__list" role="presentation">
														<button type="button" name="btnLatelyAirport" class="tag-list__text">도쿄(나리타)
														<span class="airport" style="display: none;">NRT</span>
														</button>
														<button type="button" class="tag-list__remove" onclick="javascript:deletelatelySearch(this);">
														<span class="hidden">적용할 조건을 선택해 주세요.</span>
														</button>
														</div>
													</div>
												</div>
											</div>
										</div>
																								
									</div>
									<div class="main--destination-select">
										<hr class="booking-line">
										<div data-element="tab" class="tab tab--vertical tab--booking">
											<div class="tab__buttons vertical_scroll_set" id="divDepArea">
												<div data-element="tab__list" class="tab__button" role="presentation"><button type="button" tabindex="" data-element="tab__anchor" role="tab" data-index="0" id="plugin-DEPtab-2" class="tab__anchor is-active" aria-selected="true" aria-expanded="true">대한민국</button></div>
												<div data-element="tab__list" class="tab__button" role="presentation"><button type="button" id="plugin-DEPtab-3" class="tab__anchor">일본</button></div>
											</div>
											<div class="tab__panel-wrap scrollbar-inner" data-element="tab__panel-wrap">
											<div data-element="tab__panel" id="koplace" class="tab__panel is-active" aria-labelledby="plugin-DEPtab-2" role="tabpanel" tabindex="0" style="display: block;">
											<div class="choise">
												<button type="button" class="choise__button" onclick="selectPUS()">
												<span class="stationName">부산</span>
												<span class="airport">PUS</span>
												</button>
											</div>
											<div class="choise">
												<button type="button" class="choise__button" onclick="selectCJU()">
												<span class="stationName">제주</span>
												<span class="airport">CJU</span>
												</button>
											</div>
											</div>
											<div data-element="tab__panel" class="tab__panel is-active" aria-labelledby="plugin-DEPtab-3" role="tabpanel" tabindex="0" style="">
											<div class="choise">
												<button type="button" class="choise__button" onclick="selectNRT()">
												<span class="stationName">도쿄(나리타)</span>
												<span class="airport">NRT</span>
												</button>
											</div>
											<div class="choise">
												<button type="button" class="choise__button" onclick="selectKIX()">
												<span class="stationName">오사카(간사이)</span>
												<span class="airport">KIX</span>
												</button>
											</div>									
											</div>
								</div>
								<div class="map-list">
									<div class="map-wrap">
										<div id="map-start" class="flight-map"></div>
										
									</div>
									<button type="button" class="floating-button btn-list" onclick="viewTabMap('start', 'list')">
										<span class="hidden">리스트보기</span> <!-- 리스트보기 -->
									</button>
								</div>
								<a href="#a" class="layer-close on"><span class="blind">닫기</span></a> <!-- 닫기 -->		 	
							</div>				
							
							<div class="date-layer" id="dateLayer" style="display: none;">
								<div class="layer-header">								
									<button type="button" class="header__button" name="header_btn">
									<span class="hidden">이전으로</span> <!-- 이전으로 -->
									</button>								
									<h2 class="customer-layer__title">언제 떠나세요?</h2> <!-- 언제 떠나세요? -->	
								</div>								
								<div class="layer-content">
									<div class="picker picker--full"> 
										<div class="info-wrap"><span class="info">1인 편도 운임 기준</span><span class="currency" name="currency">통화 : 원</span></div> <!-- 1인 편도 운임  기준 -->
										<div class="flatpickr-wrapper"><input type="text" class="picker__input flatpickr-input" id="selectDate" data-picker="range" data-text="1인 편도 운임 기준" data-locale="ko" data-min-date="today" data-format="Y.m.d (D)" data-selected="" data-range-text="{&quot;start&quot;: &quot;가는 날&quot;, &quot;end&quot;: &quot;오는날&quot;, &quot;current&quot;: &quot;왕복&quot;}" readonly="readonly"><div class="flatpickr-calendar rangeMode animate multiMonth inline" tabindex="-1" style=""><div class="flatpickr-months"><span class="flatpickr-prev-month"></span><div class="flatpickr-month"><div class="flatpickr-current-month"><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year" min="2022"><span class="arrowUp"></span><span class="arrowDown"></span></div><span class="cur-month">12월 </span></div></div><div class="flatpickr-month"><div class="flatpickr-current-month"><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year" min="2022"><span class="arrowUp"></span><span class="arrowDown"></span></div><span class="cur-month">1월 </span></div></div><span class="flatpickr-next-month"></span></div><div class="flatpickr-innerContainer"><div class="flatpickr-rContainer"><div class="flatpickr-weekdays"><div class="flatpickr-weekdaycontainer">
<span class="flatpickr-weekday">
일</span>
</div></div></div></div></div></div>
									</div>
									<div class="booking-button cal-button">
										<button type="button" class="button button--primary button--active" data-select-date="#selectDate" rel="modal:close">
											<span class="button__text">선택</span> <!-- 선택 -->
										</button>              
									</div>
								</div>
								<a href="#a" class="layer-close on"><span class="blind">닫기</span></a> <!-- 닫기 -->
							</div>
																		
							</div>
							</div>
							</div>
							<div class="customer-layer" id="customerLayer" style="display: none;">
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
												<p class="text__small text--color-gray" name="chdMsg">국제선 기준 만 2세~12세 미만<br>(최초 출발일 기준)</p><!-- 국제선 기준<br>만 2세 ~ 만 12세 미만 -->
											</div>						
											<div class="input-row input-row--number input-row--icon">																
												<label for="infCount" class="input__label">유아</label> <!-- 유아 -->
												<div data-element="form" class="input input--number is-active">
												<button type="button" data-element="number__button" data-type="decrease" class="input__number input__number-minus" aria-label="빼기" disabled=""></button> <!-- 빼기 -->
												<input type="text" id="infCount" placeholder="숫자입력" data-element="number__input" value="0" data-max="9" data-min="0" data-string-number="" class="input__number"> <!-- 숫자입력 -->
												<button type="button" id="btnInfCount" onclick="javascript:chkInfCount('');" data-element="number__button" data-type="increase" class="input__number input__number-plus" aria-label="더하기"></button> <!-- 더하기 -->
												</div>
												<p class="text__small text--color-gray" name="infantDesc">생후 14일 이상~만 2세 미만<br>(만 24개월 미만/최종 탑승일 기준)<br>유아의 여정이 동반 성인과 일치하지 않으면 환불 후 재구매해야 합니다.</p> <!-- 생후 7일 이상~만 2세 미만<br>(만 24개월 미만) -->
											</div>															
										</div>
									</div>
																
								</div>
								<div class="fixed-wrap fixed-wrap--multi-line border-none">
									<div class="button-wrap">
										<button type="button" class="button button--active" name="btnSetPassenger" onclick="SetPersonProc()"><span class="button__text">선택 완료</span></button> <!-- 선택 완료 -->
									</div>													
								</div>
									<a href="#a" class="layer-close on"><span class="blind">닫기</span></a> <!-- 닫기 -->
								</div>
							
											
																						
										<div class="ticketing-row-bot">
											<div class="ticketing-row-sub">
												<div class="ticketing-people">
													<button type="button" class="btn-passengers" id="personText" onclick="person()"><span id="personText" class="txt" >성인1</span></button><!-- 성인1 -->
												</div>
												<div class="payment">
												<div class="payment-head">
													<div class="payment-tit">결제 방법</div> <!-- 결제 방법 -->
													<span class="tooltip">
														<button type="button" class="tooltip__button" data-element="modal_anchor" data-target="#toolTipModalLayer2" data-modal-type="full"></button>	
													</span>
												</div>
												
												</div>
											</div>
											<div class="ticketing-row-sub">
												
												<div class="g-ticket" style="display: none;">
													<select class="g-ticket-select" id="selectGifticket"></select>																																												
													<div class="g-ticket-select nodata" style="display:none;" name="nodataGift">선택 가능한 기프티켓이 없습니다.</div>
													<a href="/ko/additionalService/service/gifticket.do" target="_blank" class="go-detail" name="nodataGift" style="display:none;">기프티켓 자세히 보기 &gt;</a><!-- 선택 가능한 기프티켓이 없습니다. 기프티켓 자세히 보기  -->													
												</div>						
												<button type="button" id="searchFlight" onclick="javascript:setSearchAvailParam(true);" class="btn-flight-sch-again">항공권 검색</button> <!-- 항공권  검색 -->
											</div>
										</div>
									</div>
								</div>
				
				
		</div>
		
		<%@ include file="../common/include/footer.jsp"%>