<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no, maximum-scale=1, user-scalable=0">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Expires" content="-1">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta name="format-detection" content="telephone=no">
	<title>제주항공</title>
	<link rel="icon" type="image/png" href="https://static.jejuair.net/hpgg/resources/images/icon/favicon.ico">
	
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
                              <script>!function(a){var e="https://s.go-mpulse.net/boomerang/",t="addEventListener";if("False"=="True")a.BOOMR_config=a.BOOMR_config||{},a.BOOMR_config.PageParams=a.BOOMR_config.PageParams||{},a.BOOMR_config.PageParams.pci=!0,e="https://s2.go-mpulse.net/boomerang/";if(window.BOOMR_API_key="AYF4Y-8J9XB-2BDC5-23EM3-Q7Z28",function(){function n(e){a.BOOMR_onload=e&&e.timeStamp||(new Date).getTime()}if(!a.BOOMR||!a.BOOMR.version&&!a.BOOMR.snippetExecuted){a.BOOMR=a.BOOMR||{},a.BOOMR.snippetExecuted=!0;var i,_,o,r=document.createElement("iframe");if(a[t])a[t]("load",n,!1);else if(a.attachEvent)a.attachEvent("onload",n);r.src="javascript:void(0)",r.title="",r.role="presentation",(r.frameElement||r).style.cssText="width:0;height:0;border:0;display:none;",o=document.getElementsByTagName("script")[0],o.parentNode.insertBefore(r,o);try{_=r.contentWindow.document}catch(O){i=document.domain,r.src="javascript:var d=document.open();d.domain='"+i+"';void(0);",_=r.contentWindow.document}_.open()._l=function(){var a=this.createElement("script");if(i)this.domain=i;a.id="boomr-if-as",a.src=e+"AYF4Y-8J9XB-2BDC5-23EM3-Q7Z28",BOOMR_lstart=(new Date).getTime(),this.body.appendChild(a)},_.write("<bo"+'dy onload="document._l();">'),_.close()}}(),"".length>0)if(a&&"performance"in a&&a.performance&&"function"==typeof a.performance.setResourceTimingBufferSize)a.performance.setResourceTimingBufferSize();!function(){if(BOOMR=a.BOOMR||{},BOOMR.plugins=BOOMR.plugins||{},!BOOMR.plugins.AK){var e=""=="true"?1:0,t="",n="2perliyxfoszcy3q5p3q-f-b79580c9c-clientnsv4-s.akamaihd.net",i="false"=="true"?2:1,_={"ak.v":"33","ak.cp":"881439","ak.ai":parseInt("562947",10),"ak.ol":"0","ak.cr":7,"ak.ipv":4,"ak.proto":"h2","ak.rid":"a00b2a3a","ak.r":45534,"ak.a2":e,"ak.m":"b","ak.n":"essl","ak.bpcip":"211.201.21.0","ak.cport":3807,"ak.gh":"23.43.165.141","ak.quicv":"","ak.tlsv":"tls1.3","ak.0rtt":"","ak.csrc":"-","ak.acc":"","ak.t":"1668344823","ak.ak":"hOBiQwZUYzCg5VSAfCLimQ==qZjA5wGBwmxQPvu0Q1jjn9b9yu6eSCVbnWJwDqG51pqof706IlUofeeGHhC/iNkfMoNOEzLljyfU1/euM0Er8hkGjjBdTbSwUXFWtCL83AFbYj103NJLj3+lythb1BZm6PD3GMtqRQulHfA3fsHQMZnSUxZTiT/5vH5uD/4dFl7Rv429qn1D9T/k6bk8zCe9pg3x3cPu1dCTjAK8R/t4TwqtKGNSOgxBVuiPdoDY1EOj3Xp8dT7YoSmORAZ7nzd6drpNy5IOkjUX+HUF++lG18Mcw2VlXCt2O5C89zT6DrRhg4+97NU6ZFi+E8ZJS3xZQk25iv3/gf8auSDRH7EgpldTv1CLEKp1cJiTisK1wzFb1ThuyW8hFRmevlAUoa4s9RtLcdFeeR8EuM4OQHMpnAdydgP0j4GmyA9bWTeeflw=","ak.pv":"100","ak.dpoabenc":"","ak.tf":i};if(""!==t)_["ak.ruds"]=t;var o={i:!1,av:function(e){var t="http.initiator";if(e&&(!e[t]||"spa_hard"===e[t]))_["ak.feo"]=void 0!==a.aFeoApplied?1:0,BOOMR.addVar(_)},rv:function(){var a=["ak.bpcip","ak.cport","ak.cr","ak.csrc","ak.gh","ak.ipv","ak.m","ak.n","ak.ol","ak.proto","ak.quicv","ak.tlsv","ak.0rtt","ak.r","ak.acc","ak.t","ak.tf"];BOOMR.removeVar(a)}};BOOMR.plugins.AK={akVars:_,akDNSPreFetchDomain:n,init:function(){if(!o.i){var a=BOOMR.subscribe;a("before_beacon",o.av,null,null),a("onbeacon",o.rv,null,null),o.i=!0}return this},is_complete:function(){return!0}}}}()}(window);</script><meta http-equiv="origin-trial" content="A751Xsk4ZW3DVQ8WZng2Dk5s3YzAyqncTzgv+VaE6wavgTY0QHkDvUTET1o7HanhuJO8lgv1Vvc88Ij78W1FIAAAAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjgwNjUyNzk5LCJpc1RoaXJkUGFydHkiOnRydWV9"><meta http-equiv="origin-trial" content="A751Xsk4ZW3DVQ8WZng2Dk5s3YzAyqncTzgv+VaE6wavgTY0QHkDvUTET1o7HanhuJO8lgv1Vvc88Ij78W1FIAAAAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjgwNjUyNzk5LCJpc1RoaXJkUGFydHkiOnRydWV9"><script type="text/javascript" async="" src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/763115837/?random=1668344823836&amp;cv=11&amp;fst=1668344823836&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2oab90&amp;u_w=1536&amp;u_h=864&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.jejuair.net%2Fko%2Fibe%2Fbooking%2FAvailability.do&amp;ref=https%3A%2F%2Fwww.jejuair.net%2Fko%2Fmember%2Fmypage%2Fmain.do&amp;tiba=%EC%A0%9C%EC%A3%BC%ED%95%AD%EA%B3%B5&amp;auid=20770610.1668143764&amp;uaa=x86&amp;uab=64&amp;uafvl=Google%2520Chrome%3B107.0.5304.107%7CChromium%3B107.0.5304.107%7CNot%253DA%253FBrand%3B24.0.0.0&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;data=event%3Dgtag.config&amp;rfmt=3&amp;fmt=4"></script><meta http-equiv="origin-trial" content="A751Xsk4ZW3DVQ8WZng2Dk5s3YzAyqncTzgv+VaE6wavgTY0QHkDvUTET1o7HanhuJO8lgv1Vvc88Ij78W1FIAAAAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjgwNjUyNzk5LCJpc1RoaXJkUGFydHkiOnRydWV9"><meta http-equiv="origin-trial" content="A751Xsk4ZW3DVQ8WZng2Dk5s3YzAyqncTzgv+VaE6wavgTY0QHkDvUTET1o7HanhuJO8lgv1Vvc88Ij78W1FIAAAAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjgwNjUyNzk5LCJpc1RoaXJkUGFydHkiOnRydWV9"><script type="text/javascript" async="" src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/770453349/?random=1668344823850&amp;cv=11&amp;fst=1668344823850&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2oab90&amp;u_w=1536&amp;u_h=864&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.jejuair.net%2Fko%2Fibe%2Fbooking%2FAvailability.do&amp;ref=https%3A%2F%2Fwww.jejuair.net%2Fko%2Fmember%2Fmypage%2Fmain.do&amp;tiba=%EC%A0%9C%EC%A3%BC%ED%95%AD%EA%B3%B5&amp;auid=20770610.1668143764&amp;uaa=x86&amp;uab=64&amp;uafvl=Google%2520Chrome%3B107.0.5304.107%7CChromium%3B107.0.5304.107%7CNot%253DA%253FBrand%3B24.0.0.0&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;data=event%3Dgtag.config&amp;rfmt=3&amp;fmt=4"></script></head>
<body id="subLayoutBody" class="isPc">

	<!-- 개선 #1271286440
<div id="skipNav" class="skip-nav">
	<a href="#content" class="skip-nav__item">본문 바로가기</a>
</div>
-->
	<!-- 상단 띠배너 공지사항은 메인페이지만 표시합니다. -->

	<!-- 앱설치알림 -->

	<!-- 남은시간 연장 및 공지바 노출-->
	<div class="top-custom-banner ticketing_top_bar">
		<!--활성화시 .on 추가-->
		<div class="top-custom-banner__inner">
			<dl class="time_bar">
				<dt>이용 가능시간 :</dt>
				<dd>
					<strong></strong>
				</dd>
			</dl>
			<div class="link-wrap--arrow">
				<button type="button" class="link-wrap__text"
					onclick="javascript:sendExtTripsell();">
					<span>연장하기</span>
				</button>
			</div>
			<button type="button" class="top-custom-banner__close"
				aria-label="닫기"></button>
		</div>
	</div>

	<!-- //남은시간 연장 및 공지바 노출 -->
	<!-- header -->
	<div id="header" class="header">
		<!-- mobile -->
		<header class="header__inner mobile-only">






			<div class="header__logo">
				<a href="javascript:;" data-action="menu" data-menu-name="main">




					<img
					src="https://static.jejuair.net/cms/images/banner_image/20211014191229348.png"
					alt="jejuairlogo" class="img_sticky" loading="lazy">

				</a>
			</div>




			<div class="header__button-wrap subType" data-element="gnbToggle">
				<!-- 예매전 노출
			<button type="button" class="header__button-ticket">
				<span class="hidden">티켓보기</span>
			</button>
			// 예매전 노출 -->

				<button type="button" class="gnb__button">




					<img
						src="https://static.jejuair.net/hpgg/resources/images/icon/icon-hamburger-header.png"
						alt="전체메뉴 열기" class="img_sticky" loading="lazy">
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
				<div class="gnb__header">
					<div class="gnb__header-top" data-absolute-sticky="">
						<a href="javascript:;" class="button-home" title="홈으로 이동"
							data-action="menu" data-menu-name="main"> <img loading="lazy"
							src="https://static.jejuair.net/hpgg/resources/images/upload/icon_bottombar_home_on_56x2.png"
							alt="홈">
						</a> <a class="select-wrap select-wrap--inline lang-type"
							id="btnCountrySelector" data-modal-type="full"> 대한민국 </a>
						<div class="additional">
							<!-- D : '웹'일경우 APP다운로드 버튼 -->
							<button type="button" class="button button--small"
								onclick="APPCALL.goMarket()">
								<span class="button__text button__icon">APP</span>
							</button>
							<a href="javascript:;" class="button-search" title="통합검색이동">
								<img loading="lazy"
								src="https://static.jejuair.net/hpgg/resources/images/icon/icon-header-search.png"
								alt="통합 검색 이동">
							</a> <a href="javascript:;" class="gnb-close" aria-label="닫기"> <img
								loading="lazy"
								src="https://static.jejuair.net/hpgg/resources/images/icon/icon-header-gnb-close.png"
								alt="전체메뉴 닫기" class="close">
							</a>
						</div>
					</div>
					<div class="gnb__header-bot">

						<div class="before">
							<div class="title">
								로그인 하시고<br>더 풍부한 혜택을 누리세요!
							</div>
							<!-- fixed 영역 -->
							<div class="sticky-wrap">
								<div class="button-wrap button-flex sticky__inner gnb-sticky1">
									<button type="button" class="button button--secondary"
										data-action="menu" data-menu-name="join">
										<span class="button__text">회원가입</span>
									</button>
									<button type="button"
										class="button button--secondary button--active"
										data-action="menu" data-menu-name="login">
										<span class="button__text">로그인</span>
									</button>
									<a href="javascript:;" class="gnb-close" aria-label="닫기"> <img
										loading="lazy"
										src="https://static.jejuair.net/hpgg/resources/images/icon/icon-header-gnb-close.png"
										alt="전체메뉴 닫기" class="close">
									</a>
								</div>
							</div>
							<!-- //fixed 영역 -->
							<div class="title">
								<div class="title__section title__section--additional">
									제주항공에서 예약하지 않으셨다면?
									<div class="additional">
										<div class="link-wrap">
											<a href="javascript:;" class="link-wrap__underline"
												data-action="menu" data-menu-name="bookingSearch"><span>예약조회</span></a>
										</div>
									</div>
								</div>
							</div>

							<div class="icon-link">




								<a href="/ko/ibe/mypage/viewReservationList.do"
									class="icon-link__item" data-action="menu"
									data-menu-name="tourAndTicket"> <img
									src="https://static.jejuair.net/cms/images/banner_image/20211117132250301.png"
									alt="" loading="lazy"> <span class="icon-link__text"
									style="color:">나의 예약조회 </span></a> <a
									href="/ko/prepare/flight/viewScheduleInfo.do"
									class="icon-link__item" data-action="menu"
									data-menu-name="tourAndTicket"> <img
									src="https://static.jejuair.net/cms/images/banner_image/20211005132323185.png"
									alt="" loading="lazy"> <span class="icon-link__text"
									style="color:">출도착 조회 </span></a> <a
									href="/ko/customerService/csCenter/faqList.do"
									class="icon-link__item" data-action="menu"
									data-menu-name="tourAndTicket"> <img
									src="https://static.jejuair.net/cms/images/banner_image/20211005132333367.png"
									alt="" loading="lazy"> <span class="icon-link__text"
									style="color:">고객센터 </span></a>

							</div>

						</div>



						<!-- //로그인 후 -->
					</div>
				</div>
				<hr class="section-spacer">
				<div class="gnb-wrap">





					<div class="gnb__box">
						<div class="gnb__title">마이페이지</div>
						<div class="gnb__list">




							<a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/member/mypage/main.do')">마이페이지
								메인</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/ibe/mypage/viewOnOffReservationList.do')">예약
								조회</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/ibe/mypage/viewReservationList.do')">나의
								예약 현황</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/member/mypage/myFlightList.do')">나의
								탑승 내역</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/member/mypage/viewMyGiftTicketList.do')">나의
								기프티켓</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/member/mypage/memberInfoModify.do')">회원정보
								수정</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/member/mypage/viewMyPartnerCoupon.do')">나의
								쿠폰</a>


































































































						</div>
					</div>

















					<div class="gnb__box">
						<div class="gnb__title">여행준비 안내</div>
						<div class="gnb__list">




















							<a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/ibe/booking/Availability.do')">항공권
								예매</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/prepare/fare/domesticBenefit.do')">국내선
								운임</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/prepare/fare/internationalBenefit.do')">국제선
								운임</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/prepare/flight/viewScheduleInfo.do?index=1')">스케줄
								조회</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/prepare/flight/viewScheduleInfo.do?index=2')">출도착
								조회</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/ibe/booking/viewMilitaryInput.do')">민항공후급증
								예약</a>




















































































						</div>
					</div>















					<div class="gnb__box">
						<div class="gnb__title">회원 혜택 안내</div>
						<div class="gnb__list">


































							<a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/memberBenefit/memberBenefit.do?param=newMember ')">신규회원
								혜택</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/memberBenefit/memberBenefit.do?param=promotion')">프로모션
								코드</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/main.do')">리프레시
								포인트</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/pointBuy.do')">포인트
								구매</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/pointSearch.do')">포인트
								조회</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/additionalService/service/gifticket.do')">기프티켓</a>



							<a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/memberBenefit/regCoupon.do')">쿠폰
								등록</a>


































































						</div>
					</div>



















					<div class="gnb__box">
						<div class="gnb__title">부가서비스 안내</div>
						<div class="gnb__list">




















































							<a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/additionalService/service/main.do')">부가서비스
								소개</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/additionalService/service/preorderedBaggage.do')">사전
								수하물</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/additionalService/service/preorderedSeat.do')">사전
								좌석</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/additionalService/service/preorderedMeal.do')">사전
								기내식</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/additionalService/service/insurance.do')">여행자
								보험</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/additionalService/service/bundleGuide.do')">부가서비스
								번들</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/additionalService/service/afterPayGuide.do')">나중에
								결제</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/additionalService/service/carringBagGuide.do')">자전거
								캐링백 서비스</a>
















































						</div>
					</div>



















					<div class="gnb__box">
						<div class="gnb__title">프리미엄 혜택 안내</div>
						<div class="gnb__list">






































































							<a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/premium/businesslite/main.do')">비즈니스
								라이트</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/premium/sportsMembership/main.do')">스포츠
								멤버십</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/additionalService/service/allianceService.do')">제휴서비스</a>



							<a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('https://www.jejuairshop.com?jjout=Y')">온라인몰
								제이샵</a>






































						</div>
					</div>











					<div class="gnb__box">
						<div class="gnb__title">탑승 수속 안내</div>
						<div class="gnb__list">
















































































							<a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/ibe/checkin/viewCheckin.do')">모바일
								탑승권</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/linkService/boardingProcessGuide/baggageGuide.do')">수하물</a>



							<a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/linkService/fastProcedure/guide.do')">빠른
								수속</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/linkService/airport/info.do')">공항
								정보</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/linkService/help/main.do')">도움이
								필요한 고객</a>


























						</div>
					</div>













					<div class="gnb__box">
						<div class="gnb__title">기내 서비스 안내</div>
						<div class="gnb__list">




























































































							<a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/cabinService/service/airCafe.do')">에어카페</a>



							<a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/customerServiceCenter/noticeDetail.do?billboardNo=0000000198')">기내
								면세</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/cabinService/service/funService.do')">기내
								FUN 서비스</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/cabinService/immigration/etcFormGuide.do')">출입국
								신고서 작성방법</a>
















						</div>
					</div>











					<div class="gnb__box">
						<div class="gnb__title">이벤트</div>
						<div class="gnb__list">






































































































							<a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/event/event.do')">진행중인 이벤트</a> <a
								href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/event/pastEvent.do')">지난 이벤트</a>










						</div>
					</div>







					<div class="gnb__box">
						<div class="gnb__title">고객센터</div>
						<div class="gnb__list">












































































































							<a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/customerService/csCenter/faqList.do')">고객센터</a>



							<a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/customerService/cabinLost/cabinLost.do')">기내
								유실물 센터</a> <a href="javascript:void(0);" class="gnb__list-item"
								onclick="URL_LINK.getI18Url('/customerServiceCenter/notice.do')">공지사항</a>


						</div>
					</div>









					<div class="gnb__footer">



						<div class="gnb__title">SNS</div>
						<div class="sns-wrap">

							<a href="https://www.facebook.com/funjejuair/"
								class="sns-wrap__item" target="_blank"> <img loading="lazy"
								src="https://static.jejuair.net/cms/images/sns_ch/20211027200713454.png"
								alt="https://www.facebook.com/funjejuair/">
							</a> <a href="https://www.youtube.com/user/funjejuair"
								class="sns-wrap__item" target="_blank"> <img loading="lazy"
								src="https://static.jejuair.net/cms/images/sns_ch/20211027200700139.png"
								alt="https://www.youtube.com/user/funjejuair">
							</a> <a href="https://instagram.com/jejuair_official"
								class="sns-wrap__item" target="_blank"> <img loading="lazy"
								src="https://static.jejuair.net/cms/images/sns_ch/20211027200545316.png"
								alt="https://instagram.com/jejuair_official">
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

					<a href="javascript:;" class="util__link company"
						data-action="menu" data-menu-name="company">기업 우대</a>
					<div class="util__link-wrap" data-element="toggle"
						data-options="{&quot;mode&quot;: &quot;slide&quot;, &quot;speed&quot;: 0, &quot;clickToClose&quot;: true}">
						<button type="button" class="util__link arrow__link"
							data-element="toggle__anchor" aria-controls="toggle-1"
							aria-expanded="false">여행사 우대</button>
						<div class="util__link-panel" data-element="toggle__panel"
							id="toggle-1">
							<a href="javascript:;" class="item" data-action="menu"
								data-menu-name="travelAgencyD">국내선</a> <a href="javascript:;"
								class="item" data-action="menu" data-menu-name="travelAgencyF">국제선</a>
						</div>
					</div>













					<a href="https://cargo.jejuair.net" target="_black"
						class="util__link2" data-action="menu" data-menu-name="Cargo">Cargo</a>
				</div>

				<div class="util__link-list" data-custom-toggle="wrap">



					<a href="javascript:;" class="util__link" data-action="menu"
						data-menu-name="login">로그인</a> <a href="javascript:;"
						class="util__link" data-action="menu" data-menu-name="join">회원가입</a>

					<!-- // 로그인 전 노출 -->





					<a href="javascript:;"
						onclick="URL_LINK.getI18Url('/ibe/mypage/viewReservationList.do')"
						class="util__link">나의 예약 현황</a> <a href="javascript:;"
						onclick="URL_LINK.getI18Url('/customerService/csCenter/faqList.do')"
						class="util__link">고객센터</a> <a href="javascript:;"
						onclick="URL_LINK.getI18Url('/customerServiceCenter/notice.do')"
						class="util__link">공지사항</a>



					<button type="button" class="util__country"
						data-custom-toggle="button">
						<span class="text"> 대한민국 </span>
					</button>
					<div class="header-country__layer" data-custom-toggle="panel"
						style="">
						<div class="country__title">지역 및 언어 설정</div>
						<div class="country__input">
							<div class="select-wrap select-wrap--line">

								<select title="국가 선택" class="select-wrap__select selected"
									name="countryChoice" id="countryChoice">






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
								<select class="select-wrap__select selected" title="언어 선택"
									name="languageChoice" id="languageChoice">





									<option value="ko" selected="">한국어</option>

								</select>
							</div>
							<button class="country__button" id="countryAndLanguageChoiceBtn"
								data-flag="base">확인</button>
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


							<img
							src="https://static.jejuair.net/cms/images/banner_image/20211014191229348.png"
							alt="jejuairlogo" loading="lazy">

						</a>
					</h1>


					<h2 class="header__page-name">항공권 예매</h2>








					<div class="header__link-list">





						<a href="javascript:void(0);" class="header__link"
							onclick="URL_LINK.getI18Url('/ibe/booking/Availability.do')">항공권
							예매</a> <a href="javascript:void(0);" class="header__link"
							onclick="URL_LINK.getI18Url('/member/mypage/main.do')">마이페이지</a>








						<a href="javascript:void(0);" class="header__link"
							onclick="URL_LINK.getI18Url('/additionalService/service/main.do')">부가서비스
							안내</a> <a href="javascript:void(0);" class="header__link"
							onclick="URL_LINK.getI18Url('/ibe/checkin/viewCheckin.do')">모바일
							탑승권</a> <a href="javascript:void(0);" class="header__link"
							onclick="URL_LINK.getI18Url('/event/event.do')">이벤트</a>




					</div>





					<div class="header__search-wrap header-search subType"
						data-custom-toggle="wrap">
						<!-- <button type="button" class="header__button-ticket">
					<span class="hidden">티켓보기</span>
					</button> -->
						<button type="button" class="header__button-search"
							data-custom-toggle="button">
							<img loading="lazy"
								src="https://static.jejuair.net/hpgg/resources/images/icon/icon-header-search.png"
								alt="검색">
						</button>
						<div class="header-search__layer" data-custom-toggle="panel"
							style="">
							<div class="header-search__form" data-element="form">
								<input type="search" class="search__text"
									placeholder="검색어를 입력해 주세요" data-element="input">
								<button type="button" data-element="remove"
									class="input__remove-button">삭제</button>
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
							<img loading="lazy"
								src="https://static.jejuair.net/hpgg/resources/images/icon/icon-hamburger-header.png"
								alt="전체메뉴 열기" class="open">




						</button>
					</div>

					<!-- goto-quick-booking : 스티키 클릭용 -->
					<div class="goto-quick-booking">
						<a href="javascript:;"> <span>어디로 여행가세요?</span>
							<div class="goto-btn">
								<span>항공권 검색</span>
							</div>
						</a>
					</div>
					<!-- //goto-quick-booking -->

				</div>

				<!-- 전체메뉴 -->
				<div class="gnb" id="gnb" style="display: none;">
					<div class="gnb-wrap">





						<div class="gnb__box">
							<div class="gnb__title">마이페이지</div>
							<div class="gnb__list">




								<a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/member/mypage/main.do')">마이페이지
									메인</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/ibe/mypage/viewOnOffReservationList.do')">예약
									조회</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/ibe/mypage/viewReservationList.do')">나의
									예약 현황</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/member/mypage/myFlightList.do')">나의
									탑승 내역</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/member/mypage/viewMyGiftTicketList.do')">나의
									기프티켓</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/member/mypage/memberInfoModify.do')">회원정보
									수정</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/member/mypage/viewMyPartnerCoupon.do')">나의
									쿠폰</a>


































































































							</div>
						</div>

















						<div class="gnb__box">
							<div class="gnb__title">여행준비 안내</div>
							<div class="gnb__list">




















								<a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/ibe/booking/Availability.do')">항공권
									예매</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/prepare/fare/domesticBenefit.do')">국내선
									운임</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/prepare/fare/internationalBenefit.do')">국제선
									운임</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/prepare/flight/viewScheduleInfo.do?index=1')">스케줄
									조회</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/prepare/flight/viewScheduleInfo.do?index=2')">출도착
									조회</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/ibe/booking/viewMilitaryInput.do')">민항공후급증
									예약</a>




















































































							</div>
						</div>















						<div class="gnb__box">
							<div class="gnb__title">회원 혜택 안내</div>
							<div class="gnb__list">


































								<a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/memberBenefit/memberBenefit.do?param=newMember ')">신규회원
									혜택</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/memberBenefit/memberBenefit.do?param=promotion')">프로모션
									코드</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/main.do')">리프레시
									포인트</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/pointBuy.do')">포인트
									구매</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/pointSearch.do')">포인트
									조회</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/additionalService/service/gifticket.do')">기프티켓</a>



								<a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/memberBenefit/regCoupon.do')">쿠폰
									등록</a>


































































							</div>
						</div>



















						<div class="gnb__box">
							<div class="gnb__title">부가서비스 안내</div>
							<div class="gnb__list">




















































								<a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/additionalService/service/main.do')">부가서비스
									소개</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/additionalService/service/preorderedBaggage.do')">사전
									수하물</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/additionalService/service/preorderedSeat.do')">사전
									좌석</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/additionalService/service/preorderedMeal.do')">사전
									기내식</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/additionalService/service/insurance.do')">여행자
									보험</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/additionalService/service/bundleGuide.do')">부가서비스
									번들</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/additionalService/service/afterPayGuide.do')">나중에
									결제</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/additionalService/service/carringBagGuide.do')">자전거
									캐링백 서비스</a>
















































							</div>
						</div>



















						<div class="gnb__box">
							<div class="gnb__title">프리미엄 혜택 안내</div>
							<div class="gnb__list">






































































								<a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/premium/businesslite/main.do')">비즈니스
									라이트</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/premium/sportsMembership/main.do')">스포츠
									멤버십</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/additionalService/service/allianceService.do')">제휴서비스</a>



								<a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('https://www.jejuairshop.com?jjout=Y')">온라인몰
									제이샵</a>






































							</div>
						</div>











						<div class="gnb__box">
							<div class="gnb__title">탑승 수속 안내</div>
							<div class="gnb__list">
















































































								<a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/ibe/checkin/viewCheckin.do')">모바일
									탑승권</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/linkService/boardingProcessGuide/baggageGuide.do')">수하물</a>



								<a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/linkService/fastProcedure/guide.do')">빠른
									수속</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/linkService/airport/info.do')">공항
									정보</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/linkService/help/main.do')">도움이
									필요한 고객</a>


























							</div>
						</div>













						<div class="gnb__box">
							<div class="gnb__title">기내 서비스 안내</div>
							<div class="gnb__list">




























































































								<a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/cabinService/service/airCafe.do')">에어카페</a>



								<a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/customerServiceCenter/noticeDetail.do?billboardNo=0000000198')">기내
									면세</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/cabinService/service/funService.do')">기내
									FUN 서비스</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/cabinService/immigration/etcFormGuide.do')">출입국
									신고서 작성방법</a>
















							</div>
						</div>











						<div class="gnb__box">
							<div class="gnb__title">이벤트</div>
							<div class="gnb__list">






































































































								<a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/event/event.do')">진행중인 이벤트</a> <a
									href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/event/pastEvent.do')">지난 이벤트</a>










							</div>
						</div>







						<div class="gnb__box">
							<div class="gnb__title">고객센터</div>
							<div class="gnb__list">












































































































								<a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/customerService/csCenter/faqList.do')">고객센터</a>



								<a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/customerService/cabinLost/cabinLost.do')">기내
									유실물 센터</a> <a href="javascript:void(0);" class="gnb__list-item"
									onclick="URL_LINK.getI18Url('/customerServiceCenter/notice.do')">공지사항</a>


							</div>
						</div>









						<div class="gnb__footer">



							<div class="gnb__title">SNS</div>
							<div class="sns-wrap">

								<a href="https://www.facebook.com/funjejuair/" target="_blank"
									class="sns-wrap__item"> <img loading="lazy"
									src="https://static.jejuair.net/cms/images/sns_ch/20211027200713454.png"
									alt="https://www.facebook.com/funjejuair/">
								</a> <a href="https://www.youtube.com/user/funjejuair"
									target="_blank" class="sns-wrap__item"> <img loading="lazy"
									src="https://static.jejuair.net/cms/images/sns_ch/20211027200700139.png"
									alt="https://www.youtube.com/user/funjejuair">
								</a> <a href="https://instagram.com/jejuair_official"
									target="_blank" class="sns-wrap__item"> <img loading="lazy"
									src="https://static.jejuair.net/cms/images/sns_ch/20211027200545316.png"
									alt="https://instagram.com/jejuair_official">
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


	<div id="body">

		<!-- Google Tag Manager (noscript) -->
		<noscript>
			<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PD2BQQ4"
				height="0" width="0" style="display: none; visibility: hidden"></iframe>
		</noscript>
		<!-- End Google Tag Manager (noscript) -->

		<div class="wrap wrap--fixed NA_1_1">


			<div id="breadcrumb" class="breadcrumb pc-only"
				aria-label="breadcrumb">
				<nav class="breadcrumb__inner">
					<div class="breadcrumb__item">
						<a href="javascript:;" class="breadcrumb__link"
							style="cursor: default;">홈</a>
					</div>




					<div class="breadcrumb__item">
						<a href="javascript:;" class="breadcrumb__link"
							style="cursor: default;">항공권 예매</a>
					</div>





				</nav>
			</div>



			<div class="content" id="content">
				<main id="main" class="main ">

					<form id="availSearchForm">
						<input type="hidden" id="availSearchData" name="availSearchData">
					</form>
					<div class="page-title-wrap pc-only">
						<div class="page-title">항공권 예매</div>
						<!-- 항공권 예매 -->
					</div>
					<div class="quick-book-sch pc-30">
						<div class="main-ticketing open">
							<div class="ticketing-in content-guide">
								<ul class="ticketing-type">
									<li class="item selected" data-triptype="RT"><a href="#"
										class="item-btn">왕복</a></li>
									<!-- 왕복 -->
									<li class="item" data-triptype="OW"><a href="#"
										class="item-btn">편도</a></li>
									<!-- 편도 -->
									<li class="item" data-triptype="MT"><a href="#"
										class="item-btn">다구간</a></li>
									<!-- 다구간 -->
								</ul>
								<div class="ticketing-row-top single">
									<div class="ticketing-target">
										<button type="button" class="start js-target-pick">
											<span class="txt before-select" id="spanDepartureDesc">출발지</span>
										</button>
										<!-- 출발지 -->
										<input type="hidden" id="departureData">
										<button type="button" class="target js-target-pick">
											<span class="txt before-select" id="spanArrivalDesc">도착지</span>
										</button>
										<!-- 도착지 -->
										<input type="hidden" id="arrivalData">
										<button type="button" class="btn-open js-target-pick"
											data-route="DEP" id="btnExchangeRoute1">
											<span class="blind">열기</span>
										</button>
										<!--열기-->
									</div>
									<div class="ticketing-date">











										<button type="button" class="btn-date" id="btnDatePicker">
											<span class="txt">2022.11.13(일) ~ 2022.11.20(일)</span>
										</button>
										<input type="hidden" id="departureDate" value="2022-11-13">
										<input type="hidden" id="arrivalDate" value="2022-11-20">
									</div>
								</div>
								<div class="ticketing-row-hidden single">
									<div class="flight-layer flight-start" id="depAirportLayer">
										<div class="layer-header">
											<div class="header__input-wrap input is-focus"
												data-element="form">
												<button type="button" class="header__button"
													name="header_btn">
													<span class="hidden">이전으로</span>
												</button>
												<!-- 이전으로 -->
												<button type="button" class="header__input-search">
													<img
														src="https://static.jejuair.net/hpgg/resources/images/icon/icon-header-search.png"
														alt="검색">
												</button>
												<input type="text" id="txtDEPAirport"
													class="header__input ui-autocomplete-input"
													data-element="input" placeholder="어디에서 출발하세요?"
													autocomplete="off">
												<p class="map-list-txt" id="mapDEPAirport">어디에서 출발하세요?</p>
												<!-- 어디에서 출발하세요? -->
												<button type="button" data-element="remove"
													class="input__remove-button">
													<span class="hidden">삭제</span>
												</button>
												<!-- 삭제 -->
											</div>
											<div id="divDEPAirportAC" name="search_auto"
												target="txtDepAirport">
												<ul
													class="predictive-search ui-menu ui-widget ui-widget-content"
													id="ui-id-1" tabindex="0" style="display: none;"></ul>
											</div>
										</div>
										<div class="txt-list">
											<div class="header-sub" data-element="tab">
												<div class="tab__buttons">
													<div data-element="tab__list" class="tab__button"
														role="presentation">
														<button type="button" class="tab__anchor is-active"
															id="dep_selectTab01" data-element="tab__anchor"
															data-index="0" role="tab" tabindex=""
															aria-selected="true" aria-expanded="true">최근 검색</button>
														<!-- 최근 검색 -->
													</div>
													<div data-element="tab__list" class="tab__button"
														role="presentation">
														<button type="button" class="tab__anchor"
															id="dep_selectTab02" data-element="tab__anchor"
															data-index="1" role="tab" tabindex=""
															aria-selected="false" aria-expanded="false">즐겨찾기</button>
														<!-- 즐겨찾기 -->
													</div>
													<div data-element="tab__list" class="tab__button"
														role="presentation" name="divPromotion">
														<button type="button" class="tab__anchor"
															id="dep_selectTab03" data-element="tab__anchor"
															data-index="2" role="tab" tabindex=""
															aria-selected="false" aria-expanded="false">프로모션</button>
														<!-- 프로모션 -->
													</div>
												</div>
												<div data-element="tab__panel" class="tab__panel is-active"
													aria-labelledby="dep_selectTab01" role="tabpanel"
													tabindex="0">
													<div data-element="tab">
														<div class="tab__button-wrap">
															<div class="tag-list" data-scroll="x" name="latelySearch"></div>
														</div>
													</div>
												</div>
												<div data-element="tab__panel" class="tab__panel"
													aria-labelledby="dep_selectTab02" role="tabpanel"
													tabindex="0" style="display: none;">
													<div data-element="tab">
														<div class="tab__button-wrap">
															<div class="tag-list" data-scroll="x" name="favorites"></div>
														</div>
													</div>
												</div>
												<div data-element="tab__panel" class="tab__panel"
													aria-labelledby="dep_selectTab03" role="tabpanel"
													tabindex="0" style="display: none;">
													<div data-element="tab">
														<div class="tab__button-wrap">
															<div class="tag-list" data-scroll="x"
																name="promotionSearch"></div>
														</div>
													</div>
												</div>
											</div>
											<div class="main--destination-select">
												<hr class="booking-line">
												<div data-element="tab"
													class="tab tab--vertical tab--booking">
													<div class="tab__buttons vertical_scroll_set"
														id="divDepArea">
														<div data-element="tab__list" class="tab__button"
															role="presentation">
															<button type="button" tabindex=""
																data-element="tab__anchor" role="tab" data-index="0"
																id="plugin-DEPtab-2" class="tab__anchor is-active"
																aria-selected="true" aria-expanded="true">대한민국</button>
														</div>
														<div data-element="tab__list" class="tab__button"
															role="presentation">
															<button type="button" tabindex=""
																data-element="tab__anchor" role="tab" data-index="1"
																id="plugin-DEPtab-3" class="tab__anchor"
																aria-selected="false" aria-expanded="false">동북아시아</button>
														</div>
														<div data-element="tab__list" class="tab__button"
															role="presentation">
															<button type="button" tabindex=""
																data-element="tab__anchor" role="tab" data-index="2"
																id="plugin-DEPtab-4" class="tab__anchor"
																aria-selected="false" aria-expanded="false">동남아시아</button>
														</div>
														<div data-element="tab__list" class="tab__button"
															role="presentation">
															<button type="button" tabindex=""
																data-element="tab__anchor" role="tab" data-index="3"
																id="plugin-DEPtab-5" class="tab__anchor"
																aria-selected="false" aria-expanded="false">대양주/괌/사이판</button>
														</div>
													</div>
													<div class="tab__panel-wrap scrollbar-inner"
														data-element="tab__panel-wrap">
														<div data-element="tab__panel"
															class="tab__panel is-active"
															aria-labelledby="plugin-DEPtab-2" role="tabpanel"
															tabindex="0" style="display: block;">
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="KR" data-areacode="RGTP000001"
																	data-onlyoneway="undefined" data-latitude="37.253"
																	data-longitude="126.223" data-stationcode="ICN"
																	data-stationtype="DEP" data-stationname="서울(인천)">
																	<span class="stationName">서울(인천)</span><span
																		class="airport">ICN</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="KR" data-areacode="RGTP000001"
																	data-onlyoneway="undefined"
																	data-latitude="37.330400000000004"
																	data-longitude="126.47070000000001"
																	data-stationcode="GMP" data-stationtype="DEP"
																	data-stationname="서울(김포)">
																	<span class="stationName">서울(김포)</span><span
																		class="airport">GMP</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="KR" data-areacode="RGTP000001"
																	data-onlyoneway="undefined" data-latitude="35.1015"
																	data-longitude="129.07500000000002"
																	data-stationcode="PUS" data-stationtype="DEP"
																	data-stationname="부산">
																	<span class="stationName">부산</span><span
																		class="airport">PUS</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="KR" data-areacode="RGTP000001"
																	data-onlyoneway="undefined" data-latitude="33.302"
																	data-longitude="126.2942" data-stationcode="CJU"
																	data-stationtype="DEP" data-stationname="제주">
																	<span class="stationName">제주</span><span
																		class="airport">CJU</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="KR" data-areacode="RGTP000001"
																	data-onlyoneway="undefined" data-latitude="35.0724"
																	data-longitude="126.4839" data-stationcode="KWJ"
																	data-stationtype="DEP" data-stationname="광주">
																	<span class="stationName">광주</span><span
																		class="airport">KWJ</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="KR" data-areacode="RGTP000001"
																	data-onlyoneway="undefined" data-latitude="35.59"
																	data-longitude="126.45" data-stationcode="KUV"
																	data-stationtype="DEP" data-stationname="군산">
																	<span class="stationName">군산</span><span
																		class="airport">KUV</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="KR" data-areacode="RGTP000001"
																	data-onlyoneway="undefined" data-latitude="36.43"
																	data-longitude="127.3024" data-stationcode="CJJ"
																	data-stationtype="DEP" data-stationname="청주">
																	<span class="stationName">청주</span><span
																		class="airport">CJJ</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="KR" data-areacode="RGTP000001"
																	data-onlyoneway="undefined" data-latitude="35.53"
																	data-longitude="128.4" data-stationcode="TAE"
																	data-stationtype="DEP" data-stationname="대구">
																	<span class="stationName">대구</span><span
																		class="airport">TAE</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
														</div>
														<div data-element="tab__panel" class="tab__panel"
															aria-labelledby="plugin-DEPtab-3" role="tabpanel"
															tabindex="0" style="display: none;">
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="JP" data-areacode="RGTP000002"
																	data-onlyoneway="undefined" data-latitude="35.455"
																	data-longitude="140.2328" data-stationcode="NRT"
																	data-stationtype="DEP" data-stationname="도쿄(나리타)">
																	<span class="stationName">도쿄(나리타)</span><span
																		class="airport">NRT</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="JP" data-areacode="RGTP000002"
																	data-onlyoneway="undefined" data-latitude="34.2526"
																	data-longitude="135.1449" data-stationcode="KIX"
																	data-stationtype="DEP" data-stationname="오사카(간사이)">
																	<span class="stationName">오사카(간사이)</span><span
																		class="airport">KIX</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="JP" data-areacode="RGTP000002"
																	data-onlyoneway="undefined"
																	data-latitude="33.345600000000005"
																	data-longitude="130.2712" data-stationcode="FUK"
																	data-stationtype="DEP" data-stationname="후쿠오카">
																	<span class="stationName">후쿠오카</span><span
																		class="airport">FUK</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="JP" data-areacode="RGTP000002"
																	data-onlyoneway="undefined"
																	data-latitude="34.511900000000004"
																	data-longitude="136.483" data-stationcode="NGO"
																	data-stationtype="DEP" data-stationname="나고야">
																	<span class="stationName">나고야</span><span
																		class="airport">NGO</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="JP" data-areacode="RGTP000002"
																	data-onlyoneway="undefined" data-latitude="42.4745"
																	data-longitude="141.4009" data-stationcode="CTS"
																	data-stationtype="DEP" data-stationname="삿포로">
																	<span class="stationName">삿포로</span><span
																		class="airport">CTS</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="JP" data-areacode="RGTP000002"
																	data-onlyoneway="undefined" data-latitude="26.12"
																	data-longitude="127.39" data-stationcode="OKA"
																	data-stationtype="DEP" data-stationname="오키나와">
																	<span class="stationName">오키나와</span><span
																		class="airport">OKA</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="CN" data-areacode="RGTP000002"
																	data-onlyoneway="undefined"
																	data-latitude="37.300000000000004"
																	data-longitude="122.05000000000001"
																	data-stationcode="WEH" data-stationtype="DEP"
																	data-stationname="웨이하이">
																	<span class="stationName">웨이하이</span><span
																		class="airport">WEH</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="CN" data-areacode="RGTP000002"
																	data-onlyoneway="undefined" data-latitude="45.45"
																	data-longitude="126.4" data-stationcode="HRB"
																	data-stationtype="DEP" data-stationname="하얼빈">
																	<span class="stationName">하얼빈</span><span
																		class="airport">HRB</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="CN" data-areacode="RGTP000002"
																	data-onlyoneway="undefined" data-latitude="42.39"
																	data-longitude="129.3" data-stationcode="YNJ"
																	data-stationtype="DEP" data-stationname="옌지">
																	<span class="stationName">옌지</span><span
																		class="airport">YNJ</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
														</div>
														<div data-element="tab__panel" class="tab__panel"
															aria-labelledby="plugin-DEPtab-4" role="tabpanel"
															tabindex="0" style="display: none;">
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="VN" data-areacode="RGTP000003"
																	data-onlyoneway="undefined" data-latitude="16.0232"
																	data-longitude="108.1213" data-stationcode="DAD"
																	data-stationtype="DEP" data-stationname="다낭">
																	<span class="stationName">다낭</span><span
																		class="airport">DAD</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="VN" data-areacode="RGTP000003"
																	data-onlyoneway="undefined" data-latitude="11.5937"
																	data-longitude="109.13300000000001"
																	data-stationcode="CXR" data-stationtype="DEP"
																	data-stationname="나트랑/냐짱">
																	<span class="stationName">나트랑/냐짱</span><span
																		class="airport">CXR</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="TH" data-areacode="RGTP000003"
																	data-onlyoneway="undefined" data-latitude="13.4109"
																	data-longitude="100.4456" data-stationcode="BKK"
																	data-stationtype="DEP" data-stationname="방콕">
																	<span class="stationName">방콕</span><span
																		class="airport">BKK</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="TH" data-areacode="RGTP000003"
																	data-onlyoneway="undefined" data-latitude="18.4619"
																	data-longitude="98.5806" data-stationcode="CNX"
																	data-stationtype="DEP" data-stationname="치앙마이">
																	<span class="stationName">치앙마이</span><span
																		class="airport">CNX</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="PH" data-areacode="RGTP000003"
																	data-onlyoneway="undefined"
																	data-latitude="14.303600000000001"
																	data-longitude="121.01060000000001"
																	data-stationcode="MNL" data-stationtype="DEP"
																	data-stationname="마닐라">
																	<span class="stationName">마닐라</span><span
																		class="airport">MNL</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="PH" data-areacode="RGTP000003"
																	data-onlyoneway="undefined"
																	data-latitude="10.195400000000001"
																	data-longitude="123.5424" data-stationcode="CEB"
																	data-stationtype="DEP" data-stationname="세부">
																	<span class="stationName">세부</span><span
																		class="airport">CEB</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="PH" data-areacode="RGTP000003"
																	data-onlyoneway="undefined"
																	data-latitude="9.395100000000001"
																	data-longitude="123.51150000000001"
																	data-stationcode="TAG" data-stationtype="DEP"
																	data-stationname="보홀">
																	<span class="stationName">보홀</span><span
																		class="airport">TAG</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="PH" data-areacode="RGTP000003"
																	data-onlyoneway="undefined"
																	data-latitude="15.110000000000001"
																	data-longitude="120.33000000000001"
																	data-stationcode="CRK" data-stationtype="DEP"
																	data-stationname="클락">
																	<span class="stationName">클락</span><span
																		class="airport">CRK</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="SG" data-areacode="RGTP000003"
																	data-onlyoneway="undefined" data-latitude="1.2129"
																	data-longitude="103.5438" data-stationcode="SIN"
																	data-stationtype="DEP" data-stationname="싱가포르">
																	<span class="stationName">싱가포르</span><span
																		class="airport">SIN</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="MY" data-areacode="RGTP000003"
																	data-onlyoneway="undefined" data-latitude="5.5627"
																	data-longitude="116.03" data-stationcode="BKI"
																	data-stationtype="DEP" data-stationname="코타키나발루">
																	<span class="stationName">코타키나발루</span><span
																		class="airport">BKI</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
														</div>
														<div data-element="tab__panel" class="tab__panel"
															aria-labelledby="plugin-DEPtab-5" role="tabpanel"
															tabindex="0" style="display: none;">
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="GU" data-areacode="RGTP000004"
																	data-onlyoneway="undefined" data-latitude="13.2848"
																	data-longitude="144.4728" data-stationcode="GUM"
																	data-stationtype="DEP" data-stationname="괌">
																	<span class="stationName">괌</span><span class="airport">GUM</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
															<div class="choise">
																<button type="button" class="choise__button"
																	data-countrycode="MP" data-areacode="RGTP000004"
																	data-onlyoneway="undefined" data-latitude="15.0722"
																	data-longitude="145.4242" data-stationcode="SPN"
																	data-stationtype="DEP" data-stationname="사이판">
																	<span class="stationName">사이판</span><span
																		class="airport">SPN</span>
																</button>
																<div class="fav-check">
																	<button type="button"
																		onclick="javascript:clickBtnFavorites(this);"
																		class="button-favorites">
																		<span class="hidden">즐겨찾기</span>
																	</button>
																</div>
															</div>
														</div>
													</div>
												</div>
												<!--<button type="button" class="floating-button btn-map" onclick="viewTabMap('start','map')">
								<span class="hidden">지도 보기</span>
	                    	</button>-->
											</div>
										</div>
										<div class="map-list">
											<div class="map-wrap">
												<div id="map-start" class="flight-map"></div>
												<div class="tab-top">
													<ul class="tab-top-list">
														<li class="tab-top-item"><a href="#"
															class="tab-top-btn on" data-areacode="RGTP000001">대한민국</a></li>
														<li class="tab-top-item"><a href="#"
															class="tab-top-btn" data-areacode="RGTP000002">동북아시아</a></li>
														<li class="tab-top-item"><a href="#"
															class="tab-top-btn" data-areacode="RGTP000003">동남아시아</a></li>
														<li class="tab-top-item"><a href="#"
															class="tab-top-btn" data-areacode="RGTP000004">대양주/괌/사이판</a></li>
													</ul>
												</div>
												<div class="tab-swipe">
													<div class="tab-swipe-wrapper swiper-wrapper">
														<a class="tab-swipe-item swiper-slide" style=""><div
																class="city-name">
																서울(인천)<span class="sub">ICN</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="KR" data-areacode="RGTP000001"
																data-latitude="37.453" data-longitude="126.423"
																data-stationcode="ICN" data-stationtype="DEP"
																data-stationname="서울(인천)">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide" style=""><div
																class="city-name">
																서울(김포)<span class="sub">GMP</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="KR" data-areacode="RGTP000001"
																data-latitude="37.53040000000001"
																data-longitude="126.67070000000001"
																data-stationcode="GMP" data-stationtype="DEP"
																data-stationname="서울(김포)">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide" style=""><div
																class="city-name">
																부산<span class="sub">PUS</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="KR" data-areacode="RGTP000001"
																data-latitude="35.301500000000004"
																data-longitude="129.275" data-stationcode="PUS"
																data-stationtype="DEP" data-stationname="부산">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide" style=""><div
																class="city-name">
																제주<span class="sub">CJU</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="KR" data-areacode="RGTP000001"
																data-latitude="33.502" data-longitude="126.4942"
																data-stationcode="CJU" data-stationtype="DEP"
																data-stationname="제주">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide" style=""><div
																class="city-name">
																광주<span class="sub">KWJ</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="KR" data-areacode="RGTP000001"
																data-latitude="35.272400000000005"
																data-longitude="126.68390000000001"
																data-stationcode="KWJ" data-stationtype="DEP"
																data-stationname="광주">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide" style=""><div
																class="city-name">
																군산<span class="sub">KUV</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="KR" data-areacode="RGTP000001"
																data-latitude="35.790000000000006"
																data-longitude="126.65" data-stationcode="KUV"
																data-stationtype="DEP" data-stationname="군산">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide" style=""><div
																class="city-name">
																청주<span class="sub">CJJ</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="KR" data-areacode="RGTP000001"
																data-latitude="36.63"
																data-longitude="127.50240000000001"
																data-stationcode="CJJ" data-stationtype="DEP"
																data-stationname="청주">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide" style=""><div
																class="city-name">
																대구<span class="sub">TAE</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="KR" data-areacode="RGTP000001"
																data-latitude="35.730000000000004"
																data-longitude="128.6" data-stationcode="TAE"
																data-stationtype="DEP" data-stationname="대구">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide"
															style="display: none;"><div class="city-name">
																도쿄(나리타)<span class="sub">NRT</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="JP" data-areacode="RGTP000002"
																data-latitude="35.655" data-longitude="140.4328"
																data-stationcode="NRT" data-stationtype="DEP"
																data-stationname="도쿄(나리타)">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide"
															style="display: none;"><div class="city-name">
																오사카(간사이)<span class="sub">KIX</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="JP" data-areacode="RGTP000002"
																data-latitude="34.452600000000004"
																data-longitude="135.3449" data-stationcode="KIX"
																data-stationtype="DEP" data-stationname="오사카(간사이)">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide"
															style="display: none;"><div class="city-name">
																후쿠오카<span class="sub">FUK</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="JP" data-areacode="RGTP000002"
																data-latitude="33.54560000000001"
																data-longitude="130.47119999999998"
																data-stationcode="FUK" data-stationtype="DEP"
																data-stationname="후쿠오카">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide"
															style="display: none;"><div class="city-name">
																나고야<span class="sub">NGO</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="JP" data-areacode="RGTP000002"
																data-latitude="34.71190000000001"
																data-longitude="136.683" data-stationcode="NGO"
																data-stationtype="DEP" data-stationname="나고야">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide"
															style="display: none;"><div class="city-name">
																삿포로<span class="sub">CTS</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="JP" data-areacode="RGTP000002"
																data-latitude="42.6745" data-longitude="141.6009"
																data-stationcode="CTS" data-stationtype="DEP"
																data-stationname="삿포로">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide"
															style="display: none;"><div class="city-name">
																오키나와<span class="sub">OKA</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="JP" data-areacode="RGTP000002"
																data-latitude="26.32" data-longitude="127.59"
																data-stationcode="OKA" data-stationtype="DEP"
																data-stationname="오키나와">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide"
															style="display: none;"><div class="city-name">
																웨이하이<span class="sub">WEH</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="CN" data-areacode="RGTP000002"
																data-latitude="37.50000000000001"
																data-longitude="122.25000000000001"
																data-stationcode="WEH" data-stationtype="DEP"
																data-stationname="웨이하이">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide"
															style="display: none;"><div class="city-name">
																하얼빈<span class="sub">HRB</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="CN" data-areacode="RGTP000002"
																data-latitude="45.650000000000006"
																data-longitude="126.60000000000001"
																data-stationcode="HRB" data-stationtype="DEP"
																data-stationname="하얼빈">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide"
															style="display: none;"><div class="city-name">
																옌지<span class="sub">YNJ</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="CN" data-areacode="RGTP000002"
																data-latitude="42.59" data-longitude="129.5"
																data-stationcode="YNJ" data-stationtype="DEP"
																data-stationname="옌지">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide"
															style="display: none;"><div class="city-name">
																다낭<span class="sub">DAD</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="VN" data-areacode="RGTP000003"
																data-latitude="16.2232"
																data-longitude="108.32130000000001"
																data-stationcode="DAD" data-stationtype="DEP"
																data-stationname="다낭">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide"
															style="display: none;"><div class="city-name">
																나트랑/냐짱<span class="sub">CXR</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="VN" data-areacode="RGTP000003"
																data-latitude="11.7937"
																data-longitude="109.33300000000001"
																data-stationcode="CXR" data-stationtype="DEP"
																data-stationname="나트랑/냐짱">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide"
															style="display: none;"><div class="city-name">
																방콕<span class="sub">BKK</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="TH" data-areacode="RGTP000003"
																data-latitude="13.610899999999999"
																data-longitude="100.6456" data-stationcode="BKK"
																data-stationtype="DEP" data-stationname="방콕">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide"
															style="display: none;"><div class="city-name">
																치앙마이<span class="sub">CNX</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="TH" data-areacode="RGTP000003"
																data-latitude="18.6619" data-longitude="98.7806"
																data-stationcode="CNX" data-stationtype="DEP"
																data-stationname="치앙마이">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide"
															style="display: none;"><div class="city-name">
																마닐라<span class="sub">MNL</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="PH" data-areacode="RGTP000003"
																data-latitude="14.5036"
																data-longitude="121.21060000000001"
																data-stationcode="MNL" data-stationtype="DEP"
																data-stationname="마닐라">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide"
															style="display: none;"><div class="city-name">
																세부<span class="sub">CEB</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="PH" data-areacode="RGTP000003"
																data-latitude="10.3954" data-longitude="123.7424"
																data-stationcode="CEB" data-stationtype="DEP"
																data-stationname="세부">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide"
															style="display: none;"><div class="city-name">
																보홀<span class="sub">TAG</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="PH" data-areacode="RGTP000003"
																data-latitude="9.5951"
																data-longitude="123.71150000000002"
																data-stationcode="TAG" data-stationtype="DEP"
																data-stationname="보홀">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide"
															style="display: none;"><div class="city-name">
																클락<span class="sub">CRK</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="PH" data-areacode="RGTP000003"
																data-latitude="15.31"
																data-longitude="120.53000000000002"
																data-stationcode="CRK" data-stationtype="DEP"
																data-stationname="클락">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide"
															style="display: none;"><div class="city-name">
																싱가포르<span class="sub">SIN</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="SG" data-areacode="RGTP000003"
																data-latitude="1.4129"
																data-longitude="103.74380000000001"
																data-stationcode="SIN" data-stationtype="DEP"
																data-stationname="싱가포르">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide"
															style="display: none;"><div class="city-name">
																코타키나발루<span class="sub">BKI</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="MY" data-areacode="RGTP000003"
																data-latitude="5.762700000000001"
																data-longitude="116.23" data-stationcode="BKI"
																data-stationtype="DEP" data-stationname="코타키나발루">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide"
															style="display: none;"><div class="city-name">
																괌<span class="sub">GUM</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="GU" data-areacode="RGTP000004"
																data-latitude="13.4848" data-longitude="144.6728"
																data-stationcode="GUM" data-stationtype="DEP"
																data-stationname="괌">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a><a class="tab-swipe-item swiper-slide"
															style="display: none;"><div class="city-name">
																사이판<span class="sub">SPN</span>
															</div>
															<button type="button" name="btnAAMChartAirport"
																class="btn-choose-city js-choose-city"
																data-countrycode="MP" data-areacode="RGTP000004"
																data-latitude="15.2722" data-longitude="145.6242"
																data-stationcode="SPN" data-stationtype="DEP"
																data-stationname="사이판">선택</button>
															<button type="button"
																onclick="javascript:clickBtnFavorites(this);"
																class="btn-wish">
																<span class="hidden">즐겨찾기</span>
															</button></a>
													</div>
													<div class="swiper-scrollbar"></div>
												</div>
											</div>
											<button type="button" class="floating-button btn-list"
												onclick="viewTabMap('start', 'list')">
												<span class="hidden">리스트보기</span>
												<!-- 리스트보기 -->
											</button>
										</div>
										<a href="#a" class="layer-close"><span class="blind">닫기</span></a>
										<!-- 닫기 -->
									</div>
									<div class="flight-layer flight-target" id="arrAirportLayer">
										<div class="layer-header">
											<div class="header__input-wrap input is-focus"
												data-element="form">
												<button type="button" class="header__button"
													name="header_btn">
													<span class="hidden">이전으로</span>
												</button>
												<!-- 이전으로 -->
												<button type="button" class="header__input-search">
													<img
														src="https://static.jejuair.net/hpgg/resources/images/icon/icon-header-search.png"
														alt="검색">
												</button>
												<input type="text" id="txtARRAirport" class="header__input"
													data-element="input" placeholder="어디로 여행가세요?">
												<!--어디로 여행가세요?-->
												<p class="map-list-txt" id="mapARRAirport">어디로 여행가세요?</p>
												<!--어디에서 출발하세요?-->
												<button type="button" data-element="remove"
													class="input__remove-button">
													<span class="hidden">삭제</span>
												</button>
												<!-- 삭제 -->
											</div>
											<div id="divARRAirportAC" name="search_auto"
												target="txtArrAirport"></div>
										</div>
										<div class="txt-list">
											<div class="header-sub" data-element="tab">
												<div class="tab__buttons">
													<div data-element="tab__list" class="tab__button"
														role="presentation">
														<button type="button" class="tab__anchor is-active"
															id="arr_selectTab01" data-element="tab__anchor"
															data-index="0" role="tab" tabindex=""
															aria-selected="true" aria-expanded="true">최근 검색</button>
														<!-- 최근 검색 -->
													</div>
													<div data-element="tab__list" class="tab__button"
														role="presentation">
														<button type="button" class="tab__anchor"
															id="arr_selectTab02" data-element="tab__anchor"
															data-index="1" role="tab" tabindex=""
															aria-selected="false" aria-expanded="false">즐겨찾기</button>
														<!-- 즐겨찾기 -->
													</div>
													<div data-element="tab__list" class="tab__button"
														role="presentation" name="divPromotion">
														<button type="button" class="tab__anchor"
															id="arr_selectTab03" data-element="tab__anchor"
															data-index="2" role="tab" tabindex=""
															aria-selected="false" aria-expanded="false">프로모션</button>
														<!-- 프로모션 -->
													</div>
												</div>
												<div data-element="tab__panel" class="tab__panel is-active"
													aria-labelledby="arr_selectTab01" role="tabpanel"
													tabindex="0">
													<div data-element="tab">
														<div class="tab__button-wrap">
															<div class="tag-list" data-scroll="x" name="latelySearch"></div>
														</div>
													</div>
												</div>
												<div data-element="tab__panel" class="tab__panel"
													aria-labelledby="arr_selectTab02" role="tabpanel"
													tabindex="0" style="display: none;">
													<div data-element="tab">
														<div class="tab__button-wrap">
															<div class="tag-list" data-scroll="x" name="favorites"></div>
														</div>
													</div>
												</div>
												<div data-element="tab__panel" class="tab__panel"
													aria-labelledby="arr_selectTab03" role="tabpanel"
													tabindex="0" style="display: none;">
													<div data-element="tab">
														<div class="tab__button-wrap">
															<div class="tag-list" data-scroll="x"
																name="promotionSearch"></div>
														</div>
													</div>
												</div>
											</div>
											<div class="main--destination-select">
												<hr class="booking-line">
												<div data-element="tab"
													class="tab tab--vertical tab--booking">
													<div class="tab__buttons vertical_scroll_set"
														id="divArrArea"></div>
													<div class="tab__panel-wrap scrollbar-inner"
														data-element="tab__panel-wrap"></div>
												</div>
												<!--<button type="button" class="floating-button btn-map" onclick="viewTabMap('target','map')">
								<span class="hidden">지도 보기</span>
	                    	</button>-->
											</div>
										</div>
										<div class="map-list">
											<div class="map-wrap">
												<div id="map-target" class="flight-map"></div>
												<div class="tab-top">
													<ul class="tab-top-list"></ul>
												</div>
												<div class="tab-swipe">
													<div class="tab-swipe-wrapper swiper-wrapper"></div>
													<div class="swiper-scrollbar"></div>
												</div>
											</div>
											<button type="button" class="floating-button btn-list"
												onclick="viewTabMap('target', 'list')">
												<span class="hidden">리스트보기</span>
											</button>
										</div>
										<a href="#a" class="layer-close"><span class="blind">닫기</span></a>
										<!-- 닫기 -->
									</div>
									<div class="date-layer" id="dateLayer">
										<div class="layer-header">
											<button type="button" class="header__button"
												name="header_btn">
												<span class="hidden">이전으로</span>
											</button>
											<h2 class="customer-layer__title">언제 떠나세요?</h2>
											<!-- 언제 떠나세요? -->
										</div>
										<div class="layer-content">
											<div class="booking-trip mobile-only">
												<div class="booking-trip__from" name="divFromDate">
													<span class="location"></span>
												</div>
												<span class="booking-trip__direction round-trip"></span>
												<div class="booking-trip__to">
													<span class="location"></span>
												</div>
											</div>
											<div class="picker picker--full">
												<div class="info-wrap">
													<span class="info">1인 편도 운임 기준</span><span class="currency"
														name="currency"></span>
												</div>
												<!-- 1인 편도 운임 기준 -->
												<div class="flatpickr-wrapper">
													<input type="text" class="picker__input flatpickr-input"
														id="selectDate" data-picker="range"
														data-text="1인 편도 운임 기준" data-locale="ko"
														data-min-date="today" data-format="Y.m.d (D)"
														data-range-text="{&quot;start&quot;: &quot;가는 날&quot;, &quot;end&quot;: &quot;오는날&quot;, &quot;current&quot;: &quot;왕복&quot;}"
														readonly="readonly">
													<div
														class="flatpickr-calendar rangeMode animate multiMonth inline"
														tabindex="-1" style="">
														<div class="flatpickr-months">
															<span class="flatpickr-prev-month flatpickr-disabled"></span>
															<div class="flatpickr-month">
																<div class="flatpickr-current-month">
																	<div class="numInputWrapper">
																		<input class="numInput cur-year" type="number"
																			tabindex="-1" aria-label="Year" min="2022"><span
																			class="arrowUp"></span><span class="arrowDown"></span>
																	</div>
																	<span class="cur-month">11월 </span>
																</div>
															</div>
															<div class="flatpickr-month">
																<div class="flatpickr-current-month">
																	<div class="numInputWrapper">
																		<input class="numInput cur-year" type="number"
																			tabindex="-1" aria-label="Year" min="2022"><span
																			class="arrowUp"></span><span class="arrowDown"></span>
																	</div>
																	<span class="cur-month">12월 </span>
																</div>
															</div>
															<span class="flatpickr-next-month"></span>
														</div>
														<div class="flatpickr-innerContainer">
															<div class="flatpickr-rContainer">
																<div class="flatpickr-weekdays">
																	<div class="flatpickr-weekdaycontainer">
																		<span class="flatpickr-weekday"> 일</span><span
																			class="flatpickr-weekday">월</span><span
																			class="flatpickr-weekday">화</span><span
																			class="flatpickr-weekday">수</span><span
																			class="flatpickr-weekday">목</span><span
																			class="flatpickr-weekday">금</span><span
																			class="flatpickr-weekday">토 </span>
																	</div>
																	<div class="flatpickr-weekdaycontainer">
																		<span class="flatpickr-weekday"> 일</span><span
																			class="flatpickr-weekday">월</span><span
																			class="flatpickr-weekday">화</span><span
																			class="flatpickr-weekday">수</span><span
																			class="flatpickr-weekday">목</span><span
																			class="flatpickr-weekday">금</span><span
																			class="flatpickr-weekday">토 </span>
																	</div>
																</div>
																<div class="flatpickr-days" tabindex="-1">
																	<div class="dayContainer">
																		<span
																			class="flatpickr-day prevMonthDay hidden flatpickr-disabled sun"
																			aria-label="20221030">30<span class="date"
																			aria-hidden="true">30</span></span><span
																			class="flatpickr-day prevMonthDay hidden flatpickr-disabled mon"
																			aria-label="20221031">31<span class="date"
																			aria-hidden="true">31</span></span><span
																			class="flatpickr-day flatpickr-disabled tue"
																			aria-label="20221101">1<span class="date"
																			aria-hidden="true">1</span></span><span
																			class="flatpickr-day flatpickr-disabled wed"
																			aria-label="20221102">2<span class="date"
																			aria-hidden="true">2</span></span><span
																			class="flatpickr-day flatpickr-disabled thu"
																			aria-label="20221103">3<span class="date"
																			aria-hidden="true">3</span></span><span
																			class="flatpickr-day flatpickr-disabled fri"
																			aria-label="20221104">4<span class="date"
																			aria-hidden="true">4</span></span><span
																			class="flatpickr-day flatpickr-disabled sat"
																			aria-label="20221105">5<span class="date"
																			aria-hidden="true">5</span></span><span
																			class="flatpickr-day flatpickr-disabled sun"
																			aria-label="20221106">6<span class="date"
																			aria-hidden="true">6</span></span><span
																			class="flatpickr-day flatpickr-disabled mon"
																			aria-label="20221107">7<span class="date"
																			aria-hidden="true">7</span></span><span
																			class="flatpickr-day flatpickr-disabled tue"
																			aria-label="20221108">8<span class="date"
																			aria-hidden="true">8</span></span><span
																			class="flatpickr-day flatpickr-disabled wed"
																			aria-label="20221109">9<span class="date"
																			aria-hidden="true">9</span></span><span
																			class="flatpickr-day flatpickr-disabled thu"
																			aria-label="20221110">10<span class="date"
																			aria-hidden="true">10</span></span><span
																			class="flatpickr-day flatpickr-disabled fri"
																			aria-label="20221111">11<span class="date"
																			aria-hidden="true">11</span></span><span
																			class="flatpickr-day flatpickr-disabled sat"
																			aria-label="20221112">12<span class="date"
																			aria-hidden="true">12</span></span><span
																			class="flatpickr-day today sun" aria-label="20221113"
																			aria-current="date" tabindex="-1">13<span
																			class="date" aria-hidden="true">13</span></span><span
																			class="flatpickr-day mon" aria-label="20221114"
																			tabindex="-1">14<span class="date"
																			aria-hidden="true">14</span></span><span
																			class="flatpickr-day tue" aria-label="20221115"
																			tabindex="-1">15<span class="date"
																			aria-hidden="true">15</span></span><span
																			class="flatpickr-day wed" aria-label="20221116"
																			tabindex="-1">16<span class="date"
																			aria-hidden="true">16</span></span><span
																			class="flatpickr-day thu" aria-label="20221117"
																			tabindex="-1">17<span class="date"
																			aria-hidden="true">17</span></span><span
																			class="flatpickr-day fri" aria-label="20221118"
																			tabindex="-1">18<span class="date"
																			aria-hidden="true">18</span></span><span
																			class="flatpickr-day sat" aria-label="20221119"
																			tabindex="-1">19<span class="date"
																			aria-hidden="true">19</span></span><span
																			class="flatpickr-day sun" aria-label="20221120"
																			tabindex="-1">20<span class="date"
																			aria-hidden="true">20</span></span><span
																			class="flatpickr-day mon" aria-label="20221121"
																			tabindex="-1">21<span class="date"
																			aria-hidden="true">21</span></span><span
																			class="flatpickr-day tue" aria-label="20221122"
																			tabindex="-1">22<span class="date"
																			aria-hidden="true">22</span></span><span
																			class="flatpickr-day wed" aria-label="20221123"
																			tabindex="-1">23<span class="date"
																			aria-hidden="true">23</span></span><span
																			class="flatpickr-day thu" aria-label="20221124"
																			tabindex="-1">24<span class="date"
																			aria-hidden="true">24</span></span><span
																			class="flatpickr-day fri" aria-label="20221125"
																			tabindex="-1">25<span class="date"
																			aria-hidden="true">25</span></span><span
																			class="flatpickr-day sat" aria-label="20221126"
																			tabindex="-1">26<span class="date"
																			aria-hidden="true">26</span></span><span
																			class="flatpickr-day sun" aria-label="20221127"
																			tabindex="-1">27<span class="date"
																			aria-hidden="true">27</span></span><span
																			class="flatpickr-day mon" aria-label="20221128"
																			tabindex="-1">28<span class="date"
																			aria-hidden="true">28</span></span><span
																			class="flatpickr-day tue" aria-label="20221129"
																			tabindex="-1">29<span class="date"
																			aria-hidden="true">29</span></span><span
																			class="flatpickr-day wed" aria-label="20221130"
																			tabindex="-1">30<span class="date"
																			aria-hidden="true">30</span></span><span
																			class="flatpickr-day nextMonthDay hidden thu"
																			aria-label="20221201" tabindex="-1">1<span
																			class="date" aria-hidden="true">1</span></span><span
																			class="flatpickr-day nextMonthDay hidden fri"
																			aria-label="20221202" tabindex="-1">2<span
																			class="date" aria-hidden="true">2</span></span><span
																			class="flatpickr-day nextMonthDay hidden sat"
																			aria-label="20221203" tabindex="-1">3<span
																			class="date" aria-hidden="true">3</span></span>
																		<div class="yearMonthContainer">
																			<span class="year">2022</span><span
																				class="sepherator">.</span><span class="month">11</span>
																		</div>
																	</div>
																	<div class="dayContainer">
																		<span class="flatpickr-day prevMonthDay hidden sun"
																			aria-label="20221127" tabindex="-1">27<span
																			class="date" aria-hidden="true">27</span></span><span
																			class="flatpickr-day prevMonthDay hidden mon"
																			aria-label="20221128" tabindex="-1">28<span
																			class="date" aria-hidden="true">28</span></span><span
																			class="flatpickr-day prevMonthDay hidden tue"
																			aria-label="20221129" tabindex="-1">29<span
																			class="date" aria-hidden="true">29</span></span><span
																			class="flatpickr-day prevMonthDay hidden wed"
																			aria-label="20221130" tabindex="-1">30<span
																			class="date" aria-hidden="true">30</span></span><span
																			class="flatpickr-day thu" aria-label="20221201"
																			tabindex="-1">1<span class="date"
																			aria-hidden="true">1</span></span><span
																			class="flatpickr-day fri" aria-label="20221202"
																			tabindex="-1">2<span class="date"
																			aria-hidden="true">2</span></span><span
																			class="flatpickr-day sat" aria-label="20221203"
																			tabindex="-1">3<span class="date"
																			aria-hidden="true">3</span></span><span
																			class="flatpickr-day sun" aria-label="20221204"
																			tabindex="-1">4<span class="date"
																			aria-hidden="true">4</span></span><span
																			class="flatpickr-day mon" aria-label="20221205"
																			tabindex="-1">5<span class="date"
																			aria-hidden="true">5</span></span><span
																			class="flatpickr-day tue" aria-label="20221206"
																			tabindex="-1">6<span class="date"
																			aria-hidden="true">6</span></span><span
																			class="flatpickr-day wed" aria-label="20221207"
																			tabindex="-1">7<span class="date"
																			aria-hidden="true">7</span></span><span
																			class="flatpickr-day thu" aria-label="20221208"
																			tabindex="-1">8<span class="date"
																			aria-hidden="true">8</span></span><span
																			class="flatpickr-day fri" aria-label="20221209"
																			tabindex="-1">9<span class="date"
																			aria-hidden="true">9</span></span><span
																			class="flatpickr-day sat" aria-label="20221210"
																			tabindex="-1">10<span class="date"
																			aria-hidden="true">10</span></span><span
																			class="flatpickr-day sun" aria-label="20221211"
																			tabindex="-1">11<span class="date"
																			aria-hidden="true">11</span></span><span
																			class="flatpickr-day mon" aria-label="20221212"
																			tabindex="-1">12<span class="date"
																			aria-hidden="true">12</span></span><span
																			class="flatpickr-day tue" aria-label="20221213"
																			tabindex="-1">13<span class="date"
																			aria-hidden="true">13</span></span><span
																			class="flatpickr-day wed" aria-label="20221214"
																			tabindex="-1">14<span class="date"
																			aria-hidden="true">14</span></span><span
																			class="flatpickr-day thu" aria-label="20221215"
																			tabindex="-1">15<span class="date"
																			aria-hidden="true">15</span></span><span
																			class="flatpickr-day fri" aria-label="20221216"
																			tabindex="-1">16<span class="date"
																			aria-hidden="true">16</span></span><span
																			class="flatpickr-day sat" aria-label="20221217"
																			tabindex="-1">17<span class="date"
																			aria-hidden="true">17</span></span><span
																			class="flatpickr-day sun" aria-label="20221218"
																			tabindex="-1">18<span class="date"
																			aria-hidden="true">18</span></span><span
																			class="flatpickr-day mon" aria-label="20221219"
																			tabindex="-1">19<span class="date"
																			aria-hidden="true">19</span></span><span
																			class="flatpickr-day tue" aria-label="20221220"
																			tabindex="-1">20<span class="date"
																			aria-hidden="true">20</span></span><span
																			class="flatpickr-day wed" aria-label="20221221"
																			tabindex="-1">21<span class="date"
																			aria-hidden="true">21</span></span><span
																			class="flatpickr-day thu" aria-label="20221222"
																			tabindex="-1">22<span class="date"
																			aria-hidden="true">22</span></span><span
																			class="flatpickr-day fri" aria-label="20221223"
																			tabindex="-1">23<span class="date"
																			aria-hidden="true">23</span></span><span
																			class="flatpickr-day sat" aria-label="20221224"
																			tabindex="-1">24<span class="date"
																			aria-hidden="true">24</span></span><span
																			class="flatpickr-day sun" aria-label="20221225"
																			tabindex="-1">25<span class="date"
																			aria-hidden="true">25</span></span><span
																			class="flatpickr-day mon" aria-label="20221226"
																			tabindex="-1">26<span class="date"
																			aria-hidden="true">26</span></span><span
																			class="flatpickr-day tue" aria-label="20221227"
																			tabindex="-1">27<span class="date"
																			aria-hidden="true">27</span></span><span
																			class="flatpickr-day wed" aria-label="20221228"
																			tabindex="-1">28<span class="date"
																			aria-hidden="true">28</span></span><span
																			class="flatpickr-day thu" aria-label="20221229"
																			tabindex="-1">29<span class="date"
																			aria-hidden="true">29</span></span><span
																			class="flatpickr-day fri" aria-label="20221230"
																			tabindex="-1">30<span class="date"
																			aria-hidden="true">30</span></span><span
																			class="flatpickr-day sat" aria-label="20221231"
																			tabindex="-1">31<span class="date"
																			aria-hidden="true">31</span></span>
																		<div class="yearMonthContainer">
																			<span class="year">2022</span><span
																				class="sepherator">.</span><span class="month">12</span>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="booking-button cal-button">
												<button type="button" id="dateClear"
													class="button button--primary button--black pc-only"
													data-station="DEP" data-reset-date="#selectDate">
													<span class="button__text">초기화</span>
													<!-- 초기화 -->
												</button>
												<button type="button"
													class="button button--primary button--active"
													data-select-date="#selectDate" rel="modal:close">
													<span class="button__text">선택</span>
													<!-- 선택 -->
												</button>
											</div>
										</div>
										<a href="#a" class="layer-close"><span class="blind">닫기</span></a>
										<!-- 닫기 -->
									</div>
									<div class="customer-layer" id="customerLayer">
										<div class="layer-header">
											<button type="button" class="header__button"
												name="header_btn">
												<span class="hidden">이전으로</span>
											</button>
											<h2 class="customer-layer__title">누구와 함께 떠나세요?</h2>
											<!-- 누구와 함께 떠나세요? -->
										</div>
										<div class="layer-content">
											<div class="booking-trip">
												<div class="booking-trip__from" id="divFromPas">
													<span class="location"></span>
												</div>
												<span class="booking-trip__switch"><span
													class="hidden">에서</span></span>
												<div class="booking-trip__to" id="divToPax">
													<span class="location"></span>
												</div>
											</div>
											<hr class="section-spacer">
											<div class="booking-members">
												<div class="input-wrap input--line">
													<div class="input-row input-row--number input-row--icon">
														<label for="adtCount" class="input__label">성인</label>
														<!-- 성인 -->
														<div data-element="form"
															class="input input--number is-active">
															<button type="button" data-element="number__button"
																onclick="javascript:chkAdtCount('');"
																data-type="decrease"
																class="input__number input__number-minus"
																aria-label="빼기" disabled=""></button>
															<input type="text" id="adtCount" placeholder="숫자입력"
																data-element="number__input" value="1" data-max="9"
																data-min="1" data-string-number="" class="input__number">
															<button type="button" data-element="number__button"
																data-type="increase"
																class="input__number input__number-plus"
																aria-label="더하기"></button>
														</div>
														<p class="text__small text--color-gray" id="adtMsg">12세
															이상</p>
														<!--12세 이상 -->
													</div>
													<div class="input-row input-row--number input-row--icon">
														<label for="chdCount" class="input__label">소아</label>
														<!-- 소아 -->
														<div data-element="form"
															class="input input--number is-active">
															<button type="button" data-element="number__button"
																data-type="decrease"
																class="input__number input__number-minus"
																aria-label="빼기" disabled=""></button>
															<input type="text" id="chdCount" placeholder="숫자입력"
																data-element="number__input" value="0" data-max="9"
																data-min="0" data-string-number="" class="input__number">
															<button type="button" data-element="number__button"
																data-type="increase"
																class="input__number input__number-plus"
																aria-label="더하기"></button>
														</div>
														<p class="text__small text--color-gray" name="chdMsg">국제선
															기준 만 2세~12세 미만</p>
														<!-- 국제선 기준<br>만 2세 ~ 만 12세 미만 -->
													</div>
													<div class="input-row input-row--number input-row--icon">
														<label for="infCount" class="input__label">유아</label>
														<!-- 유아 -->
														<div data-element="form"
															class="input input--number is-active">
															<button type="button" data-element="number__button"
																data-type="decrease"
																class="input__number input__number-minus"
																aria-label="빼기" disabled=""></button>
															<input type="text" id="infCount" placeholder="숫자입력"
																data-element="number__input" value="0" data-max="9"
																data-min="0" data-string-number="" class="input__number">
															<button type="button" id="btnInfCount"
																onclick="javascript:chkInfCount('');"
																data-element="number__button" data-type="increase"
																class="input__number input__number-plus"
																aria-label="더하기"></button>
														</div>
														<p class="text__small text--color-gray" name="infantDesc">
															생후 7일 이상~만 2세 미만<br>(만 24개월 미만)
														</p>
														<!--생후 7일 이상~만 2세 미만-->
													</div>
												</div>
											</div>

											<div class="pc-40 mo-30">
												<!--20210520 class명 변경-->
												<div data-element="toggle"
													class="toggle-item toggle-item--booking"
													data-options="{&quot;mode&quot;: &quot;slide&quot;}">
													<div class="toggle-item__title">
														<button type="button" data-element="toggle__anchor"
															class="toggle-item__anchor" aria-controls="toggle-2"
															aria-expanded="false">나이계산기</button>
														<!-- 나이계산기 -->
													</div>
													<div data-element="toggle__panel"
														class="toggle-item__content" id="toggle-2">
														<div class="input-wrap input--line">
															<div class="input-row input-row--label">
																<div class="input-label">생년월일</div>
																<!-- 생년월일 -->
																<div class="input-item">
																	<div class="input-flex">
																		<div class="input-box">
																			<div class="input" data-element="form">
																				<input type="text"
																					class="input__text input__text--placeholder"
																					name="txtCalYear" maxlength="4"
																					data-element="input" title="연도 입력" placeholder="년">
																				<button type="button" data-element="remove"
																					class="input__remove-button">삭제</button>
																				<!-- 삭제 -->
																			</div>
																		</div>
																		<div class="input-box">
																			<div class="select-wrap select-wrap--line">
																				<select class="select-wrap__select selected"
																					title="월 선택" name="selCalMonth">
																					<option value="0" disabled="" selected="" hidden="">월</option>
																					<!-- 월 -->
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
																				<select class="select-wrap__select" title="일 선택"
																					name="selCalDate">
																					<option value="">일</option>
																					<!-- 일 -->
																				</select>
																			</div>
																		</div>
																	</div>
																	<p tabindex="0" class="input__error" id="calcError"></p>
																</div>
															</div>
														</div>
														<div class="button-wrap button-wrap--center mt10">
															<button type="button" class="button button--optional"
																onclick="javascript:calcAge();">
																<span class="button__text">계산하기</span>
															</button>
															<!-- 계산하기 -->
														</div>
														<div class="notice-box--white" name="calcMsg"
															style="display: none;"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="fixed-wrap fixed-wrap--multi-line border-none">
											<div class="button-wrap">
												<button type="button" class="button button--active"
													name="btnSetPassenger">
													<span class="button__text">선택 완료</span>
												</button>
												<!-- 선택 완료 -->
											</div>
										</div>
										<a href="#a" class="layer-close"><span class="blind">닫기</span></a>
										<!-- 닫기 -->
									</div>
								</div>
								<div class="ticketing-row-top multi" style="display: none;">
									<div class="ticketing-target">
										<button type="button" class="start js-target-pick">
											<span class="txt before-select" id="spanMultiDepartureDesc">출발지</span>
											<!-- 출발지 -->
										</button>
										<input type="hidden" id="multiDepartureData">
										<button type="button" class="target js-target-pick">
											<span class="txt before-select" id="spanMultiArrivalDesc">도착지</span>
											<!-- 도착지 -->
										</button>
										<input type="hidden" id="multiArrivalData">
										<button type="button" class="btn-open js-target-pick"
											data-route="Multi" id="btnExchangeRoute2">
											<span class="blind">열기</span>
										</button>
									</div>
									<div class="ticketing-date">



										<button type="button" class="btn-date" id="btnMultiDatePicker">
											<span class="txt">2022.11.13(일)</span>
										</button>
										<input type="hidden" id="multiArrivalDate" value="2022-11-13">
									</div>
								</div>
								<div class="ticketing-row-hidden multi" style="display: none;">
									<div class="flight-layer flight-start flight-start01"
										id="depMultiAirportLayer" style="display: none;">
										<div class="layer-header">
											<div class="header__input-wrap input is-focus"
												data-element="form">
												<button type="button" class="header__button"
													name="header_btn">
													<span class="hidden">이전으로</span>
												</button>
												<button type="button" class="header__input-search">
													<img
														src="https://static.jejuair.net/hpgg/resources/images/icon/icon-header-search.png"
														alt="검색">
												</button>
												<input type="text" id="txtMultiDEPAirport"
													class="header__input" data-element="input"
													placeholder="어디에서 출발하세요?">
												<!-- 어디에서 출발하세요? -->
												<button type="button" data-element="remove"
													class="input__remove-button">
													<span class="hidden">삭제</span>
												</button>
												<!-- 삭제 -->
											</div>
											<div id="divMultiDEPAirportAC" name="search_auto"
												target="txtMultiDEPAirport"></div>
										</div>
										<div class="txt-list">
											<div class="header-sub" data-element="tab">
												<div class="tab__buttons">
													<div data-element="tab__list" class="tab__button"
														role="presentation">
														<button type="button" class="tab__anchor is-active"
															id="dep_selectTab01" data-element="tab__anchor"
															data-index="0" role="tab" tabindex=""
															aria-selected="true" aria-expanded="true">최근 검색</button>
														<!-- 최근 검색 -->
													</div>
													<div data-element="tab__list" class="tab__button"
														role="presentation">
														<button type="button" class="tab__anchor"
															id="dep_selectTab02" data-element="tab__anchor"
															data-index="1" role="tab" tabindex=""
															aria-selected="false" aria-expanded="false">즐겨찾기</button>
														<!-- 즐겨찾기 -->
													</div>
												</div>
												<div data-element="tab__panel" class="tab__panel is-active"
													aria-labelledby="dep_selectTab01" role="tabpanel"
													tabindex="0">
													<div data-element="tab">
														<div class="tab__button-wrap">
															<div class="tag-list" data-scroll="x" name="latelySearch"></div>
														</div>
													</div>
												</div>
												<div data-element="tab__panel" class="tab__panel"
													aria-labelledby="dep_selectTab02" role="tabpanel"
													tabindex="0" style="display: none;">
													<div data-element="tab">
														<div class="tab__button-wrap">
															<div class="tag-list" data-scroll="x" name="favorites"></div>
														</div>
													</div>
												</div>
											</div>
											<div class="main--destination-select">
												<hr class="booking-line">
												<div data-element="tab"
													class="tab tab--vertical tab--booking">
													<div class="tab__buttons vertical_scroll_set"
														id="divMultiDepArea"></div>
													<div class="tab__panel-wrap scrollbar-inner"
														data-element="tab__panel-wrap"></div>
												</div>
												<!--<button type="button" class="floating-button btn-map" onclick="viewTabMap('start','map')">
								<span class="hidden">지도 보기</span>
	                    	</button>-->
											</div>
										</div>
										<div class="map-list">
											<div class="map-wrap">
												<div id="map-start" class="flight-map"></div>
												<div class="tab-top">
													<ul class="tab-top-list"></ul>
												</div>
												<div class="tab-swipe">
													<div class="tab-swipe-wrapper swiper-wrapper"></div>
													<div class="swiper-scrollbar"></div>
												</div>
											</div>
											<button type="button" class="floating-button btn-list"
												onclick="viewTabMap('start', 'list')">
												<span class="hidden">리스트보기</span>
											</button>
										</div>
										<a href="#a" class="layer-close"><span class="blind">닫기</span></a>
										<!-- 닫기 -->
									</div>
									<div class="flight-layer flight-target flight-target01"
										id="arrMultiAirportLayer" style="display: none;">
										<div class="layer-header">
											<div class="header__input-wrap input is-focus"
												data-element="form">
												<button type="button" class="header__button"
													name="header_btn">
													<span class="hidden">이전으로</span>
												</button>
												<button type="button" class="header__input-search">
													<img
														src="https://static.jejuair.net/hpgg/resources/images/icon/icon-header-search.png"
														alt="검색">
												</button>
												<input type="text" id="txtMultiARRAirport"
													class="header__input" data-element="input"
													placeholder="어디로 여행가세요?">
												<!--어디로 여행가세요?-->
												<button type="button" data-element="remove"
													class="input__remove-button">
													<span class="hidden">삭제</span>
												</button>
												<!-- 삭제 -->
											</div>
											<div id="divMultiARRAirportAC" name="search_auto"
												target="txtMultiARRAirport"></div>
										</div>
										<div class="txt-list">
											<div class="header-sub" data-element="tab">
												<div class="tab__buttons">
													<div data-element="tab__list" class="tab__button"
														role="presentation">
														<button type="button" class="tab__anchor is-active"
															id="arr_selectTab01" data-element="tab__anchor"
															data-index="0" role="tab" tabindex=""
															aria-selected="true" aria-expanded="true">최근 검색</button>
														<!-- 최근 검색 -->
													</div>
													<div data-element="tab__list" class="tab__button"
														role="presentation">
														<button type="button" class="tab__anchor"
															id="arr_selectTab02" data-element="tab__anchor"
															data-index="1" role="tab" tabindex=""
															aria-selected="false" aria-expanded="false">즐겨찾기</button>
														<!-- 즐겨찾기 -->
													</div>
												</div>
												<div data-element="tab__panel" class="tab__panel is-active"
													aria-labelledby="arr_selectTab01" role="tabpanel"
													tabindex="0">
													<div data-element="tab">
														<div class="tab__button-wrap">
															<div class="tag-list" data-scroll="x" name="latelySearch"></div>
														</div>
													</div>
												</div>
												<div data-element="tab__panel" class="tab__panel"
													aria-labelledby="arr_selectTab02" role="tabpanel"
													tabindex="0" style="display: none;">
													<div data-element="tab">
														<div class="tab__button-wrap">
															<div class="tag-list" data-scroll="x" name="favorites"></div>
														</div>
													</div>
												</div>
											</div>
											<div class="main--destination-select">
												<hr class="booking-line">
												<div data-element="tab"
													class="tab tab--vertical tab--booking">
													<div class="tab__buttons vertical_scroll_set"
														id="divMultiArrArea"></div>
													<div class="tab__panel-wrap scrollbar-inner"
														data-element="tab__panel-wrap"></div>
												</div>
												<!--<button type="button" class="floating-button btn-map" onclick="viewTabMap('target','map')">
								<span class="hidden">지도 보기</span>
	                    	</button>-->
											</div>
										</div>
										<div class="map-list">
											<div class="map-wrap">
												<div id="map-target" class="flight-map"></div>
												<div class="tab-top">
													<ul class="tab-top-list"></ul>
												</div>
												<div class="tab-swipe">
													<div class="tab-swipe-wrapper swiper-wrapper"></div>
													<div class="swiper-scrollbar"></div>
												</div>
											</div>
											<button type="button" class="floating-button btn-list"
												onclick="viewTabMap('target', 'list')">
												<span class="hidden">리스트보기</span>
											</button>
										</div>
										<a href="#a" class="layer-close"><span class="blind">닫기</span></a>
										<!-- 닫기 -->
									</div>
									<div class="date-layer date-layer02" id="multiDateLayer"
										style="display: none;">
										<div class="layer-header">
											<button type="button" class="header__button"
												name="header_btn">
												<span class="hidden">이전으로</span>
											</button>
											<h2 class="customer-layer__title">언제 떠나세요?</h2>
											<!-- 언제 떠나세요? -->
										</div>
										<div class="layer-content">
											<div class="booking-trip  mobile-only">
												<div class="booking-trip__from" name="divFromDate">
													<span class="location"></span>
												</div>
												<span class="booking-trip__direction one-way"></span>
												<div class="booking-trip__to">
													<span class="location"></span>
												</div>
											</div>
											<div class="picker picker--full">
												<div class="info-wrap">
													<span class="info">1인 편도 운임 기준</span><span class="currency"
														name="currency"></span>
												</div>
												<!-- 1인 편도 운임 기준 -->


												<div class="flatpickr-wrapper">
													<input type="text" class="picker__input flatpickr-input"
														id="selectMultiDate" data-picker="single"
														data-text="1인 편도 운임 기준" data-locale="ko"
														data-min-date="today" data-format="Y.m.d (D)"
														readonly="readonly">
													<div class="flatpickr-calendar animate multiMonth inline"
														tabindex="-1" style="">
														<div class="flatpickr-months">
															<span class="flatpickr-prev-month flatpickr-disabled"></span>
															<div class="flatpickr-month">
																<div class="flatpickr-current-month">
																	<div class="numInputWrapper">
																		<input class="numInput cur-year" type="number"
																			tabindex="-1" aria-label="Year" min="2022"><span
																			class="arrowUp"></span><span class="arrowDown"></span>
																	</div>
																	<span class="cur-month">11월 </span>
																</div>
															</div>
															<div class="flatpickr-month">
																<div class="flatpickr-current-month">
																	<div class="numInputWrapper">
																		<input class="numInput cur-year" type="number"
																			tabindex="-1" aria-label="Year" min="2022"><span
																			class="arrowUp"></span><span class="arrowDown"></span>
																	</div>
																	<span class="cur-month">12월 </span>
																</div>
															</div>
															<span class="flatpickr-next-month"></span>
														</div>
														<div class="flatpickr-innerContainer">
															<div class="flatpickr-rContainer">
																<div class="flatpickr-weekdays">
																	<div class="flatpickr-weekdaycontainer">
																		<span class="flatpickr-weekday"> 일</span><span
																			class="flatpickr-weekday">월</span><span
																			class="flatpickr-weekday">화</span><span
																			class="flatpickr-weekday">수</span><span
																			class="flatpickr-weekday">목</span><span
																			class="flatpickr-weekday">금</span><span
																			class="flatpickr-weekday">토 </span>
																	</div>
																	<div class="flatpickr-weekdaycontainer">
																		<span class="flatpickr-weekday"> 일</span><span
																			class="flatpickr-weekday">월</span><span
																			class="flatpickr-weekday">화</span><span
																			class="flatpickr-weekday">수</span><span
																			class="flatpickr-weekday">목</span><span
																			class="flatpickr-weekday">금</span><span
																			class="flatpickr-weekday">토 </span>
																	</div>
																</div>
																<div class="flatpickr-days" tabindex="-1">
																	<div class="dayContainer">
																		<span
																			class="flatpickr-day prevMonthDay hidden flatpickr-disabled sun"
																			aria-label="20221030">30<span class="date"
																			aria-hidden="true">30</span></span><span
																			class="flatpickr-day prevMonthDay hidden flatpickr-disabled mon"
																			aria-label="20221031">31<span class="date"
																			aria-hidden="true">31</span></span><span
																			class="flatpickr-day flatpickr-disabled tue"
																			aria-label="20221101">1<span class="date"
																			aria-hidden="true">1</span></span><span
																			class="flatpickr-day flatpickr-disabled wed"
																			aria-label="20221102">2<span class="date"
																			aria-hidden="true">2</span></span><span
																			class="flatpickr-day flatpickr-disabled thu"
																			aria-label="20221103">3<span class="date"
																			aria-hidden="true">3</span></span><span
																			class="flatpickr-day flatpickr-disabled fri"
																			aria-label="20221104">4<span class="date"
																			aria-hidden="true">4</span></span><span
																			class="flatpickr-day flatpickr-disabled sat"
																			aria-label="20221105">5<span class="date"
																			aria-hidden="true">5</span></span><span
																			class="flatpickr-day flatpickr-disabled sun"
																			aria-label="20221106">6<span class="date"
																			aria-hidden="true">6</span></span><span
																			class="flatpickr-day flatpickr-disabled mon"
																			aria-label="20221107">7<span class="date"
																			aria-hidden="true">7</span></span><span
																			class="flatpickr-day flatpickr-disabled tue"
																			aria-label="20221108">8<span class="date"
																			aria-hidden="true">8</span></span><span
																			class="flatpickr-day flatpickr-disabled wed"
																			aria-label="20221109">9<span class="date"
																			aria-hidden="true">9</span></span><span
																			class="flatpickr-day flatpickr-disabled thu"
																			aria-label="20221110">10<span class="date"
																			aria-hidden="true">10</span></span><span
																			class="flatpickr-day flatpickr-disabled fri"
																			aria-label="20221111">11<span class="date"
																			aria-hidden="true">11</span></span><span
																			class="flatpickr-day flatpickr-disabled sat"
																			aria-label="20221112">12<span class="date"
																			aria-hidden="true">12</span></span><span
																			class="flatpickr-day today sun" aria-label="20221113"
																			aria-current="date" tabindex="-1">13<span
																			class="date" aria-hidden="true">13</span></span><span
																			class="flatpickr-day mon" aria-label="20221114"
																			tabindex="-1">14<span class="date"
																			aria-hidden="true">14</span></span><span
																			class="flatpickr-day tue" aria-label="20221115"
																			tabindex="-1">15<span class="date"
																			aria-hidden="true">15</span></span><span
																			class="flatpickr-day wed" aria-label="20221116"
																			tabindex="-1">16<span class="date"
																			aria-hidden="true">16</span></span><span
																			class="flatpickr-day thu" aria-label="20221117"
																			tabindex="-1">17<span class="date"
																			aria-hidden="true">17</span></span><span
																			class="flatpickr-day fri" aria-label="20221118"
																			tabindex="-1">18<span class="date"
																			aria-hidden="true">18</span></span><span
																			class="flatpickr-day sat" aria-label="20221119"
																			tabindex="-1">19<span class="date"
																			aria-hidden="true">19</span></span><span
																			class="flatpickr-day sun" aria-label="20221120"
																			tabindex="-1">20<span class="date"
																			aria-hidden="true">20</span></span><span
																			class="flatpickr-day mon" aria-label="20221121"
																			tabindex="-1">21<span class="date"
																			aria-hidden="true">21</span></span><span
																			class="flatpickr-day tue" aria-label="20221122"
																			tabindex="-1">22<span class="date"
																			aria-hidden="true">22</span></span><span
																			class="flatpickr-day wed" aria-label="20221123"
																			tabindex="-1">23<span class="date"
																			aria-hidden="true">23</span></span><span
																			class="flatpickr-day thu" aria-label="20221124"
																			tabindex="-1">24<span class="date"
																			aria-hidden="true">24</span></span><span
																			class="flatpickr-day fri" aria-label="20221125"
																			tabindex="-1">25<span class="date"
																			aria-hidden="true">25</span></span><span
																			class="flatpickr-day sat" aria-label="20221126"
																			tabindex="-1">26<span class="date"
																			aria-hidden="true">26</span></span><span
																			class="flatpickr-day sun" aria-label="20221127"
																			tabindex="-1">27<span class="date"
																			aria-hidden="true">27</span></span><span
																			class="flatpickr-day mon" aria-label="20221128"
																			tabindex="-1">28<span class="date"
																			aria-hidden="true">28</span></span><span
																			class="flatpickr-day tue" aria-label="20221129"
																			tabindex="-1">29<span class="date"
																			aria-hidden="true">29</span></span><span
																			class="flatpickr-day wed" aria-label="20221130"
																			tabindex="-1">30<span class="date"
																			aria-hidden="true">30</span></span><span
																			class="flatpickr-day nextMonthDay hidden thu"
																			aria-label="20221201" tabindex="-1">1<span
																			class="date" aria-hidden="true">1</span></span><span
																			class="flatpickr-day nextMonthDay hidden fri"
																			aria-label="20221202" tabindex="-1">2<span
																			class="date" aria-hidden="true">2</span></span><span
																			class="flatpickr-day nextMonthDay hidden sat"
																			aria-label="20221203" tabindex="-1">3<span
																			class="date" aria-hidden="true">3</span></span>
																		<div class="yearMonthContainer">
																			<span class="year">2022</span><span
																				class="sepherator">.</span><span class="month">11</span>
																		</div>
																	</div>
																	<div class="dayContainer">
																		<span class="flatpickr-day prevMonthDay hidden sun"
																			aria-label="20221127" tabindex="-1">27<span
																			class="date" aria-hidden="true">27</span></span><span
																			class="flatpickr-day prevMonthDay hidden mon"
																			aria-label="20221128" tabindex="-1">28<span
																			class="date" aria-hidden="true">28</span></span><span
																			class="flatpickr-day prevMonthDay hidden tue"
																			aria-label="20221129" tabindex="-1">29<span
																			class="date" aria-hidden="true">29</span></span><span
																			class="flatpickr-day prevMonthDay hidden wed"
																			aria-label="20221130" tabindex="-1">30<span
																			class="date" aria-hidden="true">30</span></span><span
																			class="flatpickr-day thu" aria-label="20221201"
																			tabindex="-1">1<span class="date"
																			aria-hidden="true">1</span></span><span
																			class="flatpickr-day fri" aria-label="20221202"
																			tabindex="-1">2<span class="date"
																			aria-hidden="true">2</span></span><span
																			class="flatpickr-day sat" aria-label="20221203"
																			tabindex="-1">3<span class="date"
																			aria-hidden="true">3</span></span><span
																			class="flatpickr-day sun" aria-label="20221204"
																			tabindex="-1">4<span class="date"
																			aria-hidden="true">4</span></span><span
																			class="flatpickr-day mon" aria-label="20221205"
																			tabindex="-1">5<span class="date"
																			aria-hidden="true">5</span></span><span
																			class="flatpickr-day tue" aria-label="20221206"
																			tabindex="-1">6<span class="date"
																			aria-hidden="true">6</span></span><span
																			class="flatpickr-day wed" aria-label="20221207"
																			tabindex="-1">7<span class="date"
																			aria-hidden="true">7</span></span><span
																			class="flatpickr-day thu" aria-label="20221208"
																			tabindex="-1">8<span class="date"
																			aria-hidden="true">8</span></span><span
																			class="flatpickr-day fri" aria-label="20221209"
																			tabindex="-1">9<span class="date"
																			aria-hidden="true">9</span></span><span
																			class="flatpickr-day sat" aria-label="20221210"
																			tabindex="-1">10<span class="date"
																			aria-hidden="true">10</span></span><span
																			class="flatpickr-day sun" aria-label="20221211"
																			tabindex="-1">11<span class="date"
																			aria-hidden="true">11</span></span><span
																			class="flatpickr-day mon" aria-label="20221212"
																			tabindex="-1">12<span class="date"
																			aria-hidden="true">12</span></span><span
																			class="flatpickr-day tue" aria-label="20221213"
																			tabindex="-1">13<span class="date"
																			aria-hidden="true">13</span></span><span
																			class="flatpickr-day wed" aria-label="20221214"
																			tabindex="-1">14<span class="date"
																			aria-hidden="true">14</span></span><span
																			class="flatpickr-day thu" aria-label="20221215"
																			tabindex="-1">15<span class="date"
																			aria-hidden="true">15</span></span><span
																			class="flatpickr-day fri" aria-label="20221216"
																			tabindex="-1">16<span class="date"
																			aria-hidden="true">16</span></span><span
																			class="flatpickr-day sat" aria-label="20221217"
																			tabindex="-1">17<span class="date"
																			aria-hidden="true">17</span></span><span
																			class="flatpickr-day sun" aria-label="20221218"
																			tabindex="-1">18<span class="date"
																			aria-hidden="true">18</span></span><span
																			class="flatpickr-day mon" aria-label="20221219"
																			tabindex="-1">19<span class="date"
																			aria-hidden="true">19</span></span><span
																			class="flatpickr-day tue" aria-label="20221220"
																			tabindex="-1">20<span class="date"
																			aria-hidden="true">20</span></span><span
																			class="flatpickr-day wed" aria-label="20221221"
																			tabindex="-1">21<span class="date"
																			aria-hidden="true">21</span></span><span
																			class="flatpickr-day thu" aria-label="20221222"
																			tabindex="-1">22<span class="date"
																			aria-hidden="true">22</span></span><span
																			class="flatpickr-day fri" aria-label="20221223"
																			tabindex="-1">23<span class="date"
																			aria-hidden="true">23</span></span><span
																			class="flatpickr-day sat" aria-label="20221224"
																			tabindex="-1">24<span class="date"
																			aria-hidden="true">24</span></span><span
																			class="flatpickr-day sun" aria-label="20221225"
																			tabindex="-1">25<span class="date"
																			aria-hidden="true">25</span></span><span
																			class="flatpickr-day mon" aria-label="20221226"
																			tabindex="-1">26<span class="date"
																			aria-hidden="true">26</span></span><span
																			class="flatpickr-day tue" aria-label="20221227"
																			tabindex="-1">27<span class="date"
																			aria-hidden="true">27</span></span><span
																			class="flatpickr-day wed" aria-label="20221228"
																			tabindex="-1">28<span class="date"
																			aria-hidden="true">28</span></span><span
																			class="flatpickr-day thu" aria-label="20221229"
																			tabindex="-1">29<span class="date"
																			aria-hidden="true">29</span></span><span
																			class="flatpickr-day fri" aria-label="20221230"
																			tabindex="-1">30<span class="date"
																			aria-hidden="true">30</span></span><span
																			class="flatpickr-day sat" aria-label="20221231"
																			tabindex="-1">31<span class="date"
																			aria-hidden="true">31</span></span>
																		<div class="yearMonthContainer">
																			<span class="year">2022</span><span
																				class="sepherator">.</span><span class="month">12</span>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="booking-button cal-button">
												<button type="button"
													class="button button--primary button--black pc-only"
													data-station="MultiARR" data-reset-date="#selectMultiDate">
													<span class="button__text">초기화</span>
													<!-- 초기화 -->
												</button>
												<button type="button"
													class="button button--primary button--active"
													data-select-date="#selectMultiDate" rel="modal:close">
													<span class="button__text">선택</span>
													<!-- 선택 -->
												</button>
											</div>
										</div>
										<a href="#a" class="layer-close"><span class="blind">닫기</span></a>
										<!-- 닫기 -->
									</div>
									<div class="customer-layer" id="multiCustomerLayer"
										style="display: none;">
										<div class="layer-header">
											<button type="button" class="header__button"
												name="header_btn">
												<span class="hidden">이전으로</span>
											</button>
											<h2 class="customer-layer__title">누구와 함께 떠나세요?</h2>
											<!-- 누구와 함께 떠나세요? -->
										</div>
										<div class="layer-content">
											<div class="booking-trip">
												<div class="booking-trip__from" id="divFromPas">
													<span class="location"></span>
												</div>
												<span class="booking-trip__switch"><span
													class="hidden">에서</span></span>
												<div class="booking-trip__to" id="divToPax">
													<span class="location"></span>
												</div>
											</div>
											<hr class="section-spacer">
											<div class="booking-members">
												<div class="input-wrap input--line">
													<div class="input-row input-row--number input-row--icon">
														<label for="adtCountMulti" class="input__label">성인</label>
														<!-- 성인 -->
														<div data-element="form"
															class="input input--number is-active">
															<button type="button" data-element="number__button"
																onclick="javascript:chkAdtCount('Multi');"
																data-type="decrease"
																class="input__number input__number-minus"
																aria-label="빼기" disabled=""></button>
															<input type="text" id="adtCountMulti" placeholder="숫자입력"
																data-element="number__input" value="1" data-max="9"
																data-min="1" data-string-number="" class="input__number">
															<button type="button" data-element="number__button"
																data-type="increase"
																class="input__number input__number-plus"
																aria-label="더하기"></button>
														</div>
														<p class="text__small text--color-gray" id="adtMsg">12세
															이상</p>
														<!--12세 이상 -->
													</div>
													<div class="input-row input-row--number input-row--icon">
														<label for="chdCountMulti" class="input__label">소아</label>
														<!-- 소아 -->
														<div data-element="form"
															class="input input--number is-active">
															<button type="button" data-element="number__button"
																data-type="decrease"
																class="input__number input__number-minus"
																aria-label="빼기" disabled=""></button>
															<input type="text" id="chdCountMulti" placeholder="숫자입력"
																data-element="number__input" value="0" data-max="9"
																data-min="0" data-string-number="" class="input__number">
															<button type="button" data-element="number__button"
																data-type="increase"
																class="input__number input__number-plus"
																aria-label="더하기"></button>
														</div>
														<p class="text__small text--color-gray" name="chdMsg">국제선
															기준 만 2세~12세 미만</p>
														<!-- 국제선 기준<br>만 2세 ~ 만 12세 미만 -->
													</div>
													<div class="input-row input-row--number input-row--icon">
														<label for="infCountMulti" class="input__label">유아</label>
														<!-- 유아 -->
														<div data-element="form"
															class="input input--number is-active">
															<button type="button" data-element="number__button"
																data-type="decrease"
																class="input__number input__number-minus"
																aria-label="빼기" disabled=""></button>
															<input type="text" id="infCountMulti" placeholder="숫자입력"
																data-element="number__input" value="0" data-max="9"
																data-min="0" data-string-number="" class="input__number">
															<button type="button" id="btnInfCount"
																onclick="javascript:chkInfCount('Multi');"
																data-element="number__button" data-type="increase"
																class="input__number input__number-plus"
																aria-label="더하기"></button>
														</div>
														<p class="text__small text--color-gray" name="infantDesc"></p>
														<!--생후 14일 이상~만 2세 미만-->
														<!-- (만 24개월 미만) -->
													</div>
												</div>
											</div>

											<div class="pc-40 mo-30">
												<!--20210520 class명 변경-->
												<div data-element="toggle"
													class="toggle-item toggle-item--booking"
													data-options="{&quot;mode&quot;: &quot;slide&quot;}">
													<div class="toggle-item__title">
														<button type="button" data-element="toggle__anchor"
															class="toggle-item__anchor" aria-controls="toggle-3"
															aria-expanded="false">나이계산기</button>
														<!-- 나이계산기 -->
													</div>
													<div data-element="toggle__panel"
														class="toggle-item__content" id="toggle-3">
														<div class="input-wrap input--line">
															<div class="input-row input-row--label">
																<div class="input-label">생년월일</div>
																<!-- 생년월일 -->
																<div class="input-item">
																	<div class="input-flex">
																		<div class="input-box">
																			<div class="input" data-element="form">
																				<input type="text"
																					class="input__text input__text--placeholder"
																					name="txtCalYear" maxlength="4"
																					data-element="input" title="연도 입력" placeholder="년">
																				<button type="button" data-element="remove"
																					class="input__remove-button">삭제</button>
																				<!-- 삭제 -->
																			</div>
																		</div>
																		<div class="input-box">
																			<div class="select-wrap select-wrap--line">
																				<select class="select-wrap__select" title="월 선택"
																					name="selCalMonth">
																					<option value="0">월</option>
																					<!-- 월 -->
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
																				<select class="select-wrap__select" title="일 선택"
																					name="selCalDate">
																					<option>일</option>
																				</select>
																			</div>
																		</div>
																	</div>
																	<p tabindex="0" class="input__error" id="calcError"></p>
																</div>
															</div>
														</div>
														<div class="button-wrap button-wrap--center">
															<button type="button"
																class="button button--optional button--optional-black"
																onclick="javascript:calcAge();">
																<span class="button__text">계산하기</span>
															</button>
															<!-- 계산하기 -->
														</div>
														<div class="notice-box--white" name="calcMsg"
															style="display: none;"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="fixed-wrap fixed-wrap--multi-line border-none">
											<div class="button-wrap">
												<button type="button" class="button button--active active"
													name="btnSetPassenger">
													<span class="button__text">선택 완료</span>
												</button>
												<!-- 선택 완료 -->
											</div>
										</div>
										<a href="#a" class="layer-close"><span class="blind">닫기</span></a>
										<!-- 닫기 -->
									</div>
								</div>
								<div class="ticketing-row-bot">
									<div class="ticketing-row-sub">
										<div class="ticketing-people">
											<button type="button" class="btn-passengers">
												<span class="txt">성인1</span>
											</button>
											<!-- 성인 -->
										</div>
										<div class="payment">
											<div class="payment-head">
												<div class="payment-tit">결제 방법</div>
												<!-- 결제 방법 -->
												<span class="tooltip">
													<button type="button" class="tooltip__button"
														data-element="modal_anchor"
														data-target="#toolTipModalLayer2" data-modal-type="full"></button>
												</span>
											</div>
											<div class="radio-wrap">
												<span class="radio payment-basic"> <input
													type="radio" id="paymentRadio01" name="paymentMethod"
													class="radio__input" checked=""> <label
													for="paymentRadio01" class="radio__label"><i
														aria-hidden="true" class="radio__ico"></i><span>일반</span></label>
													<!-- 일반 -->
												</span> <span class="radio"> <input type="radio"
													id="paymentRadio02" name="paymentMethod"
													class="radio__input"> <label for="paymentRadio02"
													class="radio__label"> <i aria-hidden="true"
														class="radio__ico"></i> <span>포인트</span> <!-- 포인트 -->
												</label>
												</span> <span class="radio payment-giftticket"> <input
													type="radio" id="paymentRadio03" name="paymentMethod"
													class="radio__input"> <label for="paymentRadio03"
													class="radio__label"> <i aria-hidden="true"
														class="radio__ico"></i> <span>기프티켓</span> <!-- 기프티켓 -->
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
												<!-- 프로모션 코드 입력 -->
												<span class="tooltip">
													<button type="button" class="tooltip__button"
														data-element="modal_anchor"
														data-target="#toolTipModalLayer1" data-modal-type="full"></button>
												</span>
											</div>
											<!-- 프로모션 코드 인풋박스 -->
											<div class="promotion-top">
												<div class="promotion-inp">
													<input type="text" class="inp-txt" id="txtPromoCode">
												</div>
											</div>
											<p class="caution" id="WarnPromoCode" style="display: none;">
												<span class="txt">프로모션 쿠폰 번호를 정확히 입력해 주세요.</span>
											</p>
											<!-- 프로모션 코드를 정확히 입력해 주세요. -->
										</div>
										<div class="g-ticket">
											<select class="g-ticket-select" id="selectGifticket"></select>
											<div class="g-ticket-select nodata" style="display: none;"
												name="nodataGift">선택 가능한 기프티켓이 없습니다.</div>
											<!--선택 가능한 기프티켓이 없습니다.-->
											<a href="/ko/additionalService/service/gifticket.do"
												target="_blank" class="go-detail" name="nodataGift"
												style="display: none;">기프티켓 자세히 보기 &gt;</a>
											<!-- 기프티켓 자세히 보기  -->
										</div>
										<button type="button" id="searchFlight"
											onclick="javascript:setSearchAvailParam(true);"
											class="btn-flight-sch-again" disabled="">항공권 검색</button>
										<!-- 항공권  검색 -->
									</div>
								</div>
							</div>
						</div>
						<!-- 최근 검색 노선 -->
						<div class="search">
							<div class="search__label">최근 검색 노선</div>
							<!-- 최근 검색 노선 -->
							<div
								class="search__slide swiper-container-initialized swiper-container-horizontal"
								data-carousel="spaceItem">
								<div class="search__box-wrap swiper-wrapper" id="divRecentRoute">
									<div class="search__box swiper-slide swiper-slide-active"
										style="">
										<button type="button"
											onclick="javascript:setRecentRoute(this);"
											class="search__item"
											data-trips="{&quot;tripRoute&quot;:[{&quot;originAirport&quot;:&quot;ICN&quot;,&quot;originName&quot;:&quot;서울(인천)&quot;,&quot;destinationAirport&quot;:&quot;BKK&quot;,&quot;destinationName&quot;:&quot;방콕&quot;,&quot;flightDate&quot;:&quot;2022-12-06&quot;,&quot;sortOptions&quot;:&quot;EarliestDeparture,EarliestArrival&quot;},{&quot;originAirport&quot;:&quot;BKK&quot;,&quot;originName&quot;:&quot;방콕&quot;,&quot;destinationAirport&quot;:&quot;ICN&quot;,&quot;destinationName&quot;:&quot;서울(인천)&quot;,&quot;flightDate&quot;:&quot;2022-12-08&quot;,&quot;sortOptions&quot;:&quot;EarliestDeparture,EarliestArrival&quot;}],&quot;passengers&quot;:[{&quot;type&quot;:&quot;ADT&quot;,&quot;count&quot;:&quot;1&quot;}],&quot;tripType&quot;:&quot;RT&quot;,&quot;bookType&quot;:&quot;Common&quot;,&quot;domIntType&quot;:&quot;I&quot;,&quot;cultureCode&quot;:&quot;ko-KR&quot;,&quot;lowfareIncludeTaxesAndFee&quot;:&quot;false&quot;,&quot;discountInfo&quot;:{},&quot;voucherInfo&quot;:{}}">
											<span class="search__destination"><span>서울(인천)</span><i
												class="icon round-trip" aria-label="RT"></i><span>방콕</span></span><span
												class="search__date">12.06 ~ 12.08</span><span
												class="search__person">1</span>
										</button>
										<button type="button" class="search__item-del"
											aria-label="delete"
											onclick="javascript:deleteRecentRoute(0);"></button>
									</div>
								</div>
								<button type="button"
									class="carousel__button-next swiper-button-disabled"
									tabindex="0" role="button" aria-label="Next slide"
									aria-disabled="true" style="display: none;"></button>
								<button type="button"
									class="carousel__button-prev swiper-button-disabled"
									tabindex="0" role="button" aria-label="Previous slide"
									aria-disabled="true" style="display: none;"></button>
								<span class="swiper-notification" aria-live="assertive"
									aria-atomic="true"></span>
							</div>
						</div>
						<!-- 최근 검색 노선 -->
					</div>
					<!-- alert 팝업 -->
					<div id="alertModalLayer" class="modal modal--simple">
						<div class="modal-content">
							<p class="alert-text"></p>
						</div>
						<div class="modal__button-area button-wrap">
							<button type="button"
								class="button button--secondary button--active"
								rel="modal:close" onclick="javascript:closeCurrentModal(this);">
								<span class="button__text">확인</span>
							</button>
						</div>
						<!-- 확인 -->
					</div>
					<!-- 컨펌 팝업 -->
					<div id="confirmModalLayer" class="modal modal--simple">
						<div class="modal-content">
							<h2 class="alert-title">알림</h2>
							<p class="alert-text">회원 로그인 후에만 이용 가능합니다. 로그인해주세요.</p>
						</div>
						<div class="modal__button-area button-wrap">
							<button type="button" class="button button--secondary"
								rel="modal:close" onclick="javascript:closeLoginModal(this);">
								<span class="button__text">취소</span>
							</button>
							<!-- 취소 -->
							<button type="button" onclick="javascript:loginModal();"
								class="button button--secondary button--active add--ml-10">
								<span class="button__text">확인</span>
							</button>
							<!-- 확인 -->
						</div>
						<a href="javascript:void(0);" rel="modal:close"
							onclick="closeLoginModal(this)" class="modal__close"><span
							class="blind">닫기</span></a>
						<!-- 닫기 -->
					</div>
					<div id="toolTipModalLayer1" class="modal modal-full modal-scroll">
						<div class="modal-header">
							<div class="modal-header__title">프로모션 코드 사용 안내</div>
							<!-- 프로모션 코드 사용 안내 -->
						</div>
						<div class="modal-content multi-bottom">
							<div class="terms-item">
								<ul class="list-guide">
									<li class="list-guide__item">사전에 안내된 프로모션 코드를 입력하고 항공권을
										검색하면 할인된 가격이 적용된 항공편을 선택할 수 있습니다.</li>
									<!-- 사전에 안내된 프로모션 코드를 입력하고 항공권을 검색하면 할인된 가격이 적용된 항공편을 선택할 수 있습니다. -->
									<li class="list-guide__item">사용 가능한 조건에 맞는 프로모션 코드를 입력해야
										할인이 적용됩니다.</li>
									<li class="list-guide__item">프로모션 코드가 없으신가요? <a
										href="/ko/event/event.do"
										style="color: #FF5000; text-decoration: underline;">진행중인
											이벤트 확인하고 프로모션 코드 받으러가기</a></li>
									<!-- 사용 가능한 조건에 맞는 프로모션 코드를 입력해야 할인이 적용됩니다. -->
								</ul>
							</div>
						</div>
						<a href="#" rel="modal:close" class="modal__close"><span
							class="blind">닫기</span></a>
						<!-- 닫기 -->
					</div>
					<div id="toolTipModalLayer2" class="modal modal-full modal-scroll">
						<div class="modal-header">
							<div class="modal-header__title">결제 방법 안내</div>
						</div>
						<div class="modal-content">
							<div class="first-margin">
								<p class="section-title">포인트 결제</p>
								<ul class="list-guide large list-guide--narrow">
									<li class="list-guide__item">보유하고 있는 포인트로 항공권 예매가 가능하며,
										부족한 포인트는 구매 후 사용할 수 있습니다.</li>
									<li class="list-guide__item">유류할증료 및 공항이용료는 포인트로 결제하실 수
										없습니다.</li>
								</ul>
							</div>


							<div class="sub-section">
								<p class="section-title">기프티켓 결제</p>
								<ul class="list-guide large list-guide--narrow">
									<li class="list-guide__item">사전에 등록된 기프티켓이 있으면 선택하여 사용
										가능합니다.</li>
									<li class="list-guide__item">기프티켓은 항공권 운임에만 적용되며, 유류할증료 및
										공항이용료와 부가서비스는 별도 결제가 필요합니다.</li>
								</ul>
							</div>

						</div>
						<a href="#" rel="modal:close" class="modal__close"><span
							class="blind">닫기</span></a>
					</div>
				</main>
			</div>















			<div class="quick-menu mobile-only">
				<!-- D : 활성화 클래스 on -->
				<a href="javascript:void(0);" class="quick-menu__item n1 "
					onclick="URL_LINK.getI18Url('/main/base/index.do')"> <img
					src="https://static.jejuair.net/hpgg/resources/images/upload/icon_bottombar_home_off_56x2.png"
					alt="홈" loading="lazy"> <!--2021-04-13 이미지로 변경--> <span>홈</span>
					<!-- 홈 -->
				</a> <a href="javascript:void(0);" class="quick-menu__item n2 on"
					onclick="URL_LINK.getI18Url('/ibe/booking/Availability.do')"> <img
					src="https://static.jejuair.net/hpgg/resources/images/upload/icon_bottom	bar_reservation_on_56x2.png"
					alt="항공권예매" loading="lazy"> <!--2021-04-13 이미지로 변경--> <span>예매</span>
					<!-- 항공권예매 -->
				</a> <a href="javascript:void(0);" class="quick-menu__item n3 "
					onclick="URL_LINK.getI18Url('/ibe/checkin/viewCheckin.do')"> <img
					src="https://static.jejuair.net/hpgg/resources/images/upload/icon_bottombar_mboardingpass_off_56x2.png"
					alt="모바일 탑승권" loading="lazy"> <!--2021-04-13 이미지로 변경--> <span>모바일
						탑승권</span> <!-- 모바일 탑승권 -->
				</a> <a href="javascript:void(0);" class="quick-menu__item n4 "
					onclick="URL_LINK.getI18Url('/additionalService/service/main.do')">



					<img
					src="https://static.jejuair.net/hpgg/resources/images/upload/icon_bottombar_service_off_56x2.png"
					alt="부가서비스" loading="lazy"> <!--2021-04-13 이미지로 변경--> <span>부가서비스</span>
					<!-- 부가서비스 -->
				</a> <a href="javascript:void(0);" class="quick-menu__item n5 "
					onclick="URL_LINK.getI18Url('/member/mypage/main.do')"> <img
					src="https://static.jejuair.net/hpgg/resources/images/upload/icon_bottombar_mypage_off_56x2.png"
					alt="마이페이지" loading="lazy"> <!--2021-04-13 이미지로 변경--> <span>마이페이지</span>
					<!-- 마이페이지 -->
				</a>
			</div>

		</div>
	</div>








	<div id="footer" class="footer pc-only">

		<!-- pc -->
		<footer class="footer__inner">
			<div class="footer__top">
				<div class="footer__top-item">
					<a href="javascript:void(0);" class="footer__top-link"
						data-action="menu" data-menu-name="about">회사소개</a>
				</div>

				<div class="footer__top-item">
					<a href="javascript:void(0);" class="footer__top-link"
						data-action="menu" data-menu-name="esg">ESG 경영</a>
				</div>


				<div class="footer__top-item">
					<a href="javascript:void(0);" class="footer__top-link"
						data-action="menu" data-menu-name="irNotice">투자정보</a>
				</div>


				<div class="footer__top-item">
					<a href="javascript:void(0);" class="footer__top-link"
						data-action="menu" data-menu-name="incruit">채용안내</a>
				</div>

				<div class="footer__top-item">
					<a href="javascript:void(0);" class="footer__top-link"
						data-action="menu" data-menu-name="carriageTemrs">여객운송약관</a>
				</div>
				<div class="footer__top-item">
					<a href="javascript:void(0);" class="footer__top-link"
						data-action="menu" data-menu-name="homepageTerms">홈페이지 이용약관</a>
				</div>
				<div class="footer__top-item footer__top-item--privacy">
					<a href="javascript:void(0);" class="footer__top-link"
						data-action="menu" data-menu-name="personalTerms">개인정보처리방침</a>
				</div>
				<div class="footer__top-item">
					<a href="javascript:void(0);" class="footer__top-link"
						data-action="menu" data-menu-name="sitemap">사이트맵</a>
				</div>

				<div class="footer__top-item footer__top-item--family">
					<div class="family-wrap" data-element="toggle"
						data-options="{&quot;mode&quot;: &quot;slide&quot;, &quot;speed&quot;: 100, &quot;clickToClose&quot;: true}">
						<button type="button" class="button-family"
							data-element="toggle__anchor" aria-controls="toggle-4"
							aria-expanded="false">Family Site</button>
						<div class="family-list" data-element="toggle__panel"
							id="toggle-4">
							<a href="javascript:void(0);" class="family-link"
								data-action="menu" data-menu-name="familyAekyung">㈜애경산업</a> <a
								href="javascript:void(0);" class="family-link"
								data-action="menu" data-menu-name="familyAtecltd">㈜에이텍</a> <a
								href="javascript:void(0);" class="family-link"
								data-action="menu" data-menu-name="familyAekyngst">애경S.T</a> <a
								href="javascript:void(0);" class="family-link"
								data-action="menu" data-menu-name="familyAkis">에이케이아이에스㈜</a> <a
								href="javascript:void(0);" class="family-link"
								data-action="menu" data-menu-name="familyAdmission">애드미션</a> <a
								href="javascript:void(0);" class="family-link"
								data-action="menu" data-menu-name="familyNeopharm">네오팜</a> <a
								href="javascript:void(0);" class="family-link"
								data-action="menu" data-menu-name="familyAkp">애경유화㈜</a> <a
								href="javascript:void(0);" class="family-link"
								data-action="menu" data-menu-name="familyAkc">애경화학㈜</a> <a
								href="javascript:void(0);" class="family-link"
								data-action="menu" data-menu-name="familyAkchemtech">에이케이켐텍</a>
							<a href="javascript:void(0);" class="family-link"
								data-action="menu" data-menu-name="familyKospa">코스파</a> <a
								href="javascript:void(0);" class="family-link"
								data-action="menu" data-menu-name="familyAkplaza">AK PLAZA</a> <a
								href="javascript:void(0);" class="family-link"
								data-action="menu" data-menu-name="familyAekyunggroup">AK홀딩스</a>
							<a href="javascript:void(0);" class="family-link"
								data-action="menu" data-menu-name="familyAkdjbcc">애경개발</a>
						</div>
					</div>
				</div>

			</div>
			<hr class="footer__spacer">
			<div class="footer__bottom">

				<div class="footer__bottom-contents">


					<div class="footer__bottom-info">





						<div class="info-item">
							<a
								href="javascript:URL_LINK.getI18Url('/terms/page/transportationServicePlan.do');"
								class="link">항공교통이용자 서비스 계획</a>
						</div>







						<div class="info-item">
							<a
								href="javascript:URL_LINK.getI18Url('https://static.jejuair.net/hpgg/resources/pdf/Application_for_Damage_Redress.pdf');"
								class="link">항공교통이용자 피해구제 계획</a>
						</div>





						<div class="info-item">
							<a
								href="javascript:URL_LINK.getI18Url('https://www.avsec365.or.kr/');"
								class="link">항공위험물안내 </a>
						</div>





						<div class="info-item">
							<a
								href="javascript:URL_LINK.getI18Url('http://static.jejuair.net/cms/images/file_upload/20220628173251946.pdf');"
								class="link">항공안전투자공시</a>
						</div>

					</div>




					<div class="footer__bottom-recommand">



						<h5 class="recommand-title">제주항공이 추천하는 최저가 여행</h5>

















						<div class="recommand-list">

							<div class="recommand-item">
								<a href="https://www.jejuair.net/flights/ko-kr/" class="link">최저
									운임 항공권</a>
							</div>

							<div class="recommand-item">
								<a
									href="https://www.jejuair.net/flights/ko-kr/flights-from-seoul"
									class="link">서울 출발 항공권</a>
							</div>

							<div class="recommand-item">
								<a
									href="https://www.jejuair.net/flights/ko-kr/flights-from-jeju"
									class="link">제주 출발 항공권</a>
							</div>

							<div class="recommand-item">
								<a
									href="https://www.jejuair.net/flights/ko-kr/flights-from-busan"
									class="link">부산 출발 항공권</a>
							</div>

							<div class="recommand-item">
								<a
									href="https://www.jejuair.net/flights/ko-kr/flights-from-muan"
									class="link">무안 출발 항공권</a>
							</div>

							<div class="recommand-item">
								<a
									href="https://www.jejuair.net/flights/ko-kr/flights-from-cheongju-si"
									class="link">청주 출발 항공권</a>
							</div>

							<div class="recommand-item">
								<a
									href="https://www.jejuair.net/flights/ko-kr/flights-from-daegu"
									class="link">대구 출발 항공권</a>
							</div>

							<div class="recommand-item">
								<a
									href="https://www.jejuair.net/flights/ko-kr/flights-from-gwangju"
									class="link">광주 출발 항공권</a>
							</div>

						</div>

					</div>



					<div class="footer__bottom-util">
						<a href="javascript:void(0);" class="util-app-ios"
							data-action="menu" data-menu-name="iOSBtn"><img
							src="https://static.jejuair.net/hpgg/resources/images/icon/icon-footer-app-ios.png"
							alt="" loading="lazy"> IOS</a> <a href="javascript:void(0);"
							class="util-app-aos" data-action="menu"
							data-menu-name="AndroidBtn"><img
							src="https://static.jejuair.net/hpgg/resources/images/icon/icon-footer-app-aos.png"
							alt="" loading="lazy"> Android</a>
					</div>

					<p class="footer__bottom-address">
						<font class="mr15">(주)제주항공</font> <span
							text="사업자등록번호 : 616-81-50527">사업자등록번호 : 616-81-50527</span> <font
							class="" text="대표이사:김이배">대표이사 : 김이배</font><br> 제주특별자치도 제주시
						신대로 64(연동, 건설공제회관 3층)
					</p>
					<p class="footer__bottom-copy"
						text="Copyright ⓒ JEJUAIR. All Rights Reserved." :=""616-81-50527"="">Copyright
						ⓒ JEJUAIR. All Rights Reserved.</p>

				</div>
			</div>
		</footer>
		<!-- //pc -->

	</div>










	<!-- 공통 스크립트 선언 -->


	<script type="text/javascript"
		src="https://static.jejuair.net/hpgg/resources/js/lib/lib.custom.min.js"></script>




	<script type="text/javascript"
		src="https://static.jejuair.net/hpgg/resources/js/lib/moment-with-locales.min.js"></script>

	<script type="text/javascript"
		src="https://static.jejuair.net/hpgg/resources/js/lib/jquery.i18n.js"></script>
	<script type="text/javascript"
		src="https://static.jejuair.net/hpgg/resources/js/lib/jquery.i18n.messagestore.js"></script>
	<!-- 메인페이지 스크립트 에러 발생으로 이전 소스로 변경합니다. 
<script type="text/javascript" src="https://static.jejuair.net/hpgg/resources/js/booking/plugin.js"></script>
<script type="text/javascript" src="https://static.jejuair.net/hpgg/resources/js/booking/common.js"></script>
-->
	<script>
$(document).ready(function(){
	
		$.ajaxSetup({
			beforeSend: function(xhr) {
				xhr.setRequestHeader('tcode', '0000000294');
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
	<script type="text/javascript"
		src="https://static.jejuair.net/hpgg/resources/js/plugin.js"></script>
	<script type="text/javascript"
		src="https://static.jejuair.net/hpgg/resources/js/common.js"></script>

	<!--필요시만 로드-->
	<script type="text/javascript"
		src="https://static.jejuair.net/hpgg/resources/js/vendor/lodash.min.js"></script>
	<!--사용되지 않음-->
	<!--<script type="text/javascript" src="https://static.jejuair.net/hpgg/resources/js/vendor/localforage.min.js"></script>-->
	<script type="text/javascript"
		src="https://static.jejuair.net/hpgg/resources/js/vendor/handlebars.min-v4.7.6.js"></script>
	<script type="text/javascript"
		src="https://static.jejuair.net/hpgg/resources/js/handlebars.helpers.js"></script>

	<script type="text/javascript"
		src="https://static.jejuair.net/hpgg/resources/js/util/sUtil.js"></script>
	<script type="text/javascript"
		src="https://static.jejuair.net/hpgg/resources/js/util/dUtil.js"></script>
	<script type="text/javascript"
		src="https://static.jejuair.net/hpgg/resources/js/util/utils.js"></script>

	<!--필요시만 로드-->
	<script type="text/javascript"
		src="https://static.jejuair.net/hpgg/resources/js/amcharts/amcharts.core.js"></script>


	<script type="text/javascript"
		src="https://static.jejuair.net/hpgg/resources/bizjs/commons/bizCommons.js"></script>
	<script type="text/javascript"
		src="https://static.jejuair.net/hpgg/resources/js/jj.helpers.js"></script>





	<script
		src="https://static.jejuair.net/hpgg/resources/js/booking/airport.js"></script>
	<script
		src="https://static.jejuair.net/hpgg/resources/js/lib/jquery-ui.min.js"></script>
	<script>
	let cultureCode = "ko_KR";	
	let tripType = document.querySelectorAll(".ticketing-type .selected")[0].getAttribute("data-tripType")
	let domIntType = "";
	let booleanLowestFare = false;
	let searchLatelyDatas = [];
	let bookType = "Common" 
	let departureAiportsMap = [];
	let arrivalAiportsMap = [];
	let airportMapLayer;
	let lowestFareJson = [2];
	let searchUrl = 'https://sec.jejuair.net'
	let currentDate = '2022.11.13'.replace(/[^0-9]/g,'')	
	let jsAdtCount='1' , jsChdCount='0', jsInfCount='0';	
	let cmsDepStn = ''
	let cmsArrStn = ''
	let cmsDepDate = ''
	let cmsArrDate = ''
	let mapListType = 'List';
	let pageId = '0000000294';
	let cname = "";
	if(USER_DEVICE.getName() !="APP"){
		if(USER_DEVICE.getName() == "PC"){
			cname = "WPC"; 
		}else{
			cname = "WMO";
		}
	}else{
		cname = "APP";
	}	
	$(document).ready(function(){
		BIZ_COMMONS_SCRIPT.callI18n(pageId)
		selectDepartureAirports('DEP');

		if(cultureCode.startsWith('zh-tw') || cultureCode.startsWith('zh-hk')){
			let dates = $("#btnDatePicker").find('.txt').text().split('.');	
			let startDate = new Date(dates[0], dates[1]-1 , dates[2].substring(0,2));
			let endDate = new Date(dates[2].replace(/[^0-9]/gi,'').substring(2,6), dates[3]-1 , dates[4].replace(/[^0-9]/gi,''));
			moment.lang(I18N.language);
			let start = moment(startDate).format("yyyy.MM.DD(ddd)");
			let end = moment(endDate).format("yyyy.MM.DD(ddd)");
			$("#btnDatePicker").find('.txt').html(start+" ~ "+end)
		}
		
		
		recentSearch();		
		$(document).on('click', '.choise__button', clickChoiseButton);
		$(document).on('click', 'button[name=btnAAMChartAirport]', clickChoiseButton);
		$(document).on('click', 'button[name=btnLatelyAirport]', clickChoiseButton);
		
		$(document).on('click', 'button[name=btnFavoriteAirport]', clickChoiseButton);
		$(document).on('click', '.tab-swipe-item', clickAAMChartBtn);	
		$(document).on('click', 'button[name=btnPromotion]', clickPromotionButton);
		$(document).on('focusin', '#txtPromoCode', keyDownPromotion);
		
		//$(document).on('contextmenu', '#txtPromoCode', preventClick);
		$(document).on('focusout', 'input[name=txtCalYear]', focusoutCalcYear);
		$(document).on('change', 'input[name=txtCalYear],[name=selCalMonth]', changeCalcMonth);
		$(document).on('click', '.flatpickr-prev-month , .flatpickr-next-month', pickerMoveMonth);
		$(document).on('click', '.date-layer button[data-select-date]', selectDate);
		$(document).on('click', '.date-layer button[data-reset-date]', clearDate);
		$(document).on('focus', '.header__input', autoComplete);
		$(document).on('click', 'button[name=header_btn]', clickPrevButton);
		$(document).on('click', 'button[name=btnSetPassenger]', setPassengerData);
		document.getElementById("btnExchangeRoute1").addEventListener("click", exchangeRoute , false);
		document.getElementById("btnExchangeRoute2").addEventListener("click", exchangeRoute , false);
		
		$('.main-ticketing').sliding();

		$("#arrivalData").data("stationcode" , null)	
		$("#arrivalData").data("countrycode" , null)	
		$("#arrivalData").data("arrivalname", null)	
		$("#txtPromoCode").val('')
	});	
	
	function recentSearch(){
		if(localStorage.getItem('recentSearchRoutes') != null) {		
			paintRecentRoutes();
		}else{
			$("#divRecentRoute").parents(".search").hide();
		}
	}	
	
	function paintRecentRoutes() {
		$("#divRecentRoute").text("");
		let btnRecentRoute = "";
		deleteRecentRoute();		
		let localStorageDatas = JSON.parse(localStorage.getItem('recentSearchRoutes'));
		for(let index=0; index<localStorageDatas.length; index++){
			let trips = localStorageDatas[index];
			if(trips.tripRoute[0].destinationName ===''){
				continue;
			}
			if(trips.cultureCode.indexOf('ko') == -1){
				continue;
			}
			btnRecentRoute +='<div class="search__box swiper-slide"><button type="button" onclick="javascript:setRecentRoute(this);" class="search__item" data-trips = '+JSON.stringify(trips)+'>'+		
			'<span class="search__destination"><span>'+trips.tripRoute[0].originName+'</span>'
			if(trips.tripType ==='RT'){
				btnRecentRoute+='<i class="icon round-trip" aria-label="'+trips.tripType+'"></i>'
			}else{
				btnRecentRoute+='<i class="icon one-way" aria-label="'+trips.tripType+'"></i>'
			}

			let passengerCnt =0;
			for(let i=0; i<trips.passengers.length; i++){
				passengerCnt+=Number(trips.passengers[i].count);
			}
			btnRecentRoute+='<span>'+trips.tripRoute[0].destinationName+'</span></span><span class="search__date">'+
			trips.tripRoute[0].flightDate.replace(/[^0-9]/gi,'').substring(4,6)+'.'+trips.tripRoute[0].flightDate.replace(/[^0-9]/gi,'').substring(6,8);
			if(trips.tripRoute.length > 1){
				btnRecentRoute+=' ~ '+trips.tripRoute[1].flightDate.replace(/[^0-9]/gi,'').substring(4,6)+'.'+trips.tripRoute[1].flightDate.replace(/[^0-9]/gi,'').substring(6,8);
			}
			btnRecentRoute+='</span>'+		
			'<span class="search__person">'+passengerCnt+'</span>'+
			'</button><button type="button" class="search__item-del" aria-label="delete" onclick="javascript:deleteRecentRoute('+index+');"></button></div></div>'
		}
		$("#divRecentRoute").append(btnRecentRoute)
		if(localStorageDatas.length<6){
			$(".carousel__button-next.swiper-button-disabled").hide();
			$(".carousel__button-prev.swiper-button-disabled").hide();
		}
		if(btnRecentRoute ==''){
			$("#divRecentRoute").parents(".search").hide();
		}	
		
		var carouselDom = $(".search__slide")[0]
		uiCarousel.reset(carouselDom);
	}
	
	
	function deleteRecentRoute(index){
		let recentSearchRoutes = [] 
		let oldRecentSearchRoutes = JSON.parse(localStorage.getItem('recentSearchRoutes'));
		for(let i=0; i<oldRecentSearchRoutes.length; i++){
			let oldRecentSearchRoute = oldRecentSearchRoutes[i]
			if(typeof index =='undefined'){
				if(oldRecentSearchRoutes[i].tripRoute[0].flightDate.replace(/[^0-9]/gi,'') >= '20221113'){
					recentSearchRoutes.push(oldRecentSearchRoute)
				}
			}else{
				if(i != index){
					recentSearchRoutes.push(oldRecentSearchRoute)
				}
			}		
		}
		if(recentSearchRoutes.length !=0){
			localStorage.setItem('recentSearchRoutes', JSON.stringify(recentSearchRoutes));
		}else{
			localStorage.removeItem('recentSearchRoutes')
		}
		$("#divRecentRoute").text("");
		if(typeof index !='undefined'){
			recentSearch();
		}
	}
	
	
	function setRecentRoute(trips){
		//tripType Set
		if($(trips).data('trips').tripType ==='OW'){
			$('.ticketing-type .item-btn').eq(1).trigger('click');
		}else{
			$('.ticketing-type .item-btn').eq(0).trigger('click');
		}
		let trip1 = {
				stationCode: $(trips).data('trips').tripRoute[0].originAirport,
				countryCode : $(trips).data('trips').domIntType ==='D' ? 'KR' : '',
				stationName: $(trips).data('trips').tripRoute[0].originName,
				stationType : 'DEP'
		};
		<!--선택한 공항을 세팅-->
		$("#depAirportLayer").data("target" , "spanDepartureDesc")
		setAirportInfo(trip1);
	
		let trip2 = {
				stationCode: $(trips).data('trips').tripRoute[0].destinationAirport,
				countryCode : $(trips).data('trips').domIntType ==='D' ? 'KR' : '',
				stationName: $(trips).data('trips').tripRoute[0].destinationName,
				stationType : 'ARR'
		};
		
		$("#arrAirportLayer").data("target" , "spanArrivalDesc")
		setAirportInfo(trip2);
		$("[id^='adtCount'],[id^='chdCount'],[id^='infCount']").val(0);
		jsAdtCount=0;jsChdCount=0;jsInfCount = 0;
		for(let i=0; i<$(trips).data('trips').passengers.length; i++){
			if($(trips).data('trips').passengers[i].type ==='ADT'){				
				$("[id^='adtCount']").val($(trips).data('trips').passengers[i].count)
				jsAdtCount = $(trips).data('trips').passengers[i].count
				if($(trips).data('trips').passengers[i].count > 0){
					$("[id^='adtCount']").siblings().prop('disabled', false);
				}
			}else if($(trips).data('trips').passengers[i].type ==='CHD'){
				$("[id^='chdCount']").val($(trips).data('trips').passengers[i].count)
				jsChdCount = $(trips).data('trips').passengers[i].count
				if($(trips).data('trips').passengers[i].count > 0){
					$("[id^='chdCount']").siblings().prop('disabled', false);
				}
			}else if($(trips).data('trips').passengers[i].type ==='INF'){
				$("[id^='infCount']").val($(trips).data('trips').passengers[i].count)
				jsInfCount = $(trips).data('trips').passengers[i].count
				if($(trips).data('trips').passengers[i].count > 0){
					$("[id^='infCount']").siblings().prop('disabled', false);
				}
			}
		}		
		setPassengerData()		
		if($(trips).data('trips').tripRoute.length ===1){
			tripType = 'OW'
			$("#departureDate").val($(trips).data('trips').tripRoute[0].flightDate)
			$("#departureDate").prev().find('.txt').text(dUtil.dateWeekNameTime($("#departureDate").val().replace(/[^0-9]/gi,''),weekLang))
			$("#arrivalDate").val("");
			$("div[name=divFromDate]").eq(0).next().addClass('one-way')
			$("div[name=divFromDate]").eq(0).next().removeClass('round-trip')		
		}else{
			tripType = 'RT'
			$("#departureDate").val($(trips).data('trips').tripRoute[0].flightDate)
			$("#arrivalDate").val($(trips).data('trips').tripRoute[1].flightDate)
			$("#departureDate").prev().find('.txt').text(dUtil.dateWeekNameTime($("#departureDate").val().replace(/[^0-9]/gi,''),weekLang)+" ~ "+dUtil.dateWeekNameTime($("#arrivalDate").val().replace(/[^0-9]/gi,''),weekLang));
			$("div[name=divFromDate]").eq(0).next().removeClass('one-way')
			$("div[name=divFromDate]").eq(0).next().addClass('round-trip')
		}
		domIntType = $(trips).data('trips').domIntType
		$("#paymentRadio01").prop("checked",true)
		$("#paymentRadio01").attr('checked','checked').trigger('change');
	}

	function calcAge(){
		const year = $("input[name=txtCalYear]:visible").val();
		let month = $("[name=selCalMonth]:visible").val();
		let day = $("[name=selCalDate]:visible").val().replace(/[^0-9]/g,'');		
		if (year === "" || month == null || day === "0") {
			$('#calcError').siblings().find('.input-box').eq(0).addClass('input--error')
			$('#calcError').siblings().find('.input-box').eq(1).addClass('input--error')
			$('#calcError').text('생년월일을 입력해 주세요.');
			$('#calcError').show();
			$('div[name=calcMsg]').hide();      
			return;
		}
		$('#calcError').siblings().find('.input-box').eq(0).removeClass('input--error')
		$('#calcError').siblings().find('.input-box').eq(1).removeClass('input--error')				
		if (month.length === 1) {
			month = "0" + month;
		}
		if (day.length === 1) {
			day = "0" + day;
		}

		//국제선은 출발일 기준
		let baseDate = $("#departureDate").val();		
		const age = getAge(year, month, day, baseDate);
		let passengerType;
		if (domIntType === 'D') {
			if (age < 2) {
				passengerType = BIZ_COMMONS_SCRIPT.getI18n("0000000294.msg00069");
				if (tripType !='OW') {
					baseDate = $("#arrivalDate").val();
					const age = getAge(year, month, day, baseDate);
					if (age >= 2) {
						passengerType = BIZ_COMMONS_SCRIPT.getI18n("0000000294.msg00066");
					}
				}
			} else if (age < 13) {
				passengerType = BIZ_COMMONS_SCRIPT.getI18n("0000000294.msg00066");
			} else {
				passengerType = BIZ_COMMONS_SCRIPT.getI18n("0000000294.msg00064");
			}
		} else { // 국제선
			if (age < 2) {
				passengerType = BIZ_COMMONS_SCRIPT.getI18n("0000000294.msg00069");
				if (tripType !='OW') {
					baseDate = $("#arrivalDate").val();
					const age = getAge(year, month, day, baseDate);
					if (age >= 2) {
						passengerType = BIZ_COMMONS_SCRIPT.getI18n("0000000294.msg00066");
					}
				}
			} else if (age < 12) {
				passengerType = BIZ_COMMONS_SCRIPT.getI18n("0000000294.msg00066");
			} else {
				passengerType = BIZ_COMMONS_SCRIPT.getI18n("0000000294.msg00064");
			}
		}
		const resultBox = $('div[name=calcMsg]');
		resultBox.empty();
		const resultMessage = BIZ_COMMONS_SCRIPT.getI18n("0000000294.msg00080").replace("#0" ,baseDate).replace("#1","<strong class='orange'>"+passengerType+"</strong>")
		resultBox.html(resultMessage);	
		resultBox.show();
	}
	</script>

	<div id="ifmWrap"
		style="height: 100%; display: none; overflow: auto; text-align: center; -webkit-overflow-scrolling: touch;">
		<iframe src="" width="100%" height="100%" name="popupChkApp"></iframe>
	</div>
	<script type="text/javascript"
		src="/nt2vCtJPw0GxCaSK28S2fbTXv8U/piEaS6pNXY/IjUxRBpiDAI/e3VUI3li/WUAB"></script>
	<span role="status" aria-live="assertive" aria-relevant="additions"
		class="ui-helper-hidden-accessible"></span>
</body>
</html>