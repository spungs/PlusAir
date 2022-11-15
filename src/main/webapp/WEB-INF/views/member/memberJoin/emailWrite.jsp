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
					
					<div class="mobile-only">
            <!-- 간편/일반 회원가입 일때 mobile -->
            <div class="title">
              <div class="title__page">사용하실 이메일 주소를 입력해 주세요.</div>
            </div>
            <!-- //간편/일반 회원가입 일때 mobile -->

            <!-- 14세 미만 회원가입 일때  mobile -->
            <!--<div class="title">
              <div class="title__page">법정대리인의 이메일 주소를 입력해 주세요. </div>
            </div>-->
            <!-- //14세 미만 회원가입 일때  mobile -->
          </div>
          <div class="title pc-only">
		            <!-- 간편/일반회원가입할떄 pc -->
		            <div class="page-title-wrap joinGubun" id="normalDiv" style="">
		              <div class="page-title">이메일 입력</div>
		              <div class="page-sub-title">사용하실 이메일 주소를 입력해 주세요.</div>
		            </div>
		            <!-- //간편/일반회원가입할떄 pc -->
		            <!-- 14세 미만 회원가입 일때 mobile -->
		            <div class="page-title-wrap joinGubun" id="childDiv" style="display: none;">
		              <div class="page-title">이메일 입력</div>
		              <div class="page-sub-title">법정대리인의 이메일 주소를 입력해 주세요. </div>
		            </div>
		            <!-- //14세 미만 회원가입 일때 mobile -->
          </div>

          <div class="section-wrap">
            <div class="input-wrap input--line">
              <div class="input-row">
                <div class="input-item">
                  <label for="inputEmail1" class="input-label label-top">이메일
                      <span title="required" class="input__label-asterisk">*</span></label>
                  <div id="emailDiv" class="input-box">
                    <div data-element="form" class="input">
                      <div class="eac-input-wrap" style="display: block; position: relative; font-size: 14px;"><input type="email" data-element="email" id="inputEmail1" class="input__text" autocomplete="off"><span class="email-auto" style="display: block; box-sizing: content-box; font-family: SpoqaHanSansNeo, roboto, sans-serif, Arial; font-weight: 400; letter-spacing: 0px; left: 0px;"></span><span class="eac-cval" style="visibility: hidden; position: absolute; display: inline-block; font-family: SpoqaHanSansNeo, roboto, sans-serif, Arial; font-weight: 400; letter-spacing: 0px;"></span></div>
                      <button type="button" data-element="remove" class="input__remove-button hide"><span class="hidden">삭제</span></button>
                    </div>
                  </div>
                  <p tabindex="0" class="input__error">에러메세지</p>
                </div>
              </div>
            </div>
          </div>

          <div class="button-wrap pc-80" data-element="bottomContent">
            <!-- 버튼 활성화 클래스 button--active -->
            <button type="button" class="button button--primary" id="nextBtn" data-action="nextBtn"><span class="button__text">다음</span></button>
          </div>
<div>
<form id="frm" name="frm" method="post" action="">
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
	<input type="hidden" id="cardYn" name="cardYn" value="">
	<input type="hidden" name="ffpNo" value="">	
	
	<input type="hidden" id="mobileNoDuplicateYn" name="mobileNoDuplicateYn" value="">
	<input type="hidden" id="emailDuplicateYn" name="emailDuplicateYn" value="N">
	
	<input type="hidden" id="korLastName" name="korLastName" value="강">
	<input type="hidden" id="korFirstName" name="korFirstName" value="모범">
	<input type="hidden" id="engLastName" name="engLastName" value="KANG">
	<input type="hidden" id="engFirstName" name="engFirstName" value="MOBUM">
	
	
</form>


</div>
				</main>
			</div>
		</div>
	</div>


<%@ include file="../../common/include/footer.jsp" %>
</body>
</html>