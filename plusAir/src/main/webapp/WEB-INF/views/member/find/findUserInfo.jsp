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
	<div class="page-title-wrap pc-only">
		<div class="page-title">아이디/비밀번호&nbsp;찾기</div>
	</div>
	<!--//20210519 title영역 수정-->
	<!-- 국내일 경우 -->
	<div class="section-wrap">
		<!--20210519 class명 변경-->
		<div class="serach-link">
			<h3 class="section-title">가입&nbsp;시&nbsp;등록한&nbsp;회원정보로&nbsp;찾기</h3>
			<a href="javascript:void(1);" class="gray-box gray-box--link " data-action="goEmail">
				<strong class="gray-box__title">이메일로&nbsp;찾기</strong>
				<p class="gray-box__sub-text">아이디를&nbsp;일부&nbsp;확인할&nbsp;수&nbsp;있어요.</p>
			</a>
			
				<a href="javascript:void(1);" class="gray-box gray-box--link " data-action="goPhone">
					<strong class="gray-box__title">휴대전화번호로&nbsp;찾기</strong>
					<p class="gray-box__sub-text">아이디를&nbsp;일부&nbsp;확인할&nbsp;수&nbsp;있어요.</p>
				</a>
			
			<a href="javascript:void(1);" class="gray-box gray-box--link " data-action="goUserId">
				<strong class="gray-box__title">아이디로&nbsp;새&nbsp;비밀번호&nbsp;설정하기</strong>
				<p class="gray-box__sub-text">가입 시 등록한 회원정보 및 본인인증을 통해 <br class="pc-only">새 비밀번호를 설정할 수 있어요.</p>
			</a>
		</div>
	</div>
	
		<div class="section-wrap">
			<!--20210519 class명 변경-->
			<div class="serach-link">
				<h3 class="section-title">본인인증으로&nbsp;찾기</h3>
				<a href="javascript:void(1);" class="gray-box gray-box--link" data-action="goCtfCheck">
					<strong class="gray-box__title">본인&nbsp;명의의&nbsp;휴대전화번호로&nbsp;찾기</strong>
					<p class="gray-box__sub-text">아이디&nbsp;전체&nbsp;확인&nbsp;및&nbsp;비밀번호를&nbsp;다시&nbsp;설정할&nbsp;수&nbsp;있어요.</p>
				</a>
				<a href="javascript:void(1);" class="gray-box gray-box--link" data-action="goIDCheckIpin">
					<strong class="gray-box__title">아이핀&nbsp;인증으로&nbsp;찾기</strong>
					<p class="gray-box__sub-text">아이디&nbsp;전체&nbsp;확인&nbsp;및&nbsp;비밀번호를&nbsp;다시&nbsp;설정할&nbsp;수&nbsp;있어요.</p>
				</a>
				<div class="guide-info guide-info--gray">
					<p class="guide-info__text">기존에&nbsp;본인인증을&nbsp;마친&nbsp;계정만&nbsp;조회할&nbsp;수&nbsp;있습니다.</p>
				</div>
			</div>
		</div>

		<form id="frmUserId" name="frmUserId" method="post" action="findUserInfoList.do" style="display: none;">
			<input type="hidden" name="ciNo">
			<input type="hidden" name="apiRequestType">
		</form>

	
				</main>
			</div>
			
		</div>
	</div>


<%@ include file="../../common/include/footer.jsp" %>
</body>
</html>