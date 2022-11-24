<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="../common/include/header.jsp"%>
	<div id="body">
			
			<!-- Google Tag Manager (noscript) -->
			<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PD2BQQ4" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
			<!-- End Google Tag Manager (noscript) -->
			
			<div class="wrap wrap--booking NA_1_51 step-ui">
				<div class="content" id="content">
					<main id="main" class="main ">
					<div class="page-title-wrap">
						<br>
						<br>
						<div id="divSubTitle" class="page-sub-title">여권 정보와 동일하게 <br class="mobile-only">입력해 주세요.</div>
					</div>
		
		<div class="section-wrap">
			<div id="divPsgr" class="tab tab--scroll tab--icon tab--icon-large tab__scroll" data-element="tab" data-options="{&quot;tabType&quot;: &quot;scroll&quot;}">
				<div class="sticky-wrap" style="padding-top: 169px;">
					<div class="sticky__inner is-sticky" data-sticky="" style="margin-top: 102px;">
						<div class="tab__inner">
							<button class="button tab__scroll-left disabled" data-tab-direction="prev" style="display: none;">
								<span class="hidden">왼쪽 탭으로 이동</span>
							</button>
							<button class="button tab__scroll-right" data-tab-direction="next" style="display: none;">
								<span class="hidden">오른쪽 탭으로 이동</span>
							</button>
							<div class="tab__scroll-wrap tab__scroll-wrap--full" data-element="tab__scroll-wrap">
								<div id="divTabs" class="tab__buttons" data-element="tab__scroll" style="width: 749px;">
									<div id="psgrTab0" class="tab__button" data-element="tab__list" role="presentation">
										<button id="psgrBtn0" class="tab__anchor is-active" type="button" data-element="tab__anchor" data-index="0" role="tab" tabindex="" aria-selected="true" aria-expanded="true">
											<span class="passenger">
											<span class="type">성인1</span>
											<strong id="tabName0" class="name"></strong>
											</span>
										</button>
									</div>
									<div id="psgrTab1" class="tab__button" data-element="tab__list" role="presentation">
										<button id="psgrBtn1" class="tab__anchor" type="button" data-element="tab__anchor" data-index="1" role="tab" tabindex="" aria-selected="false" aria-expanded="false">
											<span class="passenger baby">
											<span class="type">유아1</span>
											<strong id="tabName1" class="name"></strong>
											</span>
										</button>
									</div>
									<div id="psgrTab2" class="tab__button" data-element="tab__list" role="presentation">
										<button id="psgrBtn2" class="tab__anchor" type="button" data-element="tab__anchor" data-index="2" role="tab" tabindex="" aria-selected="false" aria-expanded="false">
											<span class="passenger child">
											<span class="type">소아1</span><strong id="tabName2" class="name"></strong>
											</span>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="psgrContainer0" class="tab__panel is-active" data-element="tab__panel" data-passengerkey="MCFBRFQ-" data-passenger-type="ADT" aria-labelledby="psgrBtn0" role="tabpanel" tabindex="0">
					<div class="passenger-info-box">
                    	<div class="passenger-info">탑승객 정보</div>
					</div>
	       			<div class="sub-section">
						<div class="input-wrap input--line pc-col pc-col-2">
							<div id="divName0" class="input-row pc-row-100">
								<div id="txtLastName0_div" class="input-item">
									<div class="input-box">
										<label for="txtLastName0" class="input__label" style="top:0px">
											성 (영문)
											<span title="required" class="input__label-asterisk">*</span>
										</label>
										<div data-element="form" class="input">
											<input type="text" data-element="input" id="txtLastName0" name="txtLastName" class="input__text input_required" style="text-transform :uppercase;">
											<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
										</div>
									</div>
									<p tabindex="0" class="input__error">성을 입력해 주세요.</p>
								</div>
								<div id="txtFirstName0_div" class="input-item">
									<div class="input-box">
										<label for="txtFirstName0" class="input__label" style="top:0px">
											이름 (영문)<span title="required" class="input__label-asterisk">*</span>
										</label>
										<div data-element="form" class="input">
											<input type="text" data-element="input" id="txtFirstName0" name="txtFirstName" class="input__text input_required" style="text-transform :uppercase;">
											<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
										</div>
									</div>
									<p tabindex="0" class="input__error">이름을 입력해 주세요.</p>
								</div>
							</div>
							<div class="input-row pc-mgl-0 boarding__gender">
								<div class="radio-wrapper">
									<p class="radio__text">성별<span title="required" class="input__label-asterisk">*</span></p>
									<div class="radio-wrap">
										<span class="radio">
											<input type="radio" id="rdoGenderM0" name="rdoGender0" value="1" class="radio__input" checked="">
											<label for="rdoGenderM0" class="radio__label"> <i aria-hidden="true" class="radio__ico"></i> <span>남자</span>
											</label>
										</span>
										<span class="radio">
											<input type="radio" id="rdoGenderW0" name="rdoGender0" value="2" class="radio__input">
											<label for="rdoGenderW0" class="radio__label"> <i aria-hidden="true" class="radio__ico"></i> <span>여자</span>
											</label>
										</span>
									</div>
								</div>
							</div>
			           		<div id="divBirth0" class="input-row input-row--label boarding__column">
				            	<div id="birth0_div" class="boarding__birth">
									<div class="input-label label-top">생년월일<span title="required" class="input__label-asterisk">*</span></div>
									<div class="input-item" data-element="form">
										<div class="input-flex">
											<div class="input-box label-active">
												<div class="input" data-element="form">
													<input type="text" class="input__text input__text--placeholder input_required" id="txtYear0" name="txtYear" maxlength="4" data-element="input" title="연도 입력" placeholder="년"><button type="button" data-element="remove" class="input__remove-button">삭제</button>
												</div>
											</div>
											<div class="input-box">
												<div class="select-wrap select-wrap--line">
													<select class="select-wrap__select input_required selected" id="selMonth0" name="selMonth" title="월 선택"><option value="">월</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
												</div>
											</div>
											<div class="input-box">
												<div class="select-wrap select-wrap--line">
													<select class="select-wrap__select input_required selected" id="selDate0" name="selDate" title="일 선택"><option value="">일</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select>
												</div>
											</div>
										</div>
										<p tabindex="0" class="input__error">생년월일을 정확히 입력해 주세요.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			
			</div>
		</div>
		
		<div id="divContact" class="section-wrap">
		<div class="section-title">대표 연락처 정보</div>
			<div class="section-sub-txt">기상악화 등에 따른 항공편 지연/결항 시 알려 드립니다. 휴대전화번호와 이메일을 입력해 주세요.</div>
		
			<div class="input-wrap input--line pc-col pc-col-2">
				<div class="input-row input-row--label">
					<div class="input-label label-top">휴대전화번호<span title="required" class="input__label-asterisk">*</span></div>
					<div id="txtContactPhone_div" class="input-item">
						<div class="input-flex">
							<div class="input-box input-box--tel">
								<div class="select-wrap select-wrap--line">
									<button class="select-wrap__button active" id="btnCountryCode" name="btnCountryCode" type="button">+82</button>
									<input type="hidden" id="hidCountryCode" class="input_contact" value="82">
								</div>
							</div>
							<div class="input-box">
								<div data-element="form" class="input">
									<input type="text" data-element="input" id="txtContactPhone" class="input__text input_contact input_required" name="txtContactPhone" maxlength="13">
									<button type="button" data-element="remove" class="input__remove-button">
										<span class="hidden">삭제</span>
									</button>
								</div>
							</div>
						</div>
						<p tabindex="0" class="input__error">휴대전화번호 오류입니다. 다시 확인해 주세요.</p>
					</div>
				</div>
				<div class="input-row">
					<div id="txtContactEmail_div" class="input-item">
						<div class="input-box label-active">
							<label for="txtContactEmail" class="input__label">
								이메일<span title="required" class="input__label-asterisk">*</span>
							</label>
							<div data-element="form" class="input">
								<input type="text" data-element="email" id="txtContactEmail" class="input__text input_contact input_required" maxlength="266">
								<button type="button" data-element="remove" class="input__remove-button">
									<span class="hidden">삭제</span>
								</button>
							</div>
						</div>
						<p class="input__sub-text">예) kimjeju@jejuair.com</p>
						<p tabindex="0" class="input__error">이메일을 입력해 주세요.</p>
					</div>
				</div>
			</div>
			</div>
		<div class="section-wrap">
			<div class="service-information" data-element="toggle" data-options="{&quot;mode&quot;: &quot;slide&quot;}">
				<div class="service-information__title">
					<button type="button" class="service-information__anchor is-active" id="btnServiceInfo" data-element="toggle__anchor" aria-controls="toggle-2" aria-expanded="true">꼭 확인해 주세요.</button>
				</div>
				<div class="service-information__content" data-element="toggle__panel" id="toggle-2" style="display: block;">
					<ul class="list-guide list-guide--small">
						<li class="list-guide__item" style="color:#FF5000">대한민국에 비자없이 입국이 가능한 외국인은 출발 72시간 전까지 <a style="color:#FF5000; border-bottom:1px solid #FF5000" onclick="">www.k-eta.go.kr</a> 또는 모바일앱(K-ETA)을 통해 K-ETA를 신청 및 발급 받은 후 입국이 가능합니다.</li>
						<li class="list-guide__item">탑승자명은 여권 및 신분증 정보와 동일하게 입력해 주세요.
						</li>
						<li class="list-guide__item">결제 이후 탑승자명을 변경할 수 없습니다.
						</li>
						<li class="list-guide__item">항공기에 탑승하기 위해 반드시 유효한 신분증을 소지해 주세요.
						</li>
						<li class="list-guide__item">유아가 좌석에 착석하는 경우 안전을 위해 기내용 안전의자(Cat Seat)를 반드시 준비해주시기 바랍니다.<br>- 미연방항공청(FAA) 승인 받은 유아용 안전의자 또는 기내 사용 가능한 인증 제품에 한하여 이용 가능합니다. 예) 포브 보네떼 제품 등 </li> 
						<li class="list-guide__item">도움이 필요한 탑승객(임산부, 휠체어 이용 고객 또는 지병이 있는 고객 등)은 체크인 카운터에서 탑승권 발급 시 직원에게 알려 주세요.
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="booking-sticky booking-sticky--reservation" data-element="toggle" data-options="{&quot;mode&quot;: &quot;slide&quot;}">
			<div class="reservation-container">
				<div class="booking-sticky__top ">
					<div id="divBottomSheetTop" class="toggle-wrap toggle-wrap--button toggle-wrap--height">
						<div class="label label--point">
							<span>예상 결제금액</span>
							</div>
						<button type="button" class="summary" data-element="toggle__anchor" aria-controls="divBottomSheet" aria-expanded="false">
							<span class="cost"><span class="price_txt">${totalprice}</span>
							<span class="unit">원</span></span>
							<span class="point" style="display: none;">
								<span class="cost"></span>
							</span>
						</button>
					</div>
					<button name="btnNext" type="button" class="button button--primary pc-only" disabled="">
						<span class="button__text">부가서비스 선택하기</span>
					</button>
				</div>
			</div>
	    </div>
		
					</main>
				</div>
			</div>
		</div>
<%@ include file="../common/include/footer.jsp"%>