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

		<div class="wrap wrap--login pc-small">
			
			
				<div id="breadcrumb" class="breadcrumb pc-only" aria-label="breadcrumb">
					<nav class="breadcrumb__inner">
						<div class="breadcrumb__item">
							<a href="javascript:;" class="breadcrumb__link" style="cursor: default;">홈</a>
						</div>
						
						
							
								
									<div class="breadcrumb__item">
										<a href="javascript:;" class="breadcrumb__link" style="cursor: default;">회원가입</a>
									</div>
								
								
							
						
						
					</nav>
				</div>
			
	
			
			<div class="content" id="content">
				<main id="main" class="main ">
					
					<form id="frm" name="frm" method="post" action="">
	<div class="content" id="content">
    <main id="main" class="main">

		<!--20210519 title영역 수정-->
		<div class="page-title-wrap">
			<div class="page-title">추가 정보 입력</div>
			<div class="page-sub-title">추가정보를 입력하시면 예약이 더 편리해져요.</div><!--20210428 문구 변경-->
		</div>
		<!--//20210519 title영역 수정-->

      	<div class="section-wrap"><!--20210519 class명 변경-->

			<div class="container--small pc-15">
				<div class="input-wrap input--line">
					<div class="input-row">
						<div class="radio-wrapper">
							<p class="radio__text">성별<span title="required" class="input__label-asterisk">*</span></p>
							<div class="radio-wrap">
								<span class="radio">
									<input type="radio" id="inputRadio2" name="sexRadio" class="radio__input" checked="" value="M">
									<label for="inputRadio2" class="radio__label">
										<i aria-hidden="true" class="radio__ico"></i>
										<span>남자</span>
									</label>
								</span>
								<span class="radio">
									<input type="radio" id="inputRadio3" name="sexRadio" class="radio__input" value="M" disabled="disabled">
									<label for="inputRadio3" class="radio__label">
										<i aria-hidden="true" class="radio__ico"></i>
										<span>여자</span>
									</label>
								</span>
							</div>
						</div>
					</div>

					
					
					
					

                	<div class="input-row input-row--label">
						<div class="input-label label-top">
							생년월일<span title="required" class="input__label-asterisk">*</span>
						</div>
						<!-- D : 에러시 input--error -->
						<div class="input-item">
							<div class="input-flex">
								<div class="input-box">
									<div class="input is-active" data-element="form">
										<input type="text" id="birthYear" class="input__text input__text--placeholder" data-element="input" title="연도 입력" value="1993" maxlength="4" placeholder="년" disabled="disabled">
										<button type="button" class="input__remove-button" data-element="remove">삭제</button>
									</div>
								</div>
								<div class="input-box">
									<div class="select-wrap select-wrap--line">
										<select class="select-wrap__select" id="birthMonth" title="월 선택" disabled="disabled">
											<option value="">월</option>
											<!-- 
												<option value="01" >
													01
												</option>
											
												<option value="02" >
													02
												</option>
											
												<option value="03" >
													03
												</option>
											
												<option value="04" >
													04
												</option>
											
												<option value="05" >
													05
												</option>
											
												<option value="06" >
													06
												</option>
											
												<option value="07" selected>
													07
												</option>
											
												<option value="08" >
													08
												</option>
											
												<option value="09" >
													09
												</option>
											
												<option value="10" >
													10
												</option>
											
												<option value="11" >
													11
												</option>
											
												<option value="12" >
													12
												</option>
											 -->
										<option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
									</div>
								</div>
								<div class="input-box">
									<div class="select-wrap select-wrap--line">
										<select class="select-wrap__select" id="birthDay" title="일 선택" disabled="disabled">
											<option value="">일</option>
											<!-- 
												<option value="01" >
													01
												</option>
											
												<option value="02" >
													02
												</option>
											
												<option value="03" >
													03
												</option>
											
												<option value="04" >
													04
												</option>
											
												<option value="05" >
													05
												</option>
											
												<option value="06" >
													06
												</option>
											
												<option value="07" >
													07
												</option>
											
												<option value="08" >
													08
												</option>
											
												<option value="09" >
													09
												</option>
											
												<option value="10" >
													10
												</option>
											
												<option value="11" >
													11
												</option>
											
												<option value="12" >
													12
												</option>
											
												<option value="13" >
													13
												</option>
											
												<option value="14" >
													14
												</option>
											
												<option value="15" >
													15
												</option>
											
												<option value="16" >
													16
												</option>
											
												<option value="17" >
													17
												</option>
											
												<option value="18" >
													18
												</option>
											
												<option value="19" >
													19
												</option>
											
												<option value="20" >
													20
												</option>
											
												<option value="21" >
													21
												</option>
											
												<option value="22" >
													22
												</option>
											
												<option value="23" >
													23
												</option>
											
												<option value="24" >
													24
												</option>
											
												<option value="25" >
													25
												</option>
											
												<option value="26" >
													26
												</option>
											
												<option value="27" >
													27
												</option>
											
												<option value="28" >
													28
												</option>
											
												<option value="29" selected>
													29
												</option>
											
												<option value="30" >
													30
												</option>
											
												<option value="31" >
													31
												</option>
											 -->
										<option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select>
									</div>
								</div>
							</div>
							<p id="ageCheckText" tabindex="0" class="input__error"></p>
						</div>
                	</div>
					<!--2021-04-15select수정-->
					<div class="input-row input-row--label">
						<div class="input-label label-top">
							거주 국가<span title="required" class="input__label-asterisk">*</span>
						</div>
						<div class="input-box">
							<div class="select-wrap select-wrap--line">
								<input type="text" id="hidCountryCode" class="input_required" name="hidCountryCode" style="display:none" value="KR">
								<button class="select-wrap__button active" type="button" id="btnNationality0" name="btnNationality" onclick="openLayerNationality('ko', $('#hidCountryCode'), this);">
									대한민국
								</button>
							</div>
						</div>
					</div>
					<div class="input-row input-row--label">
						<div class="input-label label-top">
							국적 (여권)<span title="required" class="input__label-asterisk">*</span>
						</div>
						<div class="input-box">
							<div class="select-wrap select-wrap--line">
								<input type="text" id="hidNationality" class="input_required" name="hidNationality" style="display:none" value="KR">
								<button class="select-wrap__button active" type="button" id="btnNationality1" name="btnNationality" onclick="openLayerNationality('ko', $('#hidNationality'), this);">
								  	대한민국
								</button>
							</div>
						</div>
					</div>
					<!--//2021-04-15select수정-->
					<!--//2021-10-28 [#1271284894], [#1271272033] 기획변경에 의해 추천인아이디 삭제 START
					<div class="input-row">
					<div class="input-item">
						<div class="input-box">
						<label for="fmmbrenhs" class="input__label">추천인 아이디<span title="required" class="input__label-asterisk">*</span></label>
						<div data-element="form" class="input">
							<input type="text" data-element="input" id="fmmbrenhs" name="fmmbrenhs" class="input__text">
							<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
						</div>
						</div>
						<p class="input__sub-text color-org">입력하시면 추천인과 입력한 회원 모두에게<br>바로 사용할 수 있는 포인트 1,000P 적립!
					</p>
						<p id="fmmbrenhsError" tabindex="0" class="input__error">추천인 아이디를 다시 확인해 주세요.</p>
					</div>
					</div>
					2021-10-28 [#1271284894], [#1271272033] 기획변경에 의해 추천인아이디 삭제 END -->
                
              	</div>
            </div>

		</div>

		<div class="button-wrap pc-60" data-element="bottomContent"><!--20210428 class명 변경 pc-40 -> pc-60 -->
			<!-- 버튼 활성화 클래스 button--active -->
			<button type="button" id="nextBtn" data-action="nextBtn" class="button button--primary button--active">
				<span class="button__text">저장후 로그인</span>
			</button>
			<!--20210408 button--active 활성화-->
		</div>
	</main>
	</div>

	<input type="hidden" id="sex" name="sex" value="M">
	<input type="hidden" id="email" name="email" value="kmb0729@nate.com">
	<input type="hidden" id="test" name="test" value="">
	<input type="hidden" id="lang" name="lang" value="ko">
	
	<input type="hidden" name="act" value="agree">
	<input type="hidden" name="network_id" value="">
	<input type="hidden" name="CHL" value="HOMEPAGE">
	<input type="hidden" name="language_type" value="">
	<input type="hidden" name="foreignerYn" value="N">
	<!-- 본인인증을 위해 필요한 정보   -->
	<input type="hidden" name="ipinNo" value=""> <!-- 아이핀인증번호 -->
	<input type="hidden" id="SendInfo" name="SendInfo">
	<!--	내/외국인 구분을 설정하십시오. ( '1'-내국인, '2'-외국인 )	-->
	<input type="hidden" id="foreigner" name="foreigner" value="">
	<!--	조회사유를 설정하십시오. ( '10'-회원가입, '20'-기존회원 확인, '30'-성인인증, '40'-비회원 확인, '90'-기타 사유 )	-->
	<input type="hidden" id="inqRsn" name="inqRsn" value="10">
	<input type="hidden" name="ipinYN" value="Y">
	<input type="hidden" name="diNo" value="MC0GCCqGSIb3DQIJAyEAhC3ylKMrWpW41T9qSFjHFK7xcmweYu/arEbfonV9K/Y=">
	<input type="hidden" name="ciNo" value="40Wmgqg7DetQI/ETuxzTPXmJGPkaChado2QQN7lMBomSU2Ub0JT9oj2HH27ak7Fqu39k+tJck8V2fJ3cJ4IcRQ==">
	<input type="hidden" name="mobileNo" value="82-010-8025-0729">
	
	<input type="hidden" id="apiRequestType" name="apiRequestType" value="4000">
	<input type="hidden" id="apiRequestNm" name="apiRequestNm" value="CHECKPLUS">
	<input type="hidden" id="userId" name="userId" value="kmb930729">
	<input type="hidden" id="password" name="userPassword" value="">
	
	<input type="hidden" id="expireAgreeYn" name="expireAgreeYn" value="">
	<input type="hidden" id="emailAgreeYn" name="emailAgreeYn" value="N">
	<input type="hidden" id="smsAgreeYn" name="smsAgreeYn" value="N">
	
	<input type="hidden" id="birthSolarLunar" name="birthSolarLunar" value="S">
	<input type="hidden" id="appAgreeYn" name="appAgreeYn" value="">
	<input type="hidden" id="passportNo" name="passportNo" value="">
	<input type="hidden" id="nationalityCode" name="nationalityCode" value="KR">
	<input type="hidden" id="countryCode" name="countryCode" value="KR">
	<input type="hidden" id="parentCiNo" name="parentCiNo" value="">
	<input type="hidden" id="parentConfirmYn" name="parentConfirmYn" value="">
	<input type="hidden" id="parentName" name="parentName" value="">
	<input type="hidden" id="requestChannelId" name="requestChannelId" value="HOMEPAGE">
	<input type="hidden" id="requestUserId" name="requestUserId" value="kmb930729">
	<input type="hidden" id="ffpNo" name="ffpNo" value="093563097">
	<input type="hidden" id="birthDate" name="birthDate" value="">
	
	<input type="hidden" id="newId" name="newId" value="">
	<input type="hidden" id="newPassword" name="newPassword" value="">
	<input type="hidden" id="joinType" name="joinType" value="NOR">
	<input type="hidden" id="language" name="language" value="ko">
	<input type="hidden" id="country" name="country" value="KR">
	<input type="hidden" id="korLastName" name="korLastName" value="강">
	<input type="hidden" id="korFirstName" name="korFirstName" value="모범">
	<input type="hidden" id="engLastName" name="engLastName" value="KANG">
	<input type="hidden" id="engFirstName" name="engFirstName" value="MOBUM">
</form>
<form id="nextFrm" name="nextFrm">
</form>
				</main>
			</div>
			
		</div>
	</div>


<%@ include file="../../common/include/footer.jsp" %>
</body>
</html>