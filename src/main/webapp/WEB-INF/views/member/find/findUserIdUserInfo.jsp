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
					
					<form name="frm" id="frm" method="post" action="./findUserInfoList.do">
		<input type="hidden" id="apiRequestType" name="apiRequestType" value="">
		<!--20210519 title영역 수정-->
		<div class="page-title-wrap">
			<div class="page-title">아이디/비밀번호&nbsp;찾기</div>
			<div class="page-sub-title">가입&nbsp;시&nbsp;등록한&nbsp;<br class="mobile-only">아이디를&nbsp;입력해&nbsp;주세요.</br class="mobile-only"></div>
		</div>
		<!--//20210519 title영역 수정-->

		<div class="section-wrap">
			<!--20210519 class명 변경-->
			<div class="input-wrap input--line">
				<div id="input-box" class="input-row">
					<div class="input-item">
						<!--error문구 노출시 .input__error-->
						<div class="input-box">
							<label for="userId" class="input__label">아이디</label>
							<!--20210428 필수 삭제-->
							<div data-element="form" class="input">
								<input type="text" id="userId" name="userId" class="input__text" data-element="input" maxlength="20">
								<!--data-element="input" 추가-->
								<button type="button" data-element="remove" class="input__remove-button hide"><span class="hidden">삭제</span></button>
							</div>
						</div>
						<p tabindex="0" class="input__error" style="display: none;">입력하신&nbsp;정보의&nbsp;계정을&nbsp;찾을&nbsp;수&nbsp;없습니다.&nbsp;<br>다시&nbsp;입력해주세요.</p>
						<p tabindex="1" class="input__error" style="display: none;">탈퇴한 적이 있는 아이디는 사용할 수 업습니다.</p>
						<!--20210428 error문구 변경-->
					</div>
				</div>
			</div>
		</div>

		<div class="button-wrap section-wrap" data-element="bottomContent"><!--20210519 class명 변경 -->
			<button type="button" class="button button--primary" id="nextAction"><span class="button__text">다음</span></button><!-- D : 버튼 활성화 클래스 button--active -->
		</div>
	</form>
				</main>
			</div>
			
		</div>
	</div>


<%@ include file="../../common/include/footer.jsp" %>
</body>
</html>