<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="">
<script>
function nextBtn(){
	location.href='clauseAgree';
}


</script>
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
					
					<script src="/toast/toast-sample/js/crypto-js.js"></script>
<form id="frm" name="frm" method="post" action="">
 	<div class="content" id="content">
        <main id="main" class="main">

          <!--20210519 title영역 수정-->
          <div class="page-title-wrap">
            <div class="page-title">아이디, 비밀번호 입력</div>
            <div class="page-sub-title">사용하실 아이디와 비밀번호를 입력해주세요.</div>
          </div>
           <!--//20210519 title영역 수정-->

          <div class="section-wrap"><!--20210519 class명 변경-->
            <div class="input-wrap input--line">
              <div class="input-row">
                <div class="input-item">
                  <div class="input-box">
                    <label for="input-01" class="input__label">아이디<span title="required" class="input__label-asterisk">*</span></label>
                    <div data-element="form" class="input">
                      <input type="text" id="inp-01" class="input__text">
                      <button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
                    </div>
                  </div>
                  <!-- 에러메세지 노출 텍스트 -->
                  
                    <p tabindex="0" class="input__error" id="txtIdChk1" style="display: none;">이미 사용 중인 아이디입니다.</p>

                  
                    <p tabindex="0" class="input__error" id="txtIdChk2" style="display: none;">영문 소문자와 숫자 6자 이상을 조합해 주세요.</p>
                    

                  
                    <p tabindex="0" class="input__error" id="txtIdChk3" style="display: none;">탈퇴 이력이 있는 아이디로 사용할 수 없습니다.</p>
                    
                  <!-- //에러메세지 노출 텍스트 -->
                </div>
              </div>
              <div class="input-row input-row--password">
                <div class="input-item">
                  <div class="input-box">
                    <label for="inp-02" class="input__label">비밀번호<span title="required" class="input__label-asterisk">*</span></label>
                    <div data-element="form" class="input">
                      <input type="password" class="input__text" id="inp-02">
                      <button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
                      <button type="button" data-element="toggleShow" class="input__show-button" aria-label="비밀번호 보기"></button>
                    </div>
                  </div>
                  <p class="input__sub-text">영문/숫자/특수문자 중 2가지 이상 조합하여 8~20자로 입력해 주세요. </p><!--20210519 문구 수정-->
                  <!-- 에러메세지 노출 텍스트 -->
                  <!-- 6자 이상 미입력 or 문자/숫자 각 1글자 미포함 시 -->
                  <p class="input__error" tabindex="0" id="txtPwChk1" style="display: none;">영문/숫자/특수문자 중 2가지 이상 조합하여 8~20자로 입력해 주세요.  </p>
                  <!-- //6자 이상 미입력 or 문자/숫자 각 1글자 미포함 시 -->

                  <!-- 3자 이상의 반복, 연속된 문자 or 숫자 입력 시-->
                    <p class="input__error" tabindex="0" id="txtPwChk2" style="display: none;">반복되거나 연속된 문자/숫자는 사용할 수 없습니다. </p>
                   <!--  //3자 이상의 반복, 연속된 문자 or 숫자 입력 시 -->

                  <!-- 아이디와 4자 이상 동일한 문자 or 숫자 입력 시 -->
                    <p class="input__error" tabindex="0" id="txtPwChk3" style="display: none;">아이디를 일부 포함한 비밀번호는 사용할 수 없습니다.</p>
                    <!--//아이디와 4자 이상 동일한 문자 or 숫자 입력 시 -->

                  <!-- 사용 불가능한 특수문자 입력 시-->
                    <p class="input__error" tabindex="0" id="txtPwChk4" style="display: none;"> “사용 가능한 특수문자  : !, @, $, %, ^, &amp;, *, ~”</p>
                    <!--//사용 불가능한 특수문자 입력 시 -->
                  <!-- //에러메세지 노출 텍스트 -->
                </div>
              </div>
              <div class="input-row input-row--password">
                <div class="input-item">
                  <div class="input-box">
                    <label for="inp-03" class="input__label">비밀번호 확인<span title="required" class="input__label-asterisk">*</span></label>
                    <div data-element="form" class="input">
                      <input type="password" class="input__text" data-element="input" id="inp-03">
                      <button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
                      <button type="button" data-element="toggleShow" class="input__show-button" aria-label="비밀번호 보기"></button>
                    </div>
                  </div>
                  <!-- 비밀번호 확인 입력 값과 불일치 시 -->
                  <p tabindex="0" class="input__error" id="txtPwChk5" style="display: none;">비밀번호가 일치하지 않습니다. </p>
                  <!-- //비밀번호 확인 입력 값과 불일치 시 -->
                </div>
              </div>
            </div>

			
				

          </div>

          <div class="button-wrap section-wrap" data-element="bottomContent"><!--20210519 class명 변경-->
            <!-- 버튼 활성화 클래스 button--active -->
            <button id="btnChangePw" type="button" class="button button--primary"><span class="button__text" onclick="nextBtn()">다음</span></button>
          </div>
        </main>
      </div>

	<input type="hidden" id="email" name="email" value="kmb0729@nate.com">
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
	<input type="hidden" id="status" name="status" value="normal">
	<input type="hidden" id="password" name="password" value="">
	
	<input type="hidden" id="snsType" name="snsType" value="">
	
	<input type="hidden" id="snsId" name="snsId" value="">
	
	<input type="hidden" id="parentName" name="parentName" value="">
	<input type="hidden" id="parentMobileNo" name="parentMobileNo" value="">
	<input type="hidden" id="parentCiNo" name="parentCiNo" value="">
	<input type="hidden" id="joinType" name="joinType" value="NOR">
	
	
	<input type="hidden" id="mobileNoDuplicateYn" name="mobileNoDuplicateYn" value="Y">
	<input type="hidden" id="emailDuplicateYn" name="emailDuplicateYn" value="N">
	
	<input type="hidden" id="korLastName" name="korLastName" value="강">
	<input type="hidden" id="korFirstName" name="korFirstName" value="모범">
	<input type="hidden" id="engLastName" name="engLastName" value="KANG">
  <input type="hidden" id="engFirstName" name="engFirstName" value="MOBUM">
  
  <input type="hidden" id="cardYn" name="cardYn" value="">
	<input type="hidden" id="ffpNo" name="ffpNo" value="">	
</form>
				</main>
			</div>
		</div>
	</div>


<%@ include file="../../common/include/footer.jsp" %>
</body>
</html>