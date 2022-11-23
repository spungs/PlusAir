<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="body">

		<!-- Google Tag Manager (noscript) -->
		<noscript>
			<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PD2BQQ4"
				height="0" width="0" style="display: none; visibility: hidden"></iframe>
		</noscript>
		<!-- End Google Tag Manager (noscript) -->

		<div class="wrap wrap--login pc-small">


			<div id="breadcrumb" class="breadcrumb pc-only"
				aria-label="breadcrumb">
				<nav class="breadcrumb__inner">
					<div class="breadcrumb__item">
						<a href="javascript:;" class="breadcrumb__link"
							style="cursor: default;">홈</a>
					</div>




					<div class="breadcrumb__item">
						<a href="javascript:;" class="breadcrumb__link"
							style="cursor: default;"> 회원가입 </a>
					</div>





				</nav>
			</div>



			<div class="content" id="content">
				<main id="main" class="main ">

					<div class="content" id="content">
						<main id="main" class="main">
							<div class="page-title-wrap">
								<div class="page-title">가입한 아이디 안내</div>
								<div class="page-sub-title">고객님은 이미 회원으로 가입되어 있어요.</div>
							</div>

							<div id="divHtml" class="container--default pc-25">
								<div class="gray-box">
									<div class="join-info">
										<dl class="join-info__row">
											<dt class="w90">아이디</dt>
											<dd>
												<span class="color-org" id="spanTextId">7564* <i
													class="icon-sns icon-sns--naver" aria-label="naver"></i>
												</span>
											</dd>
										</dl>
										<dl class="join-info__row">
											<dt class="w90">가입일</dt>
											<dd>
												<span id="spanTextJoinDate">2020.05.17</span>
											</dd>
										</dl>
									</div>
								</div>
							</div>

							<div class="link-wrap">
								<a href="/ko/member/auth/login.do" class="link-wrap__item">로그인</a>
								<a href="/ko/member/find/findUserInfo.do"
									class="link-wrap__item">아이디/비밀번호 찾기</a>
							</div>

						</main>

					</div>
					<div>
						<input type="hidden" id="msg00005" value="이름"> <input
							type="hidden" id="msg00006" value="아이디"> <input
							type="hidden" id="msg00007" value="가입일">
						<form>
							<input type="hidden" id="memberList"
								value="[{&quot;availPoint&quot;:&quot;2495&quot;,&quot;country&quot;:&quot;KR&quot;,&quot;currentGradeDomesticBoardcnt&quot;:&quot;1&quot;,&quot;currentGradeInternationalBoardcnt&quot;:&quot;0&quot;,&quot;email&quot;:&quot;7564s@naver.com&quot;,&quot;emailYn&quot;:&quot;N&quot;,&quot;engCountry&quot;:&quot;KOREA, REPUBLIC OF&quot;,&quot;engNationality&quot;:&quot;KOREA, REPUBLIC OF&quot;,&quot;enrollDate&quot;:&quot;20200517&quot;,&quot;ffpNo&quot;:&quot;078708770&quot;,&quot;flightPoint&quot;:&quot;2495&quot;,&quot;foreignYn&quot;:&quot;N&quot;,&quot;gradedatefr&quot;:&quot;20191101&quot;,&quot;gradedateto&quot;:&quot;20221031&quot;,&quot;isLock&quot;:&quot;N&quot;,&quot;jointype&quot;:&quot;SNS&quot;,&quot;korCountry&quot;:&quot;대한민국&quot;,&quot;korFirstName&quot;:&quot;경호&quot;,&quot;korLastName&quot;:&quot;손&quot;,&quot;korNationality&quot;:&quot;대한민국&quot;,&quot;membergrade&quot;:&quot;S&quot;,&quot;nationality&quot;:&quot;KR&quot;,&quot;nextGradedatefr&quot;:&quot;20200517&quot;,&quot;nextGradedateto&quot;:&quot;20230516&quot;,&quot;nextgradeDomesticBoardcnt&quot;:&quot;9&quot;,&quot;nextgradeInternationalBoardcnt&quot;:&quot;10&quot;,&quot;nextgradepoint&quot;:&quot;50000&quot;,&quot;smsYn&quot;:&quot;N&quot;,&quot;snsAccountList&quot;:[{&quot;snsId&quot;:&quot;8683113&quot;,&quot;snsRegDateTime&quot;:&quot;20200517&quot;,&quot;snsType&quot;:&quot;NAVER&quot;}],&quot;snsloginFlag&quot;:&quot;Y&quot;,&quot;userAccountStatus&quot;:&quot;E&quot;,&quot;userId&quot;:&quot;7564s&quot;,&quot;userPassword&quot;:&quot;Y&quot;}]">
							<input type="hidden" id="loginId"> <input type="hidden"
								id="email">
						</form>


						<form id="frm" name="frm" method="post" action="">
							<input type="hidden" id="joinGubun" name="status" value="">
							<input type="hidden" id="email" name="email" value=""> <input
								type="hidden" id="test" name="test" value=""> <input
								type="hidden" id="mobileNoDuplicateYn"
								name="mobileNoDuplicateYn" value=""> <input
								type="hidden" id="emailDuplicateYn" name="emailDuplicateYn"
								value="">
						</form>


					</div>
				</main>
			</div>

		</div>
	</div>
</body>
</html>