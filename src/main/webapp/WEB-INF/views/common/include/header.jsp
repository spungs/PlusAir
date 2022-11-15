<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="">
<head>
	<meta charset="UTF-8">
	<title>더한항공</title>
	<link href="<c:url value="/resources/css/font.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/global.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/component.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/page.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/responsive.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/lang.css" />" rel="stylesheet">
	<link rel="icon" type="image/png" href="<c:url value="/resources/favicon/favicon.ico" />">
<!-- 다국어 관련 스크립트 변수 -->
<!-- 
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
		var data =""; 
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
   var isLogin = "false";//web 로그인여부
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
    Google Tag Manager
	<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-PD2BQQ4');</script>
	End Google Tag Manager
	
	
    <script>
	var langCdtTag = 'ko';	
	</script>
    Global site tag (gtag.js) - Google Analytics
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-49935507-8"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());
		gtag('config', 'UA-49935507-8');
	</script>  종료 N006
	
	Global site tag (gtag.js) - Google Ads
	<script async="" src="https://www.googletagmanager.com/gtag/js?id=AW-763115837"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	
	  gtag('config', 'AW-763115837');
	</script>
	Global site tag (gtag.js) - Google Analytics
	<script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-49935507-9"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	
	  gtag('config', 'UA-49935507-9');
	</script>
	N023 
	<script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
	<script type="text/javascript">kakaoPixel('4430357879563963209').pageView();</script>
	<script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
	N004 
	<script type="text/javascript">kakaoPixel('6788472491368532022').pageView();</script>
	
	
	Global site tag (gtag.js) - Google Ads: 770453349 N026
	<script async="" src="https://www.googletagmanager.com/gtag/js?id=AW-770453349"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	 
	  gtag('config', 'AW-770453349');
	</script>
	
	
	N001/N002	
	
	
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
	
	
	
	END N001/N002
<script src="/tuna_.js"></script>
                              <script>!function(a){var e="https://s.go-mpulse.net/boomerang/",t="addEventListener";if("False"=="True")a.BOOMR_config=a.BOOMR_config||{},a.BOOMR_config.PageParams=a.BOOMR_config.PageParams||{},a.BOOMR_config.PageParams.pci=!0,e="https://s2.go-mpulse.net/boomerang/";if(window.BOOMR_API_key="AYF4Y-8J9XB-2BDC5-23EM3-Q7Z28",function(){function n(e){a.BOOMR_onload=e&&e.timeStamp||(new Date).getTime()}if(!a.BOOMR||!a.BOOMR.version&&!a.BOOMR.snippetExecuted){a.BOOMR=a.BOOMR||{},a.BOOMR.snippetExecuted=!0;var i,_,o,r=document.createElement("iframe");if(a[t])a[t]("load",n,!1);else if(a.attachEvent)a.attachEvent("onload",n);r.src="javascript:void(0)",r.title="",r.role="presentation",(r.frameElement||r).style.cssText="width:0;height:0;border:0;display:none;",o=document.getElementsByTagName("script")[0],o.parentNode.insertBefore(r,o);try{_=r.contentWindow.document}catch(O){i=document.domain,r.src="javascript:var d=document.open();d.domain='"+i+"';void(0);",_=r.contentWindow.document}_.open()._l=function(){var a=this.createElement("script");if(i)this.domain=i;a.id="boomr-if-as",a.src=e+"AYF4Y-8J9XB-2BDC5-23EM3-Q7Z28",BOOMR_lstart=(new Date).getTime(),this.body.appendChild(a)},_.write("<bo"+'dy onload="document._l();">'),_.close()}}(),"".length>0)if(a&&"performance"in a&&a.performance&&"function"==typeof a.performance.setResourceTimingBufferSize)a.performance.setResourceTimingBufferSize();!function(){if(BOOMR=a.BOOMR||{},BOOMR.plugins=BOOMR.plugins||{},!BOOMR.plugins.AK){var e=""=="true"?1:0,t="",n="pw7gnhyxea4ksy3qvveq-f-07074f683-clientnsv4-s.akamaihd.net",i="false"=="true"?2:1,_={"ak.v":"33","ak.cp":"881439","ak.ai":parseInt("562947",10),"ak.ol":"0","ak.cr":9,"ak.ipv":4,"ak.proto":"h2","ak.rid":"3b30066d","ak.r":45882,"ak.a2":e,"ak.m":"b","ak.n":"essl","ak.bpcip":"125.190.102.0","ak.cport":2223,"ak.gh":"23.32.56.165","ak.quicv":"","ak.tlsv":"tls1.3","ak.0rtt":"","ak.csrc":"-","ak.acc":"","ak.t":"1668328777","ak.ak":"hOBiQwZUYzCg5VSAfCLimQ==mjVLebU5NXwvGcPFiTRX7lWIkEGZ9MlDwtnPAljfz/Qtbfaq3/ZD+HYKkCUZ3YUGex4n88Nb3L49y3l5qdloi76UKPT0bUfhaxKYV6O4iz6LZW1Yr/yJO4CXu56CIh2VcddB0DYTuFdLB4UlRH+Fa04N5LqpzAGaB93pvQwaGbra4UgViqQZ5ytLan3JPkoBY1LlVWL0dBrzhyavUkeyRyh0zHDpZz+rjBh+1/SJDPt5gOu0k0i4+agVGERdbBf5IAa7VeQW4AaDUuthlwh3NN9Nc7N77pO+uQzKFq+jrWfT5ruZv7geal6g3qBW9rQyzgh9TQq+tCGf7auEkU/KdOW7d2JZtL9kU1UZqNUbD59WEkuX6LrMWsaGBmdJ9ZkojWzj7Nn2BQxR7IcebgQiI1ce377AiuAf1v0+iSn/85s=","ak.pv":"100","ak.dpoabenc":"","ak.tf":i};if(""!==t)_["ak.ruds"]=t;var o={i:!1,av:function(e){var t="http.initiator";if(e&&(!e[t]||"spa_hard"===e[t]))_["ak.feo"]=void 0!==a.aFeoApplied?1:0,BOOMR.addVar(_)},rv:function(){var a=["ak.bpcip","ak.cport","ak.cr","ak.csrc","ak.gh","ak.ipv","ak.m","ak.n","ak.ol","ak.proto","ak.quicv","ak.tlsv","ak.0rtt","ak.r","ak.acc","ak.t","ak.tf"];BOOMR.removeVar(a)}};BOOMR.plugins.AK={akVars:_,akDNSPreFetchDomain:n,init:function(){if(!o.i){var a=BOOMR.subscribe;a("before_beacon",o.av,null,null),a("onbeacon",o.rv,null,null),o.i=!0}return this},is_complete:function(){return!0}}}}()}(window);</script><meta http-equiv="origin-trial" content="A751Xsk4ZW3DVQ8WZng2Dk5s3YzAyqncTzgv+VaE6wavgTY0QHkDvUTET1o7HanhuJO8lgv1Vvc88Ij78W1FIAAAAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjgwNjUyNzk5LCJpc1RoaXJkUGFydHkiOnRydWV9"><meta http-equiv="origin-trial" content="A751Xsk4ZW3DVQ8WZng2Dk5s3YzAyqncTzgv+VaE6wavgTY0QHkDvUTET1o7HanhuJO8lgv1Vvc88Ij78W1FIAAAAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjgwNjUyNzk5LCJpc1RoaXJkUGFydHkiOnRydWV9"><script type="text/javascript" async="" src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/770453349/?random=1668328777766&amp;cv=11&amp;fst=1668328777766&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2oab90&amp;u_w=1920&amp;u_h=1080&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.jejuair.net%2Fko%2FmemberBenefit%2FmemberBenefit.do%3Fparam%3DnewMember&amp;tiba=%EC%A0%9C%EC%A3%BC%ED%95%AD%EA%B3%B5&amp;auid=527955646.1668142417&amp;data=event%3Dgtag.config&amp;rfmt=3&amp;fmt=4"></script><meta http-equiv="origin-trial" content="A751Xsk4ZW3DVQ8WZng2Dk5s3YzAyqncTzgv+VaE6wavgTY0QHkDvUTET1o7HanhuJO8lgv1Vvc88Ij78W1FIAAAAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjgwNjUyNzk5LCJpc1RoaXJkUGFydHkiOnRydWV9"><meta http-equiv="origin-trial" content="A751Xsk4ZW3DVQ8WZng2Dk5s3YzAyqncTzgv+VaE6wavgTY0QHkDvUTET1o7HanhuJO8lgv1Vvc88Ij78W1FIAAAAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjgwNjUyNzk5LCJpc1RoaXJkUGFydHkiOnRydWV9"><script type="text/javascript" async="" src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/763115837/?random=1668328777783&amp;cv=11&amp;fst=1668328777783&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2oab90&amp;u_w=1920&amp;u_h=1080&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.jejuair.net%2Fko%2FmemberBenefit%2FmemberBenefit.do%3Fparam%3DnewMember&amp;tiba=%EC%A0%9C%EC%A3%BC%ED%95%AD%EA%B3%B5&amp;auid=527955646.1668142417&amp;data=event%3Dgtag.config&amp;rfmt=3&amp;fmt=4"></script></head> 
-->
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
		
			
			
				
					
					
					
						<button class="header__button" onclick="APPCALL.back()">
							<span class="hidden">이전으로</span>
						</button>
					
					
					<h2 class="header__page-name">회원 전용 혜택</h2>
				
				
				
			
		
		
		<div class="header__button-wrap subType" data-element="gnbToggle">
			<!-- 예매전 노출
			<button type="button" class="header__button-ticket">
				<span class="hidden">티켓보기</span>
			</button>
			// 예매전 노출 -->
			
				<button type="button" class="gnb__button">
					
						
					
					
					<img src="<c:url value="/resources/img/icon-hamburger-header.png" />" alt="전체메뉴 열기" class="img_sticky" loading="lazy">
				</button>
				<button type="button" class="gnb__button active">
						<img loading="lazy" src="https://static.jejuair.net/hpgg/resources/images/icon/icon-hamburger-header.png" alt="전체메뉴 열기" class="open">

						
							
						
				</button>
 
			<!--2022-10-17 이벤트페이지 요청시, App에서 뒤로가기 처리-->
			
			  

			
				<!--번들 선택, 사전 수하물 추가, 사전 좌석선택, 사전 기내식 주문 -> 자세히 보기 햄버거 메뉴 보여주기-->
				<!--
				
					
					
						
						<button type="button" onclick="APPCALL.close();" class="modal__close"><span class="blind">닫기</span></button>
					
				
				-->
				
				
		</div>
		<!-- 스크롤시 스티키 상단 -->

		<!-- 전체메뉴 -->
<div class="gnb" id="gnb" style="display: none;">
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
				
				
				
					<a href="javascript:;" class="util__link" data-action="menu" data-menu-name="login">로그인</a>
					<a href="javascript:;" class="util__link" data-action="menu" data-menu-name="join">회원가입</a>
				
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
					
						
						<img src="<c:url value="/resources/images/banner_image/20211014191229348.png" />" alt="jejuairlogo" loading="lazy">
					
					</a>
				</h1>
				
					
						<h2 class="header__page-name">회원 전용 혜택</h2>
					
				
				
					
						
						
							
							
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

	
</head>
</html>