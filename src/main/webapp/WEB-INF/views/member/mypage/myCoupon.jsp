<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="./resources/img/favicon.ico">
<link rel="stylesheet" href="./resources/mypagecss/component.css">
<link rel="stylesheet" href="./resources/mypagecss/global.css">
<link rel="stylesheet" href="./resources/mypagecss/lang.css">
<link rel="stylesheet" href="./resources/mypagecss/main.css">
<link rel="stylesheet" href="./resources/mypagecss/page.css">
<link rel="stylesheet" href="./resources/mypagecss/responsive.css">
<link rel="stylesheet" href="./resources/mypagecss/ticketing.css">
<meta charset="UTF-8">
<title>플러스항공</title>
</head>
<body id="subLayoutBody">
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
	

	<%@ include file="../../common/include/header.jsp"%>
		
		<div id="body">
			
			<!-- Google Tag Manager (noscript) -->
			<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PD2BQQ4" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
			<!-- End Google Tag Manager (noscript) -->
			<div class="wrap GD">
				<div id="breadcrumb" class="breadcrumb pc-only" aria-label="breadcrumb">
					<nav class="breadcrumb__inner">
						<div class="breadcrumb__item">
							<a href="javascript:;" class="breadcrumb__link" style="cursor: default;">홈</a>
						</div>
						<div class="breadcrumb__item">
							<a href="javascript:;" class="breadcrumb__link" style="cursor: default;">마이페이지</a>
						</div>
						<div class="breadcrumb__item breadcrumb__item--current" aria-current="page" data-element="toggle" data-options="{&quot;mode&quot;: &quot;slide&quot;, &quot;speed&quot;: 100, &quot;clickToClose&quot;: true}">
							<button type="button" class="breadcrumb__link breadcrumb__link--list" data-element="toggle__anchor" aria-controls="toggle-2" aria-expanded="false">에어카페 쿠폰</button>
								<div class="breadcrumb__siblings-list" data-element="toggle__panel" id="toggle-2">
									<a href="javascript:void(0);" class="item" onclick="location.href='myFlightList'">나의 탑승 내역</a>
									<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/myPage/methodsPaymentMngm.do')">결제수단 관리</a>
									<a href="javascript:void(0);" class="item" onclick="location.href='MyGiftTicketList'">나의 기프티켓</a>
									<a href="javascript:void(0);" class="item" onclick="location.href='myinfo'">마이페이지 메인</a>
									<a href="javascript:void(0);" class="item" onclick="location.href='MySportsCardList'">나의 스포츠 멤버십</a>
									<a href="javascript:void(0);" class="item" onclick="location.href='MyPartnerCoupon'">나의 쿠폰</a>
									<a href="javascript:void(0);" class="item" onclick="location.href='memberInfoModify'">회원정보 수정</a>
									<a href="javascript:void(0);" class="item" onclick="location.href='ReservationList'">나의 예약 현황</a>
									<a href="javascript:void(0);" class="item" onclick="location.href='MyFavoritesList'">즐겨찾기</a>
								</div>
						</div>
					</nav>
				</div>
				<div class="content" id="content">
				<main id="main" class="main ">
					
					<!-- 안내 화면 -->
	<div class="page-title-wrap pc-only">
	    <div class="page-title">에어카페 쿠폰</div>
    </div>
	<div class="coupon-web">
		<div class="coupon-web__image">
			<img src="https://static.jejuair.net/hpgg/resources/images/etc/img-coupon-aircafe.png" alt="">
		</div>
		<div class="coupon-web__pc-wrap">
			<div class="coupon-web__title">하늘 위 작은 카페 <br>제주항공의 에어카페</div>
			<p class="coupon-web__text text__default mobile-only">제주항공 앱을 이용하시면<br>기내에서 즐기는 제주항공만의<br>에어카페 할인 혜택을 받으실 수 있어요.</p>
			<p class="coupon-web__text pc-only">제주항공 앱을 이용하시면<br>기내에서 즐기는 제주항공만의 에어카페 할인 혜택을 받으실 수 있어요.</p>
			<div class="coupon-web__button-wrap mobile-only ">
				<button type="button" class="button button--secondary button--active">
					<span class="button__text" onclick="window.open('https://japp.page.link/MTzN');">제주항공 앱으로 보기</span> <!-- 제주항공 앱으로 보기 -->
				</button>
			</div>
			<div class="button-wrap button-link pc-only left add--mt-15" style="display: flex;">
				<a href="javascript:void(0);" class="button" data-action="menu" data-menu-name="iOSBtn"><img src="https://static.jejuair.net/hpgg/resources/images/etc/link-appstore.png" alt="애플 앱스토어 이동"></a>
				<a href="javascript:void(0);" class="button" data-action="menu" data-menu-name="AndroidBtn"><img src="https://static.jejuair.net/hpgg/resources/images/etc/link-playstore.png" alt="구글 플래이스토어 이동"></a>
			</div>
			<div class="link-wrap">
				<a href="javascript:void(0)" onclick="URL_LINK.getI18Url('/cabinService/service/airCafe.do')" class="link-wrap__underline"><span>에어카페 자세히 보기</span></a>
			</div>
		</div>
	</div>
	<!-- //안내 화면 -->
	
				</main>
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
	<script type="text/javascript" src="/hOX8m7ay4wip/uP4_XAtO4s/DD/3uESLkcmE7/CRtoImUcAQ/Gi/kSUBlfdxIB"></script>
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
	</div>
	<div id="modalCountry" class="modal modal-full CO_1_1 modal-scroll">
	</div>
	<div id="modalNationality" class="modal modal-full CO_1_1 modal-scroll">
	</div>
	<div id="modalMyFriendsList" class="modal modal-full modal--fixed-multi modal-scroll">
	</div>
	<div id="modalMyFriendsDetail" class="modal modal-full modal-scroll">
	</div>
	<div id="modalAddMyFriends" class="modal modal-full modal--fixed-multi modal-scroll">
	</div>

</body>
</html>