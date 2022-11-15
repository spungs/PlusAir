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
			
			
	
			
			<div class="content" id="content">
				<main id="main" class="main ">
					
					<div class="content" id="content">
      <main id="main" class="main">
          <div class="title">
            <div class="title__page mobile-only">인증&nbsp;이메일이<br>발송되었어요.</div>
            <div class="title__wrap pc-only">
              <div class="title__page">이메일&nbsp;발송&nbsp;안내</div>
              <div class="title__additional">인증&nbsp;이메일이&nbsp;발송되었어요.</div>
            </div>
          </div>

          <div class="container--default pc-30">
            <div class="gray-box">
              <div class="text">
                <p class="text__default text--bold pc-text-large">
                  <span class="text--color-org" id="spanEmailResult">kmb****@nate.com</span>
                </p>
              </div>
            </div>
          </div>
          <ul class="list-guide list-guide--color-gray pc-20">
            <li class="list-guide__item">이메일에 첨부된 링크에 접속하여 다음 단계를 진행해 주세요.</li>
            <li class="list-guide__item">이메일이&nbsp;오지&nbsp;않았을&nbsp;경우&nbsp;스팸메일함을&nbsp;확인해&nbsp;주세요.</li>
            <li class="list-guide__item">발송&nbsp;시간은&nbsp;메일에&nbsp;따라&nbsp;조금씩&nbsp;달라질&nbsp;수&nbsp;있습니다. </li>
          </ul>
          <div class="button-wrap">
            <a href="javascript:;" class="button button--small" id="btnReSendEmail"><span class="button__text">인증&nbsp;이메일&nbsp;다시&nbsp;받기</span></a>
          </div>

          <!--<div class="button-wrap pc-80" data-element="bottomContent">-->
          <div id="btnMainDiv" class="button-wrap pc-80" data-element="">
            <button id="mainBtn" type="button" class="button button--primary button--active" data-action="menu" data-menu-name="main"><span class="button__text">메인</span></button>
          </div>
        </main>
    </div>

<input type="hidden" id="ffpNo" value="093563097">
<input type="hidden" id="url" value="/ko/member/setup/passwordInit.do">
<input type="hidden" id="title" value="아이디/비밀번호 찾기">
<input type="hidden" id="email" value="kmb0729@nate.com">
<form id="frm" name="frm" method="post" action="">
	<input type="hidden" id="joinGubun" name="status">
	<input type="hidden" id="test" name="test">
	<input type="hidden" id="lang" name="lang" value="">
</form>
				</main>
			</div>
			
		</div>
	</div>


<%@ include file="../../common/include/footer.jsp" %>
</body>
</html>