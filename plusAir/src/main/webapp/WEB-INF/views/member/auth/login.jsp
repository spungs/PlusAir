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
										<a href="javascript:;" class="breadcrumb__link" style="cursor: default;">로그인</a>
									</div>
								
								
							
						
						
					</nav>
				</div>
			
	
			
			<div class="content" id="content">
				<main id="main" class="main ">
					
					
	<div class="page-title-wrap">
		<div class="page-title">로그인</div>
		<div class="page-sub-title">포인트 적립에서 운임할인까지<br>회원전용 혜택을 받아보세요.</div>
	</div>
	<!--//20210519 title영역 수정-->
	<input type="hidden" id="bookType" value="">
	<div class="login">
		<form id="frm" action="/member/auth/loginAction.do" method="post">
			<input type="hidden" name="apiRequestType" id="apiRequestType">
			<input type="hidden" name="targetUrl" id="targetUrl" value="/ko/main/base/index.do">
			<input type="hidden" name="nonTargetUrl" id="nonTargetUrl" value="/ko/main/base/index.do">
			<input type="hidden" name="security" id="security" value="">
			<input type="hidden" name="snsType" id="snsType">
			<input type="hidden" name="snsId" id="snsId">			
			
			<div class="login__input-area">
				<div class="input-row">
					<!-- D : 에러메세지 노출 시 'input--error' 클래스 추가 -->
					<div id="idAreaForm" data-element="form" class="input">
						<!-- <label for="userId" class="input__label">아이디 <span title="required" class="input__label-asterisk">*</span></label> -->
						<!--20210427 label 추가-->
						<input type="text" data-element="input" id="userId" name="userId" class="input__text" tabindex="1" placeholder="아이디">
						<!--placeholder 삭제-->
						<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
					</div>
					<!-- 6자 미만 입력 시 or 띄어쓰기 입력 시 -->
					<p tabindex="0" id="idErrorArea" class="input__error">
						
					</p>
					<!-- //6자 미만 입력 시 or 띄어쓰기 입력 시 -->

					<!-- 탈퇴한 ID 입력 시
				<p tabindex="0" class="input__error">탈퇴한 적이 있는 아이디는 사용할 수 없습니다.<br>다른 아이디로 가입해 주세요.</p>
				//탈퇴한 ID 입력 시 -->
				</div>
				<!-- D : 에러메세지 노출 시 'input--error' 클래스 추가 -->
				<div class="input-row input-row--password">
					<div id="pwAreaForm" data-element="form" class="input ">
						<!-- <label for="userPwd" class="input__label">비밀번호 <span title="required" class="input__label-asterisk">*</span></label> -->
						<!--20210427 label 추가-->
						<input type="password" data-element="input" id="userPwd" name="userPwd" class="input__text" tabindex="2" placeholder="비밀번호">
						<!--placeholder 삭제-->
						<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
						<button type="button" data-element="toggleShow" class="input__show-button" aria-label="비밀번호 보기"></button>
					</div>
					<!-- 등록되지 않은 아이디 or 아이디/비밀번호 불일치 시 -->
					<p tabindex="0" id="pwErrorArea" class="input__error">
						
					</p>
					<!-- //등록되지 않은 아이디 or 아이디/비밀번호 불일치 시 -->
				</div>
			</div>
			<div class="login__check">
				<span class="checkbox checkbox--small">
					<input type="checkbox" class="checkbox__input" name="userIdSave" id="userIdSave" data-element="checkbox">
					<label for="userIdSave" class="checkbox__label">
						<i class="checkbox__ico" aria-hidden="true"></i>
						<span>아이디&nbsp;저장</span>
					</label>
				</span>
			</div>
			<div class="button-wrap button-wrap--login">
				<div class="button-wrap">
					<button type="button" class="button button--primary" data-action="idpwlogin" tabindex="3"><span class="button__text">로그인</span></button>
				</div>
				
				<!--한국-->
				
					<div class="button-wrap advertise">
						<span class="advertisement">광고</span>
						<button type="button" class="button button--option " data-action="loginAd"><span class="button__text button__icon button__icon--phone">휴대폰 번호로 로그인</span></button><!--20211027 오픈 후 추가-->
					</div>
					<div class="button-wrap">
						<button type="button" class="button button--option" data-action="snsNaverLogin"><span class="button__text button__icon">네이버 로그인</span></button>
					</div>
					
					<div class="button-wrap">
						<button type="button" class="button button--option" data-action="snsKakaoLogin"><span class="button__text button__icon button__icon--kakao">카카오 로그인</span></button>
					</div>
					
		              <div class="button-wrap">
		                <button type="button" class="button button--option apple-black" data-action="snsAppleLogin">
			                <span class="button__text button__icon button__icon--apple"><!-- <em class="en">애플</em> <em class="txt">로그인</em> --> 
			               	 	Apple 로그인
			                </span>
		                </button>
		              </div>
				
				<!--한국외 기타-->
				
				

				<div class="button-wrap">
					<button type="button" class="button button--option" data-action="nonUserLogin"><span class="button__text">비회원&nbsp;로그인</span></button>
				</div>
				<!--20210519 class명 변경-->
				<!-- D : MO-004-030 | 다른방법 로그인 백드롭 -->
				<!--
				
					<div class="link-wrap sub-box">
						
						<button type="button" class="link-wrap__underline" data-action="nonUserLogin"><span>다른 방법으로 로그인</span></button>
					</div>
				
				-->
			</div>
			<div class="guide-info guide-info--login">
				
				<p class="guide-info__text">비회원으로 로그인하면 리프레시 포인트 및 회원 혜택이 제공되지 않습니다. </p>
			</div>
			<div class="link-wrap link-wrap--login">
				<!--20210519 class명 삭제-->
				<a href="#" class="link-wrap__item" data-action="menu" data-menu-name="findUserInfo">아이디/비밀번호&nbsp;찾기</a>
				<a href="#" class="link-wrap__item" data-action="menu" data-menu-name="join">회원가입</a>
			</div>
		</form>
	</div>
	<a href="#" class="hidden" data-element="modal_anchor" data-target="#modalLayer01" data-modal-type="full" style="color: #fff;"></a>
	<div id="modalLayer01" class="modal modal-full modal-scroll">
		<div class="modal-header">
			<div class="modal-header__title">미가입&nbsp;계정&nbsp;안내</div>
		</div>
		<div class="modal-content">
		<div class="finish-item-wrap finish-item-wrap--full">
			<div class="finish-item no-data">
				<div aria-hidden="true" class="finish-item__img"></div>
				<p class="finish-item__title">가입되어&nbsp;있지&nbsp;않은&nbsp;계정입니다.</p>
				<p class="finish-item__text">회원으로 가입하시면 <br>각종 회원 전용 서비스를 이용하실 수 있습니다.</p>
			</div>
		</div>

		</div>
		<div class="fixed-wrap fixed-wrap--multi-line border-none ">
			<div class="button-wrap">
				<button type="button" class="button button--primary button--active " data-action="menu" data-menu-name="join"><span class="button__text">회원가입하기</span></button>
			</div>
		</div>

		<a href="#" rel="modal:close" class="modal__close"><span class="blind">Close</span></a>
	</div>
				</main>
			</div>
			
		</div>
	</div>


<%@ include file="../../common/include/footer.jsp" %>

</body></html>