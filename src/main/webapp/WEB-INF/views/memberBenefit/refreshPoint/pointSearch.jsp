<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="">
<%@ include file="../../common/include/header.jsp" %>
<div id="body">
		
		<!-- Google Tag Manager (noscript) -->
		<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PD2BQQ4" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
		<!-- End Google Tag Manager (noscript) -->

		<div class="wrap NC_1">
			
			
				<div id="breadcrumb" class="breadcrumb pc-only" aria-label="breadcrumb">
					<nav class="breadcrumb__inner">
						<div class="breadcrumb__item">
							<a href="javascript:;" class="breadcrumb__link" style="cursor: default;">홈</a>
						</div>
						
						
							
								
									<div class="breadcrumb__item">
										<a href="javascript:;" class="breadcrumb__link" style="cursor: default;">회원 혜택 안내</a>
									</div>
								
								
							
						
							
								
								
									<div class="breadcrumb__item breadcrumb__item--current" aria-current="page" data-element="toggle" data-options="{&quot;mode&quot;: &quot;slide&quot;, &quot;speed&quot;: 100, &quot;clickToClose&quot;: true}">
										
											
										
											
										
											
										
											
										
											
												<button type="button" class="breadcrumb__link breadcrumb__link--list" data-element="toggle__anchor" aria-controls="toggle-2" aria-expanded="false">포인트 조회</button>
											
										
											
										
											
										
											
										

										<div class="breadcrumb__siblings-list" data-element="toggle__panel" id="toggle-2">
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/additionalService/service/gifticket.do')">기프티켓</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/memberBenefit/regCoupon.do')">쿠폰 등록</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/main.do')">리프레시 포인트</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/pointBuy.do')">포인트 구매</a>
												
											
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/pointUse.do')">포인트 사용</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/memberBenefit/memberBenefit.do?param=newMember ')">신규회원 혜택</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/memberBenefit/memberBenefit.do?param=promotion')">프로모션 코드</a>
												
											
										</div>
									</div>
								
							
						
						
					</nav>
				</div>
			
	
			
			<div class="content" id="content">
				<main id="main" class="main ">
					
					<form id="frm" name="frm">
		<input type="hidden" id="apiRequestType" name="apiRequestType" value="Q01">
		<input type="hidden" id="ffpNo" name="ffpNo" value="093563097">
		<input type="hidden" id="offerType" name="offerType" value="JPNT">
		<input type="hidden" id="pageNo" name="pageNo" value="1">
		<input type="hidden" id="perPageCnt" name="perPageCnt" value="10">
		<input type="hidden" id="language" name="language" value="KR">
		<input type="hidden" id="fromDate" name="fromDate" value="20220815">
		<input type="hidden" id="toDate" name="toDate" value="20221114">
		<input type="hidden" id="lang" name="lang" value="ko">
		<input type="hidden" id="userId" name="userId" value="kmb930729">
		<input type="hidden" id="pgTxId" name="pgTxId" value="">
		<input type="hidden" id="ffptradeid" name="ffptradeid" value="">
		<input type="hidden" id="transObject" name="transObject" value="">
		<input type="hidden" id="usableEarnPoint" name="usableEarnPoint" value="1000">
		<input type="hidden" id="cultureCd" name="cultureCd" value="ko-KR">
		<input type="hidden" id="cstPlatform" name="cstPlatform" value="test">
		<input type="hidden" id="serverMode" name="serverMode" value="prod">
	</form>
	<div class="page-title-wrap">
	
	
          <div class="page-title">포인트 조회</div>
            <div class="page-sub-title">나의 포인트 사용 내역을 확인해 보세요.</div>
          </div>
          <div class="new-top-wrap refresh_point_searh">
            <div class="new-top-box">
              <div class="new-top-box__inner">
                <div class="pc-left">
                  <div class="mypage__grade">
	              	
						
							<span class="grade silver" aria-label="silver"></span>
						
						
						
						
						
					
                  </div>
                  <div class="link-wrap link-wrap--arrow">
	              	
						
							<a href="javascript:void(0);" onclick="MEMBER_LOGIN_LOGIN_SCRIPT.popup();" class="link-wrap__text"><span><em id="nameText">강모범</em> SILVER</span></a>
						
						
						
						
						
					
                    
                  </div>
                </div>
                <div class="pc-right">
                  <div class="pc-box">
                    <div class="mypage__point">
                      <strong class="mypage__point--title ">사용가능 포인트</strong>
                      <span>
                      	&nbsp;1,000P
					  </span>
                    </div>
                  </div>
                  <div class="table-toggle">
                    <div class="toggle" data-element="toggle" data-options="{&quot;mode&quot;: &quot;slide&quot;}">
                      <div class="toggle__panel" data-element="toggle__panel" id="toggle-3" style="display: none;">
                        <div class="box-point-list">
                          <ul class="member-point__list">
                            <li class="accumlate-point"><span class="text-title">등급 산정 탑승</span><strong class="text-desc">
								0.0회
							</strong></li>
                            <li><span class="text-title">등급 산정 포인트</span><strong class="text-desc">
								0P
							</strong></li><!--20210609 문구 수정-->
                            <li><span class="text-title">1개월 내 소멸 예정</span><strong class="text-desc">
								0P
							 </strong></li>
                            <li><span class="text-title">등급 산정 기간</span><strong id="fromToDay" class="text-desc">2019.11.01 ~ 2022.10.31</strong></li>
                          </ul>
                          <div class="button-wrap">
                            <button id="goMyBoarding" onclick="URL_LINK.getI18Url('/member/mypage/myFlightList.do')" type="button" class="button button--optional"><span class="button__text">나의 탑승 내역</span></button>
                          </div>
                        </div>
                      </div>
                      <button type="button" class="toggle__button arrow" data-element="toggle__anchor" aria-label="더보기" aria-controls="toggle-3" aria-expanded="false"></button>
                    </div>
                  </div>
                  
                </div>
              </div>
            </div>
          </div>

          <div class="section-wrap pc-single-line">
            <div class="tab tab--square tab--square-cols3 tab--square-small">
              <div class="tab__buttons">
                <div class="tab__button">
                  <button type="button" id="oneMonth" name="btnMonth" class="tab__anchor" value="2022.10.14">1개월</button>
                </div>
                <div class="tab__button">
                  <button type="button" id="threeMonth" name="btnMonth" class="tab__anchor  is-active" value="2022.08.14">3개월</button><!-- active시 is-active class 추가 -->
                </div>
                <div class="tab__button">
                  <button type="button" id="sixMonth" name="btnMonth" class="tab__anchor" value="2022.05.14">6개월</button>
                </div>
              </div>
            </div>

            <div class="input-wrap input--line">

							
						
																											
														
						
						
						<input type="hidden" id="inquiryStartDt" value="2022.08.15">
						<input type="hidden" id="inquiryEndDt" value="2022.11.14">

              <div class="input-row input-row--dash">
                <div class="input-item"><!--error시 .input--error 추가-->
                  <div class="input-label label-top">날짜선택</div>
                  <div class="input-box">
                    <button type="button" id="fromDatepicker" class="picker picker--button" data-element="modal_anchor" data-modal-type="datepicker" data-target="#datepicker01">2022.08.15(월)</button>
                  </div>
                  <p tabindex="0" class="input__error">에러메세지 따로따로</p>
                </div>
                <div class="input-item"><!--error시 .input--error 추가-->
                  <div class="input-box">
                    <button type="button" id="toDatepicker" class="picker picker--button" data-element="modal_anchor" data-modal-type="datepicker" data-target="#datepicker02">2022.11.14(월)</button>
                  </div>
                  <p tabindex="0" class="input__error">에러메세지 따로따로</p>
                </div>
              </div>
            </div>
            <div class="button-wrap button-wrap--center">
              <button type="button" id="btnSearch" class="button button--optional">
              	<span class="button__text">조회</span>
              </button>
            </div>
          </div>

          <!-- 조회리스트 -->
          <div class="section-wrap point">
            <!--<div data-element="tab" data-options="{&quot;linkedTab&quot;: &quot;#linkedTab&quot;}"
              class="tab tab--default">
              <div class="tab__buttons">
                <div data-element="tab__list" class="tab__button">
                  <button type="button" data-element="tab__anchor" class="tab__anchor is-active">내역</button>
                </div>
              </div>
            </div>-->

            <div id="linkedTab" data-element="tab__link" class="linked-tab">
              <div data-element="tab__panel" class="tab__panel tab__panel--pat20">
                <div data-element="tab" class="tab tab--2depth">
                  <!-- <div class="tab__buttons">
                    <div data-element="tab__list" class="tab__button">
                      <button type="button" data-element="tab__anchor" class="tab__anchor is-active">3개월</button>
                    </div>
                    <div data-element="tab__list" class="tab__button">
                      <button type="button" data-element="tab__anchor" class="tab__anchor">6개월</button>
                    </div>
                    <div data-element="tab__list" class="tab__button">
                      <button type="button" data-element="tab__anchor" class="tab__anchor">날짜선택</button>
                    </div>
                    <div data-element="tab__list" class="tab__button">
                      <button type="button" data-element="tab__anchor" class="tab__anchor">에러메세지 따로따로</button>
                    </div>
                    <div data-element="tab__list" class="tab__button">
                      <button type="button" data-element="tab__anchor" class="tab__anchor">에러메세지 따로따로</button>
                    </div>
                    <div data-element="tab__list" class="tab__button">
                      <button type="button" data-element="tab__anchor" class="tab__anchor">조회</button>
                    </div>
                  </div> -->  <!--20201-07-08 탭모양수정-->


                  
                  <div class="select-chips full swiper-container swiper-container-initialized swiper-container-horizontal">
                    <ul class="chips-group swiper-wrapper">
                      <li class="chip swiper-slide swiper-slide-active">
                        <button type="button" class="chip-btn checked is-active" data-val="Q01" data-index="0" data-element="tab__anchor" id="plugin-tab-5" role="tab" tabindex="" aria-selected="true" aria-expanded="true">
                          <span class="txt">전체</span>
                        </button>
                      </li>
                      <li class="chip swiper-slide swiper-slide-next">
                        <button type="button" class="chip-btn" data-val="Q02" data-index="1" data-element="tab__anchor" id="plugin-tab-6" role="tab" tabindex="" aria-selected="false" aria-expanded="false">
                          <span class="txt">적립</span>
                        </button>
                      </li>
                      <li class="chip swiper-slide">
                        <button type="button" class="chip-btn" data-val="Q04W" data-index="2" data-element="tab__anchor" id="plugin-tab-7" role="tab" tabindex="" aria-selected="false" aria-expanded="false">
                          <span class="txt">구매</span>
                        </button>
                      </li>
                      <li class="chip swiper-slide">
                        <button type="button" class="chip-btn" data-val="Q03" data-index="3" data-element="tab__anchor" id="plugin-tab-8" role="tab" tabindex="" aria-selected="false" aria-expanded="false">
                          <span class="txt">사용</span>
                        </button>
                      </li>
                      <li class="chip swiper-slide">
                        <button type="button" class="chip-btn" data-val="Q05" data-index="4" data-element="tab__anchor" id="plugin-tab-9" role="tab" tabindex="" aria-selected="false" aria-expanded="false">
                          <span class="txt">선물</span>
                        </button>
                      </li>
                      <li class="chip swiper-slide">
                        <button type="button" class="chip-btn" data-val="Q06" data-index="5" data-element="tab__anchor" id="plugin-tab-10" role="tab" tabindex="" aria-selected="false" aria-expanded="false">
                          <span class="txt">양도</span>
                        </button>
                      </li>
                    </ul>
                  <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>





                  <!-- 전체 -->
                  <div data-element="tab__panel" class="tab__panel is-active" aria-labelledby="plugin-tab-5" role="tabpanel" tabindex="0">
                    <div id="tabAll" class="result-box result-box--point result-box--col3">	<div class="result-box-item">                                            	  <div class="result-box__header">                                        	    <p class="result-box__point">+ 1,000P</p>                           	    <div class="flex-text__additional">2022.11.13</div>                   	  </div>                                                                  	  <div class="result-box__content">                                       	    <div class="flex-text">                                               	      <div class="flex-text__point" name="ftpDiv0">                    	        <p class="flex-text__point-title">(적립) 이벤트참여</p>                         	        <p class="flex-text__point-text">이벤트참여: 2022.11.13, 회원가입</p>                        	        <p class="flex-text__point-text end_date">소멸일자 : 2025.11.13</p>  	      </div>                                                              	    </div>                                                                	  </div>                                                                  	</div>                                                                    </div>
                    <!-- //전체 -->

                    <!--  조회 내역이 없을 경우 노출 -->
                    <div class="finish-item-wrap noSearch" style="display:none;">
                      <div class="finish-item nothing">
                        <div class="finish-item__img">
                          <img src="https://static.jejuair.net/hpgg/resources/images/icon/icon-result-none.png" alt="">
                        </div>
                        <p class="finish-item__title">조회 결과가 없습니다.</p>
                      </div>
                    </div>
                    <!--  //조회 내역이 없을 경우 노출 -->
                  </div>

                  <!-- 적립 -->
                  <div data-element="tab__panel" class="tab__panel" style="display:none;" aria-labelledby="plugin-tab-6" role="tabpanel" tabindex="0">
                    <div id="tab1" class="result-box result-box--point result-box--col3"></div>
					<!--  조회 내역이 없을 경우 노출 -->
                    <div class="finish-item-wrap noSearch" style="display:none;">
                      <div class="finish-item nothing">
                        <div class="finish-item__img">
                          <img src="https://static.jejuair.net/hpgg/resources/images/icon/icon-result-none.png" alt="">
                        </div>
                        <p class="finish-item__title">조회 결과가 없습니다.</p>
                      </div>
                    </div>
                    <!--  //조회 내역이 없을 경우 노출 -->
				  </div>
                  <!-- //적립 -->

                  <!-- 구매 -->
                  <div data-element="tab__panel" class="tab__panel" style="display:none;" aria-labelledby="plugin-tab-7" role="tabpanel" tabindex="0">
                    <div id="tab2" class="result-box result-box--point result-box--col3"></div>
					<!--  조회 내역이 없을 경우 노출 -->
                    <div class="finish-item-wrap noSearch" style="display:none;">
                      <div class="finish-item nothing">
                        <div class="finish-item__img">
                          <img src="https://static.jejuair.net/hpgg/resources/images/icon/icon-result-none.png" alt="">
                        </div>
                        <p class="finish-item__title">조회 결과가 없습니다.</p>
                      </div>
                    </div>
                    <!--  //조회 내역이 없을 경우 노출 -->
				  </div>
                  <!-- //구매 -->

                  <!-- 사용 -->
                  <div data-element="tab__panel" class="tab__panel" style="display:none;" aria-labelledby="plugin-tab-8" role="tabpanel" tabindex="0">
                    <div id="tab3" class="result-box result-box--point result-box--col3"></div>
					<!--  조회 내역이 없을 경우 노출 -->
                    <div class="finish-item-wrap noSearch" style="display:none;">
                      <div class="finish-item nothing">
                        <div class="finish-item__img">
                          <img src="https://static.jejuair.net/hpgg/resources/images/icon/icon-result-none.png" alt="">
                        </div>
                        <p class="finish-item__title">조회 결과가 없습니다.</p>
                      </div>
                    </div>
                    <!--  //조회 내역이 없을 경우 노출 -->
				  </div>
                  <!-- //사용 -->

                  <!-- 선물 -->
                  <div data-element="tab__panel" class="tab__panel" style="display:none;" aria-labelledby="plugin-tab-9" role="tabpanel" tabindex="0">
                    <div id="tab4" class="result-box result-box--point result-box--col3"></div>
					<!--  조회 내역이 없을 경우 노출 -->
                    <div class="finish-item-wrap noSearch" style="display:none;">
                      <div class="finish-item nothing">
                        <div class="finish-item__img">
                          <img src="https://static.jejuair.net/hpgg/resources/images/icon/icon-result-none.png" alt="">
                        </div>
                        <p class="finish-item__title">조회 결과가 없습니다.</p>
                      </div>
                    </div>
                    <!--  //조회 내역이 없을 경우 노출 -->
				  </div>
                  <!-- //선물 -->

                  <!-- 안내 -->
                  <div data-element="tab__panel" class="tab__panel" style="display:none;" aria-labelledby="plugin-tab-10" role="tabpanel" tabindex="0">
                    <div id="tab5" class="result-box result-box--point result-box--col3"></div>
					<!--  조회 내역이 없을 경우 노출 -->
                    <div class="finish-item-wrap noSearch" style="display:none;">
                      <div class="finish-item nothing">
                        <div class="finish-item__img">
                          <img src="https://static.jejuair.net/hpgg/resources/images/icon/icon-result-none.png" alt="">
                        </div>
                        <p class="finish-item__title">조회 결과가 없습니다.</p>
                      </div>
                    </div>
                    <!--  //조회 내역이 없을 경우 노출 -->
				  </div>
                  <!-- //안내 -->
                </div>
              </div>
            </div>
          </div>
          <!-- //조회리스트 -->
          
          <div data-show="true" class="more-wrap">
            <button type="button" id="btnMore" class="more__button" style="display: none;"><span class="more__button-text">더보기</span></button>
          </div>

          <!-- 소멸 포인트 안내 -->
          <div class="section-wrap">
            <div class="arrow-list">
              <a href="#" class="arrow-list__item" data-element="modal_anchor" data-target="#modalLayer01" data-modal-type="full">
                <span class="arrow-list__text">소멸 포인트 안내</span>
              </a>
            </div>
          </div>
          <!-- //소멸 포인트 안내 -->

          <!-- 날짜 선택 -->
          <div id="datepicker01" class="modal modal-full modal-full--picker">
            <div class="modal-header">
              <h2 class="header__page-name">날짜를 선택해 주세요.</h2>
            </div>

            <div class="modal-content">
              <div class="picker picker--full">
                <div class="flatpickr-wrapper"><input type="text" class="picker__input flatpickr-input" id="selectDate" data-locale="ko" data-default-date="[2022.08.15]" data-picker="single" readonly="readonly"><div class="flatpickr-calendar animate multiMonth inline" tabindex="-1" style=""><div class="flatpickr-months"><span class="flatpickr-prev-month"></span><div class="flatpickr-month"><div class="flatpickr-current-month"><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year"><span class="arrowUp"></span><span class="arrowDown"></span></div><span class="cur-month">8월 </span></div></div><div class="flatpickr-month"><div class="flatpickr-current-month"><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year"><span class="arrowUp"></span><span class="arrowDown"></span></div><span class="cur-month">9월 </span></div></div><span class="flatpickr-next-month"></span></div><div class="flatpickr-innerContainer"><div class="flatpickr-rContainer"><div class="flatpickr-weekdays"><div class="flatpickr-weekdaycontainer">
    <span class="flatpickr-weekday">
    일</span><span class="flatpickr-weekday">월</span><span class="flatpickr-weekday">화</span><span class="flatpickr-weekday">수</span><span class="flatpickr-weekday">목</span><span class="flatpickr-weekday">금</span><span class="flatpickr-weekday">토
    </span>
    </div><div class="flatpickr-weekdaycontainer">
    <span class="flatpickr-weekday">
    일</span><span class="flatpickr-weekday">월</span><span class="flatpickr-weekday">화</span><span class="flatpickr-weekday">수</span><span class="flatpickr-weekday">목</span><span class="flatpickr-weekday">금</span><span class="flatpickr-weekday">토
    </span>
    </div></div><div class="flatpickr-days" tabindex="-1"><div class="dayContainer"><span class="flatpickr-day prevMonthDay hidden sun" aria-label="20220731" tabindex="-1">31<span class="date" aria-hidden="true">31</span></span><span class="flatpickr-day mon" aria-label="20220801" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day tue" aria-label="20220802" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day wed" aria-label="20220803" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day thu" aria-label="20220804" tabindex="-1">4<span class="date" aria-hidden="true">4</span></span><span class="flatpickr-day fri" aria-label="20220805" tabindex="-1">5<span class="date" aria-hidden="true">5</span></span><span class="flatpickr-day sat" aria-label="20220806" tabindex="-1">6<span class="date" aria-hidden="true">6</span></span><span class="flatpickr-day sun" aria-label="20220807" tabindex="-1">7<span class="date" aria-hidden="true">7</span></span><span class="flatpickr-day mon" aria-label="20220808" tabindex="-1">8<span class="date" aria-hidden="true">8</span></span><span class="flatpickr-day tue" aria-label="20220809" tabindex="-1">9<span class="date" aria-hidden="true">9</span></span><span class="flatpickr-day wed" aria-label="20220810" tabindex="-1">10<span class="date" aria-hidden="true">10</span></span><span class="flatpickr-day thu" aria-label="20220811" tabindex="-1">11<span class="date" aria-hidden="true">11</span></span><span class="flatpickr-day fri" aria-label="20220812" tabindex="-1">12<span class="date" aria-hidden="true">12</span></span><span class="flatpickr-day sat" aria-label="20220813" tabindex="-1">13<span class="date" aria-hidden="true">13</span></span><span class="flatpickr-day sun" aria-label="20220814" tabindex="-1">14<span class="date" aria-hidden="true">14</span></span><span class="flatpickr-day selected mon" aria-label="20220815" tabindex="-1">15<span class="date" aria-hidden="true">15</span></span><span class="flatpickr-day tue" aria-label="20220816" tabindex="-1">16<span class="date" aria-hidden="true">16</span></span><span class="flatpickr-day wed" aria-label="20220817" tabindex="-1">17<span class="date" aria-hidden="true">17</span></span><span class="flatpickr-day thu" aria-label="20220818" tabindex="-1">18<span class="date" aria-hidden="true">18</span></span><span class="flatpickr-day fri" aria-label="20220819" tabindex="-1">19<span class="date" aria-hidden="true">19</span></span><span class="flatpickr-day sat" aria-label="20220820" tabindex="-1">20<span class="date" aria-hidden="true">20</span></span><span class="flatpickr-day sun" aria-label="20220821" tabindex="-1">21<span class="date" aria-hidden="true">21</span></span><span class="flatpickr-day mon" aria-label="20220822" tabindex="-1">22<span class="date" aria-hidden="true">22</span></span><span class="flatpickr-day tue" aria-label="20220823" tabindex="-1">23<span class="date" aria-hidden="true">23</span></span><span class="flatpickr-day wed" aria-label="20220824" tabindex="-1">24<span class="date" aria-hidden="true">24</span></span><span class="flatpickr-day thu" aria-label="20220825" tabindex="-1">25<span class="date" aria-hidden="true">25</span></span><span class="flatpickr-day fri" aria-label="20220826" tabindex="-1">26<span class="date" aria-hidden="true">26</span></span><span class="flatpickr-day sat" aria-label="20220827" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day sun" aria-label="20220828" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day mon" aria-label="20220829" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day tue" aria-label="20220830" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day wed" aria-label="20220831" tabindex="-1">31<span class="date" aria-hidden="true">31</span></span><span class="flatpickr-day nextMonthDay hidden thu" aria-label="20220901" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day nextMonthDay hidden fri" aria-label="20220902" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day nextMonthDay hidden sat" aria-label="20220903" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><div class="yearMonthContainer"><span class="year">2022</span><span class="sepherator">.</span><span class="month">8</span></div></div><div class="dayContainer"><span class="flatpickr-day prevMonthDay hidden sun" aria-label="20220828" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day prevMonthDay hidden mon" aria-label="20220829" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day prevMonthDay hidden tue" aria-label="20220830" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day prevMonthDay hidden wed" aria-label="20220831" tabindex="-1">31<span class="date" aria-hidden="true">31</span></span><span class="flatpickr-day thu" aria-label="20220901" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day fri" aria-label="20220902" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day sat" aria-label="20220903" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day sun" aria-label="20220904" tabindex="-1">4<span class="date" aria-hidden="true">4</span></span><span class="flatpickr-day mon" aria-label="20220905" tabindex="-1">5<span class="date" aria-hidden="true">5</span></span><span class="flatpickr-day tue" aria-label="20220906" tabindex="-1">6<span class="date" aria-hidden="true">6</span></span><span class="flatpickr-day wed" aria-label="20220907" tabindex="-1">7<span class="date" aria-hidden="true">7</span></span><span class="flatpickr-day thu" aria-label="20220908" tabindex="-1">8<span class="date" aria-hidden="true">8</span></span><span class="flatpickr-day fri" aria-label="20220909" tabindex="-1">9<span class="date" aria-hidden="true">9</span></span><span class="flatpickr-day sat" aria-label="20220910" tabindex="-1">10<span class="date" aria-hidden="true">10</span></span><span class="flatpickr-day sun" aria-label="20220911" tabindex="-1">11<span class="date" aria-hidden="true">11</span></span><span class="flatpickr-day mon" aria-label="20220912" tabindex="-1">12<span class="date" aria-hidden="true">12</span></span><span class="flatpickr-day tue" aria-label="20220913" tabindex="-1">13<span class="date" aria-hidden="true">13</span></span><span class="flatpickr-day wed" aria-label="20220914" tabindex="-1">14<span class="date" aria-hidden="true">14</span></span><span class="flatpickr-day thu" aria-label="20220915" tabindex="-1">15<span class="date" aria-hidden="true">15</span></span><span class="flatpickr-day fri" aria-label="20220916" tabindex="-1">16<span class="date" aria-hidden="true">16</span></span><span class="flatpickr-day sat" aria-label="20220917" tabindex="-1">17<span class="date" aria-hidden="true">17</span></span><span class="flatpickr-day sun" aria-label="20220918" tabindex="-1">18<span class="date" aria-hidden="true">18</span></span><span class="flatpickr-day mon" aria-label="20220919" tabindex="-1">19<span class="date" aria-hidden="true">19</span></span><span class="flatpickr-day tue" aria-label="20220920" tabindex="-1">20<span class="date" aria-hidden="true">20</span></span><span class="flatpickr-day wed" aria-label="20220921" tabindex="-1">21<span class="date" aria-hidden="true">21</span></span><span class="flatpickr-day thu" aria-label="20220922" tabindex="-1">22<span class="date" aria-hidden="true">22</span></span><span class="flatpickr-day fri" aria-label="20220923" tabindex="-1">23<span class="date" aria-hidden="true">23</span></span><span class="flatpickr-day sat" aria-label="20220924" tabindex="-1">24<span class="date" aria-hidden="true">24</span></span><span class="flatpickr-day sun" aria-label="20220925" tabindex="-1">25<span class="date" aria-hidden="true">25</span></span><span class="flatpickr-day mon" aria-label="20220926" tabindex="-1">26<span class="date" aria-hidden="true">26</span></span><span class="flatpickr-day tue" aria-label="20220927" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day wed" aria-label="20220928" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day thu" aria-label="20220929" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day fri" aria-label="20220930" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day nextMonthDay hidden sat" aria-label="20221001" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><div class="yearMonthContainer"><span class="year">2022</span><span class="sepherator">.</span><span class="month">9</span></div></div></div></div></div></div></div>
              </div>
              <div class="booking-button">
                <button type="button" class="button button--primary button--active" data-select-date="#selectDate">
                  <span class="button__text">선택</span>
                </button>
              </div>
            </div>
            <a href="#" rel="modal:close" class="modal__close"><span class="blind">닫기</span></a>
          </div>
          <!-- // 날짜 선택 -->
          <!-- 날짜 선택 -->
          <div id="datepicker02" class="modal modal-full modal-full--picker">
            <div class="modal-header">
              <h2 class="header__page-name">날짜를 선택해 주세요.</h2>
            </div>

            <div class="modal-content">
              <div class="picker picker--full">
                <div class="flatpickr-wrapper"><input type="text" class="picker__input flatpickr-input" id="selectDate2" data-default-date="['2022.11.14']" data-picker="single" readonly="readonly"><div class="flatpickr-calendar animate multiMonth inline" tabindex="-1" style=""><div class="flatpickr-months"><span class="flatpickr-prev-month"></span><div class="flatpickr-month"><div class="flatpickr-current-month"><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year"><span class="arrowUp"></span><span class="arrowDown"></span></div><span class="cur-month">11월 </span></div></div><div class="flatpickr-month"><div class="flatpickr-current-month"><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year"><span class="arrowUp"></span><span class="arrowDown"></span></div><span class="cur-month">12월 </span></div></div><span class="flatpickr-next-month"></span></div><div class="flatpickr-innerContainer"><div class="flatpickr-rContainer"><div class="flatpickr-weekdays"><div class="flatpickr-weekdaycontainer">
    <span class="flatpickr-weekday">
    일</span><span class="flatpickr-weekday">월</span><span class="flatpickr-weekday">화</span><span class="flatpickr-weekday">수</span><span class="flatpickr-weekday">목</span><span class="flatpickr-weekday">금</span><span class="flatpickr-weekday">토
    </span>
    </div><div class="flatpickr-weekdaycontainer">
    <span class="flatpickr-weekday">
    일</span><span class="flatpickr-weekday">월</span><span class="flatpickr-weekday">화</span><span class="flatpickr-weekday">수</span><span class="flatpickr-weekday">목</span><span class="flatpickr-weekday">금</span><span class="flatpickr-weekday">토
    </span>
    </div></div><div class="flatpickr-days" tabindex="-1"><div class="dayContainer"><span class="flatpickr-day prevMonthDay hidden sun" aria-label="20221030" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day prevMonthDay hidden mon" aria-label="20221031" tabindex="-1">31<span class="date" aria-hidden="true">31</span></span><span class="flatpickr-day tue" aria-label="20221101" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day wed" aria-label="20221102" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day thu" aria-label="20221103" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day fri" aria-label="20221104" tabindex="-1">4<span class="date" aria-hidden="true">4</span></span><span class="flatpickr-day sat" aria-label="20221105" tabindex="-1">5<span class="date" aria-hidden="true">5</span></span><span class="flatpickr-day sun" aria-label="20221106" tabindex="-1">6<span class="date" aria-hidden="true">6</span></span><span class="flatpickr-day mon" aria-label="20221107" tabindex="-1">7<span class="date" aria-hidden="true">7</span></span><span class="flatpickr-day tue" aria-label="20221108" tabindex="-1">8<span class="date" aria-hidden="true">8</span></span><span class="flatpickr-day wed" aria-label="20221109" tabindex="-1">9<span class="date" aria-hidden="true">9</span></span><span class="flatpickr-day thu" aria-label="20221110" tabindex="-1">10<span class="date" aria-hidden="true">10</span></span><span class="flatpickr-day fri" aria-label="20221111" tabindex="-1">11<span class="date" aria-hidden="true">11</span></span><span class="flatpickr-day sat" aria-label="20221112" tabindex="-1">12<span class="date" aria-hidden="true">12</span></span><span class="flatpickr-day sun" aria-label="20221113" tabindex="-1">13<span class="date" aria-hidden="true">13</span></span><span class="flatpickr-day today selected mon" aria-label="20221114" aria-current="date" tabindex="-1">14<span class="date" aria-hidden="true">14</span></span><span class="flatpickr-day tue" aria-label="20221115" tabindex="-1">15<span class="date" aria-hidden="true">15</span></span><span class="flatpickr-day wed" aria-label="20221116" tabindex="-1">16<span class="date" aria-hidden="true">16</span></span><span class="flatpickr-day thu" aria-label="20221117" tabindex="-1">17<span class="date" aria-hidden="true">17</span></span><span class="flatpickr-day fri" aria-label="20221118" tabindex="-1">18<span class="date" aria-hidden="true">18</span></span><span class="flatpickr-day sat" aria-label="20221119" tabindex="-1">19<span class="date" aria-hidden="true">19</span></span><span class="flatpickr-day sun" aria-label="20221120" tabindex="-1">20<span class="date" aria-hidden="true">20</span></span><span class="flatpickr-day mon" aria-label="20221121" tabindex="-1">21<span class="date" aria-hidden="true">21</span></span><span class="flatpickr-day tue" aria-label="20221122" tabindex="-1">22<span class="date" aria-hidden="true">22</span></span><span class="flatpickr-day wed" aria-label="20221123" tabindex="-1">23<span class="date" aria-hidden="true">23</span></span><span class="flatpickr-day thu" aria-label="20221124" tabindex="-1">24<span class="date" aria-hidden="true">24</span></span><span class="flatpickr-day fri" aria-label="20221125" tabindex="-1">25<span class="date" aria-hidden="true">25</span></span><span class="flatpickr-day sat" aria-label="20221126" tabindex="-1">26<span class="date" aria-hidden="true">26</span></span><span class="flatpickr-day sun" aria-label="20221127" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day mon" aria-label="20221128" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day tue" aria-label="20221129" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day wed" aria-label="20221130" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day nextMonthDay hidden thu" aria-label="20221201" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day nextMonthDay hidden fri" aria-label="20221202" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day nextMonthDay hidden sat" aria-label="20221203" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><div class="yearMonthContainer"><span class="year">2022</span><span class="sepherator">.</span><span class="month">11</span></div></div><div class="dayContainer"><span class="flatpickr-day prevMonthDay hidden sun" aria-label="20221127" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day prevMonthDay hidden mon" aria-label="20221128" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day prevMonthDay hidden tue" aria-label="20221129" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day prevMonthDay hidden wed" aria-label="20221130" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day thu" aria-label="20221201" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day fri" aria-label="20221202" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day sat" aria-label="20221203" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day sun" aria-label="20221204" tabindex="-1">4<span class="date" aria-hidden="true">4</span></span><span class="flatpickr-day mon" aria-label="20221205" tabindex="-1">5<span class="date" aria-hidden="true">5</span></span><span class="flatpickr-day tue" aria-label="20221206" tabindex="-1">6<span class="date" aria-hidden="true">6</span></span><span class="flatpickr-day wed" aria-label="20221207" tabindex="-1">7<span class="date" aria-hidden="true">7</span></span><span class="flatpickr-day thu" aria-label="20221208" tabindex="-1">8<span class="date" aria-hidden="true">8</span></span><span class="flatpickr-day fri" aria-label="20221209" tabindex="-1">9<span class="date" aria-hidden="true">9</span></span><span class="flatpickr-day sat" aria-label="20221210" tabindex="-1">10<span class="date" aria-hidden="true">10</span></span><span class="flatpickr-day sun" aria-label="20221211" tabindex="-1">11<span class="date" aria-hidden="true">11</span></span><span class="flatpickr-day mon" aria-label="20221212" tabindex="-1">12<span class="date" aria-hidden="true">12</span></span><span class="flatpickr-day tue" aria-label="20221213" tabindex="-1">13<span class="date" aria-hidden="true">13</span></span><span class="flatpickr-day wed" aria-label="20221214" tabindex="-1">14<span class="date" aria-hidden="true">14</span></span><span class="flatpickr-day thu" aria-label="20221215" tabindex="-1">15<span class="date" aria-hidden="true">15</span></span><span class="flatpickr-day fri" aria-label="20221216" tabindex="-1">16<span class="date" aria-hidden="true">16</span></span><span class="flatpickr-day sat" aria-label="20221217" tabindex="-1">17<span class="date" aria-hidden="true">17</span></span><span class="flatpickr-day sun" aria-label="20221218" tabindex="-1">18<span class="date" aria-hidden="true">18</span></span><span class="flatpickr-day mon" aria-label="20221219" tabindex="-1">19<span class="date" aria-hidden="true">19</span></span><span class="flatpickr-day tue" aria-label="20221220" tabindex="-1">20<span class="date" aria-hidden="true">20</span></span><span class="flatpickr-day wed" aria-label="20221221" tabindex="-1">21<span class="date" aria-hidden="true">21</span></span><span class="flatpickr-day thu" aria-label="20221222" tabindex="-1">22<span class="date" aria-hidden="true">22</span></span><span class="flatpickr-day fri" aria-label="20221223" tabindex="-1">23<span class="date" aria-hidden="true">23</span></span><span class="flatpickr-day sat" aria-label="20221224" tabindex="-1">24<span class="date" aria-hidden="true">24</span></span><span class="flatpickr-day sun" aria-label="20221225" tabindex="-1">25<span class="date" aria-hidden="true">25</span></span><span class="flatpickr-day mon" aria-label="20221226" tabindex="-1">26<span class="date" aria-hidden="true">26</span></span><span class="flatpickr-day tue" aria-label="20221227" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day wed" aria-label="20221228" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day thu" aria-label="20221229" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day fri" aria-label="20221230" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day sat" aria-label="20221231" tabindex="-1">31<span class="date" aria-hidden="true">31</span></span><div class="yearMonthContainer"><span class="year">2022</span><span class="sepherator">.</span><span class="month">12</span></div></div></div></div></div></div></div>
              </div>
              <div class="booking-button">
                <button type="button" class="button button--primary button--active" data-select-date="#selectDate2">
                  <span class="button__text">선택</span>
                </button>
              </div>
            </div>
            <a href="#" rel="modal:close" class="modal__close"><span class="blind">닫기</span></a>
          </div>
          <!-- // 날짜 선택 -->

<!-- 풀팝업 -->
  <div id="modalLayer01" class="modal modal-full modal-scroll">
    <div class="modal-header">
      <div class="modal-header__title">소멸 포인트 안내</div>
    </div>
    <div class="modal-content">
      <ul class="list-guide">
        <li class="list-guide__item">탑승 적립 포인트의 유효기간은 3년, 구매·선물 적립 포인트의 유효기간은 5년입니다.</li>
        <li class="list-guide__item">유효기간이 임박한 포인트는 소멸예정일 한 달 전부터 소멸예정 포인트로 공지되며, 이메일 또는 제주항공 홈페이지에서 안내받으실 수 있습니다.</li>
        <li class="list-guide__item">유효기간이 지난 포인트는 자동 소멸됩니다.</li>
        <li class="list-guide__item">제휴로 적립된 포인트의 유효기간은 1~2년입니다. (별도 안내 시 해당기간을 따름)</li>
      </ul>
    </div>
    <a href="#" rel="modal:close" class="modal__close"><span class="blind">닫기</span></a>
  </div>

<input type="hidden" id="msg00046" value="결제금액">
<input type="hidden" id="msg00047" value="추가적립">
<input type="hidden" id="msg00048" value="사용 포인트">
<input type="hidden" id="msg00049" value="잔액 포인트">
<input type="hidden" id="msg00050" value="환불가능 포인트">
<input type="hidden" id="msg00051" value="소멸일자">
<input type="hidden" id="msg00052" value="구매취소">
<input type="hidden" id="msg00053" value="잔액환불">
<input type="hidden" id="msg00054" value="일자">
<input type="hidden" id="msg00055" value="받으실 분 이름">
<input type="hidden" id="msg00056" value="보내신 분 이름">
<input type="hidden" id="msg00057" value="선물포인트">
<input type="hidden" id="msg00058" value="사용포인트">
<input type="hidden" id="msg00059" value="받으실 분 회원번호">
<input type="hidden" id="msg00060" value="[취소]환불완료 ">
<input type="hidden" id="msg00062" value="선물취소">
				</main>
			</div>
			
		</div>
	</div>


<%@ include file="../../common/include/footer.jsp" %>
</body>
</html>