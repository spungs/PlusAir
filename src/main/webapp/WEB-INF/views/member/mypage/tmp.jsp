<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- header, footer import	
	기프티켓, 스포츠 멤버십 삭제 -> 모달도 삭제 mySportsCardDetailModalLayer
	quick menu / mobile-only삭제
	
 -->	
	
<!DOCTYPE html>
<html lang="ko"><head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no, maximum-scale=1, user-scalable=0">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Expires" content="-1">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta name="format-detection" content="telephone=no">
	<title>제주항공</title>
	<link rel="icon" type="image/png" href="https://static.jejuair.net/hpgg/resources/images/icon/favicon.ico">
	
	
	
    <meta property="og:type" content="website">
	<meta property="og:title" content="제주항공">
    <meta property="og:description" content="대한민국 No.1 LCC 제주항공입니다.">
    <meta property="og:image" content="https://static.jejuair.net/hpgg/resources/images/icon/logo_512x512.png">
	
	
	
	
	
	
		
	
	

	
	









    
    



<link rel="stylesheet" href="https://static.jejuair.net/hpgg/resources/css/global.css">
<link rel="stylesheet" href="https://static.jejuair.net/hpgg/resources/css/component.css">
<link rel="stylesheet" href="https://static.jejuair.net/hpgg/resources/css/page.css">
<link rel="stylesheet" href="https://static.jejuair.net/hpgg/resources/css/responsive.css">
<link rel="stylesheet" href="https://static.jejuair.net/hpgg/resources/css/lang.css">




<!-- 다국어 관련 스크립트 변수 -->
<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script><script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script><script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-PD2BQQ4"></script><script type="text/javascript">
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
	deviceType : "PC",
	shortUrl : ""
}
var USER_INFO = {
	get : function() {
		var data ="eyJmZnBObyI6IjA5MzQ5NTg4MiIsImN1c3RvbWVyTm8iOiIwOTM0OTU4ODIiLCJ1c2VySWQiOiJoeWVteWswOSIsImVtYWlsIjoiaHllbXlrMDlAbmF2ZXIuY29tIiwiYmlydGhEYXRlIjoiMTk4OTEwMTMiLCJuYXRpb25hbGl0eUNvZGUiOiJLUiIsImVuZ0ZpcnN0TmFtZSI6IkhZRU1ZVU5HIiwiZW5nTGFzdE5hbWUiOiJLSU0iLCJrb3JGaXJzdE5hbWUiOiLtmJzrqoUiLCJrb3JMYXN0TmFtZSI6Iuq5gCIsImdlbmRlciI6IkYiLCJlbnJvbGxEYXRlIjoiMjAyMjExMTEiLCJtZW1iZXJncmFkZSI6IlMiLCJhdXRob3JpdGllcyI6W3t9LHt9XSwibmFtZSI6Iuq5gO2YnOuqhSIsIm1vYmlsZU5vIjoiODItMDEwLTc0NjEtNzQ1MCIsImF2YWlsUG9pbnQiOiIxMDAwIiwic25zQWNjb3VudExpc3QiOltdLCJyZXN1bHRDb2RlIjoiMDAwMCIsInNuc2xvZ2luRmxhZyI6Ik4iLCJhcHBUb2tlbiI6IjYyZGQzMWVlMzQxZWY1MjFiYzE5M2ExMGMzODIxYmU3NWM3ODhlMzhlNjg1NWQxOTk4MmMwNGJlMzllNTI2OWEzOWNkdmJBQWdzc0JYaDA1VzVrcVQ5aGl2NG9SdzdVZTFjNDNzOVVwczlLODVwODhpNEh2MGVqbTRibm1NNmNMMnZIMjMxcXE5MzBPOVBlMUwwUHh1dnYzZzFBbHl3NDV6dFUwNHIzcmkxOTlwMWdhNzk3ZGo0MzYzamlmWm83MXE0aG9UMTZCODk3MWllU1ZPdDc1ZVY1d2dPZDFobDBYeTFmNDEwUzl1ZGMyaEg5bzFIMjY2NTI1WWYyUk43T0cifQ=="; 
		data = decodeURIComponent(escape(atob( data )));
		return data || "{}";
	}
}
var PROP = {
	assetsUrl : "https://static.jejuair.net/hpgg/resources",
	cmsUrl: "https://static.jejuair.net/cms/images",
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
			if(window.webkit.messageHandlers.goClose) {
				window.webkit.messageHandlers.goClose.postMessage({});
			}			
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
			location.href="/"+I18N.language+"/main/base/index.do";
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
		if(path.indexOf('viewCheckin.do') !== -1) {
			URL_LINK.getHwUrl(path);
		}else{
			location.href = "/"+I18N.language+path;
		}
	},
	getHwUrl : function(path, params) { //homepage <-> webcheckin
		var vHtml = '';
		if(params) {
			Object.keys(params).map(function(key) {
				vHtml += '<input type="hidden" name="'+key+'" value="'+params[key]+'">';
			});
		}
		$("body").append("<form id='hybdComForm'><input type='hidden' name='targetUrl' value='" + "/"+I18N.language+path + "'/>"+vHtml+"</form>");
    	$("#hybdComForm").prop("action", "/"+I18N.language+"/common/connect/index.do").prop("method", "POST").prop("target", "_self").submit();
	}
}

if(APP_DATA.loginSuccessFirstChecker !="") {
	APPCALL.afterLogin();
}

if(location.href.indexOf('flag=logout')!==-1) {
	APPCALL.goLogout();
}

//웹 로그인 상태 확인 콜백
//true : 로그인 상태
//false : 비로그인 상태 
function callbackLoginState(result){
   var isLogin = "true";//web 로그인여부
   if(!isLogin && result) { //web비로그인 native로그인일경우
	 APPCALL.goLogout(); //native로그아웃
   }
}

if(USER_DEVICE.isApp) {//앱일경우 native로그인 상태체크
	APPCALL.loginState();
}

// 웹뷰 이탈 시 좌석 해제 홈페이지에 없어 에러 발생해 추가함
function callbackFocusOut() {}

//스크립 오류 발생으로 인해 빈 메소드 추가
function _AutofillCallbackHandler() {}

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
	
	
    <script>
	var langCdtTag = 'ko';	
	</script>
    <!-- Global site tag (gtag.js) - Google Analytics -->
	<!-- <script async src="https://www.googletagmanager.com/gtag/js?id=UA-49935507-8"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());
		gtag('config', 'UA-49935507-8');
	</script>  종료 N006-->
	
	<!-- Global site tag (gtag.js) - Google Ads -->
	<script async="" src="https://www.googletagmanager.com/gtag/js?id=AW-763115837"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	
	  gtag('config', 'AW-763115837');
	</script>
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-49935507-9"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	
	  gtag('config', 'UA-49935507-9');
	</script>
	<!-- N023  -->
	<script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
	<script type="text/javascript">kakaoPixel('4430357879563963209').pageView();</script>
	<!-- <script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script> -->
	<!-- N004  -->
	<script type="text/javascript">kakaoPixel('6788472491368532022').pageView();</script>
	
	
	<!-- Global site tag (gtag.js) - Google Ads: 770453349 N026-->
	<script async="" src="https://www.googletagmanager.com/gtag/js?id=AW-770453349"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	 
	  gtag('config', 'AW-770453349');
	</script>
	
	
	<!-- N001/N002 -->	
	
	
	<script type="text/javascript" src="//wcs.naver.net/wcslog.js"> </script> 
	<script type="text/javascript"> 
	if (!wcs_add) var wcs_add={};
		wcs_add["wa"] = "s_29f8dbdc0496";
		if (!_nasa) var _nasa={};
		if(window.wcs){
		wcs.inflow();
		wcs_do(_nasa);
	}
	</script> 
	
	
	
	<!-- END N001/N002 -->
<script src="/tuna_.js"></script>
                              <script>!function(a){var e="https://s.go-mpulse.net/boomerang/",t="addEventListener";if("False"=="True")a.BOOMR_config=a.BOOMR_config||{},a.BOOMR_config.PageParams=a.BOOMR_config.PageParams||{},a.BOOMR_config.PageParams.pci=!0,e="https://s2.go-mpulse.net/boomerang/";if(window.BOOMR_API_key="AYF4Y-8J9XB-2BDC5-23EM3-Q7Z28",function(){function n(e){a.BOOMR_onload=e&&e.timeStamp||(new Date).getTime()}if(!a.BOOMR||!a.BOOMR.version&&!a.BOOMR.snippetExecuted){a.BOOMR=a.BOOMR||{},a.BOOMR.snippetExecuted=!0;var i,_,o,r=document.createElement("iframe");if(a[t])a[t]("load",n,!1);else if(a.attachEvent)a.attachEvent("onload",n);r.src="javascript:void(0)",r.title="",r.role="presentation",(r.frameElement||r).style.cssText="width:0;height:0;border:0;display:none;",o=document.getElementsByTagName("script")[0],o.parentNode.insertBefore(r,o);try{_=r.contentWindow.document}catch(O){i=document.domain,r.src="javascript:var d=document.open();d.domain='"+i+"';void(0);",_=r.contentWindow.document}_.open()._l=function(){var a=this.createElement("script");if(i)this.domain=i;a.id="boomr-if-as",a.src=e+"AYF4Y-8J9XB-2BDC5-23EM3-Q7Z28",BOOMR_lstart=(new Date).getTime(),this.body.appendChild(a)},_.write("<bo"+'dy onload="document._l();">'),_.close()}}(),"".length>0)if(a&&"performance"in a&&a.performance&&"function"==typeof a.performance.setResourceTimingBufferSize)a.performance.setResourceTimingBufferSize();!function(){if(BOOMR=a.BOOMR||{},BOOMR.plugins=BOOMR.plugins||{},!BOOMR.plugins.AK){var e=""=="true"?1:0,t="",n="odo7njixzbfvyy3thlwa-f-3b8873637-clientnsv4-s.akamaihd.net",i="false"=="true"?2:1,_={"ak.v":"33","ak.cp":"881439","ak.ai":parseInt("562947",10),"ak.ol":"0","ak.cr":12,"ak.ipv":4,"ak.proto":"h2","ak.rid":"2c836fc7","ak.r":36376,"ak.a2":e,"ak.m":"b","ak.n":"essl","ak.bpcip":"112.221.246.0","ak.cport":52574,"ak.gh":"23.200.75.88","ak.quicv":"","ak.tlsv":"tls1.3","ak.0rtt":"","ak.csrc":"-","ak.acc":"","ak.t":"1668496108","ak.ak":"hOBiQwZUYzCg5VSAfCLimQ==jpFA/MREwKjEkPXfTunzXpkxGonbk3UyYcvkMqMjnBAOfqclQ2I7hHTHWeLZsCjMEBOXzU57OxUVlDvAYJap0pfxKjbHgdHOSd1gRo2X8L9HvFg+dlHmGhXGvwnP8vFoJTOl+J+chwZevhcQNxFp6yuNkqDH7qStt0gU6WHRi58+Gt+zP7cdpKOQ2ZpXJGS+1886HIoS9YRqFd6IjU32tvrTSf28KcU2g8EasM5h1C5EdfdgAx4MAWyS64e8tGqXmVqurjqVwr4073qdovkRrE+TQ2joesE46vnnkaU1pAdFl9PLcgS7sCDu2LUjmC3wsNS5Jo8xgqI2VUHvB9fWmq6IcCKtIohNbRo2rBHTA3RWj2REOopBFITwGSMd1OiBd6w8bsA0kNN6xEFOCZo2ta1wP0FZYD8IFRT2v5n6coA=","ak.pv":"100","ak.dpoabenc":"","ak.tf":i};if(""!==t)_["ak.ruds"]=t;var o={i:!1,av:function(e){var t="http.initiator";if(e&&(!e[t]||"spa_hard"===e[t]))_["ak.feo"]=void 0!==a.aFeoApplied?1:0,BOOMR.addVar(_)},rv:function(){var a=["ak.bpcip","ak.cport","ak.cr","ak.csrc","ak.gh","ak.ipv","ak.m","ak.n","ak.ol","ak.proto","ak.quicv","ak.tlsv","ak.0rtt","ak.r","ak.acc","ak.t","ak.tf"];BOOMR.removeVar(a)}};BOOMR.plugins.AK={akVars:_,akDNSPreFetchDomain:n,init:function(){if(!o.i){var a=BOOMR.subscribe;a("before_beacon",o.av,null,null),a("onbeacon",o.rv,null,null),o.i=!0}return this},is_complete:function(){return!0}}}}()}(window);</script><script src="https://pac.jejuair.net/common/js/sha256.js"></script><script src="https://pac.jejuair.net/common/js/Base64Util.js"></script><script src="https://pac.jejuair.net/common/js/errorLog.js"></script><meta http-equiv="origin-trial" content="A751Xsk4ZW3DVQ8WZng2Dk5s3YzAyqncTzgv+VaE6wavgTY0QHkDvUTET1o7HanhuJO8lgv1Vvc88Ij78W1FIAAAAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjgwNjUyNzk5LCJpc1RoaXJkUGFydHkiOnRydWV9"><script type="text/javascript" async="" src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/763115837/?random=1668496107659&amp;cv=11&amp;fst=1668496107659&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2oab90&amp;u_w=1920&amp;u_h=1080&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.jejuair.net%2Fko%2Fmember%2Fmypage%2Fmain.do&amp;ref=https%3A%2F%2Fwww.jejuair.net%2Fko%2Fmember%2Fauth%2Flogin.do%3FtargetUrl%3D%2Fko%2Fmember%2Fmypage%2Fmain.do&amp;tiba=%EC%A0%9C%EC%A3%BC%ED%95%AD%EA%B3%B5&amp;auid=623117428.1668489512&amp;data=event%3Dgtag.config&amp;rfmt=3&amp;fmt=4"></script><meta http-equiv="origin-trial" content="A751Xsk4ZW3DVQ8WZng2Dk5s3YzAyqncTzgv+VaE6wavgTY0QHkDvUTET1o7HanhuJO8lgv1Vvc88Ij78W1FIAAAAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjgwNjUyNzk5LCJpc1RoaXJkUGFydHkiOnRydWV9"><script type="text/javascript" async="" src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/770453349/?random=1668496107760&amp;cv=11&amp;fst=1668496107760&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2oab90&amp;u_w=1920&amp;u_h=1080&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.jejuair.net%2Fko%2Fmember%2Fmypage%2Fmain.do&amp;ref=https%3A%2F%2Fwww.jejuair.net%2Fko%2Fmember%2Fauth%2Flogin.do%3FtargetUrl%3D%2Fko%2Fmember%2Fmypage%2Fmain.do&amp;tiba=%EC%A0%9C%EC%A3%BC%ED%95%AD%EA%B3%B5&amp;auid=623117428.1668489512&amp;data=event%3Dgtag.config&amp;rfmt=3&amp;fmt=4"></script></head>
<body id="subLayoutBody" class="isPc">
	

	
	









 

 
 
 

 
 
 


















	
		
			
				
			
		
	


<!-- 개선 #1271286440
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
							

							
								
								<img src="https://static.jejuair.net/cms/images/banner_image/20211014191229348.png" alt="jejuairlogo" class="img_sticky" loading="lazy">
							
						</a>
					</div>
				
			
		
		
		<div class="header__button-wrap subType" data-element="gnbToggle">
			<!-- 예매전 노출
			<button type="button" class="header__button-ticket">
				<span class="hidden">티켓보기</span>
			</button>
			// 예매전 노출 -->
			
				<button type="button" class="gnb__button">
					
						
					
					
					<img src="https://static.jejuair.net/hpgg/resources/images/icon/icon-hamburger-header.png" alt="전체메뉴 열기" class="img_sticky" loading="lazy">
				</button>
			
 
			<!--2022-10-17 이벤트페이지 요청시, App에서 뒤로가기 처리-->
			
			  

			
				<!--번들 선택, 사전 수하물 추가, 사전 좌석선택, 사전 기내식 주문 -> 자세히 보기 햄버거 메뉴 보여주기-->
				<!--
				
					
					
						
						<button type="button" onclick="APPCALL.close();" class="modal__close"><span class="blind">닫기</span></button>
					
				
				-->
				
				
		</div>
		<!-- 스크롤시 스티키 상단 -->

		<!-- 전체메뉴 -->
		<div class="gnb" id="gnb">
			<div class="gnb__header">
				<div class="gnb__header-top" data-absolute-sticky="">
					<a href="javascript:;" class="button-home" title="홈으로 이동" data-action="menu" data-menu-name="main">
						<img loading="lazy" src="https://static.jejuair.net/hpgg/resources/images/upload/icon_bottombar_home_on_56x2.png" alt="홈">
					</a>
					<a class="select-wrap select-wrap--inline lang-type" id="btnCountrySelector" data-modal-type="full">
						
							
								대한민국
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
							
						
					</a>
					<div class="additional">
						<!-- D : '웹'일경우 APP다운로드 버튼 -->
						<button type="button" class="button button--small" onclick="APPCALL.goMarket()"><span class="button__text button__icon">APP</span></button>
						<a href="javascript:;" class="button-search" title="통합검색이동">
							<img loading="lazy" src="https://static.jejuair.net/hpgg/resources/images/icon/icon-header-search.png" alt="통합 검색 이동">
						</a>
						<a href="javascript:;" class="gnb-close" aria-label="닫기">
							<img loading="lazy" src="https://static.jejuair.net/hpgg/resources/images/icon/icon-header-gnb-close.png" alt="전체메뉴 닫기" class="close">
						</a>
					</div>
				</div>
				<div class="gnb__header-bot">
					
					
					<!-- 로그인 후 -->
					<div class="after after-login">
						<!-- fixed 영역 -->
						<div class="sticky-wrap">
							<div class="title sticky__inner gnb-sticky2">
								
								
									
										<i class="icon" aria-label="silver"><img loading="lazy" src="https://static.jejuair.net/hpgg/resources/images/icon/grade-silver-gnb-large.png" alt="silver"></i> 
									
									
									
									
									
								
								

								<div class="text">
									<p class="name">
										<span class="exbold">김혜명</span>고객님
									</p>
									<p class="hide">안녕하세요?</p>
								</div>
								<div class="additional">
									<button type="button" class="button-card" aria-label="card-popup">
										<a href="javascript:void(0)" data-target="#myBenefit" data-element="modal_anchor" data-modal-type="full" class="link-wrap__text"><img loading="lazy" src="https://static.jejuair.net/hpgg/resources/images/icon/icon-card.png" alt="알림"></a>
									</button>
									
									<a href="javascript:;" class="gnb-close" aria-label="닫기">
									   <img loading="lazy" src="https://static.jejuair.net/hpgg/resources/images/icon/icon-header-gnb-close.png" alt="전체메뉴 닫기" class="close">
									</a>
								</div>
							</div>
						</div>
						
						

						
						
						
							
								
								
							
							
							
							
							
						
						<!-- 회원카드 팝업 -->
						<div id="myBenefit" class="modal modal-full modal-bg--org modal-scroll">
							<div class="modal-header">
								<div class="modal-header__title color--wit">나의 혜택 확인</div>
							</div>
							<div class="modal-content pc-h-auto"> <!-- IM00320936 나의혜택_팝업 PC에서만 사이즈 줄임 -->
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
										<div class="list-card list-card--grade-info mb10">
											
											
											
											
											
											
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
						
						
							
								
									<a href="/ko/ibe/mypage/viewReservationList.do" class="icon-link__item" data-action="menu" data-menu-name="tourAndTicket"> 
								
								
								
								
													
							<img src="https://static.jejuair.net/cms/images/banner_image/20211117132250301.png" alt="" loading="lazy">
							<span class="icon-link__text" style="color:">나의 예약조회
							</span></a>
						
							
								
								
									<a href="/ko/prepare/flight/viewScheduleInfo.do" class="icon-link__item" data-action="menu" data-menu-name="tourAndTicket">
								
								
								
													
							<img src="https://static.jejuair.net/cms/images/banner_image/20211005132323185.png" alt="" loading="lazy">
							<span class="icon-link__text" style="color:">출도착 조회
							</span></a>
						
							
								
								
								
									<a href="/ko/customerService/csCenter/faqList.do" class="icon-link__item" data-action="menu" data-menu-name="tourAndTicket">
								
								
													
							<img src="https://static.jejuair.net/cms/images/banner_image/20211005132333367.png" alt="" loading="lazy">
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
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
								
									
										<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/prepare/fare/payBenefit.do')">결제혜택</a>
									
								
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
						<button type="button" class="button button--secondary button--border" id="logout"><span class="button__text">로그아웃</span></button>
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
				
				
					<a href="javascript:;" class="util__link" id="logout">로그아웃</a>
				
				
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
		<div class="sticky-header" data-sticky="">
			<div class="header__box">
				<!-- header__box 추가 -->
				<h1 class="header__logo">
					
					<a href="javascript:;" data-action="menu" data-menu-name="main">
					
						
						<img src="https://static.jejuair.net/cms/images/banner_image/20211014191229348.png" alt="jejuairlogo" loading="lazy">
					
					</a>
				</h1>
				
					
						<h2 class="header__page-name">마이페이지</h2>
					
				
				
					
						
						
							
							
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
						<img loading="lazy" src="https://static.jejuair.net/hpgg/resources/images/icon/icon-header-search.png" alt="검색">
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
						<img loading="lazy" src="https://static.jejuair.net/hpgg/resources/images/icon/icon-hamburger-header.png" alt="전체메뉴 열기" class="open">

						
							
						
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
			<div class="gnb" id="gnb">
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
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
									
										
											<a href="javascript:void(0);" class="gnb__list-item" onclick="URL_LINK.getI18Url('/prepare/fare/payBenefit.do')">결제혜택</a>
										
									
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
							<button type="button" class="button button--secondary button--border" id="logout"><span class="button__text">로그아웃</span></button>
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

	
	<div id="body">
		
		<!-- Google Tag Manager (noscript) -->
		<noscript>&lt;iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PD2BQQ4" height="0" width="0" style="display:none;visibility:hidden"&gt;&lt;/iframe&gt;</noscript>
		<!-- End Google Tag Manager (noscript) -->

		<div class="wrap GD">
			
			
				<div id="breadcrumb" class="breadcrumb pc-only" aria-label="breadcrumb">
					<nav class="breadcrumb__inner">
						<div class="breadcrumb__item">
							<a href="javascript:;" class="breadcrumb__link" style="cursor: default;">홈</a>
						</div>
						
						
							
								
									<div class="breadcrumb__item">
										<a href="javascript:;" class="breadcrumb__link" style="cursor: default;">
										 
											
											
												마이페이지
											
										
										
										</a>
									</div>
								
								
							
						
							
								
								
									<div class="breadcrumb__item breadcrumb__item--current" aria-current="page" data-element="toggle" data-options="{&quot;mode&quot;: &quot;slide&quot;, &quot;speed&quot;: 100, &quot;clickToClose&quot;: true}">
										
											
										
											
										
											
										
											
										
											
										
											
										
											
										
											
												<button type="button" class="breadcrumb__link breadcrumb__link--list" data-element="toggle__anchor" aria-controls="toggle-2" aria-expanded="false">마이페이지 메인</button>
											
										
											
										
											
										

										<div class="breadcrumb__siblings-list" data-element="toggle__panel" id="toggle-2">
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/member/mypage/myFlightList.do')">나의 탑승 내역</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/myPage/methodsPaymentMngm.do')">결제수단 관리</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/member/mypage/viewMyGiftTicketList.do')">나의 기프티켓</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/member/mypage/viewMyFavoritesList.do')">즐겨찾기</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/member/mypage/viewMySportsCardList.do')">나의 스포츠 멤버십</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/member/mypage/viewMyPartnerCoupon.do')">나의 쿠폰</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/member/mypage/memberInfoModify.do')">회원정보 수정</a>
												
											
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/ibe/mypage/viewReservationList.do')">나의 예약 현황</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/member/mypage/myCoupon.do')">에어카페 쿠폰</a>
												
											
										</div>
									</div>
								
							
						
						
					</nav>
				</div>
			
	
			
			<div class="content" id="content">
				<main id="main" class="main ">
					
					<div class="mobile-only">
		<!-- 완료된 예약 탑승일로부터 알림 -->
		<div class="text container--default">
			<p class="text__large text--exbold"><span>김혜명</span>고객님</p>
			<div class="container--xsmall">
				<p class="text__large text--bold">어디로 여행가세요?</p>
			</div>
		</div>
		
		<div class="container--small">
			<div class="button-wrap">
				<a href="https://www.jejuair.net/ko/ibe/booking/Availability.do" class="button button--middle"><span class="button__text">항공권 예약</span></a>
			</div>
		</div>
		
		</div>
	<div class="title pc-only">
		<div class="page-title-wrap">
			<div class="page-title">마이페이지</div>
			
			<div class="title__additional"><span>김혜명</span> 고객님,  &nbsp;어디로 여행가세요?</div>
			<div class="button-wrap left">
				<button type="button" class="button button--primary button--black" onclick="location.href='https://www.jejuair.net/ko/ibe/booking/Availability.do'">
					<span class="button__text">항공권 예약</span>
				</button>
			</div>
			
			</div>
	</div>
	<div class="new-top-wrap">
		<div class="link-wrap--arrow link-wrap--right">
			<a href="javascript:void(0)" onclick="MEMBER_MYPAGE_MAIN_SCRIPT.popup();" class="link-wrap__text"><span>회원등급 안내</span></a>
		</div>
		<div class="new-top-box">
			<div class="new-top-box__inner">
				<div class="pc-left">
					<div class="mypage__grade">
						<a href="javascript:void(0)" onclick="MEMBER_MYPAGE_MAIN_SCRIPT.popup();" class="link-wrap__text"><span class="grade silver" aria-label="silver"></span></a>
							</div>
					<div class="mypage__info">
						<div class="name">회원번호</div>
						<div class="number">093495882</div>
						<div class="link-wrap link-wrap--arrow">
							<a href="javascript:void(0)" class="link-wrap__text" data-action="memberInfoModify"><span>회원정보 수정</span></a>
						</div>
					</div>
				</div>
				<div class="pc-right">
					<div class="pc-box">
						<div onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/main.do')" class="mypage__point">
							<strong class="mypage__point--title">사용가능 포인트</strong>
							<span>1,000</span>P
						</div>
						<div class="button-wrap GD">
							<button type="button" class="button button--optional" data-target="#myBenefit" data-element="modal_anchor" data-modal-type="full" data-width="640" style="color: #fff;"><span class="button__text">나의 혜택 확인</span></button>
						</div>
					</div>
					<div class="box-link-list mypage__link">
						<a href="/ko/customerService/csCenter/qnaFormList.do">
							<div>나의 1:1 문의</div>
						</a>
						<a href="#none" data-action="passengerManager">
							<div>탑승객 관리</div>
						</a>
						<a href="#none" data-action="paymentManager">
							<div>결제수단 관리</div>
						</a>
						</div>
				</div>
			</div>
		</div>
		<!--앱 전용-->
		<button type="button" class="button--optional -w100 mycoupon-btn">
			<div onclick="APPCALL.goMyCoupon();">			
			     에어카페 쿠폰함</div>
		</button>
		<!--//앱 전용-->
	</div>
	<form id="frmForAvail" name="frmForAvail" method="post">
	<input type="hidden" id="availSearchData" name="availSearchData">
</form>
<form id="frmResvDetail" name="frmResvDetail" method="post">
	<input type="hidden" name="resvDetailReq" value="">
	<input type="hidden" name="rpnr" value="">
</form>
<div id="divResvList" class="section-wrap">
	<div class="section-title">
		<span>예약 현황</span><div class="link-wrap link-wrap--arrow">
			<a href="../../ibe/mypage/viewReservationList.do" class="link-wrap__text"><span>전체보기</span></a></div>
	</div>






	
	<div class="boarding-slide boarding-slide01 swiper-container">
		<div class="pc-flex1 pc-flex--boarding1 boarding-list-pc swiper-wrapper">
		
			
			<div class="boarding-wrap swiper-slide">
				<div class="boarding-box">
					<div class="boarding">
						<div class="boarding__header">
							<div class="boarding__header--item1">
								<span>예약번호</span> : <span>P9G28D</span>
							</div>
						</div>
						
						<a href="javascript:void(0);">					
						<div class="boarding__info-wrap" name="divReservationDetail" data-recordlocator="P9G28D" data-depdate="2023-03-19" data-culturecode="ko_KR">					
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
											<i ar="" ia-label="성인" class="icon adult"></i>
											<span>1</span><span class="hidden">명</span>
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
		<button type="button" class="button button--optional -w100" data-action="boardingHistory">
			<span class="button__text">지난 탑승 내역 보기</span></button>
	</div>
</div>


<div class="section-wrap">
	<div class="section-title">
		<span>즐겨찾기</span><div class="link-wrap link-wrap--arrow">
			<a href="../mypage/viewMyFavoritesList.do" class="link-wrap__text"><span>전체보기</span></a></div>
	</div>
	<div data-element="tab" class="tab tab--default">
		<div class="tab__buttons">
			<div data-element="tab__list" class="tab__button" role="presentation">
				<button type="button" data-element="tab__anchor" class="tab__anchor is-active" data-index="0" id="plugin-tab-5" role="tab" tabindex="" aria-selected="true" aria-expanded="true">항공편</button></div>
			<div data-element="tab__list" class="tab__button" role="presentation">
				<button type="button" data-element="tab__anchor" class="tab__anchor" data-index="1" id="plugin-tab-6" role="tab" tabindex="" aria-selected="false" aria-expanded="false">여정</button></div>
			<div data-element="tab__list" class="tab__button" role="presentation">
				<button type="button" data-element="tab__anchor" class="tab__anchor" data-index="2" id="plugin-tab-7" role="tab" tabindex="" aria-selected="false" aria-expanded="false">공항</button></div>
		</div>
<div id="divFlight" data-element="tab__panel" class="tab__panel type-over-hidden is-active" aria-labelledby="plugin-tab-5" role="tabpanel" tabindex="0">
<div class="finish-item-wrap">
				<div class="finish-item nodata">
					<div class="finish-item__img">
						<img src="/resources/images/icon/icon-nodata-03.png" alt="">
					</div>
					<p class="finish-item__title">즐겨찾기는 예매 단계에서<br>등록할 수 있어요.</p><p class="finish-item__text">고민 중인 여행이 있다면<br>언제든 저장하고 관리해 보세요:)</p><div class="container--large pc-40">
						<div class="button-wrap--center">
							<button type="button" class="button button--secondary button--active" onclick="moveAvailability();">
								<span class="button__text">예매하러 가기</span></button>
						</div>
					</div>
				</div>
			</div>
	</div>
<div id="divJourney" data-element="tab__panel" class="tab__panel type-over-hidden" aria-labelledby="plugin-tab-6" role="tabpanel" tabindex="0" style="display: none;">
<div class="finish-item-wrap">
			<div class="finish-item nodata">
				<div class="finish-item__img">
					<img src="/resources/images/icon/icon-nodata-03.png" alt="">
				</div>
				<p class="finish-item__title">즐겨찾기는 예매 단계에서<br>등록할 수 있어요.</p><p class="finish-item__text">고민 중인 여행이 있다면<br>언제든 저장하고 관리해 보세요:)</p><div class="container--large pc-40">
					<div class="button-wrap--center">
						<button type="button" class="button button--secondary button--active" onclick="moveAvailability();">
							<span class="button__text">예매하러 가기</span></button>
					</div>
				</div>
			</div>
		</div>
	</div>
<div id="divAirport" class="tab__panel type-over-hidden" data-element="tab__panel" aria-labelledby="plugin-tab-7" role="tabpanel" tabindex="0" style="display: none;">
	<div class="finish-item-wrap">
			<div class="finish-item nodata">
				<div class="finish-item__img">
					<img src="/resources/images/icon/icon-nodata-03.png" alt="">
				</div>
				<p class="finish-item__title">즐겨찾기는 예매 단계에서<br>등록할 수 있어요.</p><p class="finish-item__text">고민 중인 여행이 있다면<br>언제든 저장하고 관리해 보세요:)</p><div class="container--large pc-40">
					<div class="button-wrap button-wrap--center">
						<button type="button" class="button button--secondary button--active" onclick="moveAvailability();">
							<span class="button__text">예매하러 가기</span></button>
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
</div>

<div id="divService" class="section-wrap">
	<div class="section-title">나의 서비스</div><div data-element="tab" class="tab tab--round tab--scroll">
		<div class="tab__button-wrap sub-box" data-element="tab__scroll-wrap">
			<div class="tab__buttons" data-element="tab__scroll" style="width: 246px;">
	<div data-element="tab__list" class="tab__button" role="presentation">
					<button type="button" data-element="tab__anchor" class="tab__anchor is-active" data-index="0" id="plugin-tab-8" role="tab" tabindex="" aria-selected="true" aria-expanded="true">기프티켓</button></div>
	<div data-element="tab__list" class="tab__button" role="presentation">
					<button type="button" data-element="tab__anchor" class="tab__anchor" data-index="1" id="plugin-tab-9" role="tab" tabindex="" aria-selected="false" aria-expanded="false">스포츠 멤버십</button></div>
			</div>
		</div>







	<div data-element="tab__panel" class="tab__panel is-active" aria-labelledby="plugin-tab-8" role="tabpanel" tabindex="0">



		<div class="finish-item-wrap">
			<div class="finish-item nodata finish-item--xsmall">
				<div class="finish-item__img">
					<img src="/resources/images/icon/icon-nodata-03.png" alt="">
				</div>
				<p class="finish-item__title-small">
					기프티켓으로 쉽고 편하게 고마운분들에게 여행을 선물하세요:) 
				</p>
				<div class="link-wrap">
					<a href="../../additionalService/service/gifticket.do" class="link-wrap__underline"><span>기프티켓 구경하기</span></a>
				</div>
			</div>
		</div>


	</div>

	
	
	
	
	
	<div data-element="tab__panel" class="tab__panel" aria-labelledby="plugin-tab-9" role="tabpanel" tabindex="0" style="display: none;">



		<div class="finish-item-wrap">
			<div class="finish-item nodata finish-item--xsmall">
				<div class="finish-item__img">
					<img src="/resources/images/icon/icon-nodata-03.png" alt="">
				</div>
				<p class="finish-item__title-small">
					수하물 장비 초과 걱정 NO! 스포츠 멤버십을 경험해 보세요:)
				</p>
				<div class="link-wrap">
					<a href="../../premium/sportsMembership/main.do" class="link-wrap__underline"><span>스포츠 멤버십 구경하기</span></a>
				</div>
			</div>
		</div>


	</div>

	</div>
</div>
<div id="confirmDelete" class="modal modal--simple">
	<div class="modal-content">
		<h2 class="alert-title">
			즐겨찾기 삭제</h2><p class="alert-text">즐겨찾기를 삭제하시겠습니까?</p></div>
	<div class="modal__button-area button-wrap">
		<button type="button" class="button button--secondary" onclick="closeModal('confirmDelete')">
			<span class="button__text">아니요</span></button>
		<button type="button" class="button button--secondary button--active add--ml-10" onclick="deleteFavorite();">
			<span class="button__text">예</span></button>
	</div>
	<a href="#" onclick="closeModal('confirmDelete')" class="modal__close"><span class="blind">닫기</span></a></div>


<div id="myGiftTicketDetailModalLayer" class="modal modal-full modal-scroll modal--fixed-multi">
	<div class="modal-header">
		<div class="modal-header__title" id="voucherName"></div>
	</div>
	<div class="modal-content">
		<div class="gray-box -dark gray-box--coupon">
			<div class="coupon-list coupon-list--large">
				<div id="couponEndDim" class="coupon-list-end" style="display: none;">이미 사용한 기프티켓입니다.</div>
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
	    	<button type="button" rel="modal:close" class="button button--primary button--active"><span class="button__text">확인</span></button>
	    </div>
    </div>
	<a href="javascript:void(0)" rel="modal:close" class="modal__close"><span class="blind">닫기</span></a>
</div>
<div id="myJJLoungeDetailModalLayer" class="modal modal-full modal--fixed-multi modal-scroll">
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
		<div id="loungePurCancelDiv" class="link-wrap link-wrap--left mt-20">
			<a href="javascript:void(0)" id="purCancel" class="link-wrap__underline"><span>구매취소</span></a>
		</div>
	</div>
	<div class="fixed-wrap fixed-wrap--multi-line border-none">
	    <div class="button-wrap">
	    	<button type="button" rel="modal:close" class="button button--primary button--active"><span class="button__text">확인</span></button>
	    </div>
    </div>
	<a href="javascript:void(0)" rel="modal:close" class="modal__close"><span class="blind">닫기</span></a>
	
</div>


<div id="mySportsCardDetailModalLayer" class="modal modal-full modal--fixed-multi modal-scroll">
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
		<div id="sportsPurCancelDiv" class="link-wrap link-wrap--left mt-20">
			<a href="javascript:void(0)" id="purCancel" class="link-wrap__underline"><span>구매취소</span></a>
		</div>
	</div>
	<div class="fixed-wrap fixed-wrap--multi-line border-none ">
	    <div class="button-wrap">
	    	<button type="button" rel="modal:close" class="button button--primary button--active"><span class="button__text">확인</span></button>
	    </div>
    </div>
	<a href="javascript:void(0)" rel="modal:close" class="modal__close"><span class="blind">닫기</span></a>
	
</div>
<button type="button" id="btnModalOpen" data-element="modal_anchor" style="display: none;"></button>
	


	<div id="friendConfirmDelete" class="modal modal--simple">
		<div class="modal-content">
			<h2 class="alert-title">
				탑승객 삭제</h2>
			<p class="alert-text"><span></span>님을 탑승객 목록에서 삭제하시겠습니까?</p>
		</div>
		<div class="modal__button-area button-wrap">
			<button type="button" class="button button--secondary" onclick="closeCurrentModal(this)">
				<span class="button__text">아니요</span>
			</button>
			<button name="btnDeleteConfirm" type="button" class="button button--secondary button--active add--ml-10">
				<span class="button__text">예</span>
			</button>
		</div>
		<a href="#" onclick="closeCurrentModal(this)" class="modal__close"><span class="blind">닫기</span></a>
	</div>
	<form role="form" method="post"></form>
				</main>
			</div>
			
				
				












<div class="quick-menu mobile-only">
	<!-- D : 활성화 클래스 on -->
	<a href="javascript:void(0);" class="quick-menu__item n1 " onclick="URL_LINK.getI18Url('/main/base/index.do')">
		
			
			
				<img src="https://static.jejuair.net/hpgg/resources/images/upload/icon_bottombar_home_off_56x2.png" alt="홈" loading="lazy">
			
		
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
	<a href="javascript:void(0);" class="quick-menu__item n5 on" onclick="URL_LINK.getI18Url('/member/mypage/main.do')">
		
			
				<img src="https://static.jejuair.net/hpgg/resources/images/upload/icon_bottombar_mypage_on_56x2.png" alt="마이페이지" loading="lazy">
			
			
		
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
					<button type="button" class="button-family" data-element="toggle__anchor" aria-controls="toggle-3" aria-expanded="false">Family Site</button>
					<div class="family-list" data-element="toggle__panel" id="toggle-3">
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


	
	






<!-- 공통 스크립트 선언 -->



<script type="text/javascript" src="https://static.jejuair.net/hpgg/resources/js/lib/lib.min.js"></script>



<script type="text/javascript" src="https://static.jejuair.net/hpgg/resources/js/lib/jquery.i18n.js"></script>
<script type="text/javascript" src="https://static.jejuair.net/hpgg/resources/js/lib/jquery.i18n.messagestore.js"></script>
<!-- 메인페이지 스크립트 에러 발생으로 이전 소스로 변경합니다. 
<script type="text/javascript" src="https://static.jejuair.net/hpgg/resources/js/booking/plugin.js"></script>
<script type="text/javascript" src="https://static.jejuair.net/hpgg/resources/js/booking/common.js"></script>
-->
<script>
$(document).ready(function(){
	
		$.ajaxSetup({
			beforeSend: function(xhr) {
				xhr.setRequestHeader('tcode', '0000000178');
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
$('header.mobile-only h2.header__page-name').text($('#main div.page-title').eq(0).text());
</script>
<script type="text/javascript" src="https://static.jejuair.net/hpgg/resources/js/plugin.js"></script>
<script type="text/javascript" src="https://static.jejuair.net/hpgg/resources/js/common.js"></script>

<!--필요시만 로드-->
<script type="text/javascript" src="https://static.jejuair.net/hpgg/resources/js/vendor/lodash.min.js"></script>
<!--사용되지 않음-->
<!--<script type="text/javascript" src="https://static.jejuair.net/hpgg/resources/js/vendor/localforage.min.js"></script>-->
<script type="text/javascript" src="https://static.jejuair.net/hpgg/resources/js/vendor/handlebars.min-v4.7.6.js"></script>
<script type="text/javascript" src="https://static.jejuair.net/hpgg/resources/js/handlebars.helpers.js"></script>

<script type="text/javascript" src="https://static.jejuair.net/hpgg/resources/js/util/sUtil.js"></script>
<script type="text/javascript" src="https://static.jejuair.net/hpgg/resources/js/util/dUtil.js"></script>
<script type="text/javascript" src="https://static.jejuair.net/hpgg/resources/js/util/utils.js"></script>

<script type="text/javascript" src="https://static.jejuair.net/hpgg/resources/bizjs/commons/bizCommons.js"></script>
<script type="text/javascript" src="https://static.jejuair.net/hpgg/resources/js/jj.helpers.js"></script>

	
        
            <script type="text/javascript" src="https://static.jejuair.net/hpgg/resources/bizjs/member/mypage/main.js"></script>
        
    

	<script src="https://static.jejuair.net/hpgg/resources/js/mypage/myFavorites.js"></script>
	<script src="https://static.jejuair.net/hpgg/resources/bizjs/member/mypage/mypageDetail.js"></script>
	<script src="https://static.jejuair.net/hpgg/resources/bizjs/member/mypage/mypageDetailLink.js"></script>
	<script src="https://static.jejuair.net/hpgg/resources/js/booking/country.js"></script>
	<script src="https://static.jejuair.net/hpgg/resources/js/mypage/myFriends.js"></script>
	<script src="https://pac.jejuair.net/common/js/payment_script.js"></script>
	<script>
	
	/* 탑승객 관리용 스크립트 - (모델을 위한 div를 생성한다.) 이관 */
	$(document).ready(function(){
		$(document.body).append('<div id="modalMyFriendsList" class="modal modal-full modal--fixed-multi modal-scroll"></div>');
		$(document.body).append('<div id="modalMyFriendsDetail" class="modal modal-full modal-scroll"></div>');
		$(document.body).append('<div id="modalAddMyFriends" class="modal modal-full modal--fixed-multi modal-scroll"></div>');
		$(document).on('click', 'div[name=divReservationDetail]', goReservationDetail);	
	});
	</script>
	<div id="refreshPointPopMemberGradeGuide" class="modal modal-full modal-scroll">
	<div class="modal-header">
		<div class="modal-header__title">회원등급 안내</div>
	</div>
	<div class="modal-content pb0 h_70">
		<div class="container--small">
			<div class="title">
				<div class="title__wrap">
					<div class="title__page pc-title__additional pc-20">회원혜택이 <br class="mobile-only">궁금하신가요?</div>
				</div>
			</div>
		</div>
		<div data-element="tab" class="tab tab--icons">
			<div class="tab__button-wrap membership-tab">
				<div class="tab__buttons">
					<div data-element="tab__list" class="tab__button" role="presentation">
						<button type="button" data-element="tab__anchor" class="tab__anchor icon-01 is-active" data-index="0" id="plugin-tab-10" role="tab" tabindex="" aria-selected="true" aria-expanded="true">VIP</button>
					</div>
					<div data-element="tab__list" class="tab__button" role="presentation">
						<button type="button" data-element="tab__anchor" class="tab__anchor icon-02" data-index="1" id="plugin-tab-11" role="tab" tabindex="" aria-selected="false" aria-expanded="false">GOLD</button>
					</div>
					<div data-element="tab__list" class="tab__button" role="presentation">
						<button type="button" data-element="tab__anchor" class="tab__anchor icon-03" data-index="2" id="plugin-tab-12" role="tab" tabindex="" aria-selected="false" aria-expanded="false">SILVER+</button>
					</div>
					<div data-element="tab__list" class="tab__button" role="presentation">
						<button type="button" data-element="tab__anchor" class="tab__anchor icon-04" data-index="3" id="plugin-tab-13" role="tab" tabindex="" aria-selected="false" aria-expanded="false">SILVER</button>
					</div>
				</div>
			</div>
			<!-- VIP -->
			<div data-element="tab__panel" class="tab__panel is-active" aria-labelledby="plugin-tab-10" role="tabpanel" tabindex="0">
				<div class="box-memo box-memo--center arrow-01">
					<p class="box-memo__text">250,000P 탑승적립 또는 50회 탑승횟수 누적</p>
				</div>
				<div class="list-card list-card--member">
					<div class="list-card__item">
						<div class="list-card__info icon-01">
							<strong class="list-card__title">10% 적립</strong>
							<p class="list-card__text">(항공운임 5% 기본적립 + 5% 추가 적립)</p>
						</div>
					</div>
					<div class="list-card__item">
						<div class="list-card__info icon-02">
							<strong class="list-card__title">추가 수하물 20kg 무료</strong>
							<p class="list-card__text">(괌,사이판 노선 제외)</p>
							<ul class="list-guide list-guide--asterisk">
								<li class="list-guide__item">찜 특가는 제외</li>
								<li class="list-guide__item">추가 수하물 서비스는 수속 카운터에서만 진행 할 수 있습니다.</li>
							</ul>
						</div>
					</div>
					<div class="list-card__item">
						<div class="list-card__info icon-03">
							<strong class="list-card__title">수하물 우선 처리</strong>
						</div>
					</div>
					<div class="list-card__item">
						<div class="list-card__info icon-04">
							<strong class="list-card__title">사전 좌석 지정</strong>
						</div>
					</div>
					<div class="list-card__item">
						<div class="list-card__info icon-05">
							<strong class="list-card__title">우선탑승</strong>
							<ul class="list-guide list-guide--asterisk">
								<li class="list-guide__item">공항 카운터에서 발권 시 모바일 앱의 회원카드 제시하여 인증</li>
							</ul>
						</div>
					</div>
				</div>
				<!--20210609 안내 문구 추가-->
				<div class="guide-info guide-info--gray">
					<div class="guide-info__text">
						<strong class="">승급 집계 탑승 횟수 안내</strong>
						<p>승급 집계 탑승 횟수는 기준일( 21.10.25~) 이후 국내선에 한해 탑승 1회시 0.5회로 인정됩니다.</p>
					</div>
				</div>
				<!--//20210609 안내 문구 추가-->
			</div>
			<!-- //VIP -->
		
			<!-- GOLD -->
			<div data-element="tab__panel" class="tab__panel" aria-labelledby="plugin-tab-11" role="tabpanel" tabindex="0" style="display: none;">
				<div class="box-memo box-memo--center arrow-02">
					<p class="box-memo__text">100,000P 탑승적립 또는 20회 탑승 횟수 누적</p>
				</div>
				<div class="list-card list-card--member">
					<div class="list-card__item">
						<div class="list-card__info icon-01">
							<strong class="list-card__title">6% 적립</strong>
							<p class="list-card__text">(항공운임 5% 기본 적립 + 1% 추가 적립)</p>
						</div>
					</div>
					<div class="list-card__item">
						<div class="list-card__info icon-02">
							<strong class="list-card__title">추가 수하물 10KG 무료</strong>
							<p class="list-card__text">(괌,사이판 노선 제외)</p>
							<ul class="list-guide list-guide--asterisk">
								<li class="list-guide__item">찜 특가는 제외</li>
							</ul>
						</div>
					</div>
					<div class="list-card__item">
						<div class="list-card__info icon-03">
							<strong class="list-card__title">수하물 우선 처리</strong>
						</div>
					</div>
					<div class="list-card__item">
						<div class="list-card__info icon-05">
							<strong class="list-card__title">우선탑승</strong>
							<ul class="list-guide list-guide--asterisk">
								<li class="list-guide__item">공항 카운터에서 발권 시 모바일 앱의 회원카드 제시하여 인증</li>
							</ul>
						</div>
					</div>
				</div>
				<!--20210609 안내 문구 추가-->
				<div class="guide-info guide-info--gray">
					<div class="guide-info__text">
						<strong class=""></strong>
						<p>승급 집계 탑승 횟수는 기준일( 21.10.25~) 이후 국내선에 한해 탑승 1회시 0.5회로 인정됩니다.</p>
					</div>
				</div>
				<!--//20210609 안내 문구 추가-->
			</div>
			<!-- //GOLD -->
		
			<!-- SILVER+ -->
			<div data-element="tab__panel" class="tab__panel" aria-labelledby="plugin-tab-12" role="tabpanel" tabindex="0" style="display: none;">
				<div class="box-memo box-memo--center arrow-03">
					<p class="box-memo__text">50,000P 탑승적립 또는 10회 탑승 횟수 누적</p>
				</div>
				<div class="list-card list-card--member">
					<div class="list-card__item">
						<div class="list-card__info icon-01">
							<strong class="list-card__title">5.5% 적립</strong>
							<p class="list-card__text">(항공운임 5% 기본적립 + 0.5% 추가 적립)</p>
						</div>
					</div>
					<div class="list-card__item">
						<div class="list-card__info icon-05">
							<strong class="list-card__title">우선탑승</strong>
							<ul class="list-guide list-guide--asterisk">
								<li class="list-guide__item">공항 카운터에서 발권 시 모바일 앱의 회원카드 제시하여 인증</li>
							</ul>
						</div>
					</div>
				</div>
				<!--20210609 안내 문구 추가-->
				<div class="guide-info guide-info--gray">
					<div class="guide-info__text">
						<strong class="">승급 집계 탑승 횟수 안내</strong>
						<p>승급 집계 탑승 횟수는 기준일( 21.10.25~) 이후 국내선에 한해 탑승 1회시 0.5회로 인정됩니다.</p>
					</div>
				</div>
				<!--//20210609 안내 문구 추가-->
			</div>
			<!-- //SILVER+ -->
			
			<!-- SILVER -->
			<div data-element="tab__panel" class="tab__panel" aria-labelledby="plugin-tab-13" role="tabpanel" tabindex="0" style="display: none;">
				<div class="box-memo box-memo--center arrow-04">
					<p class="box-memo__text">제주항공 최초 가입</p>
				</div>
				<div class="list-card list-card--member">
					<div class="list-card__item">
						<div class="list-card__info no-icon">
							<strong class="list-card__title title--sub ellipsis-reset">리프레시 포인트 가입 회원 모두에게 제주항공만의 특별한 멤버십 혜택을 제공합니다.</strong>
						</div>
					</div>
				</div>
				<!--20210609 안내 문구 추가-->
				<div class="guide-info guide-info--gray">
					<div class="guide-info__text">
						<strong class="">승급 집계 탑승 횟수 안내</strong>
						<p>승급 집계 탑승 횟수는 기준일( 21.10.25~) 이후 국내선에 한해 탑승 1회시 0.5회로 인정됩니다.</p>
					</div>
				</div>
				<!--//20210609 안내 문구 추가-->
			</div>
			<!-- //SILVER -->
		</div>
		<!-- 회원등급 안내 -->
		<div class="section-wrap">
			<div class="service-information bottom-full-info" data-element="toggle" data-options="{&quot;mode&quot;: &quot;modal move scroll&quot;}">
				<div class="service-information__title">
					<button type="button" class="service-information__anchor" data-element="toggle__anchor" aria-controls="toggle-4" aria-expanded="false">회원등급 안내</button>
				</div>
				<div class="service-information__content" data-element="toggle__panel" id="toggle-4" style="display: none;">
					<div class="list-wrap">
						<ul class="list-guide list-guide--small list-guide--color-gray">
							<li class="list-guide__item">회원등급 산정에 반영되는 포인트는 탑승 시 적립되는 포인트와 등급별로 추가 적립되는 포인트입니다. 포인트는 일반 항공권 결제 후 탑승 시에만 적립되며,&nbsp;포인트 항공권으로 탑승 시에는 적립되지 않습니다.</li>
							<li class="list-guide__item">등급 유지 기간은 3년이며, 등급은 승급된 날부터 3년 뒤 승급 심사를 통해 다시 산정됩니다.</li>
							<li class="list-guide__item">승급 심사에서는 승급일 전월 마지막 날부터 이전 3년 간의 실적을 심사하며, 등급별 기준에 따라 다시 산정됩니다. (예 : 2018년 7월 10일 승급 심사, 승급 집계 기간 2015년 7월 1일 ~ 2018년 6월 30일)</li>
							<li class="list-guide__item">승급의 경우 각 등급별 승급 조건이 충족되면 자동 승급 처리됩니다. (승급 심사는 매월 10일이며 한 달에 한 번 진행됨)</li>
							<li class="list-guide__item">위탁 수하물 추가 및 수하물 우선 처리는 공항 카운터에서 발권 시 리프레시 포인트 카드 인증 후에 제공됩니다.</li>
							<li class="list-guide__item">사전 좌석 지정은 일반 좌석에 한해 제공됩니다. (앞 좌석, 비상구 좌석은 제외)</li>
							<li class="list-guide__item">등급별 혜택으로 제공되는 추가 수하물은 제주항공 위탁수하물 규정에 따릅니다.</li>
							<li class="list-guide__item">찜 특가 구매 시 무료 수하물 추가 서비스는 제공되지 않습니다.</li>
							<li class="list-guide__item">추가 수하물 서비스는 수속 카운터에서만 제공됩니다.</li>
							<li class="list-guide__item">우선 탑승은 공항 탑승구(탑승 게이트)에서 탑승 시작 알림 시 항공기에 먼저 탑승할 수있는 서비스이며, 현지 공항 사정에 따라 제한이 있을 수 있다는 점, 미리 양해해 주시기 바랍니다. (서비스 이용 시 공항 카운터에서 모바일 앱카드 제시 , 키오스크/웹 체크인 시 자동인증)</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- //회원등급 안내 -->
	</div>
	<a href="#" rel="modal:close" class="modal__close"><span class="blind">닫기</span></a>
</div>
	
	<div id="ifmWrap" style="height:100%; display:none; overflow:auto; text-align:center; -webkit-overflow-scrolling:touch;">
		<iframe src="" width="100%" height="100%" name="popupChkApp"></iframe>    
	</div>
<script type="text/javascript" src="/Fo__-9/r2jGUJ/f/q8U/h1EGIslQ/cYwEVwXLiSEp/dj0xMno/XyN9GV/FlD00B"></script>
<div class="jjLoading" data-load="Y" style="display: none;">
<!--
   <div class="loading">
      <div class="loading__img">
        <img src="https://static.jejuair.net/hpgg/resources/images/etc/img_loading.gif">
        <div class="loading__text">LOADING</div>
      </div>
    </div>
-->
  <div class="loading2">
    <div class="loading__img">
      <img src="https://static.jejuair.net/hpgg/resources/images/etc/loading2.gif">
    </div>
    
    <div class="loading2_dim"></div>
  </div>
</div><div id="modalCountry" class="modal modal-full CO_1_1 modal-scroll"></div><div id="modalNationality" class="modal modal-full CO_1_1 modal-scroll"></div><div id="modalMyFriendsList" class="modal modal-full modal--fixed-multi modal-scroll"></div><div id="modalMyFriendsDetail" class="modal modal-full modal-scroll"></div><div id="modalAddMyFriends" class="modal modal-full modal--fixed-multi modal-scroll"></div></body></html>


