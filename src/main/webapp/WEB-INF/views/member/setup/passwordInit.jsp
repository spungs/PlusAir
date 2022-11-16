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

		<div class="wrap wrap--button pc-small">
			
			
	
			
			<div class="content" id="content">
				<main id="main" class="main ">
					
					<form action="./passwordInitAction.do" method="post" id="frm">
	<!--20210519 title영역 수정-->
	<div class="page-title-wrap">
		<div class="page-title">새&nbsp;비밀번호&nbsp;설정</div>
		<div class="page-sub-title">새&nbsp;비밀번호를&nbsp;<br class="mobile-only">설정해&nbsp;주세요.</br class="mobile-only"></div>
	</div>
	<!--//20210519 title영역 수정-->
	<div class="section-wrap">
		<!--20210519 class명 변경-->
		<div class="input-wrap input--line">
			<div class="input-row input-row--password">
				<div class="input-item" id="userPasswordErrorChecker"> 
					<div class="input-box">
						<label for="userPassword" class="input__label">새&nbsp;비밀번호</label>
						<!--20210428 필수 표시 삭제-->
						<div class="input" data-element="form">
							<input type="password" class="input__text" data-element="input" id="userPassword" name="userPassword">
							<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
							<button type="button" data-element="toggleShow" class="input__show-button" aria-label="비밀번호 보기"></button>
						</div>
					</div>
					<!-- 에러텍스트 노출 -->
					<p class="input__error" tabindex="0" id="userPasswordErrorMessage"></p>
				</div>
			</div>
			<div class="input-row input-row--password">
				<div class="input-item" id="newPasswordErrorChecker">
					<div class="input-box">
						<label for="newPassword" class="input__label">새&nbsp;비밀번호&nbsp;확인</label>
						<!--20210428 필수 표시 삭제-->
						<div class="input" data-element="form">
							<input type="password" class="input__text" data-element="input" id="newPassword" name="newPassword">
							<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
							<button type="button" data-element="toggleShow" class="input__show-button" aria-label="비밀번호 보기"></button>
						</div>
					</div>
					<!-- 에러텍스트 노출 -->
					<p class="input__error" tabindex="0" id="newPasswordErrorMessage"></p>
				</div>
			</div>
		</div>
	</div>
	<div class="button-wrap section-wrap" data-element="bottomContent">
		<!--20210519 class명 변경-->
		<!-- D : 버튼 활성화 클래스 button--active -->
		<button type="button" class="button button--primary" data-action="passwordAction"><span class="button__text">새&nbsp;비밀번호&nbsp;설정하기</span></button>
	</div>
	
	<input type="hidden" id="userId" value="kmb930729">
	<input type="hidden" id="ffpNo" value="093563097">
</form>
				</main>
			</div>
			
		</div>
	</div>


<%@ include file="../../common/include/footer.jsp" %>
</body>
</html>