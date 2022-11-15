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
		
		<div class="wrap wrap--button pc-small step-ui">
			
			
				<div id="breadcrumb" class="breadcrumb pc-only" aria-label="breadcrumb">
					<nav class="breadcrumb__inner">
						<div class="breadcrumb__item">
							<a href="javascript:;" class="breadcrumb__link" style="cursor: default;">홈</a>
						</div>
						
						
							
								
									<div class="breadcrumb__item">
										<a href="javascript:;" class="breadcrumb__link" style="cursor: default;">회원가입</a>
									</div>
								
								
							
						
						
					</nav>
				</div>
			

			
			<div class="content" id="content">
				<main id="main" class="main ">
					
					<form id="frm" name="frm" method="post" action="">
<div class="page-title-wrap">
    <div class="page-title">이름 입력</div>
    <div class="page-sub-title">이름을 입력해 주세요.</div>
</div>
<div class="section-wrap">
	  <div class="input-wrap input--line">
		
		    <div class="input-row">
		      <div class="input-item">
		        <div id="korLastNameDiv" class="input-box label-active">
		          <label for="korLastName" class="input__label">성(한글)<span title="required" class="input__label-asterisk">*</span></label>
		          <div data-element="form" class="input">
		            <input type="text" data-element="input" id="korLastName" name="korLastName" class="input__text" maxlength="32">
		            <button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
		          </div>
		        </div>
		        <p tabindex="0" class="input__error" id="errorText1" style="display: none;">성(한글) 을 입력해 주세요.</p>
		        <p tabindex="0" class="input__error" id="errorText5" style="display: none;">한글은 5자, 영문은 32자까지 입력해주세요.</p>
		      </div>
		      <div class="input__mark"></div>
		      <div class="input-item">
		        <div id="korFirstNameDiv" class="input-box label-active">
		          <label for="korFirstName" class="input__label">이름(한글)<span title="required" class="input__label-asterisk">*</span></label>
		          <div data-element="form" class="input">
		            <input type="text" data-element="input" id="korFirstName" name="korFirstName" class="input__text" maxlength="32">
		            <button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
		          </div>
		        </div>
		        <p tabindex="0" class="input__error" id="errorText2" style="display: none;">이름(한글) 을 입력해 주세요.</p>
		        <p tabindex="0" class="input__error" id="errorText6" style="display: none;">한글은 성/이름 포함 15자, 영문은 32자까지 입력해주세요.</p>
		      </div>
			</div>
			
	    <div class="input-row">
		      <div class="input-item">
		        <div class="input-box">
		          <label for="engLastName" class="input__label">성(영문)<span title="required" class="input__label-asterisk">*</span></label>
		          <div data-element="form" class="input">
		            <input type="text" data-element="input" id="engLastName" name="engLastName" class="input__text" maxlength="32">
		            <button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
		          </div>
		        </div>
		        <p tabindex="0" class="input__error" id="errorText3" style="display: none;">성(영문) 을 입력해 주세요.</p>
		      </div>
		      <div class="input__mark"></div>
		      <div class="input-item">
		        <div class="input-box">
		          <label for="engFirstName" class="input__label">이름(영문)<span title="required" class="input__label-asterisk">*</span></label>
		          <div data-element="form" class="input">
		            <input type="text" data-element="input" id="engFirstName" name="engFirstName" class="input__text" maxlength="32">
		            <button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
		          </div>
		        </div>
		        <p tabindex="0" class="input__error" id="errorText4" style="display: none;">이름(영문) 을 입력해 주세요.</p>
		      </div>
	    </div>
	  </div>
	  <div class="guide-info guide-info--gray">
	    <p class="guide-info__text">반드시 여권에 기재된 (또는 여권에 사용할) 성명을 입력해 주세요. 국제선 탑승 기록과 회원정보 영문 성명이 다르면 포인트 적립 등 혜택을 드릴 수없습니다.</p>
	  </div>
</div>

<div class="button-wrap section-wrap" data-element="bottomContent"><!--20210519 class명 변경-->
  <!-- 버튼 활성화 클래스 button--active -->
  <button type="button" class="button button--primary" id="nextBtn" data-action="nextBtn"><span class="button__text">다음</span></button>
</div>
	<input type="hidden" id="joinGubun" name="status" value="normal">
	<input type="hidden" id="email" name="email" value="">
	<input type="hidden" id="test" name="test" value="">
	<input type="hidden" id="lang" name="lang" value="ko">
	
	<input type="hidden" name="act" value="agree">
	<input type="hidden" name="network_id" value="">
	<input type="hidden" name="CHL" value="HOMEPAGE">
	<input type="hidden" name="language_type" value="">
	<input type="hidden" name="foreYN" value="N">
	<input type="hidden" name="birthYear" value="1993">
	<input type="hidden" name="birthMon" value="07">
	<input type="hidden" name="birthDay" value="29">
	<!-- 본인인증을 위해 필요한 정보   -->
	<input type="hidden" name="ipinNo" value=""> <!-- 아이핀인증번호 -->
	<input type="hidden" id="SendInfo" name="SendInfo">
	<!--	내/외국인 구분을 설정하십시오. ( '1'-내국인, '2'-외국인 )	-->
	<input type="hidden" id="foreigner" name="foreigner" value="">
	<!--	조회사유를 설정하십시오. ( '10'-회원가입, '20'-기존회원 확인, '30'-성인인증, '40'-비회원 확인, '90'-기타 사유 )	-->
	<input type="hidden" id="inqRsn" name="inqRsn" value="10">
	<input type="hidden" name="lastname" value="강">
	<input type="hidden" name="firstname" value="모범">
	<input type="hidden" name="sex" value="M">
	<input type="hidden" name="ipinYN" value="Y">
	<input type="hidden" name="dupeInfo" value="MC0GCCqGSIb3DQIJAyEAhC3ylKMrWpW41T9qSFjHFK7xcmweYu/arEbfonV9K/Y=">
	<input type="hidden" name="coInfo" value="40Wmgqg7DetQI/ETuxzTPXmJGPkaChado2QQN7lMBomSU2Ub0JT9oj2HH27ak7Fqu39k+tJck8V2fJ3cJ4IcRQ==">
	<input type="hidden" name="mobileNo" value="82-010-8025-0729">
	
	<input type="hidden" id="apiRequestType" name="apiRequestType" value="1111">
	<input type="hidden" id="apiRequestNm" name="apiRequestNm" value="CHECKPLUS">
	<input type="hidden" id="memberList" name="memberList" value="">
	<input type="hidden" id="korName" name="korName" value="">
	<input type="hidden" id="userId" name="userId" value="">
	<input type="hidden" id="enrollDate" name="enrollDate" value="">
	<input type="hidden" id="snsType" name="snsType" value="">
	
	<input type="hidden" id="snsId" name="snsId" value="">
	
	<input type="hidden" id="parentName" name="parentName" value="">
	<input type="hidden" id="parentMobileNo" name="parentMobileNo" value="">
	<input type="hidden" id="parentCiNo" name="parentCiNo" value="">
	<input type="hidden" id="joinType" name="joinType" value="NOR">
	<input type="hidden" name="cardYn" value="">
	<input type="hidden" name="ffpNo" value="">
	
	<input type="hidden" id="mobileNoDuplicateYn" name="mobileNoDuplicateYn" value="">
	<input type="hidden" id="emailDuplicateYn" name="emailDuplicateYn" value="N">
	
</form>
				</main>
			</div>
		</div>
	</div>


<%@ include file="../../common/include/footer.jsp" %>
</body>
</html>