<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="">
<script>
	function nextBtn() {
		location.href = 'idPasswordWrite';
	}
</script>
<%@ include file="../../common/include/header.jsp"%>
<div id="body">

	<!-- Google Tag Manager (noscript) -->
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PD2BQQ4"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<!-- End Google Tag Manager (noscript) -->

	<div class="wrap wrap--button pc-small step-ui">
		<div id="breadcrumb" class="breadcrumb pc-only"
			aria-label="breadcrumb">
			<nav class="breadcrumb__inner">
				<div class="breadcrumb__item">
					<a href="javascript:;" class="breadcrumb__link"
						style="cursor: default;">홈</a>
				</div>
				<div class="breadcrumb__item">
					<a href="javascript:;" class="breadcrumb__link"
						style="cursor: default;">회원가입</a>
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
					<div class="page-title-wrap joinGubun" id="childDiv"
						style="display: none;">
						<div class="page-title">이메일 입력</div>
						<div class="page-sub-title">법정대리인의 이메일 주소를 입력해 주세요.</div>
					</div>
					<!-- //14세 미만 회원가입 일때 mobile -->
				</div>

				<div class="section-wrap">
					<div class="input-wrap input--line">
						<div class="input-row">
							<div class="input-item">
								<label for="inputEmail1" class="input-label label-top">이메일
									<span title="required" class="input__label-asterisk">*</span>
								</label>
								<div id="emailDiv" class="input-box">
									<div data-element="form" class="input">
										<div class="eac-input-wrap"
											style="display: block; position: relative; font-size: 14px;">
											<input type="email" data-element="email" id="inputEmail1"
												class="input__text" autocomplete="off"> <span
												class="email-auto"
												style="display: block; box-sizing: content-box; font-family: SpoqaHanSansNeo, roboto, sans-serif, Arial; font-weight: 400; letter-spacing: 0px; left: 0px;"></span>
											<span class="eac-cval"
												style="visibility: hidden; position: absolute; display: inline-block; font-family: SpoqaHanSansNeo, roboto, sans-serif, Arial; font-weight: 400; letter-spacing: 0px;"></span>
										</div>
										<button type="button" data-element="remove"
											class="input__remove-button hide">
											<span class="hidden">삭제</span>
										</button>
									</div>
								</div>
								<p tabindex="0" class="input__error">에러메세지</p>
							</div>
						</div>
					</div>
				</div>

				<div class="button-wrap pc-80" data-element="bottomContent">
					<!-- 버튼 활성화 클래스 button--active -->
					<button type="button" class="button button--primary" id="nextBtn"
						data-action="nextBtn">
						<span class="button__text" onclick="nextBtn()">다음</span>
					</button>
				</div>

			</main>
		</div>
	</div>

	<!-- id="body" /div -->
</div>


<%@ include file="../../common/include/footer.jsp"%>
</body>
</html>