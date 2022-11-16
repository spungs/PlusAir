<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="">
<script>
function next_btn(){
	korLastName = document.getElementById('korLastName').value;
	korFirstName = document.getElementById('korFirstName').value;
	engLastName = document.getElementById('engLastName').value;
	engFirstName = document.getElementById('engFirstName').value;
	
	if(korLastName == ""){
		alert('성(한글)을 입력해 주세요.\n한글은 5자까지 입력해주세요.')
		return;
	}
	if(korFirstName == ""){
		alert('이름(한글)을 입력해 주세요.\n한글은 15자까지 입력해주세요.')
		return;
	}	
	if(engLastName == ""){
		alert('성(영문)을 입력해 주세요.\n영문은 32자까지  입력해주세요.')
		return;
	}	
	if(engFirstName == ""){
		alert('이름(한글)을 입력해 주세요.\n영문은 32자까지  입력해주세요.')
		return;
	}	
// 	document.getElementById('frm').submit();
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
					
					<form id="frm" name="frm" method="post" action="emailWrite">
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
		            <input type="text" data-element="input" id="korLastName" name="korLastName" class="input__text" maxlength="5">
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
		            <input type="text" data-element="input" id="korFirstName" name="korFirstName" class="input__text" maxlength="15">
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
</div>

<div class="button-wrap section-wrap" data-element="bottomContent"><!--20210519 class명 변경-->
  <!-- 버튼 활성화 클래스 button--active -->
  <button type="button" class="button button--primary" id="nextBtn" onclick="next_btn()"><span class="button__text">다음</span></button>
</div>
</form>
				</main>
			</div>
		</div>
	</div>


<%@ include file="../../common/include/footer.jsp" %>
</body>
</html>