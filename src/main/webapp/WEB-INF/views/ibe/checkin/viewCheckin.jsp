<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class=""><head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no, maximum-scale=1, user-scalable=0">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Expires" content="-1">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta name="format-detection" content="telephone=no">
	<title>제주항공</title>
	<link rel="icon" type="image/png" href="https://static.jejuair.net/wccg/resources/images/icon/favicon.ico">
	
	
	
		
		
			
		
	

	
	





    



<link rel="stylesheet" href="https://static.jejuair.net/wccg/resources/css/global.css">
<link rel="stylesheet" href="https://static.jejuair.net/wccg/resources/css/component.css">
<link rel="stylesheet" href="https://static.jejuair.net/wccg/resources/css/page.css">
<link rel="stylesheet" href="https://static.jejuair.net/wccg/resources/css/responsive.css">
<link rel="stylesheet" href="https://static.jejuair.net/wccg/resources/css/lang.css">




<!-- 다국어 관련 스크립트 변수 -->
<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script><script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-PD2BQQ4"></script><script type="text/javascript">
var I18N = {
	language : "ko",
	country : "KR",
	countryAndLanguage : [{"languages":[{"cntryCd":"KR","langNm":"한국어","cntryNm":"대한민국","langCd":"ko"}],"cntryCd":"KR","cntryNm":"대한민국"},{"languages":[{"cntryCd":"JP","langNm":"日本語","cntryNm":"日本","langCd":"ja"}],"cntryCd":"JP","cntryNm":"日本"},{"languages":[{"cntryCd":"CN","langNm":"中文(内地)","cntryNm":"中国","langCd":"zh-CN"}],"cntryCd":"CN","cntryNm":"中国"},{"languages":[{"cntryCd":"TW","langNm":"中文(繁體)","cntryNm":"台灣","langCd":"zh-TW"}],"cntryCd":"TW","cntryNm":"台灣"},{"languages":[{"cntryCd":"HK","langNm":"中文(繁體)","cntryNm":"香港","langCd":"zh-HK"}],"cntryCd":"HK","cntryNm":"香港"},{"languages":[{"cntryCd":"MO","langNm":"中文(繁體)","cntryNm":"澳門","langCd":"zh-HK"}],"cntryCd":"MO","cntryNm":"澳門"},{"languages":[{"cntryCd":"US","langNm":"ENGLISH","cntryNm":"US","langCd":"en"}],"cntryCd":"US","cntryNm":"US"},{"languages":[{"cntryCd":"TH","langNm":"ENGLISH","cntryNm":"THAILAND","langCd":"en"}],"cntryCd":"TH","cntryNm":"THAILAND"},{"languages":[{"cntryCd":"VN","langNm":"ENGLISH","cntryNm":"VIETNAM","langCd":"en"}],"cntryCd":"VN","cntryNm":"VIETNAM"},{"languages":[{"cntryCd":"PH","langNm":"ENGLISH","cntryNm":"PHILLIPINES","langCd":"en"}],"cntryCd":"PH","cntryNm":"PHILLIPINES"},{"languages":[{"cntryCd":"MY","langNm":"ENGLISH","cntryNm":"MALAYSIA","langCd":"en"}],"cntryCd":"MY","cntryNm":"MALAYSIA"},{"languages":[{"cntryCd":"LA","langNm":"ENGLISH","cntryNm":"LAOS","langCd":"en"}],"cntryCd":"LA","cntryNm":"LAOS"},{"languages":[{"cntryCd":"RU","langNm":"ENGLISH","cntryNm":"RUSSIA","langCd":"en"}],"cntryCd":"RU","cntryNm":"RUSSIA"},{"languages":[{"cntryCd":"SG","langNm":"ENGLISH","cntryNm":"SINGAPORE","langCd":"en"}],"cntryCd":"SG","cntryNm":"SINGAPORE"},{"languages":[{"cntryCd":"MN","langNm":"ENGLISH","cntryNm":"MONGOLIA","langCd":"en"}],"cntryCd":"MN","cntryNm":"MONGOLIA"}]
}
var APP_DATA = {
	loginSuccessFirstChecker : '', // 값의 유무로만 판단.
	// deviceOs : "",
	// deviceType : ""
	deviceOs : "none",
	deviceType : "PC"
}
var USER_INFO = {
	get : function() {
		var data = JSON.stringify({"ffpNo":"093495882","customerNo":"093495882","userId":"hyemyk09","email":"hyemyk09@naver.com","birthDate":"19891013","nationalityCode":"KR","engFirstName":"HYEMYUNG","engLastName":"KIM","korFirstName":"혜명","korLastName":"김","gender":"F","enrollDate":"20221111","membergrade":"S","authorities":[{},{}],"name":"김혜명","mobileNo":"82-010-7461-7450","availPoint":"1000","snsAccountList":[],"resultCode":"0000","snsloginFlag":"N","appToken":"62dd31ee341ef521bc193a10c3821be75c788e38e6855d19982c04be39e5269a39cdvbAAgssBXh05W5kqT9hiv4oRw7Ue1c43s9Ups9K85p88i4Hv0ejm4bnmM6cL2vH231qq930O9Pe1L0Pxuvv3g1Alyw45ztU04r3ri199p1ga797dj4363jifZo71q4hoT16B8971ieSVOt75eV5wgOd1hl0Xy1f410S9udc2hH9o1H266525Yf2RN7OG"});
		return data || "{}";
	}
}
var PROP = {
	assetsUrl : "https://static.jejuair.net/wccg/resources"
}
var USER_DEVICE = {
	getName : function() {
		return "PC";
	},
	isApp : function() {
		return false;
	},
	isMobile : function() {
		return false;
	},
	isWeb : function() {
		return ;
	}
}
var APPCALL = {
	setMenu : function() {

		if(APP_DATA.deviceOs == "ios") {
			window.webkit.messageHandlers.goMenu.postMessage({});
		} else if(APP_DATA.deviceOs == "aos") {
			window.JejuAir.goMenu();
		} else {
			console.log("PC에서 호출작동됨 :: 메뉴를 개방하라");
		}
	},
	back : function() {
		if(APP_DATA.deviceOs == "ios") {
			window.webkit.messageHandlers.goBack.postMessage({});
		} else if(APP_DATA.deviceOs == "aos") {
			window.JejuAir.goBack();
		} else {
			window.history.back();
		}
	},
	close : function() {
		if(APP_DATA.deviceOs == "ios") {
			window.webkit.messageHandlers.goClose.postMessage({});
		} else if(APP_DATA.deviceOs == "aos") {
			window.JejuAir.goClose();
		} else {
			console.log("PC는 닫기가 존재하지 않습니다.");
		}
	},
	afterLogin : function(userInfo) { // 로그인 시, APP은 1번 호출한다.
		if(!userInfo) {
			userInfo = USER_INFO.get();
		}
		if(APP_DATA.deviceOs == "ios") {
			window.webkit.messageHandlers.userInfo.postMessage(userInfo);
		} else if(APP_DATA.deviceOs == "aos") {
			window.JejuAir.userInfo(userInfo);
		} else {
			console.log("호출완료");
		}
	},
	callPassport : function() { // 로그인 시, APP은 1번 호출한다.
		if(APP_DATA.deviceOs == "ios") {
			window.webkit.messageHandlers.goOCRPassport.postMessage({});
		} else if(APP_DATA.deviceOs == "aos") {
			window.JejuAir.goOCRPassport();
		} else {
			console.log("호출완료");
		}
	},
	callPastBoardingPass : function() { // 로그인 시, APP은 1번 호출한다.
		if(APP_DATA.deviceOs == "ios") {
			window.webkit.messageHandlers.goPastBoardingPass.postMessage({})
		} else if(APP_DATA.deviceOs == "aos") {
			window.JejuAir.goPastBoardingPass()
		} else {
			console.log("호출완료");
		}
	},
	callBoardingPass : function(jsonString) { // 로그인 시, APP은 1번 호출한다.
		if(APP_DATA.deviceOs == "ios") {
			window.webkit.messageHandlers.mobileTicket.postMessage(jsonString)
		} else if(APP_DATA.deviceOs == "aos") {
			window.JejuAir.mobileTicket(jsonString)
		} else {
			console.log("호출완료");
		}
	},
	goMain: function() { //메인화면 이동
		if(APP_DATA.deviceOs == "ios") {
			window.webkit.messageHandlers.callMain.postMessage({});
		} else if(APP_DATA.deviceOs == "aos") {
			window.JejuAir.goMain();
		} else {
			//location.href="/"+I18N.language+"/main/base/index.do";
			URL_LINK.getI18Url('/main/base/index.do');
		}
	},
	goLogout: function() {// 로그아웃시 네티이브 호출
		if(APP_DATA.deviceOs == "ios") {
			window.webkit.messageHandlers.goLogout.postMessage({});
		} else if(APP_DATA.deviceOs == "aos") {
			window.JejuAir.goLogout();
		}else {
			console.log('logout');
		}
	},
	loginState: function() { //로그인 상태 체크
		if(APP_DATA.deviceOs == "ios") {
			window.webkit.messageHandlers.onLoginState.postMessage({})
		} else if(APP_DATA.deviceOs == "aos") {
			window.JejuAir.onLoginState();
		}
	},

	goMyCoupon: function() { //쿠폰 이동
		if(APP_DATA.deviceOs == "ios") {
			window.webkit.messageHandlers.goMyCoupon.postMessage({});
		} else if(APP_DATA.deviceOs == "aos") {
			window.JejuAir.goMyCoupon();
		}else {
			URL_LINK.getI18Url('/member/mypage/myCoupon.do');
		}
	},

	goMarket: function() {
		if(APP_DATA.deviceOs !== "ios" && APP_DATA.deviceOs !== "aos") {
			var infos = getMobileDevice(navigator.userAgent);
			if(infos.isiOS) {
				window.open("https://itunes.apple.com/ko/app/jeju-air/id373053637?l=ko&mt=8", "_blank");
			}else if(infos.isAndroid) {
				window.open("https://play.google.com/store/apps/details?id=com.parksmt.jejuair.android16", "_blank");
			}
		}
	}
}
var URL_LINK = {
	getI18Url : function(path) {
		/*
		if(path.indexOf('/corpService/') == 0 ) {
			location.href = path;
			return;
		} else if(path.indexOf('/member/auth/') == 0 ) {
			location.href = path;
			return;
		} else
		*/
		if(path.indexOf('/bonusProgram/') == 0 ) {
			location.href = path;
			return;
		} else if(path.indexOf('#') == 0 ) {
			location.href = path;
			return;
		} else if(path.indexOf('http') == 0 ) {
			window.open(path, "_blank");
			return;
		}  else if(path.indexOf('/myPage/myBoardingList.do') == 0) {
			alert("준비중입니다.");
			return;
		}
		//location.href = ""+"/"+I18N.language+path;

		if(path.indexOf('login.do')!==-1 || path.indexOf('viewCheckin.do')!==-1) {
			location.href = "/"+I18N.language+path;
			return false;
		}

		if(path.startsWith("/"+I18N.language)!==-1){
			path = path.replace("/"+I18N.language, '');
		}
		this.getHwUrl(path);
	},
	getHwUrl : function(path) { //homepage <-> webcheckin
		var vHtml = '<input type="hidden" name="cntryCd" value="'+I18N.country+'"><input type="hidden" name="langCd" value="'+I18N.language+'">';
		$("body").append("<form id='hybdComForm'><input type='hidden' name='targetUrl' value='" + "/"+I18N.language+path + "'/>"+vHtml+"</form>");
    	$("#hybdComForm").prop("action", "/"+I18N.language+"/common/connect/index.do").prop("method", "POST").prop("target", "_self").submit();
	}
}

if(APP_DATA.loginSuccessFirstChecker !="") {
	APPCALL.afterLogin();
}

if(location.href.indexOf('flag=logout')!==-1) {
	//APPCALL.goLogout();
}

//웹 로그인 상태 확인 콜백
//true : 로그인 상태
//false : 비로그인 상태 
function callbackLoginState(result){
  // var isLogin = "";//web 로그인여부
  // if(!isLogin && result) { //web비로그인 native로그인일경우
//	 APPCALL.goLogout(); //native로그아웃
  // }
}

//if(USER_DEVICE.isApp) {//앱일경우 native로그인 상태체크
//	APPCALL.loginState();
//}

//안드로이드 modal일경우 back버튼 클릭시 뒤로가기가 아닌 modal닫기
function goBackBtn() {

	var isOpen1 = false;
	var isOpen2 = false;

	if($('html').hasClass('open-modal')){
		$('div.jquery-modal').find('a.modal__close').trigger('click');
		for(var i=0;i < $('div.modal-wrapper').length;i++){
			if($('div.modal-wrapper:eq('+i+')').hasClass('on')){
				$('div.modal-wrapper:eq('+i+')').find('a.modal__close').trigger('click');

				if($('html').hasClass('open-modal')){
					$('html').removeClass('open-modal');
				}
				break;
			}
		};
		
		return false;
	}

	if($('body > div').hasClass('dim')) {
		//bottomSheet
		for(var i=0;i < $('div.bottom-sheet').length;i++){
			if($('div.bottom-sheet:eq('+i+')').css('display')==='block'){
				$('div.bottom-sheet:eq('+i+')').find('button[data-element="bottomSheet__button-close"]').trigger('click');
				break;
			}
		};
		return false;
	}
	
	if($('div.flight-layer').length > 0) {
		for(var i=0;i < $('div.flight-layer').length;i++){
			if($('div.flight-layer:eq('+i+')').css('display')==='block'){
				$('div.flight-layer:eq('+i+')').find('a.layer-close').trigger('click');
				isOpen1 = true;
				break;
			}
		};
	}
	
	if($('div.date-layer').length > 0) {
		for(var i=0;i < $('div.date-layer').length;i++){
			if($('div.date-layer:eq('+i+')').css('display')==='block'){
				$('div.date-layer:eq('+i+')').find('a.layer-close').trigger('click');
				isOpen2 = true;
				break;
			}
		};
	}

	if(!$('html').hasClass('open-modal') && !$('body > div').hasClass('dim') && !isOpen1 && !isOpen2) {
		try {
			window.JejuAir.callBackBtn('Y');
		}catch(e){}
	}
	
}

</script>
	
	
	
			
	
	<script>
	window.dataLayer = window.dataLayer || [];
	window.dataLayer.push({
		'event'		: 'pageview',
		'dimension2':btoa(JSON.parse(USER_INFO.get()).userId),
		'dimension3':'PC-WEB',
		'dimension4': JSON.parse(USER_INFO.get()).membergrade 
	})
	</script>    	
          <!-- Google Tag Manager -->
	<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-PD2BQQ4');</script>
	<!-- End Google Tag Manager -->
    
<script src="/tuna_.js"></script></head>
<body id="subLayoutBody" class="isMobile">
	

	
	









 

 
 
 

 
 
 
















<!-- ios naver에서 땡기는 refresh시도시 해당 내용이 나와 주석처리함. 뭔 기능인지 모르겠음 개선 #1271286440
<div id="skipNav" class="skip-nav">
	<a href="#content" class="skip-nav__item">본문 바로가기</a>
</div>
-->
<!-- 상단 띠배너 공지사항은 메인페이지만 표시합니다. -->

	


<!-- 앱설치알림 -->




	


<!-- 남은시간 연장 및 공지바 노출-->
<div class="top-custom-banner ticketing_top_bar"><!--활성화시 .on 추가-->
  <div class="top-custom-banner__inner">
    <dl class="time_bar">
        <dt>이용 가능시간 : </dt>
        <dd><strong></strong></dd>
    </dl>
    <div class="link-wrap--arrow">
        <button type="button" class="link-wrap__text" onclick="javascript:sendExtTripsell();"><span>연장하기</span></button>
    </div>
    <button type="button" class="top-custom-banner__close" aria-label="닫기"></button>
  </div>
</div>

<!-- //남은시간 연장 및 공지바 노출 -->
<!-- header -->
<div id="header" class="header">
	<!-- mobile -->
	<header class="header__inner mobile-only">
		
			
			
				
				
				
					<div class="header__logo">
						<a href="javascript:;" data-action="menu" data-menu-name="main">
							

							
								
								<img src="https://static.jejuair.net/cms/images/banner_image/20211014191229348.png" alt="jejuairlogo" class="img_sticky">
							
						</a>
					</div>
				
			
		
		
		<div class="header__button-wrap subType" data-element="gnbToggle">
			<!-- 예매전 노출
			<button type="button" class="header__button-ticket">
				<span class="hidden">티켓보기</span>
			</button>
			// 예매전 노출 -->
			
				<button type="button" class="gnb__button">
					
						
					
					
					<img src="https://static.jejuair.net/wccg/resources/images/icon/icon-hamburger-header.png" alt="전체메뉴 열기" class="img_sticky">
				</button>
			

			
		</div>
		<!-- 스크롤시 스티키 상단 -->

		<!-- 전체메뉴 -->
		<div class="gnb" id="gnb" style="display: none; right: -925px; top: 0px;">
			<div class="gnb__header">
				<div class="gnb__header-top" data-absolute-sticky="">
					<a href="javascript:;" class="button-home" title="홈으로 이동" data-action="menu" data-menu-name="main">
						<img loading="lazy" src="https://static.jejuair.net/wccg/resources/images/upload/icon_bottombar_home_on_56x2.png" alt="홈">
					</a>
					<a class="select-wrap select-wrap--inline lang-type" id="btnCountrySelector" data-modal-type="full">
						
							
								대한민국
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
					</a>
					<div class="additional">
						<!-- D : '웹'일경우 APP다운로드 버튼 -->
						<button type="button" class="button button--small" onclick="APPCALL.goMarket()"><span class="button__text button__icon">APP</span></button>
						<a href="javascript:;" class="button-search" title="통합검색이동">
							<img loading="lazy" src="https://static.jejuair.net/wccg/resources/images/icon/icon-header-search.png" alt="통합 검색 이동">
						</a>
						<a href="javascript:;" class="gnb-close" aria-label="닫기">
							<img loading="lazy" src="https://static.jejuair.net/wccg/resources/images/icon/icon-header-gnb-close.png" alt="전체메뉴 닫기" class="close">
						</a>
					</div>
				</div>
				<div class="gnb__header-bot">
					
					
					<!-- 로그인 후 -->
					<div class="after after-login">
						<!-- fixed 영역 -->
						<div class="sticky-wrap" style="padding-top: 0px;">
							<div class="title sticky__inner gnb-sticky2">
								
								
									
										<i class="icon" aria-label="silver"><img loading="lazy" src="https://static.jejuair.net/wccg/resources/images/icon/grade-silver-gnb-large.png" alt="silver"></i> 
									
									
									
									
									
								
								

								<div class="text">
									<p class="name">
										<span class="exbold">김혜명</span>고객님
									</p>
									<p class="hide">안녕하세요?</p>
								</div>
								<div class="additional">
									<button type="button" class="button-card" aria-label="card-popup">
										<a href="javascript:void(0)" data-target="#myBenefit" data-element="modal_anchor" data-modal-type="full" class="link-wrap__text"><img loading="lazy" src="https://static.jejuair.net/wccg/resources/images/icon/icon-card.png" alt="알림"></a>
									</button>
									
									<a href="javascript:;" class="gnb-close" aria-label="닫기">
									   <img loading="lazy" src="https://static.jejuair.net/wccg/resources/images/icon/icon-header-gnb-close.png" alt="전체메뉴 닫기" class="close">
									</a>
								</div>
							</div>
						</div>
						
						

						
						
						
							
								
								
							
							
							
							
							
						
						<!-- 회원카드 팝업 -->
						<div id="myBenefit" class="modal modal-full modal-bg--org modal-scroll">
							<div class="modal-header">
								<div class="modal-header__title">나의 혜택 확인</div>
							</div>
							<div class="modal-content">
								<div class="member-card">
									<div class="member-card__item">
										

										<!--
										등급별 아이콘 해당 class 추가
										'icon-vip' - VIP
										'icon-cold' - GOLD
										'icon-sliver' - SILVER
										'icon-sliver-plus' - SILVER+
									-->
										<div class="member-card__grade">
											<p class="member-card__grade-title icon-sliver">SILVER</p>
										</div>
										<!-- <div class="member-card__grade"><p class="member-card__grade-title icon-vip">VIP</p></div>           
									<div class="member-card__grade"><p class="member-card__grade-title icon-sliver">SILVER</p></div>
									<div class="member-card__grade"><p class="member-card__grade-title icon-sliver-plus">SILVER+</p></div> -->

										<div class="gray-box">
											<div class="member-card__list">
												<ul class="member-card__list-info">
													<li><span class="text-title">성명</span><strong class="text-desc">김혜명</strong></li>
													<li><span class="text-title">회원번호</span><strong class="text-desc">093495882</strong></li>
													<li><span class="text-title">사용 가능 포인트</span><strong class="text-desc text-desc--org">1,000P</strong></li>
												</ul>
											</div>
										</div>
									</div>

									<p class="list-card-line"></p>

									<div class="member-card__item">
										<div class="list-card list-card--grade-info">
											
											
											
											
										</div>
									</div>
								</div>

							</div>
							<a href="#" rel="modal:close" class="modal__close"><span class="blind">닫기</span></a>
						</div>
						<!-- //회원카드 팝업 -->
						<!-- //fixed 영역 -->
						<div class="gray-box">
							<div class="flex-text">
								회원번호
								<div class="flex-text__additional">093495882</div>
							</div>
							<div class="flex-text">
								사용 가능한 포인트
								<div class="flex-text__additional" data-user-info-box="availPoint">1,000P</div>
							</div>
						</div>
						<div class="button-wrap button-flex">
							<button type="button" class="button button--secondary button--border" data-action="menu" data-menu-name="refreshPoint"><span class="button__text">리프레시포인트</span></button>
							<button type="button" class="button button--secondary button--border add--ml-10" data-action="menu" data-menu-name="mypage"><span class="button__text">마이페이지</span></button>
						</div>
					</div>
					
					<div class="icon-link">
						
						
							
								
										<a href="javascript:;" onclick="URL_LINK.getI18Url('/ibe/mypage/viewReservationList.do')" class="icon-link__item" data-action="menu" data-menu-name="tourAndTicket"> 
									
									
									
									
													
							<img src="https://static.jejuair.net/cms/images/banner_image/20211117132250301.png" alt="">
							<span class="icon-link__text" style="color:">나의 예약조회
							</span></a>
						
							
								
									
										<a href="javascript:;" onclick="URL_LINK.getI18Url('/prepare/flight/viewScheduleInfo.do')" class="icon-link__item" data-action="menu" data-menu-name="tourAndTicket">
									
									
									
													
							<img src="https://static.jejuair.net/cms/images/banner_image/20211005132323185.png" alt="">
							<span class="icon-link__text" style="color:">출도착 조회
							</span></a>
						
							
								
									
									
										<a href="javascript:;" onclick="URL_LINK.getI18Url('/customerService/csCenter/faqList.do')" class="icon-link__item" data-action="menu" data-menu-name="tourAndTicket">
									
									
													
							<img src="https://static.jejuair.net/cms/images/banner_image/20211005132333367.png" alt="">
							<span class="icon-link__text" style="color:">고객센터
							</span></a>
						
					</div>
										
					

					<!-- //로그인 후 -->
				</div>
			</div>
			<hr class="section-spacer">
			<div class="gnb-wrap">
				
				
				
				
					
						<div class="gnb__box">
							<div class="gnb__title">마이페이지</div>
							<div class="gnb__list">
								
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/member/mypage/main.do')">마이페이지 메인</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/ibe/mypage/viewOnOffReservationList.do')">예약 조회</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/ibe/mypage/viewReservationList.do')">나의 예약 현황</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/member/mypage/myFlightList.do')">나의 탑승 내역</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/member/mypage/viewMyGiftTicketList.do')">나의 기프티켓</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/member/mypage/memberInfoModify.do')">회원정보 수정</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/member/mypage/viewMyPartnerCoupon.do')">나의 쿠폰</a>
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
							</div>
						</div>
					
				
					
				
					
				
					
				
					
				
					
				
					
				
					
				
					
						<div class="gnb__box">
							<div class="gnb__title">여행준비 안내</div>
							<div class="gnb__list">
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/ibe/booking/Availability.do')">항공권 예매</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/prepare/fare/domesticBenefit.do')">국내선 운임</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/prepare/fare/internationalBenefit.do')">국제선 운임</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/prepare/flight/viewScheduleInfo.do?index=1')">스케줄 조회</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/prepare/flight/viewScheduleInfo.do?index=2')">출도착 조회</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/ibe/booking/viewMilitaryInput.do')">민항공후급증 예약</a>
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
							</div>
						</div>
					
				
					
				
					
				
					
				
					
				
					
				
					
				
					
						<div class="gnb__box">
							<div class="gnb__title">회원 혜택 안내</div>
							<div class="gnb__list">
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/memberBenefit/memberBenefit.do?param=newMember ')">신규회원 혜택</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/memberBenefit/memberBenefit.do?param=promotion')">프로모션 코드</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/main.do')">리프레시 포인트</a>
									
								
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/pointBuy.do')">포인트 구매</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/pointSearch.do')">포인트 조회</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/additionalService/service/gifticket.do')">기프티켓</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/memberBenefit/regCoupon.do')">쿠폰 등록</a>
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
							</div>
						</div>
					
				
					
				
					
				
					
				
					
				
					
				
					
				
					
				
					
				
					
						<div class="gnb__box">
							<div class="gnb__title">부가서비스 안내</div>
							<div class="gnb__list">
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/additionalService/service/main.do')">부가서비스 소개</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/additionalService/service/preorderedBaggage.do')">사전 수하물</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/additionalService/service/preorderedSeat.do')">사전 좌석</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/additionalService/service/preorderedMeal.do')">사전 기내식</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/additionalService/service/insurance.do')">여행자 보험</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/additionalService/service/bundleGuide.do')">부가서비스 번들</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/additionalService/service/afterPayGuide.do')">나중에 결제</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/additionalService/service/carringBagGuide.do')">자전거 캐링백 서비스</a>
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
							</div>
						</div>
					
				
					
				
					
				
					
				
					
				
					
				
					
				
					
				
					
				
					
						<div class="gnb__box">
							<div class="gnb__title">프리미엄 혜택 안내</div>
							<div class="gnb__list">
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/premium/businesslite/main.do')">비즈니스 라이트</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/premium/sportsMembership/main.do')">스포츠 멤버십</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/additionalService/service/allianceService.do')">제휴서비스</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('https://www.jejuairshop.com?jjout=Y')">온라인몰 제이샵</a>
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
							</div>
						</div>
					
				
					
				
					
				
					
				
					
				
					
						<div class="gnb__box">
							<div class="gnb__title">탑승 수속 안내</div>
							<div class="gnb__list">
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/ibe/checkin/viewCheckin.do')">모바일 탑승권</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/linkService/boardingProcessGuide/baggageGuide.do')">수하물</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/linkService/fastProcedure/guide.do')">빠른 수속</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/linkService/airport/info.do')">공항 정보</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/linkService/help/main.do')">도움이 필요한 고객</a>
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
							</div>
						</div>
					
				
					
				
					
				
					
				
					
				
					
				
					
						<div class="gnb__box">
							<div class="gnb__title">기내 서비스 안내</div>
							<div class="gnb__list">
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/cabinService/service/airCafe.do')">에어카페</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/customerServiceCenter/noticeDetail.do?billboardNo=0000000198')">기내 면세</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/cabinService/service/funService.do')">기내 FUN 서비스</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/cabinService/immigration/etcFormGuide.do')">출입국 신고서 작성방법</a>
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
							</div>
						</div>
					
				
					
				
					
				
					
				
					
				
					
						<div class="gnb__box">
							<div class="gnb__title">이벤트</div>
							<div class="gnb__list">
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/event/event.do')">진행중인 이벤트</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/event/pastEvent.do')">지난 이벤트</a>
									
								
									
								
									
								
									
								
									
								
							</div>
						</div>
					
				
					
				
					
				
					
						<div class="gnb__box">
							<div class="gnb__title">고객센터</div>
							<div class="gnb__list">
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/customerService/csCenter/faqList.do')">고객센터</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/customerService/cabinLost/cabinLost.do')">기내 유실물 센터</a>
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/customerServiceCenter/notice.do')">공지사항</a>
									
								
							</div>
						</div>
					
				
					
				
					
				
					
				
				
				<div class="gnb__footer">
					
						
						
							<div class="gnb__title">SNS</div>
							<div class="sns-wrap">
								
									<a href="https://www.facebook.com/funjejuair/" class="sns-wrap__item" target="_blank">
										<img loading="lazy" src="https://static.jejuair.net/cms/images/sns_ch/20211027200713454.png" alt="https://www.facebook.com/funjejuair/">
									</a>
								
									<a href="https://www.youtube.com/user/funjejuair" class="sns-wrap__item" target="_blank">
										<img loading="lazy" src="https://static.jejuair.net/cms/images/sns_ch/20211027200700139.png" alt="https://www.youtube.com/user/funjejuair">
									</a>
								
									<a href="https://instagram.com/jejuair_official" class="sns-wrap__item" target="_blank">
										<img loading="lazy" src="https://static.jejuair.net/cms/images/sns_ch/20211027200545316.png" alt="https://instagram.com/jejuair_official">
									</a>
								
							</div>
						
					
					
					<div class="button-wrap button-wrap--center">
						<button type="button" class="button button--secondary button--border" data-element="modal_anchor" data-target="#confirmLogout" data-modal-type="small"><span class="button__text">로그아웃</span></button>
					</div>
					
				</div>
			</div>
		</div>
		<!-- //전체메뉴 -->
	</header>
	<!-- //mobile -->

	<!-- pc용 공통 헤더 -->
	<div class="header__util util pc-only">
		<div class="util__inner">
			<div class="util__benefit">
	         <!-- 기업우대 여행자우대 사이트 한국어만 표출   , 기업우대서비스 오픈이 11월 8일,  오픈 시기  -->
			 
     			<a href="javascript:;" class="util__link company" data-action="menu" data-menu-name="company">기업 우대</a>
                <div class="util__link-wrap" data-element="toggle" data-options="{&quot;mode&quot;: &quot;slide&quot;, &quot;speed&quot;: 0, &quot;clickToClose&quot;: true}">
		          <button type="button" class="util__link arrow__link" data-element="toggle__anchor" aria-controls="toggle-1" aria-expanded="false">여행사 우대</button>
		          <div class="util__link-panel" data-element="toggle__panel" id="toggle-1">
		            <a href="javascript:;" class="item" data-action="menu" data-menu-name="travelAgencyD">국내선</a>
		            <a href="javascript:;" class="item" data-action="menu" data-menu-name="travelAgencyF">국제선</a>
		          </div>
		        </div>	
              
              
              
            
             
              
             
              
             
              
             
              
             
              <a href="https://cargo.jejuair.net" target="_black" class="util__link2" data-action="menu" data-menu-name="Cargo">Cargo</a>		        			
			</div>

			<div class="util__link-list" data-custom-toggle="wrap">
				
					<span class="util__personal">
                        <a href="javascript:;" onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/pointSearch.do');"><span class="text">나의 포인트</span> <strong class="point" data-user-info-box="availPoint">1,000P</strong></a>
					</span>
				
				
					<a href="javascript:;" class="util__link" data-element="modal_anchor" data-target="#confirmLogout" data-modal-type="small">로그아웃</a>
				
				
				<!-- // 로그인 전 노출 -->

				
					
						
						
						<a href="javascript:;" onclick="URL_LINK.getI18Url('/ibe/mypage/viewReservationList.do')" class="util__link">나의 예약 현황</a>
						
					
						
						
						<a href="javascript:;" onclick="URL_LINK.getI18Url('/customerService/csCenter/faqList.do')" class="util__link">고객센터</a>
						
					
						
						
						<a href="javascript:;" onclick="URL_LINK.getI18Url('/customerServiceCenter/notice.do')" class="util__link">공지사항</a>
						
					
				
				<button type="button" class="util__country" data-custom-toggle="button">
					<span class="text">
							
								대한민국
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						</span>
				</button>
				<div class="header-country__layer" data-custom-toggle="panel" style="">
					<div class="country__title">
						지역 및 언어 설정
					</div>
					<div class="country__input">
						<div class="select-wrap select-wrap--line">
							
							<select title="국가 선택" class="select-wrap__select selected" name="countryChoice" id="countryChoice">
								
									
									
										
										
									
									<option value="KR" selected="">대한민국</option>
								
									
									
									<option value="JP">日本</option>
								
									
									
									<option value="CN">中国</option>
								
									
									
									<option value="TW">台灣</option>
								
									
									
									<option value="HK">香港</option>
								
									
									
									<option value="MO">澳門</option>
								
									
									
									<option value="US">US</option>
								
									
									
									<option value="TH">THAILAND</option>
								
									
									
									<option value="VN">VIETNAM</option>
								
									
									
									<option value="PH">PHILLIPINES</option>
								
									
									
									<option value="MY">MALAYSIA</option>
								
									
									
									<option value="LA">LAOS</option>
								
									
									
									<option value="RU">RUSSIA</option>
								
									
									
									<option value="SG">SINGAPORE</option>
								
									
									
									<option value="MN">MONGOLIA</option>
								
							</select>
						</div>
						<div class="select-wrap select-wrap--line">
							<select class="select-wrap__select selected" title="언어 선택" name="languageChoice" id="languageChoice">
								
									
									
										
									
									<option value="ko" selected="">한국어</option>
								
							</select>
						</div>
						<button class="country__button" id="countryAndLanguageChoiceBtn" data-flag="base">확인</button>
					</div>
					<button class="button-close" data-custom-toggle="close">
						<span class="hidden">닫기</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	<header class="header__inner  pc-only">
		<div class="sticky-header" data-sticky="" style="">
			<div class="header__box">
				<!-- header__box 추가 -->
				<h1 class="header__logo">
					
					<a href="javascript:;" data-action="menu" data-menu-name="main">
					
						
						<img src="https://static.jejuair.net/cms/images/banner_image/20211014191229348.png" alt="jejuairlogo">
					
					</a>
				</h1>
				
					
						<h2 class="header__page-name">모바일 탑승권</h2>
					
				
				
					
						
						
							
							
								<div class="header__link-list">
									
									
										
											
											
												<a href="javascript:void(0);" class="header__link" onclick="URL_LINK.getI18Url('/ibe/booking/Availability.do')">항공권 예매</a>
											
										
									
									
									
										
											
											
												<a href="javascript:void(0);" class="header__link" onclick="URL_LINK.getI18Url('/member/mypage/main.do')">마이페이지</a>
											
										
									
									
									
										
											
											
												<a href="javascript:void(0);" class="header__link" onclick="URL_LINK.getI18Url('/additionalService/service/main.do')">부가서비스 안내</a>
											
										
									
									
									
										
											
											
												<a href="javascript:void(0);" class="header__link" onclick="URL_LINK.getI18Url('/ibe/checkin/viewCheckin.do')">모바일 탑승권</a>
											
										
									
									
									
										
											
											
												<a href="javascript:void(0);" class="header__link" onclick="URL_LINK.getI18Url('/event/event.do')">이벤트</a>
											
										
									
									
								</div>
							
						
					
				

				<div class="header__search-wrap header-search subType" data-custom-toggle="wrap">
					<!-- <button type="button" class="header__button-ticket">
					<span class="hidden">티켓보기</span>
					</button> -->
					<button type="button" class="header__button-search" data-custom-toggle="button">
						<img loading="lazy" src="https://static.jejuair.net/wccg/resources/images/icon/icon-header-search.png" alt="검색">
					</button>
					<div class="header-search__layer" data-custom-toggle="panel" style="">
						<div class="header-search__form" data-element="form">
							<input type="search" class="search__text" placeholder="검색어를 입력해 주세요" data-element="input">
							<button type="button" data-element="remove" class="input__remove-button">삭제</button>
							<div class="search-button">
								<button class="button" type="button">검색</button>
							</div>
						</div>
						<!-- <button type="button" class="search__close" data-custom-toggle="button">
					<span class="hidden">검색창 닫기</span>
				</button> -->
					</div>
				</div>
				<div class="header__button-wrap subType" data-element="gnbToggle">
					<button type="button" class="gnb__button">
						<img loading="lazy" src="https://static.jejuair.net/wccg/resources/images/icon/icon-hamburger-header.png" alt="전체메뉴 열기" class="open">

						
							
						
					</button>
				</div>

				<!-- goto-quick-booking : 스티키 클릭용 -->
				<div class="goto-quick-booking">
					<a href="javascript:;">
						<span>어디로 여행가세요?</span>
						<div class="goto-btn">
							<span>항공권 검색</span>
						</div>
					</a>
				</div>
				<!-- //goto-quick-booking -->

			</div>

			<!-- 전체메뉴 -->
			<div class="gnb" id="gnb" style="display: none; right: -925px; top: 0px;">
				<div class="gnb-wrap">
					
					
					
					
						
							<div class="gnb__box">
								<div class="gnb__title">마이페이지</div>
								<div class="gnb__list">
									
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/member/mypage/main.do')">마이페이지 메인</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/ibe/mypage/viewOnOffReservationList.do')">예약 조회</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/ibe/mypage/viewReservationList.do')">나의 예약 현황</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/member/mypage/myFlightList.do')">나의 탑승 내역</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/member/mypage/viewMyGiftTicketList.do')">나의 기프티켓</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/member/mypage/memberInfoModify.do')">회원정보 수정</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/member/mypage/viewMyPartnerCoupon.do')">나의 쿠폰</a>
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
								</div>
							</div>
						
					
						
					
						
					
						
					
						
					
						
					
						
					
						
					
						
							<div class="gnb__box">
								<div class="gnb__title">여행준비 안내</div>
								<div class="gnb__list">
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/ibe/booking/Availability.do')">항공권 예매</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/prepare/fare/domesticBenefit.do')">국내선 운임</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/prepare/fare/internationalBenefit.do')">국제선 운임</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/prepare/flight/viewScheduleInfo.do?index=1')">스케줄 조회</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/prepare/flight/viewScheduleInfo.do?index=2')">출도착 조회</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/ibe/booking/viewMilitaryInput.do')">민항공후급증 예약</a>
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
								</div>
							</div>
						
					
						
					
						
					
						
					
						
					
						
					
						
					
						
							<div class="gnb__box">
								<div class="gnb__title">회원 혜택 안내</div>
								<div class="gnb__list">
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/memberBenefit/memberBenefit.do?param=newMember ')">신규회원 혜택</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/memberBenefit/memberBenefit.do?param=promotion')">프로모션 코드</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/main.do')">리프레시 포인트</a>
										
									
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/pointBuy.do')">포인트 구매</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/pointSearch.do')">포인트 조회</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/additionalService/service/gifticket.do')">기프티켓</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/memberBenefit/regCoupon.do')">쿠폰 등록</a>
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
								</div>
							</div>
						
					
						
					
						
					
						
					
						
					
						
					
						
					
						
					
						
					
						
							<div class="gnb__box">
								<div class="gnb__title">부가서비스 안내</div>
								<div class="gnb__list">
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/additionalService/service/main.do')">부가서비스 소개</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/additionalService/service/preorderedBaggage.do')">사전 수하물</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/additionalService/service/preorderedSeat.do')">사전 좌석</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/additionalService/service/preorderedMeal.do')">사전 기내식</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/additionalService/service/insurance.do')">여행자 보험</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/additionalService/service/bundleGuide.do')">부가서비스 번들</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/additionalService/service/afterPayGuide.do')">나중에 결제</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/additionalService/service/carringBagGuide.do')">자전거 캐링백 서비스</a>
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
								</div>
							</div>
						
					
						
					
						
					
						
					
						
					
						
					
						
					
						
					
						
					
						
							<div class="gnb__box">
								<div class="gnb__title">프리미엄 혜택 안내</div>
								<div class="gnb__list">
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/premium/businesslite/main.do')">비즈니스 라이트</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/premium/sportsMembership/main.do')">스포츠 멤버십</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/additionalService/service/allianceService.do')">제휴서비스</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('https://www.jejuairshop.com?jjout=Y')">온라인몰 제이샵</a>
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
								</div>
							</div>
						
					
						
					
						
					
						
					
						
					
						
							<div class="gnb__box">
								<div class="gnb__title">탑승 수속 안내</div>
								<div class="gnb__list">
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/ibe/checkin/viewCheckin.do')">모바일 탑승권</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/linkService/boardingProcessGuide/baggageGuide.do')">수하물</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/linkService/fastProcedure/guide.do')">빠른 수속</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/linkService/airport/info.do')">공항 정보</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/linkService/help/main.do')">도움이 필요한 고객</a>
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
								</div>
							</div>
						
					
						
					
						
					
						
					
						
					
						
					
						
							<div class="gnb__box">
								<div class="gnb__title">기내 서비스 안내</div>
								<div class="gnb__list">
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/cabinService/service/airCafe.do')">에어카페</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/customerServiceCenter/noticeDetail.do?billboardNo=0000000198')">기내 면세</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/cabinService/service/funService.do')">기내 FUN 서비스</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/cabinService/immigration/etcFormGuide.do')">출입국 신고서 작성방법</a>
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
								</div>
							</div>
						
					
						
					
						
					
						
					
						
					
						
							<div class="gnb__box">
								<div class="gnb__title">이벤트</div>
								<div class="gnb__list">
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/event/event.do')">진행중인 이벤트</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/event/pastEvent.do')">지난 이벤트</a>
										
									
										
									
										
									
										
									
										
									
								</div>
							</div>
						
					
						
					
						
					
						
							<div class="gnb__box">
								<div class="gnb__title">고객센터</div>
								<div class="gnb__list">
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/customerService/csCenter/faqList.do')">고객센터</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/customerService/cabinLost/cabinLost.do')">기내 유실물 센터</a>
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/customerServiceCenter/notice.do')">공지사항</a>
										
									
								</div>
							</div>
						
					
						
					
						
					
						
					
					
					<div class="gnb__footer">
						
							
							
								<div class="gnb__title">SNS</div>
								<div class="sns-wrap">
									
										<a href="https://www.facebook.com/funjejuair/" target="_blank" class="sns-wrap__item">
											<img loading="lazy" src="https://static.jejuair.net/cms/images/sns_ch/20211027200713454.png" alt="https://www.facebook.com/funjejuair/">
										</a>
									
										<a href="https://www.youtube.com/user/funjejuair" target="_blank" class="sns-wrap__item">
											<img loading="lazy" src="https://static.jejuair.net/cms/images/sns_ch/20211027200700139.png" alt="https://www.youtube.com/user/funjejuair">
										</a>
									
										<a href="https://instagram.com/jejuair_official" target="_blank" class="sns-wrap__item">
											<img loading="lazy" src="https://static.jejuair.net/cms/images/sns_ch/20211027200545316.png" alt="https://instagram.com/jejuair_official">
										</a>
									
								</div>
							
						
						
						<div class="button-wrap button-wrap--center">
							<button type="button" class="button button--secondary button--border" data-element="modal_anchor" data-target="#confirmLogout" data-modal-type="small"><span class="button__text">로그아웃</span></button>
						</div>
						
					</div>
				</div>
			</div>
			
			<!-- //전체메뉴 -->
		</div>
	</header>
	<!-- //pc용 공통 헤더 -->
	<!-- pc용 공통 헤더 -->
</div>
<!-- //header -->
<!-- 공통 컨펌(내용) -->
<div id="confirmLogout" class="modal modal--simple">
	<div class="modal-content">
		<h2 class="alert-title">로그아웃 하시겠습니까?<!--로그아웃 하시겠습니까?--></h2>
	</div>
	<div class="modal__button-area button-wrap">
		<button type="button" class="button button--secondary" rel="modal:close" onclick="javascript:closeCurrentModal(this);"><span class="button__text">아니요<!--아니요--></span></button>
		<button type="button" class="button button--secondary button--active add--ml-10" onclick="BIZ_COMMONS_SCRIPT.goLogout();"><span class="button__text">예<!--예--></span></button>
	</div>
</div>
 <!-- // 공통 컨펌(내용) -->

	
	<div id="body">
		
		<!-- Google Tag Manager (noscript) -->
		<noscript>&lt;iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PD2BQQ4" height="0" width="0" style="display:none;visibility:hidden"&gt;&lt;/iframe&gt;</noscript>
		<!-- End Google Tag Manager (noscript) -->
		
		<div class="wrap main-nf">
			
			
				<div id="breadcrumb" class="breadcrumb pc-only" aria-label="breadcrumb">
					<nav class="breadcrumb__inner">
						<div class="breadcrumb__item">
							<a href="javascript:;" class="breadcrumb__link" style="cursor: default;">홈</a>
						</div>
						
						
							
								
									<div class="breadcrumb__item">
										<a href="javascript:;" class="breadcrumb__link" style="cursor: default;">탑승 수속 안내</a>
									</div>
								
								
							
						
							
								
								
									<div class="breadcrumb__item breadcrumb__item--current" aria-current="page" data-element="toggle" data-options="{&quot;mode&quot;: &quot;slide&quot;, &quot;speed&quot;: 100, &quot;clickToClose&quot;: true}">
										
											
												<button type="button" class="breadcrumb__link breadcrumb__link--list" data-element="toggle__anchor" aria-controls="toggle-2" aria-expanded="false">모바일 탑승권</button>
											
										
											
										
											
										
											
										
											
										

										<div class="breadcrumb__siblings-list" data-element="toggle__panel" id="toggle-2">
											
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/linkService/airport/info.do')">공항 정보</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/linkService/fastProcedure/guide.do')">빠른 수속</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/linkService/help/main.do')">도움이 필요한 고객</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/linkService/boardingProcessGuide/baggageGuide.do')">수하물</a>
												
											
										</div>
									</div>
								
							
						
					</nav>
				</div>
			

			
			<div class="content" id="content">
				<main id="main" class="main ">
					
					
<form id="fromCheckinInfo" name="checkinInfo" method="post" target="_self">
	<input type="hidden" name="checkinInfo" value="">
	<input type="hidden" name="rpnr" id="rpnr" value="">
</form>

<form id="fromCheckinen" name="checkinedData" method="post" target="_self">
	<input type="hidden" name="boardingPassData" value="">
	<input type="hidden" name="rpnr" id="rpnr" value="">
</form>
<div class="page-title-wrap" id="isResult" style="display:none;"><div class="page-title">모바일 탑승권</div></div>
<div class="page-title-wrap" id="noLogin" style="display:none;"><div class="page-title">모바일 탑승권</div></div>
<div class="page-title-wrap" id="loginNoResult" style=""><div class="page-title">모바일 탑승권</div><div class="page-sub-title">현재 발급할 수 있는 <br class="mobile-only">예약이 없어요.</div><div class="title mobile-only"><div class="button-wrap left"><a href="javascript:void(0)" class="button button--middle" onclick="URL_LINK.getI18Url(&quot;/ibe/mypage/viewReservationList.do&quot;)"><span class="button__text">나의 예약</span></a></div></div><div class="title pc-only"><div class="button-wrap left"><button type="button" class="button button--primary button--black" onclick="URL_LINK.getI18Url(&quot;/ibe/mypage/viewReservationList.do&quot;)"><span class="button__text">나의 예약</span></button></div></div></div>
<div class="page-title-wrap" id="nonUserLogin" style="display:none;"><div class="page-title">모바일 탑승권</div></div>
<div class="section-wrap" id="noCheckinList" style="">
	<div class="boarding pc-full">
		<div class="boarding__issue">
			<div class="pc-flex">
				<div class="boarding__issue-title">모바일 탑승권 발급 가능 시간</div>
				<div class="boarding__issue-info">
					<div class="graph-wrap">
						<div class="graph-wrap__item graph-wrap__item--international">
							<span class="graph-wrap__time">24시간 전</span> <span class="graph-wrap__time center">1시간 30분 전</span>
							<dl>
								<dt>국제선</dt>
								<dd>
									출발 24시간 전<br> ~ 1시간 30분 전 
								</dd>
							</dl>
						</div>
						<div class="graph-wrap__item graph-wrap__item--domestic">
							<span class="graph-wrap__time">30분 전</span>
							<di>
							<dt>국내선</dt>
							<dd>
								출발 24시간 전<br> ~ 30분 전 
							</dd>
							</di>
						</div>
					</div>
				</div>
			</div>
			<div class="sub-section">
				<div class="boarding__issue-title">모바일 탑승권 발급 제한 노선</div>
				<ul class="list-guide">
					<li class="list-guide__item">한국출발 인천공항 필리핀, 중국 노선</li>
					<li class="list-guide__item">한국출발 김해공항 국제선</li>
					<li class="list-guide__item">해외출발 모든 국제선</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<div class="page-title-wrap" style="display:none;"></div>

<div class="section-wrap" id="resultListSection" style="display: none;">
	<div class="select-chips full help swiper-container swiper-container-initialized swiper-container-horizontal">
		<ul class="chips-group swiper-wrapper" id="checkinTabList" style="transition-duration: 0ms;"></ul>
	<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
	<div class="sub-section" id="checkinList"></div>
</div>


<div class="section-wrap">
	<div class="link-wrap link-wrap--left mobile-only">
		<a href="javascript:void(0)" class="link-wrap__underline" onclick="restrictedUseInfoModalLayer();"><span>이용제한 고객 및 임산부 고객 안내</span></a>
	</div>
	<div class="link-wrap link-wrap--left pc-only">
		<a href="javascript:void(0)" class="link-wrap__underline" onclick="restrictedUseInfoModalLayer();"><span>이용제한 고객 및 임산부 고객 안내</span></a>
	</div>
	<div class="link-wrap link-wrap--left link-wrap--arrow mobile-only" id="lastCheckinBtn" onclick="goBeforeBoardingPass();" style="display:none;">
		<a href="javascript:void(0)" class="link-wrap__text"><span>지난 모바일 탑승권 보기</span></a>
	</div>
</div>

<div class="section-wrap">
	<div class="section-title">예약 정보로 조회하기</div>
	<div class="gray-box gray-box--pc pc-search pc-search--row2">
		<div class="input-set cont1">
			<div class="input-wrap input--line">
				<div class="input-row">
					<div class="input-item" id="inputRecordLocatorDiv">
						<div class="input-box">
							<label class="input__label">예약번호</label>
							<div data-element="form" class="input">
								<input type="text" onchange="checkResvBtn();" data-element="input" class="input__text" title="예약번호 입력" id="recordLocatorLabel" name="recordLocatorInput" style="text-transform :uppercase;" onkeyup="sUtil.alphaNumeric(this)" maxlength="6">
								<input type="hidden" id="hidRecordLocator">
								<button type="button" data-element="remove" class="input__remove-button">
									<span class="hidden">삭제</span>
								</button>
							</div>
						</div>
						<p class="input__sub-text">여행사, 공항, 고객센터, 비회원 예약도 조회할 수 있어요.</p>
						<p tabindex="0" class="input__error" id="errorRecordLocator"></p>
					</div>
				</div>
				<div class="input-row">
					<div class="input-item" id="inputDepDateDiv">
						<div class="input-box label-active">
							<label class="input__label">탑승일자</label>
							<button type="button" data-element="modal_anchor" data-modal-type="datepicker" data-target="#datepicker01" class="picker picker--button" id="boardingDateBtn">YYYY.MM.DD</button>
							<input type="hidden" id="hidDepDate">
						</div>
						<p tabindex="0" class="input__error" id="errorDepDate"></p>
					</div>
				</div>
			</div>
		</div>
		<div class="input-set cont2 mt30">
			<div class="input-set cont2" id="inputPassengerList">
				<div class="notice-box__title">탑승객 정보 입력</div>
				<p class="input__sub-text">예약 시 입력한 한글 또는 영문의 탑승객명을 입력해 주세요.</p>
				<div class="add-input">
					<div class="input-wrap input--line">
						<div class="input-row">
							<div class="input-item">
								<div class="input-flex">
									<div class="input-box">
										<label for="psInputLastName_1" class="input__label">성</label>
										<div data-element="form" class="input">
											<input type="text" data-element="input" id="psInputLastName_1" class="input__text" style="text-transform :uppercase;" onchange="checkResvBtn();" onkeyup="sUtil.koreng(this)">
											<button type="button" data-element="remove" class="input__remove-button">삭제</button>
										</div>
									</div>
									<div class="input-box">
										<label for="psInputFirstName_1" class="input__label">이름</label>
										<div data-element="form" class="input">
											<input type="text" data-element="input" id="psInputFirstName_1" class="input__text" title="이름 입력" style="text-transform :uppercase;" onchange="checkResvBtn();" onkeyup="sUtil.koreng(this)">
											<button type="button" data-element="remove" class="input__remove-button">삭제</button>
										</div>
									</div>
									<div class="btn_add">
										<button type="button" class="button button--small" id="addPsFormBtn" onclick="addInputPsForm();">
											<span class="button__text button__icon icon-plus">추가</span>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="button-wrap mt-20">
			<button type="button" id="searchResvBtn" class="button button--optional" onclick="getCheckinOtherList('search', userData);" disabled="disabled"> 
				<span class="button__text">조회</span>
			</button>
		</div>
	</div>
</div>


<div id="datepicker01" class="modal modal-full modal-full--picker" data-max-rate="none">
	<div class="modal-header">
		<h2 class="header__page-name">날짜를 선택해 주세요.</h2>
	</div>
	<div class="modal-content">
		<div class="picker picker--full">
			
			
				
			
			<div class="flatpickr-wrapper"><input type="text" data-min-date="today" class="picker__input flatpickr-input" data-locale="ko" data-defaultdate="2022-11-12" id="selectDate" data-picker="single" title="달력버튼" readonly="readonly"><div class="flatpickr-calendar animate multiMonth inline arrowTop" tabindex="-1" style=""><div class="flatpickr-months"><span class="flatpickr-prev-month flatpickr-disabled"></span><div class="flatpickr-month"><div class="flatpickr-current-month"><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year" min="2022"><span class="arrowUp"></span><span class="arrowDown"></span></div><span class="cur-month">11월 </span></div></div><div class="flatpickr-month"><div class="flatpickr-current-month"><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year" min="2022"><span class="arrowUp"></span><span class="arrowDown"></span></div><span class="cur-month">12월 </span></div></div><div class="flatpickr-month"><div class="flatpickr-current-month"><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year" min="2022"><span class="arrowUp"></span><span class="arrowDown"></span></div><span class="cur-month">1월 </span></div></div><div class="flatpickr-month"><div class="flatpickr-current-month"><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year" min="2022"><span class="arrowUp"></span><span class="arrowDown"></span></div><span class="cur-month">2월 </span></div></div><div class="flatpickr-month"><div class="flatpickr-current-month"><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year" min="2022"><span class="arrowUp"></span><span class="arrowDown"></span></div><span class="cur-month">3월 </span></div></div><div class="flatpickr-month"><div class="flatpickr-current-month"><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year" min="2022"><span class="arrowUp"></span><span class="arrowDown"></span></div><span class="cur-month">4월 </span></div></div><div class="flatpickr-month"><div class="flatpickr-current-month"><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year" min="2022"><span class="arrowUp"></span><span class="arrowDown"></span></div><span class="cur-month">5월 </span></div></div><div class="flatpickr-month"><div class="flatpickr-current-month"><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year" min="2022"><span class="arrowUp"></span><span class="arrowDown"></span></div><span class="cur-month">6월 </span></div></div><div class="flatpickr-month"><div class="flatpickr-current-month"><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year" min="2022"><span class="arrowUp"></span><span class="arrowDown"></span></div><span class="cur-month">7월 </span></div></div><div class="flatpickr-month"><div class="flatpickr-current-month"><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year" min="2022"><span class="arrowUp"></span><span class="arrowDown"></span></div><span class="cur-month">8월 </span></div></div><div class="flatpickr-month"><div class="flatpickr-current-month"><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year" min="2022"><span class="arrowUp"></span><span class="arrowDown"></span></div><span class="cur-month">9월 </span></div></div><div class="flatpickr-month"><div class="flatpickr-current-month"><div class="numInputWrapper"><input class="numInput cur-year" type="number" tabindex="-1" aria-label="Year" min="2022"><span class="arrowUp"></span><span class="arrowDown"></span></div><span class="cur-month">10월 </span></div></div><span class="flatpickr-next-month"></span></div><div class="flatpickr-innerContainer"><div class="flatpickr-rContainer"><div class="flatpickr-weekdays"><div class="flatpickr-weekdaycontainer">
    <span class="flatpickr-weekday">
    일</span><span class="flatpickr-weekday">월</span><span class="flatpickr-weekday">화</span><span class="flatpickr-weekday">수</span><span class="flatpickr-weekday">목</span><span class="flatpickr-weekday">금</span><span class="flatpickr-weekday">토
    </span>
    </div><div class="flatpickr-weekdaycontainer">
    <span class="flatpickr-weekday">
    일</span><span class="flatpickr-weekday">월</span><span class="flatpickr-weekday">화</span><span class="flatpickr-weekday">수</span><span class="flatpickr-weekday">목</span><span class="flatpickr-weekday">금</span><span class="flatpickr-weekday">토
    </span>
    </div><div class="flatpickr-weekdaycontainer">
    <span class="flatpickr-weekday">
    일</span><span class="flatpickr-weekday">월</span><span class="flatpickr-weekday">화</span><span class="flatpickr-weekday">수</span><span class="flatpickr-weekday">목</span><span class="flatpickr-weekday">금</span><span class="flatpickr-weekday">토
    </span>
    </div><div class="flatpickr-weekdaycontainer">
    <span class="flatpickr-weekday">
    일</span><span class="flatpickr-weekday">월</span><span class="flatpickr-weekday">화</span><span class="flatpickr-weekday">수</span><span class="flatpickr-weekday">목</span><span class="flatpickr-weekday">금</span><span class="flatpickr-weekday">토
    </span>
    </div><div class="flatpickr-weekdaycontainer">
    <span class="flatpickr-weekday">
    일</span><span class="flatpickr-weekday">월</span><span class="flatpickr-weekday">화</span><span class="flatpickr-weekday">수</span><span class="flatpickr-weekday">목</span><span class="flatpickr-weekday">금</span><span class="flatpickr-weekday">토
    </span>
    </div><div class="flatpickr-weekdaycontainer">
    <span class="flatpickr-weekday">
    일</span><span class="flatpickr-weekday">월</span><span class="flatpickr-weekday">화</span><span class="flatpickr-weekday">수</span><span class="flatpickr-weekday">목</span><span class="flatpickr-weekday">금</span><span class="flatpickr-weekday">토
    </span>
    </div><div class="flatpickr-weekdaycontainer">
    <span class="flatpickr-weekday">
    일</span><span class="flatpickr-weekday">월</span><span class="flatpickr-weekday">화</span><span class="flatpickr-weekday">수</span><span class="flatpickr-weekday">목</span><span class="flatpickr-weekday">금</span><span class="flatpickr-weekday">토
    </span>
    </div><div class="flatpickr-weekdaycontainer">
    <span class="flatpickr-weekday">
    일</span><span class="flatpickr-weekday">월</span><span class="flatpickr-weekday">화</span><span class="flatpickr-weekday">수</span><span class="flatpickr-weekday">목</span><span class="flatpickr-weekday">금</span><span class="flatpickr-weekday">토
    </span>
    </div><div class="flatpickr-weekdaycontainer">
    <span class="flatpickr-weekday">
    일</span><span class="flatpickr-weekday">월</span><span class="flatpickr-weekday">화</span><span class="flatpickr-weekday">수</span><span class="flatpickr-weekday">목</span><span class="flatpickr-weekday">금</span><span class="flatpickr-weekday">토
    </span>
    </div><div class="flatpickr-weekdaycontainer">
    <span class="flatpickr-weekday">
    일</span><span class="flatpickr-weekday">월</span><span class="flatpickr-weekday">화</span><span class="flatpickr-weekday">수</span><span class="flatpickr-weekday">목</span><span class="flatpickr-weekday">금</span><span class="flatpickr-weekday">토
    </span>
    </div><div class="flatpickr-weekdaycontainer">
    <span class="flatpickr-weekday">
    일</span><span class="flatpickr-weekday">월</span><span class="flatpickr-weekday">화</span><span class="flatpickr-weekday">수</span><span class="flatpickr-weekday">목</span><span class="flatpickr-weekday">금</span><span class="flatpickr-weekday">토
    </span>
    </div><div class="flatpickr-weekdaycontainer">
    <span class="flatpickr-weekday">
    일</span><span class="flatpickr-weekday">월</span><span class="flatpickr-weekday">화</span><span class="flatpickr-weekday">수</span><span class="flatpickr-weekday">목</span><span class="flatpickr-weekday">금</span><span class="flatpickr-weekday">토
    </span>
    </div></div><div class="flatpickr-days" tabindex="-1"><div class="dayContainer"><span class="flatpickr-day prevMonthDay hidden flatpickr-disabled sun" aria-label="20221030">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day prevMonthDay hidden flatpickr-disabled mon" aria-label="20221031">31<span class="date" aria-hidden="true">31</span></span><span class="flatpickr-day flatpickr-disabled tue" aria-label="20221101">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day flatpickr-disabled wed" aria-label="20221102">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day flatpickr-disabled thu" aria-label="20221103">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day flatpickr-disabled fri" aria-label="20221104">4<span class="date" aria-hidden="true">4</span></span><span class="flatpickr-day flatpickr-disabled sat" aria-label="20221105">5<span class="date" aria-hidden="true">5</span></span><span class="flatpickr-day flatpickr-disabled sun" aria-label="20221106">6<span class="date" aria-hidden="true">6</span></span><span class="flatpickr-day flatpickr-disabled mon" aria-label="20221107">7<span class="date" aria-hidden="true">7</span></span><span class="flatpickr-day flatpickr-disabled tue" aria-label="20221108">8<span class="date" aria-hidden="true">8</span></span><span class="flatpickr-day flatpickr-disabled wed" aria-label="20221109">9<span class="date" aria-hidden="true">9</span></span><span class="flatpickr-day flatpickr-disabled thu" aria-label="20221110">10<span class="date" aria-hidden="true">10</span></span><span class="flatpickr-day flatpickr-disabled fri" aria-label="20221111">11<span class="date" aria-hidden="true">11</span></span><span class="flatpickr-day today selected sat" aria-label="20221112" aria-current="date" tabindex="-1">12<span class="date" aria-hidden="true">12</span></span><span class="flatpickr-day sun" aria-label="20221113" tabindex="-1">13<span class="date" aria-hidden="true">13</span></span><span class="flatpickr-day mon" aria-label="20221114" tabindex="-1">14<span class="date" aria-hidden="true">14</span></span><span class="flatpickr-day tue" aria-label="20221115" tabindex="-1">15<span class="date" aria-hidden="true">15</span></span><span class="flatpickr-day wed" aria-label="20221116" tabindex="-1">16<span class="date" aria-hidden="true">16</span></span><span class="flatpickr-day thu" aria-label="20221117" tabindex="-1">17<span class="date" aria-hidden="true">17</span></span><span class="flatpickr-day fri" aria-label="20221118" tabindex="-1">18<span class="date" aria-hidden="true">18</span></span><span class="flatpickr-day sat" aria-label="20221119" tabindex="-1">19<span class="date" aria-hidden="true">19</span></span><span class="flatpickr-day sun" aria-label="20221120" tabindex="-1">20<span class="date" aria-hidden="true">20</span></span><span class="flatpickr-day mon" aria-label="20221121" tabindex="-1">21<span class="date" aria-hidden="true">21</span></span><span class="flatpickr-day tue" aria-label="20221122" tabindex="-1">22<span class="date" aria-hidden="true">22</span></span><span class="flatpickr-day wed" aria-label="20221123" tabindex="-1">23<span class="date" aria-hidden="true">23</span></span><span class="flatpickr-day thu" aria-label="20221124" tabindex="-1">24<span class="date" aria-hidden="true">24</span></span><span class="flatpickr-day fri" aria-label="20221125" tabindex="-1">25<span class="date" aria-hidden="true">25</span></span><span class="flatpickr-day sat" aria-label="20221126" tabindex="-1">26<span class="date" aria-hidden="true">26</span></span><span class="flatpickr-day sun" aria-label="20221127" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day mon" aria-label="20221128" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day tue" aria-label="20221129" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day wed" aria-label="20221130" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day nextMonthDay hidden thu" aria-label="20221201" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day nextMonthDay hidden fri" aria-label="20221202" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day nextMonthDay hidden sat" aria-label="20221203" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><div class="yearMonthContainer"><span class="year">2022</span><span class="sepherator">.</span><span class="month">11</span></div></div><div class="dayContainer"><span class="flatpickr-day prevMonthDay hidden sun" aria-label="20221127" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day prevMonthDay hidden mon" aria-label="20221128" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day prevMonthDay hidden tue" aria-label="20221129" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day prevMonthDay hidden wed" aria-label="20221130" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day thu" aria-label="20221201" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day fri" aria-label="20221202" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day sat" aria-label="20221203" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day sun" aria-label="20221204" tabindex="-1">4<span class="date" aria-hidden="true">4</span></span><span class="flatpickr-day mon" aria-label="20221205" tabindex="-1">5<span class="date" aria-hidden="true">5</span></span><span class="flatpickr-day tue" aria-label="20221206" tabindex="-1">6<span class="date" aria-hidden="true">6</span></span><span class="flatpickr-day wed" aria-label="20221207" tabindex="-1">7<span class="date" aria-hidden="true">7</span></span><span class="flatpickr-day thu" aria-label="20221208" tabindex="-1">8<span class="date" aria-hidden="true">8</span></span><span class="flatpickr-day fri" aria-label="20221209" tabindex="-1">9<span class="date" aria-hidden="true">9</span></span><span class="flatpickr-day sat" aria-label="20221210" tabindex="-1">10<span class="date" aria-hidden="true">10</span></span><span class="flatpickr-day sun" aria-label="20221211" tabindex="-1">11<span class="date" aria-hidden="true">11</span></span><span class="flatpickr-day mon" aria-label="20221212" tabindex="-1">12<span class="date" aria-hidden="true">12</span></span><span class="flatpickr-day tue" aria-label="20221213" tabindex="-1">13<span class="date" aria-hidden="true">13</span></span><span class="flatpickr-day wed" aria-label="20221214" tabindex="-1">14<span class="date" aria-hidden="true">14</span></span><span class="flatpickr-day thu" aria-label="20221215" tabindex="-1">15<span class="date" aria-hidden="true">15</span></span><span class="flatpickr-day fri" aria-label="20221216" tabindex="-1">16<span class="date" aria-hidden="true">16</span></span><span class="flatpickr-day sat" aria-label="20221217" tabindex="-1">17<span class="date" aria-hidden="true">17</span></span><span class="flatpickr-day sun" aria-label="20221218" tabindex="-1">18<span class="date" aria-hidden="true">18</span></span><span class="flatpickr-day mon" aria-label="20221219" tabindex="-1">19<span class="date" aria-hidden="true">19</span></span><span class="flatpickr-day tue" aria-label="20221220" tabindex="-1">20<span class="date" aria-hidden="true">20</span></span><span class="flatpickr-day wed" aria-label="20221221" tabindex="-1">21<span class="date" aria-hidden="true">21</span></span><span class="flatpickr-day thu" aria-label="20221222" tabindex="-1">22<span class="date" aria-hidden="true">22</span></span><span class="flatpickr-day fri" aria-label="20221223" tabindex="-1">23<span class="date" aria-hidden="true">23</span></span><span class="flatpickr-day sat" aria-label="20221224" tabindex="-1">24<span class="date" aria-hidden="true">24</span></span><span class="flatpickr-day sun" aria-label="20221225" tabindex="-1">25<span class="date" aria-hidden="true">25</span></span><span class="flatpickr-day mon" aria-label="20221226" tabindex="-1">26<span class="date" aria-hidden="true">26</span></span><span class="flatpickr-day tue" aria-label="20221227" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day wed" aria-label="20221228" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day thu" aria-label="20221229" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day fri" aria-label="20221230" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day sat" aria-label="20221231" tabindex="-1">31<span class="date" aria-hidden="true">31</span></span><div class="yearMonthContainer"><span class="year">2022</span><span class="sepherator">.</span><span class="month">12</span></div></div><div class="dayContainer"><span class="flatpickr-day sun" aria-label="20230101" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day mon" aria-label="20230102" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day tue" aria-label="20230103" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day wed" aria-label="20230104" tabindex="-1">4<span class="date" aria-hidden="true">4</span></span><span class="flatpickr-day thu" aria-label="20230105" tabindex="-1">5<span class="date" aria-hidden="true">5</span></span><span class="flatpickr-day fri" aria-label="20230106" tabindex="-1">6<span class="date" aria-hidden="true">6</span></span><span class="flatpickr-day sat" aria-label="20230107" tabindex="-1">7<span class="date" aria-hidden="true">7</span></span><span class="flatpickr-day sun" aria-label="20230108" tabindex="-1">8<span class="date" aria-hidden="true">8</span></span><span class="flatpickr-day mon" aria-label="20230109" tabindex="-1">9<span class="date" aria-hidden="true">9</span></span><span class="flatpickr-day tue" aria-label="20230110" tabindex="-1">10<span class="date" aria-hidden="true">10</span></span><span class="flatpickr-day wed" aria-label="20230111" tabindex="-1">11<span class="date" aria-hidden="true">11</span></span><span class="flatpickr-day thu" aria-label="20230112" tabindex="-1">12<span class="date" aria-hidden="true">12</span></span><span class="flatpickr-day fri" aria-label="20230113" tabindex="-1">13<span class="date" aria-hidden="true">13</span></span><span class="flatpickr-day sat" aria-label="20230114" tabindex="-1">14<span class="date" aria-hidden="true">14</span></span><span class="flatpickr-day sun" aria-label="20230115" tabindex="-1">15<span class="date" aria-hidden="true">15</span></span><span class="flatpickr-day mon" aria-label="20230116" tabindex="-1">16<span class="date" aria-hidden="true">16</span></span><span class="flatpickr-day tue" aria-label="20230117" tabindex="-1">17<span class="date" aria-hidden="true">17</span></span><span class="flatpickr-day wed" aria-label="20230118" tabindex="-1">18<span class="date" aria-hidden="true">18</span></span><span class="flatpickr-day thu" aria-label="20230119" tabindex="-1">19<span class="date" aria-hidden="true">19</span></span><span class="flatpickr-day fri" aria-label="20230120" tabindex="-1">20<span class="date" aria-hidden="true">20</span></span><span class="flatpickr-day sat" aria-label="20230121" tabindex="-1">21<span class="date" aria-hidden="true">21</span></span><span class="flatpickr-day sun" aria-label="20230122" tabindex="-1">22<span class="date" aria-hidden="true">22</span></span><span class="flatpickr-day mon" aria-label="20230123" tabindex="-1">23<span class="date" aria-hidden="true">23</span></span><span class="flatpickr-day tue" aria-label="20230124" tabindex="-1">24<span class="date" aria-hidden="true">24</span></span><span class="flatpickr-day wed" aria-label="20230125" tabindex="-1">25<span class="date" aria-hidden="true">25</span></span><span class="flatpickr-day thu" aria-label="20230126" tabindex="-1">26<span class="date" aria-hidden="true">26</span></span><span class="flatpickr-day fri" aria-label="20230127" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day sat" aria-label="20230128" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day sun" aria-label="20230129" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day mon" aria-label="20230130" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day tue" aria-label="20230131" tabindex="-1">31<span class="date" aria-hidden="true">31</span></span><span class="flatpickr-day nextMonthDay hidden wed" aria-label="20230201" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day nextMonthDay hidden thu" aria-label="20230202" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day nextMonthDay hidden fri" aria-label="20230203" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day nextMonthDay hidden sat" aria-label="20230204" tabindex="-1">4<span class="date" aria-hidden="true">4</span></span><div class="yearMonthContainer"><span class="year">2023</span><span class="sepherator">.</span><span class="month">1</span></div></div><div class="dayContainer"><span class="flatpickr-day prevMonthDay hidden sun" aria-label="20230129" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day prevMonthDay hidden mon" aria-label="20230130" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day prevMonthDay hidden tue" aria-label="20230131" tabindex="-1">31<span class="date" aria-hidden="true">31</span></span><span class="flatpickr-day wed" aria-label="20230201" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day thu" aria-label="20230202" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day fri" aria-label="20230203" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day sat" aria-label="20230204" tabindex="-1">4<span class="date" aria-hidden="true">4</span></span><span class="flatpickr-day sun" aria-label="20230205" tabindex="-1">5<span class="date" aria-hidden="true">5</span></span><span class="flatpickr-day mon" aria-label="20230206" tabindex="-1">6<span class="date" aria-hidden="true">6</span></span><span class="flatpickr-day tue" aria-label="20230207" tabindex="-1">7<span class="date" aria-hidden="true">7</span></span><span class="flatpickr-day wed" aria-label="20230208" tabindex="-1">8<span class="date" aria-hidden="true">8</span></span><span class="flatpickr-day thu" aria-label="20230209" tabindex="-1">9<span class="date" aria-hidden="true">9</span></span><span class="flatpickr-day fri" aria-label="20230210" tabindex="-1">10<span class="date" aria-hidden="true">10</span></span><span class="flatpickr-day sat" aria-label="20230211" tabindex="-1">11<span class="date" aria-hidden="true">11</span></span><span class="flatpickr-day sun" aria-label="20230212" tabindex="-1">12<span class="date" aria-hidden="true">12</span></span><span class="flatpickr-day mon" aria-label="20230213" tabindex="-1">13<span class="date" aria-hidden="true">13</span></span><span class="flatpickr-day tue" aria-label="20230214" tabindex="-1">14<span class="date" aria-hidden="true">14</span></span><span class="flatpickr-day wed" aria-label="20230215" tabindex="-1">15<span class="date" aria-hidden="true">15</span></span><span class="flatpickr-day thu" aria-label="20230216" tabindex="-1">16<span class="date" aria-hidden="true">16</span></span><span class="flatpickr-day fri" aria-label="20230217" tabindex="-1">17<span class="date" aria-hidden="true">17</span></span><span class="flatpickr-day sat" aria-label="20230218" tabindex="-1">18<span class="date" aria-hidden="true">18</span></span><span class="flatpickr-day sun" aria-label="20230219" tabindex="-1">19<span class="date" aria-hidden="true">19</span></span><span class="flatpickr-day mon" aria-label="20230220" tabindex="-1">20<span class="date" aria-hidden="true">20</span></span><span class="flatpickr-day tue" aria-label="20230221" tabindex="-1">21<span class="date" aria-hidden="true">21</span></span><span class="flatpickr-day wed" aria-label="20230222" tabindex="-1">22<span class="date" aria-hidden="true">22</span></span><span class="flatpickr-day thu" aria-label="20230223" tabindex="-1">23<span class="date" aria-hidden="true">23</span></span><span class="flatpickr-day fri" aria-label="20230224" tabindex="-1">24<span class="date" aria-hidden="true">24</span></span><span class="flatpickr-day sat" aria-label="20230225" tabindex="-1">25<span class="date" aria-hidden="true">25</span></span><span class="flatpickr-day sun" aria-label="20230226" tabindex="-1">26<span class="date" aria-hidden="true">26</span></span><span class="flatpickr-day mon" aria-label="20230227" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day tue" aria-label="20230228" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day nextMonthDay hidden wed" aria-label="20230301" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day nextMonthDay hidden thu" aria-label="20230302" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day nextMonthDay hidden fri" aria-label="20230303" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day nextMonthDay hidden sat" aria-label="20230304" tabindex="-1">4<span class="date" aria-hidden="true">4</span></span><div class="yearMonthContainer"><span class="year">2023</span><span class="sepherator">.</span><span class="month">2</span></div></div><div class="dayContainer"><span class="flatpickr-day prevMonthDay hidden sun" aria-label="20230226" tabindex="-1">26<span class="date" aria-hidden="true">26</span></span><span class="flatpickr-day prevMonthDay hidden mon" aria-label="20230227" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day prevMonthDay hidden tue" aria-label="20230228" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day wed" aria-label="20230301" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day thu" aria-label="20230302" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day fri" aria-label="20230303" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day sat" aria-label="20230304" tabindex="-1">4<span class="date" aria-hidden="true">4</span></span><span class="flatpickr-day sun" aria-label="20230305" tabindex="-1">5<span class="date" aria-hidden="true">5</span></span><span class="flatpickr-day mon" aria-label="20230306" tabindex="-1">6<span class="date" aria-hidden="true">6</span></span><span class="flatpickr-day tue" aria-label="20230307" tabindex="-1">7<span class="date" aria-hidden="true">7</span></span><span class="flatpickr-day wed" aria-label="20230308" tabindex="-1">8<span class="date" aria-hidden="true">8</span></span><span class="flatpickr-day thu" aria-label="20230309" tabindex="-1">9<span class="date" aria-hidden="true">9</span></span><span class="flatpickr-day fri" aria-label="20230310" tabindex="-1">10<span class="date" aria-hidden="true">10</span></span><span class="flatpickr-day sat" aria-label="20230311" tabindex="-1">11<span class="date" aria-hidden="true">11</span></span><span class="flatpickr-day sun" aria-label="20230312" tabindex="-1">12<span class="date" aria-hidden="true">12</span></span><span class="flatpickr-day mon" aria-label="20230313" tabindex="-1">13<span class="date" aria-hidden="true">13</span></span><span class="flatpickr-day tue" aria-label="20230314" tabindex="-1">14<span class="date" aria-hidden="true">14</span></span><span class="flatpickr-day wed" aria-label="20230315" tabindex="-1">15<span class="date" aria-hidden="true">15</span></span><span class="flatpickr-day thu" aria-label="20230316" tabindex="-1">16<span class="date" aria-hidden="true">16</span></span><span class="flatpickr-day fri" aria-label="20230317" tabindex="-1">17<span class="date" aria-hidden="true">17</span></span><span class="flatpickr-day sat" aria-label="20230318" tabindex="-1">18<span class="date" aria-hidden="true">18</span></span><span class="flatpickr-day sun" aria-label="20230319" tabindex="-1">19<span class="date" aria-hidden="true">19</span></span><span class="flatpickr-day mon" aria-label="20230320" tabindex="-1">20<span class="date" aria-hidden="true">20</span></span><span class="flatpickr-day tue" aria-label="20230321" tabindex="-1">21<span class="date" aria-hidden="true">21</span></span><span class="flatpickr-day wed" aria-label="20230322" tabindex="-1">22<span class="date" aria-hidden="true">22</span></span><span class="flatpickr-day thu" aria-label="20230323" tabindex="-1">23<span class="date" aria-hidden="true">23</span></span><span class="flatpickr-day fri" aria-label="20230324" tabindex="-1">24<span class="date" aria-hidden="true">24</span></span><span class="flatpickr-day sat" aria-label="20230325" tabindex="-1">25<span class="date" aria-hidden="true">25</span></span><span class="flatpickr-day sun" aria-label="20230326" tabindex="-1">26<span class="date" aria-hidden="true">26</span></span><span class="flatpickr-day mon" aria-label="20230327" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day tue" aria-label="20230328" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day wed" aria-label="20230329" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day thu" aria-label="20230330" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day fri" aria-label="20230331" tabindex="-1">31<span class="date" aria-hidden="true">31</span></span><span class="flatpickr-day nextMonthDay hidden sat" aria-label="20230401" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><div class="yearMonthContainer"><span class="year">2023</span><span class="sepherator">.</span><span class="month">3</span></div></div><div class="dayContainer"><span class="flatpickr-day prevMonthDay hidden sun" aria-label="20230326" tabindex="-1">26<span class="date" aria-hidden="true">26</span></span><span class="flatpickr-day prevMonthDay hidden mon" aria-label="20230327" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day prevMonthDay hidden tue" aria-label="20230328" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day prevMonthDay hidden wed" aria-label="20230329" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day prevMonthDay hidden thu" aria-label="20230330" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day prevMonthDay hidden fri" aria-label="20230331" tabindex="-1">31<span class="date" aria-hidden="true">31</span></span><span class="flatpickr-day sat" aria-label="20230401" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day sun" aria-label="20230402" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day mon" aria-label="20230403" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day tue" aria-label="20230404" tabindex="-1">4<span class="date" aria-hidden="true">4</span></span><span class="flatpickr-day wed" aria-label="20230405" tabindex="-1">5<span class="date" aria-hidden="true">5</span></span><span class="flatpickr-day thu" aria-label="20230406" tabindex="-1">6<span class="date" aria-hidden="true">6</span></span><span class="flatpickr-day fri" aria-label="20230407" tabindex="-1">7<span class="date" aria-hidden="true">7</span></span><span class="flatpickr-day sat" aria-label="20230408" tabindex="-1">8<span class="date" aria-hidden="true">8</span></span><span class="flatpickr-day sun" aria-label="20230409" tabindex="-1">9<span class="date" aria-hidden="true">9</span></span><span class="flatpickr-day mon" aria-label="20230410" tabindex="-1">10<span class="date" aria-hidden="true">10</span></span><span class="flatpickr-day tue" aria-label="20230411" tabindex="-1">11<span class="date" aria-hidden="true">11</span></span><span class="flatpickr-day wed" aria-label="20230412" tabindex="-1">12<span class="date" aria-hidden="true">12</span></span><span class="flatpickr-day thu" aria-label="20230413" tabindex="-1">13<span class="date" aria-hidden="true">13</span></span><span class="flatpickr-day fri" aria-label="20230414" tabindex="-1">14<span class="date" aria-hidden="true">14</span></span><span class="flatpickr-day sat" aria-label="20230415" tabindex="-1">15<span class="date" aria-hidden="true">15</span></span><span class="flatpickr-day sun" aria-label="20230416" tabindex="-1">16<span class="date" aria-hidden="true">16</span></span><span class="flatpickr-day mon" aria-label="20230417" tabindex="-1">17<span class="date" aria-hidden="true">17</span></span><span class="flatpickr-day tue" aria-label="20230418" tabindex="-1">18<span class="date" aria-hidden="true">18</span></span><span class="flatpickr-day wed" aria-label="20230419" tabindex="-1">19<span class="date" aria-hidden="true">19</span></span><span class="flatpickr-day thu" aria-label="20230420" tabindex="-1">20<span class="date" aria-hidden="true">20</span></span><span class="flatpickr-day fri" aria-label="20230421" tabindex="-1">21<span class="date" aria-hidden="true">21</span></span><span class="flatpickr-day sat" aria-label="20230422" tabindex="-1">22<span class="date" aria-hidden="true">22</span></span><span class="flatpickr-day sun" aria-label="20230423" tabindex="-1">23<span class="date" aria-hidden="true">23</span></span><span class="flatpickr-day mon" aria-label="20230424" tabindex="-1">24<span class="date" aria-hidden="true">24</span></span><span class="flatpickr-day tue" aria-label="20230425" tabindex="-1">25<span class="date" aria-hidden="true">25</span></span><span class="flatpickr-day wed" aria-label="20230426" tabindex="-1">26<span class="date" aria-hidden="true">26</span></span><span class="flatpickr-day thu" aria-label="20230427" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day fri" aria-label="20230428" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day sat" aria-label="20230429" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day sun" aria-label="20230430" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day nextMonthDay hidden mon" aria-label="20230501" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day nextMonthDay hidden tue" aria-label="20230502" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day nextMonthDay hidden wed" aria-label="20230503" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day nextMonthDay hidden thu" aria-label="20230504" tabindex="-1">4<span class="date" aria-hidden="true">4</span></span><span class="flatpickr-day nextMonthDay hidden fri" aria-label="20230505" tabindex="-1">5<span class="date" aria-hidden="true">5</span></span><span class="flatpickr-day nextMonthDay hidden sat" aria-label="20230506" tabindex="-1">6<span class="date" aria-hidden="true">6</span></span><div class="yearMonthContainer"><span class="year">2023</span><span class="sepherator">.</span><span class="month">4</span></div></div><div class="dayContainer"><span class="flatpickr-day prevMonthDay hidden sun" aria-label="20230430" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day mon" aria-label="20230501" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day tue" aria-label="20230502" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day wed" aria-label="20230503" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day thu" aria-label="20230504" tabindex="-1">4<span class="date" aria-hidden="true">4</span></span><span class="flatpickr-day fri" aria-label="20230505" tabindex="-1">5<span class="date" aria-hidden="true">5</span></span><span class="flatpickr-day sat" aria-label="20230506" tabindex="-1">6<span class="date" aria-hidden="true">6</span></span><span class="flatpickr-day sun" aria-label="20230507" tabindex="-1">7<span class="date" aria-hidden="true">7</span></span><span class="flatpickr-day mon" aria-label="20230508" tabindex="-1">8<span class="date" aria-hidden="true">8</span></span><span class="flatpickr-day tue" aria-label="20230509" tabindex="-1">9<span class="date" aria-hidden="true">9</span></span><span class="flatpickr-day wed" aria-label="20230510" tabindex="-1">10<span class="date" aria-hidden="true">10</span></span><span class="flatpickr-day thu" aria-label="20230511" tabindex="-1">11<span class="date" aria-hidden="true">11</span></span><span class="flatpickr-day fri" aria-label="20230512" tabindex="-1">12<span class="date" aria-hidden="true">12</span></span><span class="flatpickr-day sat" aria-label="20230513" tabindex="-1">13<span class="date" aria-hidden="true">13</span></span><span class="flatpickr-day sun" aria-label="20230514" tabindex="-1">14<span class="date" aria-hidden="true">14</span></span><span class="flatpickr-day mon" aria-label="20230515" tabindex="-1">15<span class="date" aria-hidden="true">15</span></span><span class="flatpickr-day tue" aria-label="20230516" tabindex="-1">16<span class="date" aria-hidden="true">16</span></span><span class="flatpickr-day wed" aria-label="20230517" tabindex="-1">17<span class="date" aria-hidden="true">17</span></span><span class="flatpickr-day thu" aria-label="20230518" tabindex="-1">18<span class="date" aria-hidden="true">18</span></span><span class="flatpickr-day fri" aria-label="20230519" tabindex="-1">19<span class="date" aria-hidden="true">19</span></span><span class="flatpickr-day sat" aria-label="20230520" tabindex="-1">20<span class="date" aria-hidden="true">20</span></span><span class="flatpickr-day sun" aria-label="20230521" tabindex="-1">21<span class="date" aria-hidden="true">21</span></span><span class="flatpickr-day mon" aria-label="20230522" tabindex="-1">22<span class="date" aria-hidden="true">22</span></span><span class="flatpickr-day tue" aria-label="20230523" tabindex="-1">23<span class="date" aria-hidden="true">23</span></span><span class="flatpickr-day wed" aria-label="20230524" tabindex="-1">24<span class="date" aria-hidden="true">24</span></span><span class="flatpickr-day thu" aria-label="20230525" tabindex="-1">25<span class="date" aria-hidden="true">25</span></span><span class="flatpickr-day fri" aria-label="20230526" tabindex="-1">26<span class="date" aria-hidden="true">26</span></span><span class="flatpickr-day sat" aria-label="20230527" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day sun" aria-label="20230528" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day mon" aria-label="20230529" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day tue" aria-label="20230530" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day wed" aria-label="20230531" tabindex="-1">31<span class="date" aria-hidden="true">31</span></span><span class="flatpickr-day nextMonthDay hidden thu" aria-label="20230601" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day nextMonthDay hidden fri" aria-label="20230602" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day nextMonthDay hidden sat" aria-label="20230603" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><div class="yearMonthContainer"><span class="year">2023</span><span class="sepherator">.</span><span class="month">5</span></div></div><div class="dayContainer"><span class="flatpickr-day prevMonthDay hidden sun" aria-label="20230528" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day prevMonthDay hidden mon" aria-label="20230529" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day prevMonthDay hidden tue" aria-label="20230530" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day prevMonthDay hidden wed" aria-label="20230531" tabindex="-1">31<span class="date" aria-hidden="true">31</span></span><span class="flatpickr-day thu" aria-label="20230601" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day fri" aria-label="20230602" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day sat" aria-label="20230603" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day sun" aria-label="20230604" tabindex="-1">4<span class="date" aria-hidden="true">4</span></span><span class="flatpickr-day mon" aria-label="20230605" tabindex="-1">5<span class="date" aria-hidden="true">5</span></span><span class="flatpickr-day tue" aria-label="20230606" tabindex="-1">6<span class="date" aria-hidden="true">6</span></span><span class="flatpickr-day wed" aria-label="20230607" tabindex="-1">7<span class="date" aria-hidden="true">7</span></span><span class="flatpickr-day thu" aria-label="20230608" tabindex="-1">8<span class="date" aria-hidden="true">8</span></span><span class="flatpickr-day fri" aria-label="20230609" tabindex="-1">9<span class="date" aria-hidden="true">9</span></span><span class="flatpickr-day sat" aria-label="20230610" tabindex="-1">10<span class="date" aria-hidden="true">10</span></span><span class="flatpickr-day sun" aria-label="20230611" tabindex="-1">11<span class="date" aria-hidden="true">11</span></span><span class="flatpickr-day mon" aria-label="20230612" tabindex="-1">12<span class="date" aria-hidden="true">12</span></span><span class="flatpickr-day tue" aria-label="20230613" tabindex="-1">13<span class="date" aria-hidden="true">13</span></span><span class="flatpickr-day wed" aria-label="20230614" tabindex="-1">14<span class="date" aria-hidden="true">14</span></span><span class="flatpickr-day thu" aria-label="20230615" tabindex="-1">15<span class="date" aria-hidden="true">15</span></span><span class="flatpickr-day fri" aria-label="20230616" tabindex="-1">16<span class="date" aria-hidden="true">16</span></span><span class="flatpickr-day sat" aria-label="20230617" tabindex="-1">17<span class="date" aria-hidden="true">17</span></span><span class="flatpickr-day sun" aria-label="20230618" tabindex="-1">18<span class="date" aria-hidden="true">18</span></span><span class="flatpickr-day mon" aria-label="20230619" tabindex="-1">19<span class="date" aria-hidden="true">19</span></span><span class="flatpickr-day tue" aria-label="20230620" tabindex="-1">20<span class="date" aria-hidden="true">20</span></span><span class="flatpickr-day wed" aria-label="20230621" tabindex="-1">21<span class="date" aria-hidden="true">21</span></span><span class="flatpickr-day thu" aria-label="20230622" tabindex="-1">22<span class="date" aria-hidden="true">22</span></span><span class="flatpickr-day fri" aria-label="20230623" tabindex="-1">23<span class="date" aria-hidden="true">23</span></span><span class="flatpickr-day sat" aria-label="20230624" tabindex="-1">24<span class="date" aria-hidden="true">24</span></span><span class="flatpickr-day sun" aria-label="20230625" tabindex="-1">25<span class="date" aria-hidden="true">25</span></span><span class="flatpickr-day mon" aria-label="20230626" tabindex="-1">26<span class="date" aria-hidden="true">26</span></span><span class="flatpickr-day tue" aria-label="20230627" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day wed" aria-label="20230628" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day thu" aria-label="20230629" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day fri" aria-label="20230630" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day nextMonthDay hidden sat" aria-label="20230701" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><div class="yearMonthContainer"><span class="year">2023</span><span class="sepherator">.</span><span class="month">6</span></div></div><div class="dayContainer"><span class="flatpickr-day prevMonthDay hidden sun" aria-label="20230625" tabindex="-1">25<span class="date" aria-hidden="true">25</span></span><span class="flatpickr-day prevMonthDay hidden mon" aria-label="20230626" tabindex="-1">26<span class="date" aria-hidden="true">26</span></span><span class="flatpickr-day prevMonthDay hidden tue" aria-label="20230627" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day prevMonthDay hidden wed" aria-label="20230628" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day prevMonthDay hidden thu" aria-label="20230629" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day prevMonthDay hidden fri" aria-label="20230630" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day sat" aria-label="20230701" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day sun" aria-label="20230702" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day mon" aria-label="20230703" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day tue" aria-label="20230704" tabindex="-1">4<span class="date" aria-hidden="true">4</span></span><span class="flatpickr-day wed" aria-label="20230705" tabindex="-1">5<span class="date" aria-hidden="true">5</span></span><span class="flatpickr-day thu" aria-label="20230706" tabindex="-1">6<span class="date" aria-hidden="true">6</span></span><span class="flatpickr-day fri" aria-label="20230707" tabindex="-1">7<span class="date" aria-hidden="true">7</span></span><span class="flatpickr-day sat" aria-label="20230708" tabindex="-1">8<span class="date" aria-hidden="true">8</span></span><span class="flatpickr-day sun" aria-label="20230709" tabindex="-1">9<span class="date" aria-hidden="true">9</span></span><span class="flatpickr-day mon" aria-label="20230710" tabindex="-1">10<span class="date" aria-hidden="true">10</span></span><span class="flatpickr-day tue" aria-label="20230711" tabindex="-1">11<span class="date" aria-hidden="true">11</span></span><span class="flatpickr-day wed" aria-label="20230712" tabindex="-1">12<span class="date" aria-hidden="true">12</span></span><span class="flatpickr-day thu" aria-label="20230713" tabindex="-1">13<span class="date" aria-hidden="true">13</span></span><span class="flatpickr-day fri" aria-label="20230714" tabindex="-1">14<span class="date" aria-hidden="true">14</span></span><span class="flatpickr-day sat" aria-label="20230715" tabindex="-1">15<span class="date" aria-hidden="true">15</span></span><span class="flatpickr-day sun" aria-label="20230716" tabindex="-1">16<span class="date" aria-hidden="true">16</span></span><span class="flatpickr-day mon" aria-label="20230717" tabindex="-1">17<span class="date" aria-hidden="true">17</span></span><span class="flatpickr-day tue" aria-label="20230718" tabindex="-1">18<span class="date" aria-hidden="true">18</span></span><span class="flatpickr-day wed" aria-label="20230719" tabindex="-1">19<span class="date" aria-hidden="true">19</span></span><span class="flatpickr-day thu" aria-label="20230720" tabindex="-1">20<span class="date" aria-hidden="true">20</span></span><span class="flatpickr-day fri" aria-label="20230721" tabindex="-1">21<span class="date" aria-hidden="true">21</span></span><span class="flatpickr-day sat" aria-label="20230722" tabindex="-1">22<span class="date" aria-hidden="true">22</span></span><span class="flatpickr-day sun" aria-label="20230723" tabindex="-1">23<span class="date" aria-hidden="true">23</span></span><span class="flatpickr-day mon" aria-label="20230724" tabindex="-1">24<span class="date" aria-hidden="true">24</span></span><span class="flatpickr-day tue" aria-label="20230725" tabindex="-1">25<span class="date" aria-hidden="true">25</span></span><span class="flatpickr-day wed" aria-label="20230726" tabindex="-1">26<span class="date" aria-hidden="true">26</span></span><span class="flatpickr-day thu" aria-label="20230727" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day fri" aria-label="20230728" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day sat" aria-label="20230729" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day sun" aria-label="20230730" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day mon" aria-label="20230731" tabindex="-1">31<span class="date" aria-hidden="true">31</span></span><span class="flatpickr-day nextMonthDay hidden tue" aria-label="20230801" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day nextMonthDay hidden wed" aria-label="20230802" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day nextMonthDay hidden thu" aria-label="20230803" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day nextMonthDay hidden fri" aria-label="20230804" tabindex="-1">4<span class="date" aria-hidden="true">4</span></span><span class="flatpickr-day nextMonthDay hidden sat" aria-label="20230805" tabindex="-1">5<span class="date" aria-hidden="true">5</span></span><div class="yearMonthContainer"><span class="year">2023</span><span class="sepherator">.</span><span class="month">7</span></div></div><div class="dayContainer"><span class="flatpickr-day prevMonthDay hidden sun" aria-label="20230730" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day prevMonthDay hidden mon" aria-label="20230731" tabindex="-1">31<span class="date" aria-hidden="true">31</span></span><span class="flatpickr-day tue" aria-label="20230801" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day wed" aria-label="20230802" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day thu" aria-label="20230803" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day fri" aria-label="20230804" tabindex="-1">4<span class="date" aria-hidden="true">4</span></span><span class="flatpickr-day sat" aria-label="20230805" tabindex="-1">5<span class="date" aria-hidden="true">5</span></span><span class="flatpickr-day sun" aria-label="20230806" tabindex="-1">6<span class="date" aria-hidden="true">6</span></span><span class="flatpickr-day mon" aria-label="20230807" tabindex="-1">7<span class="date" aria-hidden="true">7</span></span><span class="flatpickr-day tue" aria-label="20230808" tabindex="-1">8<span class="date" aria-hidden="true">8</span></span><span class="flatpickr-day wed" aria-label="20230809" tabindex="-1">9<span class="date" aria-hidden="true">9</span></span><span class="flatpickr-day thu" aria-label="20230810" tabindex="-1">10<span class="date" aria-hidden="true">10</span></span><span class="flatpickr-day fri" aria-label="20230811" tabindex="-1">11<span class="date" aria-hidden="true">11</span></span><span class="flatpickr-day sat" aria-label="20230812" tabindex="-1">12<span class="date" aria-hidden="true">12</span></span><span class="flatpickr-day sun" aria-label="20230813" tabindex="-1">13<span class="date" aria-hidden="true">13</span></span><span class="flatpickr-day mon" aria-label="20230814" tabindex="-1">14<span class="date" aria-hidden="true">14</span></span><span class="flatpickr-day tue" aria-label="20230815" tabindex="-1">15<span class="date" aria-hidden="true">15</span></span><span class="flatpickr-day wed" aria-label="20230816" tabindex="-1">16<span class="date" aria-hidden="true">16</span></span><span class="flatpickr-day thu" aria-label="20230817" tabindex="-1">17<span class="date" aria-hidden="true">17</span></span><span class="flatpickr-day fri" aria-label="20230818" tabindex="-1">18<span class="date" aria-hidden="true">18</span></span><span class="flatpickr-day sat" aria-label="20230819" tabindex="-1">19<span class="date" aria-hidden="true">19</span></span><span class="flatpickr-day sun" aria-label="20230820" tabindex="-1">20<span class="date" aria-hidden="true">20</span></span><span class="flatpickr-day mon" aria-label="20230821" tabindex="-1">21<span class="date" aria-hidden="true">21</span></span><span class="flatpickr-day tue" aria-label="20230822" tabindex="-1">22<span class="date" aria-hidden="true">22</span></span><span class="flatpickr-day wed" aria-label="20230823" tabindex="-1">23<span class="date" aria-hidden="true">23</span></span><span class="flatpickr-day thu" aria-label="20230824" tabindex="-1">24<span class="date" aria-hidden="true">24</span></span><span class="flatpickr-day fri" aria-label="20230825" tabindex="-1">25<span class="date" aria-hidden="true">25</span></span><span class="flatpickr-day sat" aria-label="20230826" tabindex="-1">26<span class="date" aria-hidden="true">26</span></span><span class="flatpickr-day sun" aria-label="20230827" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day mon" aria-label="20230828" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day tue" aria-label="20230829" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day wed" aria-label="20230830" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day thu" aria-label="20230831" tabindex="-1">31<span class="date" aria-hidden="true">31</span></span><span class="flatpickr-day nextMonthDay hidden fri" aria-label="20230901" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day nextMonthDay hidden sat" aria-label="20230902" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><div class="yearMonthContainer"><span class="year">2023</span><span class="sepherator">.</span><span class="month">8</span></div></div><div class="dayContainer"><span class="flatpickr-day prevMonthDay hidden sun" aria-label="20230827" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day prevMonthDay hidden mon" aria-label="20230828" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day prevMonthDay hidden tue" aria-label="20230829" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day prevMonthDay hidden wed" aria-label="20230830" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day prevMonthDay hidden thu" aria-label="20230831" tabindex="-1">31<span class="date" aria-hidden="true">31</span></span><span class="flatpickr-day fri" aria-label="20230901" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day sat" aria-label="20230902" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day sun" aria-label="20230903" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day mon" aria-label="20230904" tabindex="-1">4<span class="date" aria-hidden="true">4</span></span><span class="flatpickr-day tue" aria-label="20230905" tabindex="-1">5<span class="date" aria-hidden="true">5</span></span><span class="flatpickr-day wed" aria-label="20230906" tabindex="-1">6<span class="date" aria-hidden="true">6</span></span><span class="flatpickr-day thu" aria-label="20230907" tabindex="-1">7<span class="date" aria-hidden="true">7</span></span><span class="flatpickr-day fri" aria-label="20230908" tabindex="-1">8<span class="date" aria-hidden="true">8</span></span><span class="flatpickr-day sat" aria-label="20230909" tabindex="-1">9<span class="date" aria-hidden="true">9</span></span><span class="flatpickr-day sun" aria-label="20230910" tabindex="-1">10<span class="date" aria-hidden="true">10</span></span><span class="flatpickr-day mon" aria-label="20230911" tabindex="-1">11<span class="date" aria-hidden="true">11</span></span><span class="flatpickr-day tue" aria-label="20230912" tabindex="-1">12<span class="date" aria-hidden="true">12</span></span><span class="flatpickr-day wed" aria-label="20230913" tabindex="-1">13<span class="date" aria-hidden="true">13</span></span><span class="flatpickr-day thu" aria-label="20230914" tabindex="-1">14<span class="date" aria-hidden="true">14</span></span><span class="flatpickr-day fri" aria-label="20230915" tabindex="-1">15<span class="date" aria-hidden="true">15</span></span><span class="flatpickr-day sat" aria-label="20230916" tabindex="-1">16<span class="date" aria-hidden="true">16</span></span><span class="flatpickr-day sun" aria-label="20230917" tabindex="-1">17<span class="date" aria-hidden="true">17</span></span><span class="flatpickr-day mon" aria-label="20230918" tabindex="-1">18<span class="date" aria-hidden="true">18</span></span><span class="flatpickr-day tue" aria-label="20230919" tabindex="-1">19<span class="date" aria-hidden="true">19</span></span><span class="flatpickr-day wed" aria-label="20230920" tabindex="-1">20<span class="date" aria-hidden="true">20</span></span><span class="flatpickr-day thu" aria-label="20230921" tabindex="-1">21<span class="date" aria-hidden="true">21</span></span><span class="flatpickr-day fri" aria-label="20230922" tabindex="-1">22<span class="date" aria-hidden="true">22</span></span><span class="flatpickr-day sat" aria-label="20230923" tabindex="-1">23<span class="date" aria-hidden="true">23</span></span><span class="flatpickr-day sun" aria-label="20230924" tabindex="-1">24<span class="date" aria-hidden="true">24</span></span><span class="flatpickr-day mon" aria-label="20230925" tabindex="-1">25<span class="date" aria-hidden="true">25</span></span><span class="flatpickr-day tue" aria-label="20230926" tabindex="-1">26<span class="date" aria-hidden="true">26</span></span><span class="flatpickr-day wed" aria-label="20230927" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day thu" aria-label="20230928" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day fri" aria-label="20230929" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day sat" aria-label="20230930" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><div class="yearMonthContainer"><span class="year">2023</span><span class="sepherator">.</span><span class="month">9</span></div></div><div class="dayContainer"><span class="flatpickr-day sun" aria-label="20231001" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day mon" aria-label="20231002" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day tue" aria-label="20231003" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day wed" aria-label="20231004" tabindex="-1">4<span class="date" aria-hidden="true">4</span></span><span class="flatpickr-day thu" aria-label="20231005" tabindex="-1">5<span class="date" aria-hidden="true">5</span></span><span class="flatpickr-day fri" aria-label="20231006" tabindex="-1">6<span class="date" aria-hidden="true">6</span></span><span class="flatpickr-day sat" aria-label="20231007" tabindex="-1">7<span class="date" aria-hidden="true">7</span></span><span class="flatpickr-day sun" aria-label="20231008" tabindex="-1">8<span class="date" aria-hidden="true">8</span></span><span class="flatpickr-day mon" aria-label="20231009" tabindex="-1">9<span class="date" aria-hidden="true">9</span></span><span class="flatpickr-day tue" aria-label="20231010" tabindex="-1">10<span class="date" aria-hidden="true">10</span></span><span class="flatpickr-day wed" aria-label="20231011" tabindex="-1">11<span class="date" aria-hidden="true">11</span></span><span class="flatpickr-day thu" aria-label="20231012" tabindex="-1">12<span class="date" aria-hidden="true">12</span></span><span class="flatpickr-day fri" aria-label="20231013" tabindex="-1">13<span class="date" aria-hidden="true">13</span></span><span class="flatpickr-day sat" aria-label="20231014" tabindex="-1">14<span class="date" aria-hidden="true">14</span></span><span class="flatpickr-day sun" aria-label="20231015" tabindex="-1">15<span class="date" aria-hidden="true">15</span></span><span class="flatpickr-day mon" aria-label="20231016" tabindex="-1">16<span class="date" aria-hidden="true">16</span></span><span class="flatpickr-day tue" aria-label="20231017" tabindex="-1">17<span class="date" aria-hidden="true">17</span></span><span class="flatpickr-day wed" aria-label="20231018" tabindex="-1">18<span class="date" aria-hidden="true">18</span></span><span class="flatpickr-day thu" aria-label="20231019" tabindex="-1">19<span class="date" aria-hidden="true">19</span></span><span class="flatpickr-day fri" aria-label="20231020" tabindex="-1">20<span class="date" aria-hidden="true">20</span></span><span class="flatpickr-day sat" aria-label="20231021" tabindex="-1">21<span class="date" aria-hidden="true">21</span></span><span class="flatpickr-day sun" aria-label="20231022" tabindex="-1">22<span class="date" aria-hidden="true">22</span></span><span class="flatpickr-day mon" aria-label="20231023" tabindex="-1">23<span class="date" aria-hidden="true">23</span></span><span class="flatpickr-day tue" aria-label="20231024" tabindex="-1">24<span class="date" aria-hidden="true">24</span></span><span class="flatpickr-day wed" aria-label="20231025" tabindex="-1">25<span class="date" aria-hidden="true">25</span></span><span class="flatpickr-day thu" aria-label="20231026" tabindex="-1">26<span class="date" aria-hidden="true">26</span></span><span class="flatpickr-day fri" aria-label="20231027" tabindex="-1">27<span class="date" aria-hidden="true">27</span></span><span class="flatpickr-day sat" aria-label="20231028" tabindex="-1">28<span class="date" aria-hidden="true">28</span></span><span class="flatpickr-day sun" aria-label="20231029" tabindex="-1">29<span class="date" aria-hidden="true">29</span></span><span class="flatpickr-day mon" aria-label="20231030" tabindex="-1">30<span class="date" aria-hidden="true">30</span></span><span class="flatpickr-day tue" aria-label="20231031" tabindex="-1">31<span class="date" aria-hidden="true">31</span></span><span class="flatpickr-day nextMonthDay hidden wed" aria-label="20231101" tabindex="-1">1<span class="date" aria-hidden="true">1</span></span><span class="flatpickr-day nextMonthDay hidden thu" aria-label="20231102" tabindex="-1">2<span class="date" aria-hidden="true">2</span></span><span class="flatpickr-day nextMonthDay hidden fri" aria-label="20231103" tabindex="-1">3<span class="date" aria-hidden="true">3</span></span><span class="flatpickr-day nextMonthDay hidden sat" aria-label="20231104" tabindex="-1">4<span class="date" aria-hidden="true">4</span></span><div class="yearMonthContainer"><span class="year">2023</span><span class="sepherator">.</span><span class="month">10</span></div></div></div></div></div></div></div>
		</div>
		<div class="booking-button cal-button">
			<button type="button" class="button button--primary button--black pc-only" data-reset-date="#selectDate">
				<span class="button__text">초기화</span>
			</button>
			<button type="button" class="button button--primary button--active" data-select-date="#selectDate" rel="modal:close" id="chooseDepDateBtn">
				<span class="button__text">선택</span>
			</button>
		</div>
	</div>
	<a href="javascript:void(0)" rel="modal:close" class="modal__close"><span class="blind">닫기</span></a>
</div>


<div id="countryInfoLayer" class="modal modal-full modal-scroll modal--fixed-multi">
	<div class="modal-header">
		<div class="modal-header__title">유의사항</div>
	</div>
	<div class="modal-content">

		<div class="list-wrap">
			<ul class="list-guide">
				<li class="list-guide__item color--org text" id="byCountryMsg" style="display: none;"></li>
				<li class="list-guide__item">모든 방문객은 반드시 오는 편 티켓을 소지하여야 합니다.(무착륙 국제관광비행편 제외)</li>
				<li class="list-guide__item">도착지 출입국 규정에 따라, 훼손된 여권을 소지한 경우 입국이 거절될 수 있습니다.</li>
			</ul>
		</div>

	</div>
	<div class="fixed-wrap fixed-wrap--multi-line border-none ">
		<div class="button-wrap">
			<button type="button" class="button button--primary button--active" rel="modal:close" onclick="goCheckinPassengerInput();">
				<span class="button__text">확인</span>
			</button>
		</div>
	</div>
	<a href="javascript:void(0)" rel="modal:close" class="modal__close"><span class="blind">닫기</span></a>
</div>


<div id="domIllegalUseLayer" class="modal modal-full modal-scroll modal--fixed-multi">
	<div class="modal-header">
	</div>
	<div class="modal-content">
		<div class="first-margin">
			<div class="section-sub-txt"></div>
		</div>
		<div class="section-wrap">
			<div class="section-title">신분증 부정사용 관련 처벌 안내</div>
			<div class="section-sub-txt">타인의 신분증을 도용 등 부정 사용시, 관련 법령에 의거 2년 이하의 징역이나 또는 500만원 이하의 벌금으로 처벌될 수 있습니다.</div>
		</div>
	</div>
	<div class="fixed-wrap fixed-wrap--multi-line border-none ">
		<div class="button-wrap">
			<button type="button" class="button button--primary button--active" onclick="goCheckinPassengerInput();">
				<span class="button__text">확인</span>
			</button>
		</div>
	</div>
	<a href="javascript:void(0)" rel="modal:close" class="modal__close"><span class="blind">닫기</span></a>
</div>


<div id="intCovidLayer" class="modal modal-full modal-scroll modal--fixed-multi">
	<div class="modal-header">
		<div class="modal-header__title">신종 코로나 바이러스에 따른 탑승 안내</div>
	</div>
	<div class="modal-content">
		<div class="first-margin">
			<div class="section-sub-txt">
				코로나 19로 인해 각 국가의 입국 규정이 상이하오니 수속 카운터에서 안내를 받으시기 바랍니다.
				<br>(각 국가의 검역 강화로 인해 입국 서류 불충분시 탑승과 입국이 거절될 수 있습니다.)
			</div>
		</div>

	</div>
	<div class="fixed-wrap fixed-wrap--multi-line border-none ">
		<div class="button-wrap">
			<button type="button" class="button button--primary button--active" onclick="checkCountryCode();">
				<span class="button__text">확인</span>
			</button>
		</div>
	</div>
	<a href="javascript:void(0)" rel="modal:close" class="modal__close"><span class="blind">닫기</span></a>
</div>


<div id="roundTripInfoLayer" class="modal modal-full modal-scroll modal--fixed-multi">
	<div class="modal-header">
		<div class="modal-header__title">알림</div>
	</div>
	<div class="modal-content">
		<div class="first-margin">
			<div class="section-sub-txt">
				오는 편의 모바일탑승권은 국내선 항공편 출발 24시간~30분 전까지, <br>국제선 항공편 출발 24시간~1시간 30분 전까지 발급 가능합니다. 
			</div>
		</div>
	</div>
	<div class="fixed-wrap fixed-wrap--multi-line border-none ">
		<div class="button-wrap">
			<button type="button" class="button button--primary button--active" onclick="checkCovid();">
				<span class="button__text">확인</span>
			</button>
		</div>
	</div>
	<a href="javascript:void(0)" rel="modal:close" class="modal__close"><span class="blind">닫기</span></a>
</div>


<div id="restrictInfoLayer"></div>


<div id="alertModalLayer" class="modal modal--simple">
	<div class="modal-content"><p class="alert-text"></p></div>
	<div class="modal__button-area button-wrap">
		<button type="button" class="button button--secondary button--active" onclick="closeModal('alertModalLayer');">
		<span class="button__text">확인</span></button>
	</div>
</div>


<div id="layerConfirm" class="modal modal--simple">
	<div class="modal-content"><p class="alert-text"></p></div>
	<div class="modal__button-area button-wrap">
		<button id="btnConfirmDisAgree" type="button" class="button button--secondary" onclick="closeModal('layerConfirm');">
			<span class="button__text">아니요</span>
		</button>
		<button id="btnConfirmAgree" type="button" class="button button--secondary button--active add--ml-10" onclick="checkRoundTripInfo();">
			<span class="button__text">예</span>
		</button>
	</div>
</div>

<button type="button" id="btnModalOpen" data-element="modal_anchor" style="display: none;" data-modal-type="full"></button>
				</main>
			</div>
			
				
				












<div class="quick-menu mobile-only">
	<!-- D : 활성화 클래스 on -->
	<a href="javascript:void(0);" class="quick-menu__item n1 " onclick="URL_LINK.getI18Url('/main/base/index.do')">
		
			
			
				<img src="https://static.jejuair.net/wccg/resources/images/upload/icon_bottombar_home_off_56x2.png" alt="홈">
			
		
		<!--2021-04-13 이미지로 변경-->
		<span>홈</span> <!-- 홈 -->
	</a>
	<a href="javascript:void(0);" class="quick-menu__item n2 " onclick="URL_LINK.getI18Url('/ibe/booking/Availability.do')">
		
			
			
				<img src="https://static.jejuair.net/wccg/resources/images/upload/icon_bottom	bar_reservation_off_56x2.png" alt="항공권예매">
			
		
		<!--2021-04-13 이미지로 변경-->
		<span>예매</span> <!-- 항공권예매 -->
	</a>
	<a href="javascript:void(0);" class="quick-menu__item n3 on" onclick="URL_LINK.getI18Url('/ibe/checkin/viewCheckin.do')">
		
			
				<img src="https://static.jejuair.net/wccg/resources/images/upload/icon_bottombar_mboardingpass_on_56x2.png" alt="모바일 탑승권">
			
			
		
		<!--2021-04-13 이미지로 변경-->
		<span>모바일 탑승권</span> <!-- 모바일 탑승권 -->
	</a>
	<a href="javascript:void(0);" class="quick-menu__item n4 " onclick="URL_LINK.getI18Url('/additionalService/service/main.do')">
		
			
			
				<img src="https://static.jejuair.net/wccg/resources/images/upload/icon_bottombar_service_off_56x2.png" alt="부가서비스">
			
		
		<!--2021-04-13 이미지로 변경-->
		<span>부가서비스</span> <!-- 부가서비스 -->
	</a>
	<a href="javascript:void(0);" class="quick-menu__item n5 " onclick="URL_LINK.getI18Url('/member/mypage/main.do')">
		
			
			
				<img src="https://static.jejuair.net/wccg/resources/images/upload/icon_bottombar_mypage_off_56x2.png" alt="마이페이지">
			
		
		<!--2021-04-13 이미지로 변경-->
		<span>마이페이지</span> <!-- 마이페이지 -->
	</a>
</div>
			
		</div>
	</div>

	
	




<div id="footer" class="footer pc-only">
	
    <!-- pc -->
    <footer class="footer__inner">
		<div class="footer__top">
			<div class="footer__top-item">
				<a href="javascript:void(0);" class="footer__top-link" data-action="menu" data-menu-name="about">회사소개</a>
			</div>
			
				<div class="footer__top-item">
					<a href="javascript:void(0);" class="footer__top-link" data-action="menu" data-menu-name="ir">투자정보</a>
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
				<div class="family-wrap" data-element="toggle" data-options="{'mode': 'slide', 'speed': 300, 'clickToClose': true}">
					<button type="button" class="button-family" data-element="toggle__anchor" aria-controls="toggle-3" aria-expanded="false">Family Site</button>
					<div class="family-list" data-element="toggle__panel" id="toggle-3" style="display: none;">
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
							<a href="javascript:URL_LINK.getI18Url('https://static.jejuair.net/wccg/resources/pdf/Application_for_Damage_Redress.pdf');" class="link">항공교통이용자 피해구제 계획</a>
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
					<a href="javascript:void(0);" class="util-app-ios" data-action="menu" data-menu-name="iOSBtn"><img src="https://static.jejuair.net/wccg/resources/images/icon/icon-footer-app-ios.png" alt=""> IOS</a>
					<a href="javascript:void(0);" class="util-app-aos" data-action="menu" data-menu-name="AndroidBtn"><img src="https://static.jejuair.net/wccg/resources/images/icon/icon-footer-app-aos.png" alt=""> Android</a>
				</div>
				
				<p class="footer__bottom-address">
				    <font class="mr15">(주)제주항공</font>
					<span text="사업자등록번호 : 616-81-50527">사업자등록번호 : 616-81-50527</span>
					<font class="" text="대표이사:김이배">대표이사 : 김이배</font><br>
	            	제주특별자치도 제주시 신대로 64(연동, 건설공제회관 3층)
            	</p>
            	
            	
          		
			</div>
		</div>
    </footer>
    <!-- //pc -->
</div>


	
	


<!-- 공통 스크립트 선언 -->
<script type="text/javascript" src="https://static.jejuair.net/wccg/resources/js/lib/lib.min.js"></script>
<script type="text/javascript" src="https://static.jejuair.net/wccg/resources/js/lib/moment-with-locales.min.js"></script>
<script type="text/javascript" src="https://static.jejuair.net/wccg/resources/js/lib/jquery.i18n.js"></script>
<script type="text/javascript" src="https://static.jejuair.net/wccg/resources/js/lib/jquery.i18n.messagestore.js"></script>
<!-- 메인페이지 스크립트 에러 발생으로 이전 소스로 변경합니다. 
<script type="text/javascript" src="https://static.jejuair.net/wccg/resources/js/booking/plugin.js"></script>
<script type="text/javascript" src="https://static.jejuair.net/wccg/resources/js/booking/common.js"></script>
-->
<script>
$(document).ready(function(){
	
		$.ajaxSetup({
			beforeSend: function(xhr) {
				xhr.setRequestHeader('tcode', '0000000550');
				xhr.setRequestHeader('cname', USER_DEVICE.getName());
			}
		});
	
	
	//BOOKING LAYOUT상태서 sub로 바뀔경우  
	$(document).off('changeLayout').on('changeLayout', function(e, type) {
		if(type==='sub') {
			$('.bookingType').hide();
			$('.subType').show();
		}else if(type==='booking'){
			$('.subType').hide();
			$('.bookingType').show();
		}
	});
    
	//breadcrumbs cursor default
	$('.breadcrumb__item > a').css('cursor','default');
});

//타이틀 설정
$('header.mobile-only h2.header__page-name').text($('#main div.page-title').text());

</script>
<script type="text/javascript" src="https://static.jejuair.net/wccg/resources/js/plugin.js"></script>
<script type="text/javascript" src="https://static.jejuair.net/wccg/resources/js/common.js"></script>
<script type="text/javascript" src="https://static.jejuair.net/wccg/resources/js/vendor/lodash.min.js"></script>
<script type="text/javascript" src="https://static.jejuair.net/wccg/resources/js/vendor/localforage.min.js"></script>
<script type="text/javascript" src="https://static.jejuair.net/wccg/resources/js/vendor/handlebars.min-v4.7.6.js"></script>
<script type="text/javascript" src="https://static.jejuair.net/wccg/resources/js/handlebars.helpers.js"></script>
<script type="text/javascript" src="https://static.jejuair.net/wccg/resources/js/util/sUtil.js"></script>
<script type="text/javascript" src="https://static.jejuair.net/wccg/resources/js/util/dUtil.js"></script>
<script type="text/javascript" src="https://static.jejuair.net/wccg/resources/js/util/utils.js"></script>
<script type="text/javascript" src="https://static.jejuair.net/wccg/resources/js/amcharts/amcharts.core.js"></script>
<script type="text/javascript" src="https://static.jejuair.net/wccg/resources/bizjs/commons/bizCommons.js"></script>
<script type="text/javascript" src="https://static.jejuair.net/wccg/resources/js/jj.helpers.js"></script>

	
        
    

	<script>
let cultureCode = 'ko_KR';
let resultCheckinList = "";
let domIntType = "";
let userFlag = "";
let hwurl = 'https://www.jejuair.net';
let maxPsNum = 9;
let inputPsCnt = 1;
let resvDetailReqObj = {};
let detailData = "";
let userData = JSON.parse(USER_INFO.get());
let isNonUser = false;

if(userData.customerNo == null && userData.email == null){ //비로그인
	isNonUser = false;
} else if(userData.email != null){ //비회원로그인
	isNonUser = true;
}

$('#datepicker01').on('modal:close', function(e) {
	valCheckBtn($("#boardingDateBtn"));
});

$(document).ready(function() {

	if(USER_DEVICE.isApp()) {
		$('#lastCheckinBtn').show();
	}
	
	//로그인 경우 : 예약정보로 조회하기 toggle 닫힘 / 비로그인인 경우 toggle 열림
	if(userData.customerNo != null){
		getCheckinList(userData);
		userFlag = "P";
	} else { //오프라인 & 비회원 예약조회
		getCheckinOtherList("init", userData);
		userFlag = "N";
	}

	
	$(document).on('click', '#btnAgree07', function() {
		$(".modal__close").trigger("click");
	});

	$(document).ajaxStart(function() {
		Progress.show();
	});
	$(document).ajaxStop(function() {
		Progress.hide();
	});
});


function addInputPsForm(){
	let inputPsHtml = "";
	inputPsCnt++;

	inputPsHtml +="<div class='add-input'>";
	inputPsHtml +="	<div class='input-wrap input--line'>";
	inputPsHtml +="		<div class='input-row'>";
	inputPsHtml +="			<div class='input-item'>";

	inputPsHtml +="<div class='input-flex'>";
	inputPsHtml +="	<div class='input-box'>";
	inputPsHtml +="		<label for='psInputLastName_"+inputPsCnt+"' class='input__label'>성</label>"; //성
	inputPsHtml +="		<div data-element='form' class='input'>";
	inputPsHtml +="			<input type='text' data-element='input' id='psInputLastName_"+inputPsCnt+"' class='input__text' style='text-transform :uppercase;' onchange='checkResvBtn();' onkeyup='sUtil.koreng(this);'>";
	inputPsHtml +="			<button type='button' data-element='remove' class='input__remove-button'>삭제</button>";
	inputPsHtml +="		</div>";
	inputPsHtml +="	</div>";
	inputPsHtml +="	<div class='input-box'>";
	inputPsHtml +="		<label for='psInputFirstName_"+inputPsCnt+"' class='input__label'>이름</label>"; //이름
	inputPsHtml +="		<div data-element='form' class='input'>";
	inputPsHtml +="			<input type='text' data-element='input' id='psInputFirstName_"+inputPsCnt+"' class='input__text' title='이름 입력'style='text-transform :uppercase;' onchange='checkResvBtn();' onkeyup='sUtil.koreng(this);'>";
	inputPsHtml +="			<button type='button' data-element='remove' class='input__remove-button'>삭제</button>";
	inputPsHtml +="		</div>";
	inputPsHtml +="	</div>";
	inputPsHtml +="	<div class='btn_delete'>";
	inputPsHtml +="		<button type='button' class='button button--small' onclick='removeInputPsForm(this);'>";
	inputPsHtml +="			<span class='button__text button__icon icon-minus'>삭제</span>";
	inputPsHtml +="		</button>";
	inputPsHtml +="	</div>";
	inputPsHtml +="</div>";

	inputPsHtml +="			</div>";
	inputPsHtml +="		</div>";
	inputPsHtml +="	</div>";
	inputPsHtml +="</div>";

	$("#inputPassengerList").append(inputPsHtml);

	formControl.init();

	psHandleBtn();
}


function removeInputPsForm() {
	$("#inputPassengerList > div:last").remove();
	
	psHandleBtn();
}


function psHandleBtn() {
	if (maxPsNum > $("#inputPassengerList > div.add-input").length) {
		$("#addPsFormBtn").show();
	} else {
		$("#addPsFormBtn").hide();
	}
	
	checkResvBtn();
}


function getCheckinOtherList(flag, userData){
	let psName = "";
	
	if(flag == "init"){
		if(!isNonUser){ //비로그인
			setNoResultHtml(""); 
		} else if(isNonUser){ //비회원로그인
			isNonUser = true;
			setNoResultHtml("nonUserLogin");
		}
	}

	let boardingDate = $("#boardingDateBtn").text().replace(/[^0-9]/g,'');
	$("#hidDepDate").val(boardingDate.substr(0, 4) + "-" + boardingDate.substr(4, 2) + "-" + boardingDate.substr(6, 2));
	$("#hidRecordLocator").val( $("[name=recordLocatorInput]").val().toUpperCase().replace(/\s/gi, ""));

	for(let i = 0; i < $("[id^=psInputLastName_]").length; i++) {
		if(psName != "") {
			psName += ",";
		}
		psName += $("[id^=psInputLastName_]").eq(i).val() + "/" + $("[id^=psInputFirstName_]").eq(i).val();
	}

	if(flag == "search"){
		const otherListReq = {
			recordLocator: $("#hidRecordLocator").val(),
			depDate:  $("#hidDepDate").val(),
			cultureCode:  cultureCode.replace("_", "-"),
			passengerName : psName.toUpperCase().replace(/\s/gi, "")
		}

		$.ajax({
			url 		: "getCheckinOtherList.json",
			type 		: "post",
			async		: true,
			dataType	: "json",
			data 		: {
				otherListReq:  JSON.stringify(otherListReq)
			},
			beforeSend: function() { 
				Progress.show();
	        },
			success 	: function(data) {
				if(data.code == "0000"){
					if(data.data.code == "0000"){
						resultCheckinList = data.data.data;
						
						setCheckinList(resultCheckinList , flag);
		
						 
						if(data.data.data == null || Object.keys(resultCheckinList).length == 0 || $("#checkinTabList > li").length == 0){
							$("#loginNoResult").html("<div class='page-title'>모바일 탑승권</div><div class='page-sub-title'>현재 발급할 수 있는 <br class=mobile-only>예약이 없어요.</div>").show();
							
							$("#noCheckinList").show();
							$("#noLogin").hide();
							$("#isResult").hide();
							$("#nonUserLogin").hide();
						} else {
							$("#isResult").html("<div class='page-title'>모바일 탑승권</div><div class='page-sub-title'>탑승일자가 빠른 구간부터 발급할 수 있어요.</div>").show();
							
							$("#noLogin").hide();
							$("#noCheckinList").hide();
							$("#loginNoResult").hide();
							$("#nonUserLogin").hide();
						}
					} else if(data.data.code == null){
						$("#alertModalLayer").find(".alert-text").text("발급 가능한 예약을 찾을 수 없습니다.\n예약 정보와 모바일 탑승권 발급 조건을 다시 확인해 주세요.");
						fullPopOpen("alertModalLayer");
					} else {
						let datas = {};
						if(data.data.code == "COMESV902" || data.data.code == "WCSUSV033") {
							datas.message = "조회된 데이터가 없습니다."; 
						} else {
							datas.title = data.data.code,
							datas.message = data.data.message
						}
						$.JJAlert(datas);
						if(userData.customerNo != null){
							$("#isResult").hide();
							$("#nonUserLogin").hide();
							setNoResultHtml("user");
 						} else if(!isNonUser){
							$("#loginNoResult").hide();
							$("#isResult").hide();
							$("#nonUserLogin").hide();
							setNoResultHtml("");
						} else if(isNonUser){
							$("#loginNoResult").hide();
							$("#isResult").hide();
							$("#nonUserLogin").hide();
							setNoResultHtml("nonUserLogin");
						}

						$("#resultListSection").hide();
						$("#checkinTabList").hide();
						$("#checkinList").hide();
					}
				} else {
					let datas = {
						title: data.code,
						message: data.message
					}; 
					$.JJAlert(datas);
						
					if(userData.customerNo == null){
						setNoResultHtml("");
					} else if(userData.email != null){
						setNoResultHtml("nonUserLogin");
					}

					$("#resultListSection").hide();
					$("#checkinTabList").hide();
					$("#checkinList").hide();
					$("#isResult").hide();
				}
			},
			complete : function() {
				Progress.hide();
				$("html").scrollTop(0); 
			}
		}); 
	}
	
	initInput();
}


function getCheckinList(userInfo){
	let userTitleHtml = "";
	
	const checkinListReq = {
		customerNo :  userInfo.customerNo,
		cultureCode:  cultureCode.replace("_", "-"),
	};

	$.ajax({
		url 		: "getCheckinList.json",
		type 		: "post",
		async		: true,
		dataType	: "json",
		data 		: {
			checkinListReq:  JSON.stringify(checkinListReq)
		},
		beforeSend: function() { 
			Progress.show();
        },
		success 	: function(data) {
			if(data.code != null && data.code == "0000"){
				if(data.data.code == "0000"){
					resultCheckinList = data.data.data;
	
					
					setCheckinList(resultCheckinList, "");
	
					 
					if(resultCheckinList == null || $("#checkinTabList > li").length == 0){
						setNoResultHtml("user");
					} else {
						$("#isResult").html("<div class='page-title'>모바일 탑승권</div><div class='page-sub-title'>탑승일자가 빠른 구간부터 발급할 수 있어요.</div>").show(); 
					}
				} else {
					let datas = {
						title: data.data.code,
						message: data.data.message
					}; 
					$.JJAlert(datas);
					
					setNoResultHtml("user");
				}
			} else {
				let datas = {
					title: data.code,
					message: data.message
				}; 
				$.JJAlert(datas);
				
				setNoResultHtml("user");
			}
		},
		complete : function() {
			Progress.hide();
		}
	});
	
	
	initInput();
}


function setCheckinList(resultCheckinList ,flag){
	let isCheckinCnt = 0;
	let trueCheckinCnt = 0;
	let tabListHtml = "";
	let checkinListHtml = "";

	for(let cdx in resultCheckinList){
		let gmtNow = new Date(); //local 시간 
		let utcNow = new Date(gmtNow.getTime() + (gmtNow.getTimezoneOffset() * 60000)); //UTC변환

		for(let jdx in resultCheckinList[cdx].journeys){
			if(flag == "search" && $("#hidDepDate").val() != resultCheckinList[cdx].journeys[jdx].designator.departure.substr(0, 10)) {
				continue;
			}

			let untkType = "";

			for(let sdx in resultCheckinList[cdx].journeys[jdx].segments){
				isCheckinCnt++;
				if(resultCheckinList[cdx].journeys[jdx].segments[sdx].possibleCheckIn == true) {
					tabListHtml += "<li class='chip swiper-slide'>";
					tabListHtml += "	<button type='button' class='chip-btn' data-index="+isCheckinCnt+" id=swiperBtn"+isCheckinCnt+">";
					tabListHtml += "		<span class='txt'>"+resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.originName +"→"+ resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.destinationName +"</span>";
					tabListHtml += "		<input type='hidden' name='journeyKey' value='"+resultCheckinList[cdx].journeys[jdx].journeyKey+"'>";
					tabListHtml += "		<input type='hidden' name='segKey' value='"+resultCheckinList[cdx].journeys[jdx].segments[sdx].segmentKey+"'>";
					tabListHtml += "		<input type='hidden' name='departureDate' value='"+resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.departure+"'>";
					tabListHtml += "		<input type='hidden' name='recordLocator' value='"+resultCheckinList[cdx].recordLocator+"'>";
					tabListHtml += "		<input type='hidden' name='segDestination' value='"+resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.destination+"'>";
					tabListHtml += "		<input type='hidden' name='segOrigin' value='"+resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.origin+"'>";
					tabListHtml += "		<input type='hidden' name='segOriginName' value='"+resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.originName+"'>";
					tabListHtml += "		<input type='hidden' name='checkinData' value='"+JSON.stringify(resultCheckinList[cdx]).replaceAll('\'', '&#39;').replaceAll('\r','\\r').replaceAll('\n','\\n')+"'>";
					tabListHtml += "		<input type='hidden' name='sortData' value='"+resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.departure.replace(/[^0-9]/gi,'')+"'>";
					tabListHtml += "		<input type='hidden' name='codeShareFlag' value='"+(resultCheckinList[cdx].journeys[jdx].segments[sdx].externalIdentifier != null ? "Y" : "N")+"'>";
					tabListHtml += "	</button>";
					tabListHtml += "</li>";

					let oldDepDate = "";					
					let newDepDate = "";
					let newFligtNo = "";
					let newArrDate = ""; 
					let newDate = "";
					let oldDate = "";
					let newIrop = "";

					if(resultCheckinList[cdx].journeys[jdx].segments[sdx].legs[0].operationsInfo.departureTimes.estimated != null){
						newDate = resultCheckinList[cdx].journeys[jdx].segments[sdx].legs[0].operationsInfo.departureTimes.estimated.replaceAll(/[^0-9]/gi,'');
						oldDate = resultCheckinList[cdx].journeys[jdx].segments[sdx].legs[0].operationsInfo.departureTimes.scheduled.replaceAll(/[^0-9]/gi,'');
						newDepDate = resultCheckinList[cdx].journeys[jdx].segments[sdx].legs[0].operationsInfo.departureTimes.estimated.replaceAll(/[^0-9]/gi,'');
						oldDepDate = resultCheckinList[cdx].journeys[jdx].segments[sdx].legs[0].operationsInfo.departureTimes.scheduled.replaceAll(/[^0-9]/gi,'');
						newIrop = resultCheckinList[cdx].journeys[jdx].segments[sdx].legs[0].legInfo.irop;
						
						if(oldDate > newDate){
							untkType = "조기출발";
						}

						if(oldDate < newDate){
							untkType = "지연";
						}
					}

					checkinListHtml+="<div class='show' data-chip-show="+isCheckinCnt+">";
					checkinListHtml+="	<div class='boarding-list-pc boarding-pass'>";
					checkinListHtml+="		<div class='boarding-wrap'>";
					if(untkType === ""){
						checkinListHtml+="			<div class='boarding-box'>";
					} else{
						checkinListHtml+="			<div class='boarding-box change'>";
					}
					checkinListHtml+="				<div class='boarding'>";
					checkinListHtml+="					<div class='boarding__header'>";
					checkinListHtml+="						<div class='boarding__header--item1'>";
					checkinListHtml+="							<span>예약번호</span>: <span>"+ resultCheckinList[cdx].recordLocator +"</span>"; 
					checkinListHtml+="						</div>";
					checkinListHtml+="					</div>";

					if(untkType != ""){
						checkinListHtml+="<div class='change-box'>"+ untkType +"</div>"; // 분기
					}
					checkinListHtml+="					<div class='boarding__info-wrap'>";
					checkinListHtml+="						<div class='boarding__info--top'>";
					checkinListHtml+="							<div class='boarding__info--top-item1'>";

					if(newFligtNo == "") {
						checkinListHtml+="							<span>"+ resultCheckinList[cdx].journeys[jdx].segments[sdx].identifier.carrierCode + resultCheckinList[cdx].journeys[jdx].segments[sdx].identifier.identifier +"</span>";
					} else {
						checkinListHtml+="								<span class='before'>"+ oldFligtNo +"</span>";
						checkinListHtml+="								<span class='after'>"+ newFligtNo +"</span>";
					}
					
					checkinListHtml+="							</div>";
					checkinListHtml+="							<div class='boarding__info--top-item2'>";
					checkinListHtml+="								<div class='label label-blue'>D-DAY</div>";
					checkinListHtml+="							</div>";
					checkinListHtml+="						</div>";
					checkinListHtml+="						<div class='boarding__info'>";
					checkinListHtml+="							<div class='boarding__info-before'>";

					let originName = resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.originName;
					let destinationName = resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.destinationName;
					if(originName == null || destinationName == null ){
						originName = resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.origin;
						destinationName = resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.destination;
					}
					
					if(originName.indexOf("(") != -1 ){
						let splitOriginName = originName.split("(");
						checkinListHtml+="							<div class='boarding__info-title'>"+ splitOriginName[0] +"</div>";
						checkinListHtml+="							<div class='boarding__info-text'>"+ splitOriginName[1].slice(0, -1) +"</div>";
					} else {
						checkinListHtml+="							<div class='boarding__info-title'>"+ originName +"</div>";
						checkinListHtml+="							<div class='boarding__info-text'>&nbsp;</div>";
					}

					if(newDepDate == "") {
						checkinListHtml+="								<div class='boarding__info-date'>"+ dUtil.dateWeekNameTime(resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.departure.replace(/[^0-9]/gi,''), I18N.language) +"</div>";
						checkinListHtml += "							<input type='hidden' name='sortData' value='"+resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.departure.replace(/[^0-9]/gi,'')+"'>";
					} else {
						checkinListHtml+="								<div class='boarding__info-date before'>"+ dUtil.dateWeekNameTime(oldDepDate.replace(/[^0-9]/gi,''), I18N.language) +"</div>";
						checkinListHtml+="								<div class='boarding__info-date after'>"+ dUtil.dateWeekNameTime(newDepDate.replace(/[^0-9]/gi,''), I18N.language) +"</div>";
						checkinListHtml += "							<input type='hidden' name='sortData' value='"+newDepDate.replace(/[^0-9]/gi,'')+"'>";
					}
					
					checkinListHtml+="							</div>";
					checkinListHtml+="							<div aria-label='one-way' class='icon-mark one-way'></div>";
					checkinListHtml+="							<div class='boarding__info-after'>";
					if(destinationName.indexOf("(") != -1 ){
						let splitDestinationName = destinationName.split("(");
						checkinListHtml+="							<div class='boarding__info-title'>"+ splitDestinationName[0] +"</div>";
						checkinListHtml+="							<div class='boarding__info-text'>"+ splitDestinationName[1].slice(0, -1)+"</div>";
					} else {
						checkinListHtml+="							<div class='boarding__info-title'>"+ destinationName +"</div>";
						checkinListHtml+="							<div class='boarding__info-text'>&nbsp;</div>";
					}

					if(newArrDate == "") {
						checkinListHtml+="								<div class='boarding__info-date'>"+ dUtil.dateWeekNameTime(resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.arrival.replace(/[^0-9]/gi,''), I18N.language) +"</div>";
					} else {
						checkinListHtml+="								<div class='boarding__info-date before'>"+ dUtil.dateWeekNameTime(oldArrDate.replace(/[^0-9]/gi,''), I18N.language) +"</div>";
						checkinListHtml+="								<div class='boarding__info-date after'>"+ dUtil.dateWeekNameTime(newArrDate.replace(/[^0-9]/gi,''), I18N.language) +"</div>";
					}
										
					checkinListHtml+="							</div>";
					checkinListHtml+="						</div>";

					let resultStatus = "";
					
					
					let cntDefault = 0;
					let cntCheckedIn = 0;
					let cntBoarded = 0;

					let cntImpossible = 0;
					
					for(let psdx in resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment){
						let seatData = resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].seats;
						let isPet = false;
						let isWCHR = false;
						let isCHD = false;

						for(let pdx in resultCheckinList[cdx].passengers){
							if(Object.keys(resultCheckinList[cdx].passengers).length == 1 && Object.keys(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment).length == 1){
								if(resultCheckinList[cdx].passengers[pdx].passengerTypeCode == "CHD"){
									isCHD = true;
									break;
								}
							}
						}
						
						for(let ssdx in resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].ssrs){
							if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].ssrs[ssdx].ssrCode == "PETC"){
								isPet = true;
								break;
							} else if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].ssrs[ssdx].ssrCode == "WCHR"){
								isWCHR = true;
								break;
							}
						}

						
						if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].liftStatus == "Default" && (isCHD || isPet || resultCheckinList[cdx].passengers[psdx].infant != null
						|| (seatData.length > 0 && seatData[0].seatInformation.propertyList.EXITROW != null && seatData[0].seatInformation.propertyList.EXITROW == "TRUE") || isWCHR || !resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].isPossibleCheckIn
						|| resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].code == "WCSIUI008")) {
							cntImpossible++;
						} else {
							if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].liftStatus == "Default"){
								cntDefault++;
							} else if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].liftStatus == "CheckedIn"){
								cntCheckedIn++;
							} else if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].liftStatus == "Boarded"){
								cntBoarded++;
							}
						}
					}
										
					if(cntCheckedIn > 0 && (Object.keys(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment).length - cntImpossible) == cntCheckedIn){
						resultStatus = "<span class='color--blue text'>발급 완료</span>";
					} else if(cntBoarded > 0 && (Object.keys(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment).length - cntImpossible) == cntBoarded){
						resultStatus = "<span class='color--black text'>탑승 완료</span>";
					} else if((Object.keys(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment).length - cntImpossible) == 0){
						resultStatus = "<span class='color--black text'>발급불가</span>";
					} else {
						resultStatus = "<span class='color--org text'>" + cntDefault + "명 발급 가능</span>"; 
					}
					
					checkinListHtml+="						<div class='button-wrap3-row'>";
					checkinListHtml+=							resultStatus;
					checkinListHtml+="						</div>";
					checkinListHtml+="					</div>";
					checkinListHtml+="				</div>";
					checkinListHtml+="				<div class='boarding-passchk'>";
					
					let psHtml = "";
					let psTicketHtml = "";

					for(let psdx in resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment){
						let infoMsg = "";
						let seatData = resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].seats;
						let isPet = false;
						let isWCHR = false;
						let isCHD = false;

						for(let pdx in resultCheckinList[cdx].passengers){
							if(Object.keys(resultCheckinList[cdx].passengers).length == 1 && Object.keys(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment).length == 1){
								if(resultCheckinList[cdx].passengers[pdx].passengerTypeCode == "CHD"){
									isCHD = true;
									break;
								}
							}
						}
						
						for(let ssdx in resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].ssrs){
							if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].ssrs[ssdx].ssrCode == "PETC"){
								isPet = true;
								break;
							} else if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].ssrs[ssdx].ssrCode == "WCHR"){
								isWCHR = true;
								break;
							}
						}

						if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].liftStatus != "CheckedIn" && resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].liftStatus != "Boarded"){
							if(!resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].possibleCheckIn){
								infoMsg = "AD";
							} 

							if (isCHD){
								infoMsg = "혼자 여행하는 어린이";
							} else if(resultCheckinList[cdx].passengers[psdx].infant != null) {
								infoMsg = "유아 탑승객 보호자";
							} else if(seatData.length > 0 && seatData[0].seatInformation.propertyList.EXITROW != null && seatData[0].seatInformation.propertyList.EXITROW == "TRUE") {
								infoMsg = "비상구 좌석 사전 구매 승객";
							} else if(isWCHR){ // 휠체어 승객
								infoMsg = "휠체어 신청 승객";
							} else if(isPet){
								infoMsg = "애완동물 동반 승객";
							} else if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].liftStatus == "NoShow"){
								infoMsg = "noshow 승객";
							} else if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].code == "WCSIUI008") {
								infoMsg = "autoCheckin"; 
							} 
						}

						//불가능 case
						if(infoMsg != ""){
							psHtml+="					<div class='check-item'>";
							psHtml+="						<span class='checkbox checkbox--small'> <input type='checkbox' id='inputPassengers"+psdx+"' name='psCheckBox' class='checkbox__input' data-passengeralternatekey="+ resultCheckinList[cdx].passengers[psdx].passengerAlternateKey +" disabled>";
							psHtml+="							<label for='inputPassengers"+psdx+"' class='checkbox__label'> <i aria-hidden='true' class='checkbox__ico'></i>";
							psHtml+="								<span name='paxName' style='text-transform :uppercase;'>"+ resultCheckinList[cdx].passengers[psdx].name.last + "/" + resultCheckinList[cdx].passengers[psdx].name.first +"</span>";
							psHtml+="							</label>";
							psHtml+="						</span>";
							psHtml+="						<span data-element='tooltip' role='tooltip' class='tooltip' data-set='{\"width\":\"300\", \"left\":\"-100\", \"arrow\":\"102\"}'>";
							psHtml+="							<button type='button' aria-label='툴팁 열기' data-element='tooltip__anchor' class='tooltip__button'></button>";
							psHtml+="							<span data-element='tooltip__panel' class='tooltip__panel'>";
							psHtml+="								<span aria-hidden='true' class='tooltip-arrow'></span>"; 
							if(infoMsg == "AD"){
								psHtml+="								<span class='tooltip-desc'>직원 확인이 필요한 예약으로 모바일 탑승권 발급이 제한됩니다. 탑승 당일 카운터에 방문하시면 친절하게 도와드릴게요.</span>"; 
							} else if(infoMsg == "autoCheckin") {
								psHtml+="                               <span class='tooltip-desc'>자동 체크인 진행 중입니다.</span>"; 
							} else {
								psHtml+="								<span class='tooltip-desc'>고객님은 "+infoMsg+"이므로 모바일 탑승권 발급이 제한됩니다.<br>발급 제한 고객님은 탑승 당일 카운터에 방문하시면 친절하게 도와드릴게요.</span>"; 
							}
							psHtml+="							</span>";
							psHtml+="						</span>";
							psHtml+="					</div>";
						} else {
							//체크인 가능 case
							if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].liftStatus == "Default"){
								psHtml+="					<div class='check-item'>";
								psHtml+="						<span class='checkbox checkbox--small'> <input type='checkbox' onclick='btnValCheck(" + isCheckinCnt + ");' id='inputPassengers"+psdx+isCheckinCnt+"' name='psCheckBox' data-passengerkey="+resultCheckinList[cdx].passengers[psdx].passengerKey+" data-passengeralternatekey="+ resultCheckinList[cdx].passengers[psdx].passengerAlternateKey +" class='checkbox__input' data-age='"+ resultCheckinList[cdx].passengers[psdx].info.dateOfBirth +"' value='"+psdx+"'>";
								psHtml+="							<label for='inputPassengers"+psdx+isCheckinCnt+"' class='checkbox__label'> <i aria-hidden='true' class='checkbox__ico'></i>";
								psHtml+="								<span name='paxName' style='text-transform :uppercase;'>"+ resultCheckinList[cdx].passengers[psdx].name.last + "/" + resultCheckinList[cdx].passengers[psdx].name.first +"</span>";
								psHtml+="							</label>";
								psHtml+="						</span>";
								psHtml+="					</div>";
							} else if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].liftStatus == "CheckedIn" || resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].liftStatus == "Boarded"){
// 								const ticketClass = resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].hasBarcode ? "ticket-item" : "ticket-item seat-item";
								const ticketClass = "ticket-item";
								psTicketHtml +="<a class='" + ticketClass + "' onclick='goViewCheckin(this)'>";
		                        psTicketHtml +="	<span class='name' style='text-transform :uppercase;' data-webcheckin="+resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].isWebCheckIn+" data-passengeralternatekey="+ resultCheckinList[cdx].passengers[psdx].passengerAlternateKey +">"+ resultCheckinList[cdx].passengers[psdx].name.last + "/" + resultCheckinList[cdx].passengers[psdx].name.first +"</span>";
		                        psTicketHtml +="</a>";
							}

						}
					}

					if(psHtml != ""){
						checkinListHtml+="<div class='check-wrap'>";
						checkinListHtml+=	psHtml;
						checkinListHtml+="</div>";
					}

					if(psTicketHtml != ""){
						checkinListHtml+="<div class='boarding-ticket-wrap'>";
						checkinListHtml+=	psTicketHtml;
                        checkinListHtml+="</div>";
					}
					
					checkinListHtml+="				</div>";
					checkinListHtml+="				<div class='boarding_end'></div>";
					checkinListHtml+="			</div>";
					checkinListHtml+="			<div class='button-wrap2'>";
					checkinListHtml+="				<button type='button' class='button -w100' id='btnCheckin" + isCheckinCnt + "' onclick='checkinPassengerInputCheck();' disabled>모바일 탑승권 발급</button>";
					checkinListHtml+="			</div>";
					checkinListHtml+="		</div>";
					checkinListHtml+="	</div>";
					checkinListHtml+="</div>";
				} else { 
					let depDateObj = new Date(resultCheckinList[cdx].journeys[jdx].segments[sdx].legs[0].legInfo.departureTimeUtc.replace("Z", ""));
					if((depDateObj.getTime() + 86400000 >= utcNow.getTime()) && (depDateObj.getTime()- 86400000) <= utcNow.getTime()){ // 출발 후 24시간이 지난 경우는 제외 ~ 출발일 기준 24시간 전
						tabListHtml += "<li class='chip swiper-slide'>";
						tabListHtml += "	<button type='button' class='chip-btn' data-index="+isCheckinCnt+" id=swiperBtn"+isCheckinCnt+">";
						tabListHtml += "		<span class='txt'>"+resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.originName +"→"+ resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.destinationName +"</span>";
						tabListHtml += "		<input type='hidden' name='journeyKey' value='"+resultCheckinList[cdx].journeys[jdx].journeyKey+"'>";
						tabListHtml += "		<input type='hidden' name='segKey' value='"+resultCheckinList[cdx].journeys[jdx].segments[sdx].segmentKey+"'>";
						tabListHtml += "		<input type='hidden' name='departureDate' value='"+resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.departure+"'>";
						tabListHtml += "		<input type='hidden' name='recordLocator' value='"+resultCheckinList[cdx].recordLocator+"'>";
						tabListHtml += "		<input type='hidden' name='segDestination' value='"+resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.destination+"'>";
						tabListHtml += "		<input type='hidden' name='segOrigin' value='"+resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.origin+"'>";
						tabListHtml += "		<input type='hidden' name='checkinData' value='"+JSON.stringify(resultCheckinList[cdx]).replaceAll('\'', '&#39;').replaceAll('\r','\\r').replaceAll('\n','\\n')+"'>";
						tabListHtml += "		<input type='hidden' name='sortData' value='"+resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.departure.replace(/[^0-9]/gi,'')+"'>";
						tabListHtml += "	</button>";
						tabListHtml += "</li>";
	
						checkinListHtml+="<div class='show' data-chip-show="+isCheckinCnt+">";
						checkinListHtml+="	<div class='boarding-list-pc boarding-pass'>";
						checkinListHtml+="		<div class='boarding-wrap'>";
						if(resultCheckinList[cdx].untkYn == "N"){
							checkinListHtml+="			<div class='boarding-box'>";
						} else if(resultCheckinList[cdx].untkYn == "Y"){
							checkinListHtml+="			<div class='boarding-box change'>";
						}
						checkinListHtml+="				<div class='boarding'>";
						checkinListHtml+="					<div class='boarding__header'>";
						checkinListHtml+="						<div class='boarding__header--item1'>";
						checkinListHtml+="							<span>예약번호</span>: <span>"+ resultCheckinList[cdx].recordLocator +"</span>";
						checkinListHtml+="						</div>";
						checkinListHtml+="					</div>";

						let oldFlag = "";
						let oldFligtNo = "";
						let oldDepDate = "";
						let oldArrDate = "";
						let newFligtNo = "";
						let newDepDate = "";
						let newArrDate = "";
						let untkStatus = "";
						
						if(resultCheckinList[cdx].untkYn == "Y"){ 
							if(resultCheckinList[cdx].resUntk != null){
								for(let ujdx in resultCheckinList[cdx].resUntk.untkList){
									if(resultCheckinList[cdx].resUntk.untkList[ujdx].status == "OLD"){
										let legInfo = resultCheckinList[cdx].resUntk.untkList[ujdx].journeys[jdx].segments[sdx].legs[0];
										oldFlag = "before";
										
										let carrierCode = legInfo.carrierCode == null ? "" : legInfo.carrierCode;
										let identifier = legInfo.identifier == null ? "" : legInfo.identifier;
										
										oldFligtNo = carrierCode + identifier;
										oldDepDate = legInfo.departure == null ? "" : legInfo.departure;
										oldArrDate = legInfo.arrival == null ? "" : legInfo.arrival;

										break;
									}
								}
							}

							if(oldFlag == "before"){
								for(let ujdx in resultCheckinList[cdx].resUntk.untkList){
									if(resultCheckinList[cdx].resUntk.untkList[ujdx].status == "NEW"){
										let legInfo = resultCheckinList[cdx].resUntk.untkList[ujdx].journeys[jdx].segments[sdx].legs[0];
										
										let carrierCode = legInfo.carrierCode == null ? "" : legInfo.carrierCode;
										let identifier = legInfo.identifier == null ? "" : legInfo.identifier;
										let departure = legInfo.departure == null ? "" : legInfo.departure;
										let arrival = legInfo.arrival == null ? "" : legInfo.arrival;

										if(oldFligtNo != (carrierCode + identifier)) newFligtNo = carrierCode + identifier;
										if(oldDepDate != departure) newDepDate = departure;
										if(oldArrDate != arrival) newArrDate = arrival;

										break;
									}
								}
							}
						}

						if(untkType != ""){
							checkinListHtml+="<div class='change-box'>"+ untkType +"</div>"; // 분기
						}
						
						checkinListHtml+="					<div class='boarding__info-wrap'>";
						checkinListHtml+="						<div class='boarding__info--top'>";
						checkinListHtml+="							<div class='boarding__info--top-item1'>";

						if(newFligtNo == "") {
							checkinListHtml+="								<span>"+ resultCheckinList[cdx].journeys[jdx].segments[sdx].identifier.carrierCode + resultCheckinList[cdx].journeys[jdx].segments[sdx].identifier.identifier +"</span>";
						} else {
							checkinListHtml+="								<span class='before'>"+ oldFligtNo +"</span>";
							checkinListHtml+="								<span class='after'>"+ newFligtNo +"</span>";
						}
						
						checkinListHtml+="							</div>";
						checkinListHtml+="						</div>";
						checkinListHtml+="						<div class='boarding__info'>";
						checkinListHtml+="							<div class='boarding__info-before'>";
						
						let originName = resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.originName;
						let destinationName = resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.destinationName;
						
						if(originName == null || destinationName == null ){ 
							originName = resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.origin;
							destinationName = resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.destination;
						}
						
						if(originName.indexOf("(") != -1 ){
							let splitOriginName = originName.split("(");
							checkinListHtml+="							<div class='boarding__info-title'>"+ splitOriginName[0] +"</div>";
							checkinListHtml+="							<div class='boarding__info-text'>"+ splitOriginName[1].slice(0, -1) +"</div>";
						} else {
							checkinListHtml+="							<div class='boarding__info-title'>"+ originName +"</div>";
							checkinListHtml+="							<div class='boarding__info-text'>&nbsp;</div>";
						}

						if(newDepDate == "") {
							checkinListHtml+="								<div class='boarding__info-date'>"+ dUtil.dateWeekNameTime(resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.departure.replace(/[^0-9]/gi,''), I18N.language) +"</div>";
							checkinListHtml += "							<input type='hidden' name='sortData' value='"+resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.departure.replace(/[^0-9]/gi,'')+"'>";
						} else {
							if(oldDepDate != null && newDepDate != null && newDepDate != null){
								checkinListHtml+="								<div class='boarding__info-date before'>"+ dUtil.dateWeekNameTime(oldDepDate.replace(/[^0-9]/gi,''), I18N.language) +"</div>";
								checkinListHtml+="								<div class='boarding__info-date after'>"+ dUtil.dateWeekNameTime(newDepDate.replace(/[^0-9]/gi,''), I18N.language) +"</div>";
								checkinListHtml += "							<input type='hidden' name='sortData' value='"+newDepDate.replace(/[^0-9]/gi,'')+"'>";
							}
						}
						checkinListHtml+="							</div>";
						checkinListHtml+="							<div aria-label='one-way' class='icon-mark one-way'></div>";
						checkinListHtml+="							<div class='boarding__info-after'>";

						if(destinationName.indexOf("(") != -1 ){
							let splitDestinationName = destinationName.split("(");
							checkinListHtml+="							<div class='boarding__info-title'>"+ splitDestinationName[0] +"</div>";
							checkinListHtml+="							<div class='boarding__info-text'>"+ splitDestinationName[1].slice(0, -1)+"</div>";
						} else {
							checkinListHtml+="							<div class='boarding__info-title'>"+ destinationName +"</div>";
							checkinListHtml+="							<div class='boarding__info-text'>&nbsp;</div>";
						}

						if(newArrDate == "") {
							checkinListHtml+="								<div class='boarding__info-date'>"+ dUtil.dateWeekNameTime(resultCheckinList[cdx].journeys[jdx].segments[sdx].designator.arrival.replace(/[^0-9]/gi,''), I18N.language) +"</div>";
						} else {
							checkinListHtml+="								<div class='boarding__info-date before'>"+ dUtil.dateWeekNameTime(oldArrDate.replace(/[^0-9]/gi,''), I18N.language) +"</div>";
							checkinListHtml+="								<div class='boarding__info-date after'>"+ dUtil.dateWeekNameTime(newArrDate.replace(/[^0-9]/gi,''), I18N.language) +"</div>";
						}
						
						checkinListHtml+="							</div>";
						checkinListHtml+="						</div>";

						
						let cntDefault = 0;
						let cntCheckedIn = 0;
						let cntBoarded = 0;

						let cntImpossible = 0;
						
						for(let psdx in resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment){
							let seatData = resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].seats;
							let isPet = false;
							let isWCHR = false;
							let isCHD = false;

							for(let pdx in resultCheckinList[cdx].passengers){
								if(Object.keys(resultCheckinList[cdx].passengers).length == 1 && Object.keys(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment).length == 1){
									if(resultCheckinList[cdx].passengers[pdx].passengerTypeCode == "CHD"){
										isCHD = true;
										break;
									}
								}
							}
							
							for(let ssdx in resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].ssrs){
								if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].ssrs[ssdx].ssrCode == "PETC"){
									isPet = true;
									break;
								} else if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].ssrs[ssdx].ssrCode == "WCHR"){
									isWCHR = true;
									break;
								}
							}

							if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].liftStatus == "Default" && (isCHD || isPet || resultCheckinList[cdx].passengers[psdx].infant != null
							|| (seatData.length > 0 && seatData[0].seatInformation.propertyList.EXITROW != null && seatData[0].seatInformation.propertyList.EXITROW == "TRUE") || isWCHR
							|| resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].code == "WCSIUI008" || resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].code == "WCSIUI008")) {
								cntImpossible++;
							} else {
								if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].liftStatus == "Default"){
									cntDefault++;
								} else if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].liftStatus == "CheckedIn"){
									cntCheckedIn++;
								} else if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].liftStatus == "Boarded"){
									cntBoarded++;
								}
							}
						}

						let resultStatus = "";
						let tooltipDesc = "체크인 발급 불가 시간입니다."; 
						
						const counterInquiry = (Object.keys(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment).length - cntImpossible) != (cntCheckedIn+cntBoarded);
						if(counterInquiry && resultCheckinList[cdx].journeys[jdx].segments[sdx].code != "0000") {
							resultStatus = "<span class='color--org text'>카운터 문의"
								+"		<span data-element='tooltip' role='tooltip' class='tooltip' data-set='{'width': '320', 'left':'-280', 'arrow':  '280'}'>"
								+"			<button type='button' aria-label='툴팁 열기' data-element='tooltip__anchor' class='tooltip__button'></button>"
								+"			<span data-element='tooltip__panel' class='tooltip__panel'>"
							+"				<span aria-hidden='true' class='tooltip-arrow'></span>";
						}
						if(resultCheckinList[cdx].journeys[jdx].segments[sdx].code == "WCSIUI001" || resultCheckinList[cdx].journeys[jdx].segments[sdx].code == "WCSIUI005") {
							tooltipDesc = "모바일탑승권 발급 가능 노선이 아닙니다. "; 
						} else if(resultCheckinList[cdx].journeys[jdx].segments[sdx].code == "WCSIUI007") {
							tooltipDesc = "체크인이 진행될 수 없습니다."; 
						} else if (resultCheckinList[cdx].journeys[jdx].segments[sdx].code == "WCSISV062") {
							tooltipDesc = "카운터 직원의 안내를 받아주시기 바랍니다."; 
						}

						if(resultStatus !== '') {
							resultStatus += "<span class='tooltip-desc'>" + tooltipDesc + "</span>"
								+"			</span>"
								+"		</span>"
		                      	+"	</span>";
						}
						
						checkinListHtml+="						<div class='button-wrap3-row'>";
						checkinListHtml+=							resultStatus;
						checkinListHtml+="						</div>";
						checkinListHtml+="					</div>";
						checkinListHtml+="				</div>";
						checkinListHtml+="				<div class='boarding-passchk'>";
						
						let psHtml = "";
						let psTicketHtml = "";

						for(let psdx in resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment){
							let infoMsg = "";
							let seatData = resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].seats;
							let isPet = false;
							let isWCHR = false;
							let isCHD = false;

							for(let pdx in resultCheckinList[cdx].passengers){
								if(Object.keys(resultCheckinList[cdx].passengers).length == 1 && Object.keys(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment).length == 1){
									if(resultCheckinList[cdx].passengers[pdx].passengerTypeCode == "CHD"){
										isCHD = true;
										break;
									}
								}
							}
							
							for(let ssdx in resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].ssrs){
								if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].ssrs[ssdx].ssrCode == "PETC"){
									isPet = true;
									break;
								} else if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].ssrs[ssdx].ssrCode == "WCHR"){
									isWCHR = true;
									break;
								}
							}

							if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].liftStatus != "CheckedIn" && resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].liftStatus != "Boarded"){
 								if (resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].code == "WCSIUI015"){
									infoMsg = "Standby";
								} else if(isCHD){
									infoMsg = "혼자 여행하는 어린이";
								} else if(resultCheckinList[cdx].passengers[psdx].infant != null) {
									infoMsg = "유아 탑승객 보호자";
								} else if(seatData.length > 0 && seatData[0].seatInformation.propertyList.EXITROW != null && seatData[0].seatInformation.propertyList.EXITROW == "TRUE") {
									infoMsg = "비상구 좌석 사전 구매 승객";
								} else if(isWCHR){ // 휠체어 승객
									infoMsg = "휠체어 신청 승객";
								} else if(isPet){ // 반려동물 ssr 코드값 확인
									infoMsg = "애완동물 동반 승객";
								} else if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].liftStatus == "NoShow"){
									infoMsg = "noshow 승객";
								} else if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].code == "WCSIUI008") {
									infoMsg = "autoCheckin"; 
								}
							}

							//불가능 case
							if(infoMsg != ""){
								psHtml+="					<div class='check-item'>";
								psHtml+="						<span class='checkbox checkbox--small'> <input type='checkbox' id='inputPassengers"+psdx+"' name='psCheckBox' class='checkbox__input' data-passengeralternatekey="+ resultCheckinList[cdx].passengers[psdx].passengerAlternateKey +" disabled>";
								psHtml+="							<label for='inputPassengers"+psdx+"' class='checkbox__label'> <i aria-hidden='true' class='checkbox__ico'></i>";
								psHtml+="								<span name='paxName' style='text-transform :uppercase;'>"+ resultCheckinList[cdx].passengers[psdx].name.last + "/" + resultCheckinList[cdx].passengers[psdx].name.first +"</span>";
								psHtml+="							</label>";
								psHtml+="						</span>";
								psHtml+="						<span data-element='tooltip' role='tooltip' class='tooltip' data-set='{\"width\":\"300\", \"left\":\"-100\", \"arrow\":\"102\"}'>";
								psHtml+="							<button type='button' aria-label='툴팁 열기' data-element='tooltip__anchor' class='tooltip__button'></button>";
								psHtml+="							<span data-element='tooltip__panel' class='tooltip__panel'>";
								psHtml+="								<span aria-hidden='true' class='tooltip-arrow'></span>"; 
								if(infoMsg == "autoCheckin") {
									psHtml+="								<span class='tooltip-desc'>자동 체크인 진행 중입니다.</span>"; 
								} else {
									psHtml+="								<span class='tooltip-desc'>고객님은 "+infoMsg+"이므로 모바일 탑승권 발급이 제한됩니다.<br>발급 제한 고객님은 탑승 당일 카운터에 방문하시면 친절하게 도와드릴게요.</span>"; 
								}
								psHtml+="							</span>";
								psHtml+="						</span>";
								psHtml+="					</div>";
							} else {
								if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].liftStatus == "Default"){
									psHtml+="					<div class='check-item'>";
									psHtml+="						<span class='checkbox checkbox--small'> <input type='checkbox' onclick='btnValCheck(" + isCheckinCnt + ");' id='inputPassengers"+psdx+isCheckinCnt+"' name='psCheckBox' class='checkbox__input' data-passengeralternatekey="+ resultCheckinList[cdx].passengers[psdx].passengerAlternateKey +" data-age='"+ resultCheckinList[cdx].passengers[psdx].info.dateOfBirth +"' value='"+psdx+"' disabled>";
									psHtml+="							<label for='inputPassengers"+psdx+isCheckinCnt+"' class='checkbox__label'> <i aria-hidden='true' class='checkbox__ico'></i>";
									psHtml+="								<span name='paxName' style='text-transform :uppercase;'>"+ resultCheckinList[cdx].passengers[psdx].name.last + "/" + resultCheckinList[cdx].passengers[psdx].name.first +"</span>";
									psHtml+="							</label>";
									psHtml+="						</span>";
									psHtml+="					</div>";
								} else if(resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].liftStatus == "CheckedIn" || resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].liftStatus == "Boarded"){
// 									const ticketClass = resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].hasBarcode ? "ticket-item" : "ticket-item seat-item";
									const ticketClass = "ticket-item";
									psTicketHtml +="<a class='" + ticketClass + "' onclick='goViewCheckin(this)'>";
			                        psTicketHtml +="	<span class='name' style='text-transform :uppercase;' data-webcheckin="+resultCheckinList[cdx].journeys[jdx].segments[sdx].passengerSegment[psdx].isWebCheckIn+" data-passengeralternatekey="+ resultCheckinList[cdx].passengers[psdx].passengerAlternateKey +">"+ resultCheckinList[cdx].passengers[psdx].name.last + "/" + resultCheckinList[cdx].passengers[psdx].name.first +"</span>";
			                        psTicketHtml +="</a>";
								}
							}
						}
	
						if(psHtml != ""){
							checkinListHtml+="<div class='check-wrap'>";
							checkinListHtml+=	psHtml;
							checkinListHtml+="</div>";
						}

						if(psTicketHtml != ""){
							checkinListHtml+="<div class='boarding-ticket-wrap'>";
							checkinListHtml+=	psTicketHtml;
	                        checkinListHtml+="</div>";
						}
	
						checkinListHtml+="				</div>";
						checkinListHtml+="				<div class='boarding_end'></div>";
						checkinListHtml+="			</div>";
						checkinListHtml+="			<div class='button-wrap2'>";
						checkinListHtml+="				<button type='button' class='button -w100' disabled>모바일 탑승권 발급</button>";
						checkinListHtml+="			</div>";
						checkinListHtml+="		</div>";
						checkinListHtml+="	</div>";
						checkinListHtml+="</div>";
					}
				}
			}
		}
	}

	$("#resultListSection").show();
	
	$("#checkinTabList").html(tabListHtml);
	$("#checkinList").html(checkinListHtml);
	$("#checkinTabList").show();
	$("#checkinList").show();

	if($("#resultListSection  li").length == 0){
		$("#resultListSection").hide();
	}

	sortCheckinList("#checkinTabList"); //정렬
	sortCheckinList("#checkinList"); //정렬

	
	$(".select-chips").selectChips();
	
    tooltip.init('[data-element="tooltip"]');
	
	
	if($(".chip.swiper-slide").length > 0){
		$("#checkinTabList > li > button").eq(0).trigger("click")
	}
}


function sortCheckinList(target){
	$(target).html(
		$(target).children().sort(function(a, b) {
			let jsData1 = $(a).find('[name=sortData]').val();
			let jsData2 = $(b).find('[name=sortData]').val();

			return jsData1 < jsData2 ? -1 : jsData1 > jsData2 ? 1 : 0;
		})
	);
}

function setNoResultHtml(flag){
	if(flag == "user"){
		$("#loginNoResult").html("<div class='page-title'>모바일 탑승권</div><div class='page-sub-title'>현재 발급할 수 있는 <br class=mobile-only>예약이 없어요.</div>"	
				+	"<div class='title mobile-only'>"
				+		"<div class='button-wrap left'>"
				+			"<a href='javascript:void(0)' class='button button--middle' onclick='URL_LINK.getI18Url(" + "\"/ibe/mypage/viewReservationList.do\")'>"
				+ 				"<span class='button__text'>나의 예약</span>"
				+       	"</a>"
				+		"</div>"
				+	"</div>"
				+	"<div class='title pc-only'>"
				+		"<div class='button-wrap left'>"
				+			"<button type='button' class='button button--primary button--black' onclick='URL_LINK.getI18Url(" + "\"/ibe/mypage/viewReservationList.do\")'>"
				+				"<span class='button__text'>나의 예약</span>"
				+			"</button>"
				+		"</div>"
				+	"</div>").show();
		
	} else if(flag == ""){
		$("#noLogin").html("<div class='page-title'>모바일 탑승권</div>"
				+"<div class='page-sub-title'>발급할 수 있는 예약을 <br class=mobile-only>보려면 로그인해 주세요.</div>"
				+"	<div class='title mobile-only'>"
				+"		<div class='button-wrap left'>"
				+"			<a href='javascript:void(0)' class='button button--middle' onclick='location.href =\"../../member/auth/login.do?targetUrl=/"+I18N.language+"/ibe/checkin/viewCheckin.do\"'>"
				+"				<span class='button__text'>로그인</span>"
				+"			</a>"
				+"		</div>"
				+"	</div>"
				+"	<div class='title pc-only'>"
				+"		<div class='button-wrap left'>"
				+"			<button type='button' class='button button--primary button--black' onclick='location.href =\"../../member/auth/login.do?targetUrl=/"+I18N.language+"/ibe/checkin/viewCheckin.do\"'>"
				+"				<span class='button__text'>로그인</span>"
				+"			</button>"
				+"		</div>"
				+"	</div>").show();

	} else if(flag == "nonUserLogin"){
		$("#nonUserLogin").html("<div class='page-title'>모바일 탑승권</div>"
		+"<div class='page-sub-title'>발급할 수 있는 예약을 보려면 예약정보로 조회해주세요. </div>").show();
	}
	
	$("#noCheckinList").show();
	
	if($("#resultListSection  li").length == 0){
		$("#resultListSection").hide();
	}

}


function getDomIntType(checkinData){
	domIntType = "";

	let tempDomIntType = "D";

	for(let jdx in checkinData.journeys){
		let isInt = false;
		
		$.ajax({
			url 		: "getDomIntType.json",
			type 		: "post",
			async		: false,
			dataType	: "json",
			data 		: {
				origin:  checkinData.journeys[jdx].designator.origin,
				destination:  checkinData.journeys[jdx].designator.destination,
				langCode:  I18N.language
			},
			success 	: function(data) {
				if(data.data.domIntType == "I") {
					tempDomIntType = "I";
					isInt = true;
				}
			}
		});

		if (isInt) {
			break;
		}
	}

	domIntType = tempDomIntType;
}

 
function checkCountryCode(){
	$("#byCountryMsg").text("");
	
	let reqData = {
		codeType : "nation",
		arrStn	: $(".chips-group.swiper-wrapper > li >.checked").find("[name=segDestination]").val()
	}

	$.ajax({
		url 		: "getCheckInCommonCode.json",
		type 		: "post",
		async		: false,
		dataType	: "json",
		data 		:{
			 commonCodeReq : JSON.stringify(reqData)
		},
		success 	: function(data) {
			if(data.code == "0000"){
				let countryCode = data.data.data.nation;
				
				let layerText = "";
				if(countryCode == "CHN"){ //중국
					layerText = "한국인 승객은 유효한 VISA를 소지하여야 입국이 가능합니다.";
				} else if(countryCode == "VNM"){ //베트남
					layerText = "베트남 도착일 기준 30일 이내에 입국 기록이 있을 시 비자가 없는 경우 재입국이 불허될 수 있습니다.";
				} else if(countryCode == "PHL"){//필리핀
					layerText = "만 15세 미만의 청소년 및 소아를 동반한 승객께서는 카운터에서 수속하여 주시기 바랍니다";
				}
				
				if(layerText != "") {
					$("#byCountryMsg").text(layerText).show();
				}
				
				
				if($.modal.isActive()) {
					$.modal.close();
				}

				$('#btnModalOpen').data('target', '#countryInfoLayer').trigger('click');
			} else {
				let datas = {
					title: data.code,
					message: data.message
				}; 
						
				$.JJAlert(datas);
			}
		}
	});
}

 
function unableCountryCode(){
	let depStn = $(".chips-group.swiper-wrapper > li >.checked").find("[name=segOrigin]").val();
	let depStnName = $(".chips-group.swiper-wrapper > li >.checked").find("[name=segOriginName]").val();
	let arrStn = $(".chips-group.swiper-wrapper > li >.checked").find("[name=segDestination]").val();
	let unableResult = false;
	
	let reqData = {
		codeType : "restrict",
		depStn	: depStn,
		arrStn	: arrStn,
		routeType : domIntType
	}

	$.ajax({
		url 		: "getCheckInCommonCode.json",
		type 		: "post",
		async		: false,
		dataType	: "json",
		data 		:{
			 commonCodeReq : JSON.stringify(reqData),
		},
		success 	: function(data) {
			if(data.data.code == "0000"){
				if(data.data.data.allowYN == "Y"){
					unableResult = true;
				} else {
					$("#alertModalLayer").find(".alert-text").text("모바일탑승권 발급 가능 노선이 아닙니다. "); 
					fullPopOpen("alertModalLayer");
				}
			} else {
				let datas = {
					title: data.data.code,
					message: data.data.message
				}; 
						
				$.JJAlert(datas);
			}
		}
	});

	return unableResult;
}


function isAmericasRoute(journeyList) {
	let amFlag = false;
	
	$.each(journeyList, function(jIdx) {
		$.each(journeyList[jIdx].segments, function(sIdx) {
			let segments = journeyList[jIdx].segments[sIdx]; 
			if( segments.designator.origin == 'GUM' || segments.designator.destination == 'GUM' ||
				segments.designator.origin == 'SPN' || segments.designator.destination == 'SPN' ) {
					amFlag = true;
					return false;
			}
		});
	});
	
	return amFlag;
};


function checkinPassengerInputCheck(){
	let checkinData = JSON.parse($(".chips-group.swiper-wrapper > li >.checked").find("[name=checkinData]").val());
	let codeShareFlag = $(".chips-group.swiper-wrapper > li >.checked").find("[name=codeShareFlag]").val();
	
	
	
	if(codeShareFlag == "Y") {
		$("#alertModalLayer").find(".alert-text").text("공동운항편은 웹체크인이 불가능합니다.실제 운항항공사에 문의해 주시기 바랍니다.");
		fullPopOpen("alertModalLayer");
		return;
	}

	getDomIntType(checkinData); 
	
	
	if(!unableCountryCode()){
		return;
	}

	
	if(checkinData.journeys.length == 2 && checkinValidation(checkinData)){
		return;
	}
	
	if($("#checkinList div.show").find("[name=psCheckBox]:checked").length == 0) {
		$("#alertModalLayer").find(".alert-text").text("탑승객을 선택해주세요.");
		fullPopOpen("alertModalLayer");
		return;
	}

	const queues = checkinData.queues.filter(function(element) {
		return ['SCHCXL', 'CXLMOV', 'SCHCHG'].includes(element.code);
	});
	if(queues.length !== 0) {
		const datas = {
			title: '제주항공 항공기 스케줄 변경 안내', 
			message: '고객님의 예약하신 항공편의 스케줄이 변경되었습니다.  마이페이지에서 변경된 운항편의 탑승여부를 확정 후 체크인을 진행하여 주시기 바랍니다.</br/>단, 여행사 및 타사이트를 통해 구매한 항공권은 해당 구입처로 문의하여 주시기 바랍니다.'
			
		}; 

		$.JJAlert(datas, function() {
			if(typeof(userData.ffpNo) !== 'undefined') {
				URL_LINK.getI18Url('/ibe/mypage/viewReservationList.do');
			} else {
				URL_LINK.getI18Url('/ibe/mypage/viewOnOffReservationList.do');
			}
		});
		return;
	}

	let checkAge = false;
	$("#checkinList div.show").find("[name=psCheckBox]:checked").each(function() {
		if($(this).data("age") == "undefined"){
			checkAge = true;
			return false;
		}
		
		if(calcAge($(this).data("age")) >= 19) {
			checkAge = true;
			return false;
		}
	});
	if(checkAge == false) {
		$("#alertModalLayer").find(".alert-text").text("만 19세 미만 승객은 국토부 지침에 따라 셀프체크인 이용이 불가하오니 공항 카운터에서 수속하여 주시기 바랍니다.(만 19세 미만의 승객이 체크인 시에는 성인과 함께 수속하여야 합니다.)");
		fullPopOpen("alertModalLayer");
 		return;
	}
	
	
	
	if($("#checkinList div.show").find("[name=psCheckBox]:checked").length < $("#checkinList div.show").find("[name=psCheckBox]").not(":disabled").length){
		$("#layerConfirm").find(".alert-text").text("선택하지 않은 승객이 있습니다. 그대로 진행하시겠습니까?");
		fullPopOpen("layerConfirm");
		return;
	}
	
	
	
	checkRoundTripInfo();
}


function checkRoundTripInfo(){
	$("#btnConfirmDisAgree").trigger("click");
	
	let checkinData = JSON.parse($(".chips-group.swiper-wrapper > li >.checked").find("[name=checkinData]").val());
	
	if(checkinData.journeys.length == 2){
		if(checkinData.journeys[0].journeyKey == $(".chips-group.swiper-wrapper > li >.checked").find("[name=journeyKey]").val()){
			$('#btnModalOpen').data('target', '#roundTripInfoLayer').trigger('click');
			return;
		}
	}

	checkCovid(); 
}


function checkCovid(){
	let checkinData = JSON.parse($(".chips-group.swiper-wrapper > li >.checked").find("[name=checkinData]").val());

	
	if(domIntType == "D"){
		$('#btnModalOpen').data('target', '#domIllegalUseLayer').trigger('click');
	} else if(domIntType == "I"){
		$('#btnModalOpen').data('target', '#intCovidLayer').trigger('click');
	} else {
		return;
	}
}


function checkinValidation(checkinData){
	if(checkinData.journeys[1].journeyKey == $(".chips-group.swiper-wrapper > li >.checked").find("[name=journeyKey]").val()){
		if(checkinData.journeys[0].segments[0].possibleCheckIn == true){
			let gmtNow = new Date(); //local 시간 
			let utcNow = new Date(gmtNow.getTime() + (gmtNow.getTimezoneOffset() * 60000)); //UTC변환
			
			let firstDepDate = new Date(checkinData.journeys[0].segments[0].legs[0].legInfo.departureTimeUtc.replace("Z", ""));
			let secondDepDate = new Date(checkinData.journeys[1].segments[0].legs[0].legInfo.departureTimeUtc.replace("Z", ""));
	
			if((firstDepDate.getTime()- 86400000 <= utcNow.getTime()) && (secondDepDate.getTime()- 86400000 <= utcNow.getTime())){
				let isDefault = false;

				$("#checkinList div.show").find("[name=psCheckBox]:checked").each(function() {
					if(checkinData.journeys[0].segments[0].passengerSegment[$(this).data("passengerkey")].liftStatus == "Default"){
						isDefault = true;

						return false;
					}
			    });

				if (isDefault) {
					$("#alertModalLayer").find(".alert-text").text("24시간 이내 여정인 경우 가는 편을 먼저 발급해주시기 바랍니다.");
					fullPopOpen("alertModalLayer");
					return true;
				}
			}
		}
	}

	return false;
}


function calcAge(tempBirth){
	let birthday = new Date(tempBirth.substr(0,4)+"/"+tempBirth.substr(5,2)+"/"+tempBirth.substr(8,2));
	let today = new Date();
	let years = today.getFullYear() - birthday.getFullYear();
	 
	birthday.setFullYear(today.getFullYear());
	 
	if (today < birthday)
	{
	    years--;
	}

	return years;
}


function restrictedUseInfoModalLayer() {
	if($('#restrictedUseInfoModalLayer').length === 0) {
		$.ajax({
			async : false,
			type : 'post',
			url : 'viewRestrictedUseInfo.json',
			data:{
				param : 'temp'
			},
			success : function(data) {
				$('#restrictInfoLayer').html(data);
				$("#restrictedUseInfoModalLayer").find("#btnAgree07 > span").text("확인");
			}
		});
	}
	
	$('#btnModalOpen').data('target', '#restrictedUseInfoModalLayer');
	$('#btnModalOpen').data('modal-type', 'full');
	$('#btnModalOpen').trigger('click');
}


function goBeforeBoardingPass(){
	APPCALL.callPastBoardingPass();
}


function checkFields(){
	if($("input[name=recordLocatorInput]").val() == ""){
		$("#errorRecordLocator").text("한국출발 인천공항 필리핀, 중국 노선");
		
		$("#inputRecordLocatorDiv").addClass("input--error");
		return false;
	} 

	if($("#boardingDateBtn").text() == "YYYY.MM.DD" || $("#boardingDateBtn").text() == ""){
		$("#errorDepDate").text("후쿠오카, 삿포로 외 모든 해외 출발 노선");
		
		$("#inputDepDateDiv").addClass("input--error");
		return false;
	}

	for(let i = 0; i < $("[id^=psInputLastName_]").length; i++) {
		if($("[id^=psInputLastName_]").eq(i).val() == "" || $("[id^=psInputFirstName_]").eq(i).val() == "") {
			$("#alertModalLayer").find(".alert-text").text("성명을 입력하세요.");
			fullPopOpen("alertModalLayer");
			return false;
		}
	}

	return true;
}


function checkResvBtn(){
	let checkName = true;

	for(let i = 0; i < $("[id^=psInputLastName_]").length; i++) {
		if($("[id^=psInputLastName_]").eq(i).val() == "" || $("[id^=psInputFirstName_]").eq(i).val() == "") {
			checkName = false;
			break;
		}
	}
	
	if($("input[name=recordLocatorInput]").val() != "" && ($("#boardingDateBtn").text() != "YYYY.MM.DD" && $("#boardingDateBtn").text() != "") && checkName){
		$("#searchResvBtn").removeAttr("disabled");
//		$("#searchResvBtn").removeClass("button--disabled");
		$("#searchResvBtn").addClass("button--active");
	} else {
		$("#searchResvBtn").attr("disabled","disabled");
		$("#searchResvBtn").removeClass("button--active");
//		$("#searchResvBtn").addClass("button--disabled");
	}
}


function valCheckBtn(obj){
	let btnObj = $(obj);
	let checkName = true;

	for(let i = 0; i < $("[id^=psInputLastName_]").length; i++) {
		if($("[id^=psInputLastName_]").eq(i).val() == "" || $("[id^=psInputFirstName_]").eq(i).val() == "") {
			checkName = false;
			break;
		}
	}
	
	if((btnObj.text() != "YYYY.MM.DD" && btnObj.text() != "") && $("input[name=recordLocatorInput]").val() != "" && checkName){
		$("#searchResvBtn").removeAttr("disabled");
		$("#searchResvBtn").addClass("button--active");
	} else {
		$("#searchResvBtn").removeClass("button--active");
		$("#searchResvBtn").attr("disabled","disabled");
	}
}


function btnValCheck(index) {
	let checkLen = $("[data-chip-show=" + index + "]").find("[name=psCheckBox]:checked").length;
	
	if (checkLen > 0) {
		$("#btnCheckin" + index).addClass("is-active").removeAttr("disabled");
	} else {
		$("#btnCheckin" + index).removeClass("is-active").attr("disabled","disabled");
	}

	initCheckBox(index);
}


function initCheckBox(index) {
	let otherDataChipShowObj = $("#checkinList [data-chip-show]").not("[data-chip-show=" + index + "]");
	
	otherDataChipShowObj.find("[name=psCheckBox]").prop("checked", false);
	otherDataChipShowObj.find("[id^=btnCheckin]").attr("disabled","disabled").removeClass("is-active");
}


function initInput(){
	$("#resultPsListDiv > div").html("");
	$("#resultPsCntDiv").html("");
	$("[id^=psInput]").val("").blur();
	$("#boardingDateBtn").text("YYYY.MM.DD");
	$("[name=recordLocatorInput]").val("").blur();
	$("#searchResvBtn").attr("disabled","disabled");
	$("#searchResvBtn").removeClass("button--active");
//	$("#searchResvBtn").addClass("button--disabled");
	$(".btn_delete").find("button").click();
}


function goCheckinPassengerInput(){	
	
	let checkinInfoObj = new Object();
	let checkinPassengersArray = new Array();
	let psTypeObject = new Array();
	let tempDeparture = $(".chips-group.swiper-wrapper > li >.checked").find("[name=departureDate]").val();

	$("#checkinList div.show").find("[name=psCheckBox]:checked").each(function() { 
    	checkinPassengersArray.push(this.value);
    });

    checkinInfoObj.passengerKey = checkinPassengersArray; 
	checkinInfoObj.journeyKey = $(".chips-group.swiper-wrapper > li >.checked").find("[name=journeyKey]").val();
	checkinInfoObj.recordLocator = $(".chips-group.swiper-wrapper > li >.checked").find("[name=recordLocator]").val();
	checkinInfoObj.segmentKey = $(".chips-group.swiper-wrapper > li >.checked").find("[name=segKey]").val();
	checkinInfoObj.checkinData = JSON.parse($(".chips-group.swiper-wrapper > li >.checked").find("[name=checkinData]").val());
	checkinInfoObj.destination = $(".chips-group.swiper-wrapper > li >.checked").find("[name=segDestination]").val();
	checkinInfoObj.cultureCode = cultureCode.replace("_","-");
	checkinInfoObj.domIntType = domIntType;
	checkinInfoObj.amFlag = isAmericasRoute(JSON.parse($(".chips-group.swiper-wrapper > li >.checked").find("[name=checkinData]").val()).journeys);
	checkinInfoObj.departure = tempDeparture.substr("0", "10");
	checkinInfoObj.searchType = userFlag;
	checkinInfoObj.cultureCode = cultureCode.replace("_", "-");

	$("#fromCheckinInfo [name=checkinInfo").val(JSON.stringify(checkinInfoObj));
	$("#fromCheckinInfo [name=rpnr]").val(checkinInfoObj.recordLocator);
	$("#fromCheckinInfo").attr({
		"onsubmit" 	: "return true",
		"action" 	: "viewCheckinPassenger.do"
	}).submit();
}


function goViewCheckin(obj){
	if(!$(obj).find("span").data("webcheckin")){
		$("#alertModalLayer").find(".alert-text").text("공항 현장 카운터, 키오스크에서 발급한 탑승권입니다.");
		fullPopOpen("alertModalLayer");
		return;
	}
	
	let checkinedData = new Object();
	let tempPs = new Array(); //체크인 된 passengers Array
	let companionPassengers = new Array(); //체크인 되지 않은 passengers Array
	let tempDeparture = $(".chips-group.swiper-wrapper > li >.checked").find("[name=departureDate]").val();

	//체크인 된 passengers
	$(obj).parent().find('span').each(function(){
		let passengerAlternateKey = new Object();
		
		if($(this).data("webcheckin")){
			passengerAlternateKey.passengerAlternateKey = $(this).data("passengeralternatekey");
			tempPs.push(passengerAlternateKey);
		}
	});

	//체크인 되지 않은 모든 passengers
	$("#checkinList div.show").find("[name=psCheckBox]").each(function() {
		let passengerAlternateKey = new Object();
		
		passengerAlternateKey.passengerAlternateKey = $(this).data("passengeralternatekey");
		companionPassengers.push(passengerAlternateKey);
    });

	
	
	getDomIntType(JSON.parse($(".chips-group.swiper-wrapper > li >.checked").find("[name=checkinData]").val())); 
	
	checkinedData.passengers = tempPs; 
	checkinedData.recordLocator = $(".chips-group.swiper-wrapper > li >.checked").find("[name=recordLocator]").val();
	checkinedData.journeyKey = $(".chips-group.swiper-wrapper > li >.checked").find("[name=journeyKey]").val();
	checkinedData.segmentKey = $(".chips-group.swiper-wrapper > li >.checked").find("[name=segKey]").val();
	checkinedData.departure = tempDeparture.substr("0", "10");
	checkinedData.searchType = userFlag;
	checkinedData.cultureCode = cultureCode.replace("_", "-");
	checkinedData.domIntType = domIntType;
	checkinedData.companionPassengers = companionPassengers;

	Progress.show();

	$("#fromCheckinen [name=boardingPassData").val(JSON.stringify(checkinedData));
	$("#fromCheckinen [name=rpnr]").val(checkinedData.recordLocator);
	$("#fromCheckinen").attr({
		"method"	: "post",
		"onsubmit" 	: "return true",
		"action" 	: "viewBoardingPass.do"
	}).submit();
}
</script>
	
	<div id="ifmWrap" style="height:100%; display:none; overflow:auto; text-align:center; -webkit-overflow-scrolling:touch;">
		<iframe src="" width="100%" height="100%" name="popupChkApp"></iframe>    
	</div>
<script type="text/javascript" src="/DehOE8/cXBmx/O8noS/0Q/EkYXLhtmOD/RhBbXg0E/VS1SAw/chaQ4B"></script>

<div class="jjLoading" data-load="Y" style="display: none;">
<!--
   <div class="loading">
      <div class="loading__img">
        <img src="https://static.jejuair.net/wccg/resources/images/etc/img_loading.gif">
        <div class="loading__text">LOADING</div>
      </div>
    </div>
-->
  <div class="loading2">
    <div class="loading__img">
      <img src="https://static.jejuair.net/wccg/resources/images/etc/loading2.gif">
    </div>
    
    <div class="loading2_dim"></div>
  </div>
</div></body></html>