<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="">
<!-- Jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<%@ include file="../../common/include/header.jsp"%>
<div id="body">
		
		<!-- Google Tag Manager (noscript) -->
		<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PD2BQQ4" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
		<!-- End Google Tag Manager (noscript) -->

		<div class="wrap  wrap--no-pab pc-small">
			
			
				<div id="breadcrumb" class="breadcrumb pc-only" aria-label="breadcrumb">
					<nav class="breadcrumb__inner">
						<div class="breadcrumb__item">
							<a href="javascript:;" class="breadcrumb__link" style="cursor: default;">홈</a>
						</div>
						
						
							
								
									<div class="breadcrumb__item">
										<a href="javascript:;" class="breadcrumb__link" style="cursor: default;">
										 
											
											
												비회원 로그인
											
										
										
										</a>
									</div>
								
								
							
						
						
					</nav>
				</div>
			
	
			
			<div class="content" id="content">
				<main id="main" class="main ">
					
					<!--20210519 title영역 수정-->
	<form id="frm" action="/member/auth/loginAction.do" method="post">
		<input type="hidden" name="apiRequestType" id="apiRequestType" value="3">
		<input type="hidden" name="targetUrl" id="targetUrl" value="">
		<input type="hidden" name="nonTargetUrl" id="nonTargetUrl" value="">
		<input type="hidden" name="security" id="security" value="">
		<div class="page-title-wrap">
			<div class="page-title">비회원&nbsp;로그인</div>
			<div class="page-sub-title">회원가입 없이 <br class="mobile-only">예매할 수 있어요.</div>
		</div>
		<!--//20210519 title영역 수정-->
		<div class="sub-section">
			<!--20210519 class변경-->
			<div class="input-wrap login">
				<!--20210427 .login 추가-->
				<div class="input-row">
					<!-- D : 에러메세지 호출 input--error 클래스 추가 -->
					<div id="login_email_container" class="input" data-element="form">
						<label for="login_email" class="input__label">이메일 <span title="required" class="input__label-asterisk">*</span></label>
						<!--20210427 label 추가-->
						<div class="eac-input-wrap" style="display: inline-block; position: relative; font-size: 16px;"><input type="text" class="input__text" data-element="email" id="login_email" name="userEmail" title="이메일&nbsp;입력"><span class="email-inputbox_auto" style="display: block; box-sizing: content-box; font-family: SpoqaHanSansNeo, roboto, sans-serif, Arial; font-weight: 700; letter-spacing: 0px;"></span><span class="eac-cval" style="visibility: hidden; position: absolute; display: inline-block; font-family: SpoqaHanSansNeo, roboto, sans-serif, Arial; font-weight: 700; letter-spacing: 0px;"></span></div>
						<button type="button" data-element="remove" class="input__remove-button" onclick="MEMBER_AUTH_NONUSERLOGIN_SCRIPT.remove();"><span class="hidden">삭제</span></button>
					</div>
					
					<p class="input__error" tabindex="1">이메일&nbsp;주소를&nbsp;입력해주세요.</p>
				</div>
			</div>
		</div>

		<div class="agree-wrap sub-section">
			<!--20210519 class변경-->
			<div id="emailAgreeContainer" class="check-wrap">
				<span class="checkbox checkbox--small">
					<input type="checkbox" class="checkbox__input" id="emailAgree" name="emailAgree" data-element="checkbox">
					<label for="emailAgree" class="checkbox__label">
						<i class="checkbox__ico" aria-hidden="true"></i>
						<span>개인정보&nbsp;수집,&nbsp;이용&nbsp;동의</span>
					</label>
				</span>
				<button type="button" id="btnTerm" class="agree-wrap__button" data-modal-type="full" aria-label="(필수) 개인정보 수집, 이용 동의 보기" onclick="MEMBER_AUTH_NONUSERLOGIN_SCRIPT.openTerms();"></button>
			</div>
			<p class="input__error" id="noChecked" tabindex="2">개인정보의&nbsp;수집,&nbsp;이용&nbsp;사항에&nbsp;동의해주십시오.</p>
		</div>

		<div class="section-wrap">
			<!--20210519 class변경-->
			<div class="button-wrap" id="login-btn-wrap">
				<!-- D : 버튼 활성화시 button--primary -> button--active 클래스 변경 -->
				<button type="button" class="button button--primary" data-action="emailLogin"><span class="button__text">비회원&nbsp;로그인</span></button>
			</div>
		</div>
	</form>
	<div class="section-wrap">
		<!--20210519 class변경-->
		<div class="service-information" data-element="toggle" data-options="{&quot;mode&quot;: &quot;move scroll&quot;}">
			<div class="service-information__title">
				<button type="button" class="service-information__anchor" data-element="toggle__anchor" aria-controls="toggle-2" aria-expanded="false">비회원&nbsp;로그인&nbsp;안내</button>
			</div>
			<div class="service-information__content" data-element="toggle__panel" id="toggle-2">
				<div class="list-wrap">
					<ul class="list-guide">
						<li class="list-guide__item">입력하신&nbsp;이메일&nbsp;주소를&nbsp;항공권을&nbsp;예매하실&nbsp;때도&nbsp;동일하게&nbsp;기재해&nbsp;주세요.</li>
						<li class="list-guide__item">비회원으로&nbsp;예매하시면&nbsp;요금&nbsp;할인과&nbsp;각종&nbsp;이벤트&nbsp;혜택을&nbsp;받으실&nbsp;수&nbsp;없습니다.</li>
						<li class="list-guide__item">항공권&nbsp;예매&nbsp;정보는&nbsp;[마이페이지&nbsp;&gt;&nbsp;나의&nbsp;예약조회]&nbsp;에서&nbsp;확인하실&nbsp;수&nbsp;있습니다. </li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div id="modalLayer01" class="modal modal-full modal-scroll modal--fixed-multi">
		<div class="modal-header">
		  <div class="modal-header__title" id="termTitle"></div>
		</div>
		<div class="modal-content" style="height: calc(100% - 59.6px);">
		  <section class="terms" id="termConts">
			
		  </section>
		</div>
		<div class="fixed-wrap fixed-wrap--multi-line border-none">
		  <!-- checkbox 없는 경우 border-none class 추가 -->
		  <div class="button-wrap">
			<button type="button" rel="modal:close" class="button button--active"><span class="button__text">확인</span></button>
		  </div>
		</div>
		<a href="javascript:;" rel="modal:close" class="modal__close"><span class="blind">닫기</span></a>
	  </div>
				</main>
			</div>
			
		</div>
	</div>


<%@ include file="../../common/include/footer.jsp"%>

</body>
</html>