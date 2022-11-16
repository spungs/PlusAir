<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="">
<script>
function nextBtn(){
	location.href='../../base/index';
}

function writeBtn(){
	location.href='optionalInfoWrite';
}


</script>
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
					
					<script>
if(langCdtTag === 'ja') {
	_lt('send', 'cv', {
	  type: 'Conversion'
	},['ed5b2a5c-bf71-45cb-8efe-d82784b14617']);
}
</script>

<form id="frm" name="frm" method="post" action="">
          <!--20210519 title영역 수정-->
          <div class="page-title-wrap">
            <div class="page-title">가입완료</div>
            <div class="page-sub-title">환영합니다! 가입이 완료되었습니다.</div>
            <div class="section-sub-txt">제주항공 회원만의 특별한 이벤트와 프로모션,<br>포인트 적립 등 각종 회원 전용 혜택을 누려 보세요.</div>
          </div>
          <!--//20210519 title영역 수정-->

          <div class="sub-section">
            <!--20210519 class명 변경-->
            <div class="gray-box benefit_event">
            	<div class="section-sub-txt align-center">
                가입 즉시 사용 가능한<br>
				<span class="color--org">리프레시 포인트와 할인혜택</span>드려요.
              </div>
              <ul class="coupon-list">
                <li class="coupon-list__box">
                  <p class="coupon-list__box--title">가입과 동시에 적립</p>
                  <div class="coupon-list__item coupon-type1">
                    <p class="coupon-list__text">리프레시 포인트</p>
                    <p class="coupon-list__point">+ 2,000<span>P</span></p>
                  </div>
                </li>
                <li class="coupon-list__box">
                  <p class="coupon-list__box--title">국내선 예약 시</p>
                  <div class="coupon-list__item coupon-type2">
                    <p class="coupon-list__text">운임 7% 회원 할인</p>
                    <p class="coupon-list__point"><span>국내선</span>7<span>%</span></p>
                  </div>
                </li>
                <li class="coupon-list__box">
                  <p class="coupon-list__box--title">국제선 예약 시</p>
                  <div class="coupon-list__item coupon-type3">
                    <p class="coupon-list__text">운임 5% 회원 할인</p>
                    <p class="coupon-list__point"><span>국제선</span>5<span>%</span></p>
                  </div>
                </li>
              </ul>
            </div>
            <!--20210519 위치 이동, class명 삭제-->
            <div class="guide-info guide-info--gray ">
              <p class="guide-info__text inlineblock">신규회원 할인 사용기간 : 가입일로부터 30일 이내<br>
신규회원 할인 탑승기간 : 가입일로부터 90일 이내<br>
추가정보는 나중에 [마이페이지]에서도 입력할 수 있습니다.</p>
            </div>
            <!--//20210519 위치 이동, class명 삭제-->
          </div>

          <!--20210519 버튼영역 변경-->
          <div class="fixed-wrap section-wrap">
            <div class="button-wrap button-wrap--stick">
              <button type="button" data-action="nextBtn" class="button button--primary button--black"><span class="button__text" onclick="nextBtn()">다음에 입력하기</span></button>
              <button type="button" data-action="writeBtn" class="button button--primary button--active"><span class="button__text" onclick="writeBtn()">추가정보 입력하기</span></button>
            </div>
          </div>
          <!--//20210519 버튼영역 변경-->

	<input type="hidden" id="status" name="status" value="[normal, normal]">
	<input type="hidden" id="email" name="email" value="kmb0729@nate.com">
	<input type="hidden" id="test" name="test" value="">
	<input type="hidden" id="lang" name="lang" value="ko">
	
	<input type="hidden" name="act" value="agree">
	<input type="hidden" name="network_id" value="">
	<input type="hidden" name="CHL" value="HOMEPAGE">
	<input type="hidden" name="language_type" value="">
	<input type="hidden" name="foreignerYn" value="N">
	<input type="hidden" name="birthDate" value="19930729">
	<!-- 본인인증을 위해 필요한 정보   -->
	<input type="hidden" name="ipinNo" value=""> <!-- 아이핀인증번호 -->
	<input type="hidden" id="SendInfo" name="SendInfo">
	<!--	내/외국인 구분을 설정하십시오. ( '1'-내국인, '2'-외국인 )	-->
	<input type="hidden" id="foreigner" name="foreigner" value="">
	<!--	조회사유를 설정하십시오. ( '10'-회원가입, '20'-기존회원 확인, '30'-성인인증, '40'-비회원 확인, '90'-기타 사유 )	-->
	<input type="hidden" id="inqRsn" name="inqRsn" value="10">
	<input type="hidden" name="korLastName" value="강">
	<input type="hidden" name="korFirstName" value="모범">
	<input type="hidden" name="sex" value="M">
	<input type="hidden" name="ipinYN" value="Y">
	<input type="hidden" name="diNo" value="MC0GCCqGSIb3DQIJAyEAhC3ylKMrWpW41T9qSFjHFK7xcmweYu/arEbfonV9K/Y=">
	<input type="hidden" name="ciNo" value="40Wmgqg7DetQI/ETuxzTPXmJGPkaChado2QQN7lMBomSU2Ub0JT9oj2HH27ak7Fqu39k+tJck8V2fJ3cJ4IcRQ==">
	<input type="hidden" name="mobileNo" value="82-010-8025-0729">
	
	<input type="hidden" id="apiRequestType" name="apiRequestType" value="1111">
	<input type="hidden" id="apiRequestNm" name="apiRequestNm" value="CHECKPLUS">
	<input type="hidden" id="userId" name="userId" value="kmb930729">
	<input type="hidden" id="password" name="userPassword" value="">
	
	<input type="hidden" id="expireAgreeYn" name="expireAgreeYn" value="">
	<input type="hidden" id="emailAgreeYn" name="emailAgreeYn" value="N">
	<input type="hidden" id="smsAgreeYn" name="smsAgreeYn" value="N">
	
	<input type="hidden" id="engLastName" name="engLastName" value="KANG">
	<input type="hidden" id="engFirstName" name="engFirstName" value="MOBUM">
	<input type="hidden" id="birthSolarLunar" name="birthSolarLunar" value="S">
	<input type="hidden" id="appAgreeYn" name="appAgreeYn" value="">
	<input type="hidden" id="passportNo" name="passportNo" value="">
	<input type="hidden" id="nationalityCode" name="nationalityCode" value="">
	<input type="hidden" id="countryCode" name="countryCode" value="">
	<input type="hidden" id="parentCiNo" name="parentCiNo" value="">
	<input type="hidden" id="parentConfirmYn" name="parentConfirmYn" value="">
	<input type="hidden" id="parentName" name="parentName" value="">
	<input type="hidden" id="parentMobileNo" name="parentMobileNo" value="">
	<input type="hidden" id="requestChannelId" name="requestChannelId" value="">
	<input type="hidden" id="requestUserId" name="requestUserId" value="">
	<input type="hidden" id="fmmbrenhs" name="fmmbrenhs" value="">
	<input type="hidden" id="ffpNo" name="ffpNo" value="093563097">
	<input type="hidden" id="joinType" name="joinType" value="NOR">
</form>
<form id="newFrm" name="newFrm" method="get" action="">
</form>

<script>
  var joinType = document.getElementById('joinType').value;
  window.dataLayer = window.dataLayer ||[];
  window.dataLayer.push({
    'event': 'signupComplete',
    'eventCategory': '회원가입',
    'eventAction': '회원가입 완료',
    'eventLabel': joinType
  });
</script>

<!-- Event snippet for 회원가입완료 conversion page -->
<script>
if(langCdtTag === 'ja') {
	gtag('event', 'conversion', {'send_to': 'AW-10828977727/42J-CLCjz4sDEL-s1Kso'});
}
</script>

<script async="">
if(langCdtTag === 'ja') {
	ytag({
	"type": "yss_conversion",
	"config": {
	"yahoo_conversion_id": "1001228944",
	"yahoo_conversion_label": "XBZICOvjnYsDEPHI1qso",
	"yahoo_conversion_value": "0"
	}
	});
}
</script>

<script async="">
if(langCdtTag === 'ja') {
	ytag({
	"type":"yjad_conversion",
	"config":{
	"yahoo_ydn_conv_io": "0zbPNWxdBKovYWgpfHtcXw..",
	"yahoo_ydn_conv_label": "3R3VW6U5RCVZRZF6LT1869874",
	"yahoo_ydn_conv_transaction_id": "",
	"yahoo_ydn_conv_value": "0"
	}
	});
}
</script>

<!-- Event snippet for 회원가입(리뉴얼) conversion page -->
<script>
if(langCdtTag === 'ko') {
	gtag('event', 'conversion', {
		 'send_to': 'AW-763115837/SscRCPuzqcQDEL3y8OsC',
		 'transaction_id': ''
	});
}
</script>


	<script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
	<script type="text/javascript">
		kakaoPixel('4430357879563963209').pageView();
		kakaoPixel('4430357879563963209').completeRegistration();
	</script>



	<!-- Global site tag (gtag.js) - Google Ads: 770453349 -->
	<script async="" src="https://www.googletagmanager.com/gtag/js?id=AW-770453349"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());
		gtag('config', 'AW-770453349');
	</script>
	
	<!-- Event snippet for 가입 conversion page -->
	<script>
		gtag('event', 'conversion', {'send_to': 'AW-770453349/39vxCLP04MkDEOXesO8C'});
	</script>

				</main>
			</div>
			
		</div>
	</div>


<%@ include file="../../common/include/footer.jsp" %>
</body>
</html>