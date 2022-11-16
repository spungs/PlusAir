<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="">

<%@ include file="../../common/include/header.jsp"%>
<div id="body">

	<!-- Google Tag Manager (noscript) -->
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PD2BQQ4"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<!-- End Google Tag Manager (noscript) -->

	<div class="wrap pc-small mo-pb40">
		<div id="breadcrumb" class="breadcrumb pc-only"	aria-label="breadcrumb">
			<nav class="breadcrumb__inner">
				<div class="breadcrumb__item">
					<a href="javascript:;" class="breadcrumb__link"	style="cursor: default;">홈</a>
				</div>
				<div class="breadcrumb__item">
					<a href="javascript:;" class="breadcrumb__link"	style="cursor: default;">회원가입</a>
				</div>
			</nav>
		</div>

		<div class="content" id="content">
			<main id="main" class="main ">
				<div class="page-title-wrap pc-only">
					<div class="page-title">회원가입</div>
				</div>
				<!-- 회원가입 국내일 경우 -->
				<div class="login">
					<div class="container--default pc-25">
						<div class="guide-info guide-info--gray">
							<p class="guide-info__text">
								한국에 거주하는 내국인을 위한 페이지입니다.<br> 한국거주 외국인 또는 해외거주 내국인은 국가/언어
								설정을 변경하여 가입해 주세요.
							</p>
						</div>
					</div>
					<div class="container--default pc-30">
						<div class="icon-link">

							<a href="nameWrite" class="icon-link__item"
								data-action="goCtfCheck"> <img
								src="<c:url value="/resources/images/icon/icon-join-item-01.png" />"
								alt="" aria-hidden="true"> <span class="icon-link__text">휴대전화
									인증<br>회원가입
							</span>
							</a>
						</div>
					</div>
					<div class="button-wrap button-wrap--login">

						<div class="button-wrap">
							<button type="button" class="button button--option"
								data-action="goNaverLogin">
								<span class="button__text button__icon">네이버 회원가입</span>
							</button>
						</div>
						<div class="button-wrap">
							<button type="button" class="button button--option"
								data-action="goKakaoLogin">
								<span class="button__text button__icon button__icon--kakao">카카오
									회원가입</span>
							</button>
						</div>

						<!--
		              <div class="button-wrap">
		                <button type="button" class="button button--option" data-action='goLineLogin'><span class="button__text button__icon button__icon--line">Line 회원가입</span></button>
		              </div>
		              <div class="link-wrap">
		                <button type="button" class="link-wrap__underline" data-target-open="sheet01"><span>다른 방법으로 회원가입</span></button>
		              </div>-->

						<!-- 						<div class="button-wrap"> -->
						<!-- 							<button type="button" class="button button--option apple-black" -->
						<!-- 								data-action="goAppleLogin"> -->
						<!-- 								<span class="button__text button__icon button__icon--apple"> -->
						<!-- 									<em class="en">애플</em> <em class="txt">회원가입</em> Apple -->
						<!-- 									회원가입 -->
						<!-- 								</span> -->
						<!-- 							</button> -->
						<!-- 						</div> -->
					</div>
				</div>
				<div class="container--large pc-40">
					<div class="notice-box">
						<h5 class="notice-box__title">가입 시, 꼭 확인해 주세요.</h5>
						<p class="notice-box__text">제휴카드 발급 고객, 제휴사 서비스, 제주항공 이벤트 등
							혜택을 이용하실 고객님은 휴대전화나 아이핀 인증을 통해 가입해 주세요.</p>
						<p class="notice-box__text">미리 회원가입 여부를 꼭 확인해 주세요. 본인 명의 아이디가
							여러 개인 경우, 아이디별로 적립된 포인트 및 탑승 횟수 등은 통합되지 않습니다.</p>
					</div>
				</div>
				<!-- //회원가입 국내일 경우 -->
				
				<div>
					<!-- 다른방법으로 회원가입 백드롭 -->
					<div class="bottom-sheet bottomSheet-modal" id="sheet01">
						<div class="bottom-sheet__top">
							<div class="title">
								<h2 class="title__main">다른 방법으로 회원가입</h2>
							</div>
						</div>
						<div class="bottom-sheet__bot pc-login">
							<div class="button-wrap button-wrap--login">
								<!--<button id="facebookLogin" type="button" aria-label="페이스북으로 회원가입" data-action="goFaceBookLogin" class="button-sns button-sns--facebook">
          <span>facebook 회원가입</span>
        </button>
        <button id="googleLogin" type="button" aria-label="구글 회원가입" data-action='goGoogleLogin' class="button-sns button-sns--google">
          <span>google 회원가입</span>
        </button>
        <button type="button" aria-label="트위터로 회원가입" class="button-sns button-sns--twiter">
          <span>Line 회원가입</span>
        </button>-->
<!-- 								<div class="button-wrap"> -->
<!-- 									<button id="appleLogin" type="button" -->
<!-- 										class="button button--option" data-action="goAppleLogin"> -->
<!-- 										<span class="button__text button__icon button__icon--apple">APPLE -->
<!-- 											회원가입</span> -->
<!-- 									</button> -->
<!-- 								</div> -->
<!-- 							</div> -->
						</div>
						<a href="#" rel="modal:close" class="bottom-sheet__button-close"><span
							class="blind">닫기</span></a>
					</div>

					<form id="frm" name="frm" method="post" action=""></form>

					<!-- 개인 인증 (휴대폰, 공인인증서, 신용카드)을 통하여 보호자의 실명확인 처리 - 최선혁 - 2013. 01. 07 -->
					<form id="reqIdentity" name="reqIdentity" method="post" action="">
						<input type="hidden" name="m" value="checkplusSerivce">
						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
						<input type="hidden" name="EncodeData"
							value="AgAFRzI4ODfbWCbkTO2UwrpWKVbUHQBBihZ4V8t6aQA2UVU9kLkRiWRKPvoaXwiAY9H0mDGW+wQqQfI5q2nHN3WfdkSp+bbc/QXPo/W0SOKb19mPX9kEp06eU6zMPWipZpk8AFQbwBmfvYEvxf9DMohdpQ86NPyqtZdzgJrofzWRp32v/64U7naLbh7H6SVJ9PcRqXNthC8pThZk6T0zmBd8WVv++EcHMaMp+jxhsvYrmFBQASnoK/T/NgUx9iRsjod6XHqnGgdvtYaE6p5PRx4EUbOLQBLNBozOgCIxy/lz5261VMy/nyI5/L21C0mdDzWhXCd4pw8CgS1NhjYlaWk5DpZkYlUfZzslu7gTQHX+wu63t3XFhmT5WMZGPM7MvbgxKujwoPBtzXlNrYmGD/XLaZvezNFnF16/TrTCdqoRP6YnTBDoc5pzCFNW7bqnN8Adpvq2nLSH1UQ81ywnSoWNEuQfFbBo">
						<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
						<!-- 업체에서 응답받기 원하는 데이타를 설정하기 위해 사용할 수 있으며, 인증결과 응답시 해당 값을 그대로 송신합니다. 해당 파라미터는 추가하실 수 없습니다. -->
						<input type="hidden" name="param_r1" value="join"> <input
							type="hidden" name="param_r2" value=""> <input
							type="hidden" name="param_r3" value="">
					</form>

					<form id="reqForm" name="reqForm" method="post" action="">
						<input type="hidden" name="m" value="pubmain"> <input
							type="hidden" name="enc_data"
							value="AgEETjAwN0hPuG20DH0TO2+wyPsDi8Ckdmu6kvdMmnxLuCRZoZAWdupElzmVw/cKYIPlNccRVt1Iidk/4GzZgMaCWxiiZykWhm1cYcsFrkuJ9hn/jNb3KpUt71G7CM2QmjC1N/bU7SJeLVKBqX1okSLfKfSCZC1nd58hGDaD/pA7QQ4KWZ1sk75BNuDTDN+HqioypzLOUTGn8DN+n3Tsb2oYFxYt2OmIc3b7MKn9lyr1N2zvg5ypyneWXy0X4R70BjHBSSdQlQMxB7LEIiG1EhJYhBGKadlHTt339riM1yeD4Ro5tL/ns7xwAAEYvxkqSBOaxXgi9Q==">

					</form>


					<!-- I-PIN 인증을 위한 세팅 form - 최선혁 - 2013. 01. 03 -->
					<form id="pageForm" name="pageForm" method="post" action="">
						<input type="hidden" id="NiceId" name="NiceId" value="N007">
						<input type="hidden" id="SIKey" name="SIKey" value="Jejuair2020!">
						<input type="hidden" id="PingInfo" name="PingInfo" value="random">
						<input type="hidden" id="ReturnURL" name="ReturnURL"
							value="https://www.jejuair.net/ko/member/login/niceCheckResult.do">
						<!--	조회사유를 설정하십시오 ( '10'-회원가입, '20'-기존회원 확인, '30'-성인인증, '40'-비회원 확인, '50'-기타 사유 )	-->
						<input type="hidden" id="InqRsn" name="InqRsn" value="10">
						<!--	주문번호를 설정하십시오. (최소 14자리, 20자리미만)	-->
						<input type="hidden" id="InqRsn" name="nicePopAct" value="join">
						<input type="hidden" id="OrderNo" name="OrderNo"
							value="39221113416464198">
					</form>


					<form method="post" id="frmInfo_ipin" name="frmInfo_ipin">
						<input type="hidden" id="joinGubun" name="status"> <input
							type="hidden" id="test" name="test"> <input type="hidden"
							id="lang" name="lang" value="ko"> <input type="hidden"
							name="act" value="agree"> <input type="hidden"
							name="network_id" value=""> <input type="hidden" id="CHL"
							name="CHL" value="HOMEPAGE"> <input type="hidden"
							name="language_type" value=""> <input type="hidden"
							name="foreYN" value="N"> <input type="hidden"
							name="birthYear" value=""> <input type="hidden"
							name="birthMon" value=""> <input type="hidden"
							name="birthDay" value="">
						<!-- 본인인증을 위해 필요한 정보   -->
						<input type="hidden" name="ipinNo" value="">
						<!-- 아이핀인증번호 -->
						<input type="hidden" id="SendInfo" name="SendInfo">
						<!--	내/외국인 구분을 설정하십시오. ( '1'-내국인, '2'-외국인 )	-->
						<input type="hidden" id="foreigner" name="foreigner" value="">
						<!--	조회사유를 설정하십시오. ( '10'-회원가입, '20'-기존회원 확인, '30'-성인인증, '40'-비회원 확인, '90'-기타 사유 )	-->
						<input type="hidden" id="inqRsn" name="inqRsn" value="10">
						<input type="hidden" name="lastname" value=""> <input
							type="hidden" name="firstname" value=""> <input
							type="hidden" name="sex" value=""> <input type="hidden"
							name="ipinYN" value="Y"> <input type="hidden"
							name="dupeInfo" value=""> <input type="hidden"
							name="coInfo" value=""> <input type="hidden"
							name="mobileNo" value=""> <input type="hidden"
							id="apiRequestType" name="apiRequestType" value=""> <input
							type="hidden" id="apiRequestNm" name="apiRequestNm" value="">
						<input type="hidden" id="korName" name="korName" value="">
						<input type="hidden" id="userId" name="userId" value=""> <input
							type="hidden" id="enrollDate" name="enrollDate" value="">
						<input type="hidden" id="snsType" name="snsType" value="">
						<input type="hidden" id="email" name="email" value=""> <input
							type="hidden" id="memberList" name="memberList" value="">

						<input type="hidden" id="snsId" name="snsId" value=""> <input
							type="hidden" id="SS_NAVER_UI" name="SS_NAVER_UI" value="">
						<input type="hidden" id="SS_KAKAO_UI" name="SS_KAKAO_UI" value="">
						<input type="hidden" id="SS_GOOGLE_UI" name="SS_GOOGLE_UI"
							value=""> <input type="hidden" id="SS_FACEBOOK_UI"
							name="SS_FACEBOOK_UI" value=""> <input type="hidden"
							id="SS_APPLE_UI" name="SS_APPLE_UI" value=""> <input
							type="hidden" id="joinType" name="joinType" value=""> <input
							type="hidden" name="cardYn" value=""> <input
							type="hidden" name="ffpNo" value="">

					</form>

					<form method="post" id="snsRequestAuthForm"
						name="snsRequestAuthForm" target="snsRequestAuth">
						<input type="hidden" id="hidSNSType" name="hidSNSType" value="">
						<input type="hidden" id="requestType" name="requestType"
							value="join"> <input type="hidden" name="hidChannelType"
							value="HOMEPAGE">
					</form>

					<span id="0000000157msg00024" style="display: none;">제휴카드 발급
						회원으로 회원가입&gt; 제휴카드발급 회원가입 진행 부탁드립니다.</span> <span id="0000000157msg00025"
						style="display: none;">제휴카드 발급 회원가입 대상자가 아닙니다. 일반회원가입으로 진행
						부탁드립니다.</span>

				</div>
				<button id="btnModalAlert" type="button"
					class="input__remove-button hide" data-element="modal_anchor"
					data-target="#divModalAlert" data-modal-type="simple" aria-label=""></button>
				<div id="divModalAlert" class="modal modal--simple">
					<div class="modal-content">
						<h2 class="alert-title"></h2>
						<p id="alertText" class="alert-text">제주항공 탈퇴 후 3일이 지나야 가입이
							가능합니다.</p>
					</div>
					<div class="modal__button-area button-wrap">
						<button type="button"
							class="button button--secondary button--active" rel="modal:close">
							<span class="button__text">확인</span>
						</button>
					</div>
					<a href="#" rel="modal:close" class="modal__close"><span
						class="blind">닫기</span></a>
				</div>
			</main>
		</div>

	</div>
</div>


<%@ include file="../../common/include/footer.jsp"%>

</body>
</html>