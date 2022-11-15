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
										<a href="javascript:;" class="breadcrumb__link" style="cursor: default;">아이디/비밀번호 찾기</a>
									</div>
								
								
							
						
						
					</nav>
				</div>
			
	
			
			<div class="content" id="content">
				<main id="main" class="main ">
					
					<!--20210519 title영역 수정-->
	<div class="page-title-wrap">
		<div class="page-title">아이디/비밀번호&nbsp;찾기</div>
		<div class="page-sub-title">입력하신&nbsp;정보로&nbsp;<br class="mobile-only">계정 <span class="color--org">
		
			
			
				
				
					 <!-- 아이디가 있는 일반또는 제휴회원 --> 
						
					
					
					
				
				1
			
			
		
		</span>건을&nbsp;찾았어요.</br class="mobile-only"></div>
		<div class="page-title-add">검색된&nbsp;계정&nbsp;중&nbsp;본인의&nbsp;아이디를&nbsp;선택해&nbsp;<br>새&nbsp;비밀번호를&nbsp;설정할&nbsp;수&nbsp;있습니다.</div>
		<!--20210519 class명 변경-->
	</div>
	
	<!-- 2022.05 개선  S 12231 dk -->
	<div class="section-wrap">
      <div id="divIdList" class="radio-button-block radio-list">
      	
		
			
			
			
				<span class="radio-button checkbox--small">
				<input type="radio" id="rdoId0" name="rdoId" class="radio-button__input checkbox__input">
				<label for="rdoId0" class="radio-button__label delete-in checkbox__label">
						<span class="dis-table">
							<span class="radio-button__title type02">
								<span>아이디</span>
								<span class="color-org">
									
										
											kmb
											******
										
										
									
								</span>	
							</span>
							<span class="radio-button__title type02">
								<span>가입일</span>
								<span>2022.11.13</span>
							</span>
							<i class="checkbox__ico right" aria-hidden="true"></i>
						 </span>
				</label>
					
					
					
					<input type="hidden" name="apiRequestType" value="2000">
					<input type="hidden" name="ffpno" value="093563097">
					<input type="hidden" name="userId" value="kmb930729">
					<input type="hidden" name="num" value="0">
					<input type="hidden" name="email" value="kmb0729@nate.com">
					<input type="hidden" name="ciNo" value="40Wmgqg7DetQI/ETuxzTPXmJGPkaChado2QQN7lMBomSU2Ub0JT9oj2HH27ak7Fqu39k+tJck8V2fJ3cJ4IcRQ==">
					<input type="hidden" name="mobileno" value="82-010-8025-0729">
					<input type="hidden" name="joinType" value="NOR">
					<input type="hidden" id="maskingMobileNo">
				</span>
			
		
		
      </div>
    </div>
    <!-- 2022.05 개선  E -->
	
	<form id="frm" method="post" action="/ko/member/setup/passwordInit.do">
		<input type="hidden" name="userId">
		<input type="hidden" name="ffpNo">
		<input type="hidden" name="isFlag" value="Y">
	</form>
	
	<!-- 버튼 테스트 s -->
	<!-- 비밀번호 재설정  버튼 추가 -->
	<div class="button-wrap section-wrap">
		<button type="button" class="button button--primary" id="btnPwModify">
			<span class="button__text">비밀번호&nbsp;재설정</span>
		</button>
		
		
		  <!-- </button> -->
		
	</div>
	<!-- 이전으로 버튼 추가 -->
	<div class="button-wrap button-wrap--login mt30">
		<div class="button-wrap left">
			<button type="button" class="link-wrap__underline" data-action="menu" data-menu-name="login"><span class="button__text">이전으로</span></button>
	    </div>
	</div>
	<!-- 버튼 테스트 e -->

	

    <button id="btnSheet" data-target-open="sheet01" style="display: none;" data-target="#sheet01" data-element="modal_anchor"></button>

	<div class="bottom-sheet GB_0_33 bottomSheet-modal" id="sheet01">
		<div class="bottom-sheet__top">
			<div class="title">
				<h2 class="title__main">비밀번호&nbsp;재설정</h2>
			</div>
		</div>
		<div class="bottom-sheet__bot">
			<div class="list-option-reset">
				<ul class="list-option list-option--border-b">
					<li class="list-option__item">
						<a href="javascript:;" class="list-card__item" onclick="MEMBER_AUTH_FINDUSERINFOLIST_SCRIPT.sendEmail();">
							<div class="list-card__image">
								<img src="https://static.jejuair.net/hpgg/resources/images/icon/icon-email-mono-small.png" alt="">
							</div>
							<div class="list-card__info">
								<div class="list-card__info-vertical">
									<strong class="list-card__title">이메일로&nbsp;링크&nbsp;받고&nbsp;재설정</strong>
									<p class="list-card__text" id="email">je****@gmail.com</p>
								</div>
							</div>
						</a>
					</li>
					
					<li class="list-option__item">
						<a href="javascript:;" class="list-card__item" onclick="MEMBER_AUTH_FINDUSERINFOLIST_SCRIPT.goMobileSms();">
							<div class="list-card__image">
								<img src="https://static.jejuair.net/hpgg/resources/images/icon/icon-phone-mono-small.png" alt="">
							</div>
							<div class="list-card__info">
								<div class="list-card__info-vertical">
									<strong class="list-card__title">휴대전화로&nbsp;인증코드&nbsp;받고&nbsp;재설정</strong>
									<p class="list-card__text" id="mobileNo">010-****-1234</p>
								</div>
							</div>
						</a>
					</li>
					
					
					<div class="list-card__info" id="goCino" style="display: none;">
						<a href="./findUserInfo.do" class="list-card__item">
							<strong class="list-card__title">본인인증으로 찾기로 비밀번호 설정바랍니다.</strong>
						</a>
					</div>
				
					<div class="list-card__info" id="goAliance" style="display: none;">
						<div class="list-card__info-vertical">
							<strong class="list-card__title">제휴카드회원입니다. 회원가입 단계에서 제휴카드회원가입을 진행바랍니다.</strong>
						</div>
					</div>
					
					
					
					<div class="list-card__info" id="goEmpty" style="display: none;">
						<div class="list-card__info-vertical">
							<strong class="list-card__title">인증에 필요한 정보가 없습니다. 고객센터로 연락주세요.</strong>
						</div>
					</div>
				</ul>
			</div>

			
			<div class="section-wrap"><!--20210519 class명 변경-->
				<div class="section-title">고객센터에 문의하기</div><!--20210519 class명 변경-->
				<div class="customer-inquiry pc-15">
				  <div class="img-box">
					
					
						<div class="img-box__item">
						  <a href="http://pf.kakao.com/_gxbqxhE" target="_blank">
							<div class="img-box__img">
							  <img src="https://static.jejuair.net/hpgg/resources/images/icon/icon-kakao-sms.png" alt="">
							</div>
							<div class="img-box__text">
							  <strong>카카오톡 문의</strong>
							  <p>카카오톡에서 ‘제주항공 고객센터’를<br>검색하시면 상담사에게 문의할 수 있어요.</p>
							</div>
						  </a>
						</div>
					
					
					<div class="img-box__item">
					  <a href="tel:1599-1500" title="전화연결"><!--20210428 a 링크 추가-->
						<div class="img-box__img">
						  <img src="https://static.jejuair.net/hpgg/resources/images/icon/icon-phone.png" alt="">
						</div>
						<div class="img-box__text">
						  <strong>전화 문의</strong>
						  <p>고객센터 : 1599-1500<br>운영시간(한국시간) : 09:00 ~ 19:00</p>
						</div>
					  </a>
					</div>
					
				  </div>
				</div>
			</div>
			

		</div>
		<a href="#" rel="modal:close" class="bottom-sheet__button-close"><span class="blind">닫기</span></a>
	</div>

	<form id="mobileSms" method="POST" action="/ko/member/setup/passwordInit.do">
	  <input type="hidden" name="userId" value="">
	  <input type="hidden" name="ffpNo" value="">
	  <input type="hidden" name="mobileNo" value="">
	</form>

	<div id="modalLayer01" class="modal modal-full modal-scroll modal--fixed-multi">
		<div class="modal-header">
		  <div class="modal-header__title">인증코드&nbsp;입력</div>
		</div>
		<div class="modal-content">
		  <div class="title">
			<div class="title__page "><span class="text--color-org" id="mobileSpan"></span>로<br class="mobile-only">&nbsp;인증코드가&nbsp;발송되었어요.</br class="mobile-only"></div>
		  </div>
	
		  <div class="section-wrap">
	
			<div class="input-wrap input--line">
			  <div class="input-row">
				<div class="input-item">
				  <div class="input-box">
					<label for="inputnumber" class="input__label">인증코드&nbsp;입력&nbsp;(6자리)</label>
					<div class="input" data-element="form">
					  <input type="tel" class="input__text" data-element="input" id="inpCertify" maxlength="6">
					  <button type="button" class="input__remove-button" data-element="remove">삭제</button>
					</div>
				  </div>
					<!-- 입력 필드 하단 ‘다시받기’ 버튼 선택 시 재발송 텍스트 안내 -->
					<p class="input__error" tabindex="0" id="txtCertify">인증코드가&nbsp;다시&nbsp;발송됐습니다.</p>
					<!-- //입력 필드 하단 ‘다시받기’ 버튼 선택 시 재발송 텍스트 안내 -->
	
					<!-- 잘못된 인증코드 입력 시-->
					<p class="input__error" tabindex="0" id="txtNoCertify">인증코드를&nbsp;다시&nbsp;확인해&nbsp;주세요.</p>
	
					<!-- 인증시간 초과 -->
					<p class="input__error" tabindex="0" id="txtTmOver">유효시간이&nbsp;초과하였습니다.<br>인증코드를&nbsp;다시&nbsp;받아&nbsp;입력해주세요.</p>
				</div>
			  </div>
	  
			  <div class="input-item">
				<div class="button-wrap button-wrap--between"><!--.button-wrap--between class변경-->
				  <div class="sub-text date__text">유효시간 <span id="txtTimer"></span></div>
				  <button type="button" id="reSms" class="button button--small mt0">
					<span class="button__text" id="btnCertify">다시받기</span>
				  </button>
				</div>
			  </div>
			</div>
		  </div>
	
		</div>
	
	
		<div class="fixed-wrap fixed-wrap--multi-line border-none ">
		  <div class="button-wrap">
			<button type="button" id="btnPopupNext" class="button button--primary">
			  <span class="button__text">새&nbsp;비밀번호&nbsp;설정하기</span>
			</button>
			<!--가입한 아이디 안내 화면에서 호출 시 -->
			<!-- <span class="button__text">다음</span></button> -->
			<!--//가입한 아이디 안내 화면에서 호출 시 -->
		  </div>
		</div>
		<a href="javascript:;" rel="modal:close" class="modal__close"><span class="blind">닫기</span></a>   
	  </div>
	  <input type="hidden" id="modalLayer01Show" data-element="modal_anchor" data-target="#modalLayer01" data-modal-type="full">
				</main>
			</div>
			
		</div>
	</div>
<%@ include file="../../common/include/footer.jsp" %>
</body>
</html>