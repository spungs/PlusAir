<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="">
<%@ include file="../common/include/header.jsp" %>
<div id="body">
		
		<!-- Google Tag Manager (noscript) -->
		<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PD2BQQ4" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
		<!-- End Google Tag Manager (noscript) -->

		<div class="wrap NC">
			
			
				<div id="breadcrumb" class="breadcrumb pc-only" aria-label="breadcrumb">
					<nav class="breadcrumb__inner">
						<div class="breadcrumb__item">
							<a href="javascript:;" class="breadcrumb__link" style="cursor: default;">홈</a>
						</div>
						
						
							
								
									<div class="breadcrumb__item">
										<a href="javascript:;" class="breadcrumb__link" style="cursor: default;">회원 혜택 안내</a>
									</div>
								
								
							
						
							
								
								
									<div class="breadcrumb__item breadcrumb__item--current" aria-current="page" data-element="toggle" data-options="{&quot;mode&quot;: &quot;slide&quot;, &quot;speed&quot;: 100, &quot;clickToClose&quot;: true}">
										
											
										
											
												<button type="button" class="breadcrumb__link breadcrumb__link--list" data-element="toggle__anchor" aria-controls="toggle-2" aria-expanded="false">쿠폰 등록</button>
											
										
											
										
											
										
											
										
											
										
											
										
											
										

										<div class="breadcrumb__siblings-list" data-element="toggle__panel" id="toggle-2">
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/additionalService/service/gifticket.do')">기프티켓</a>
												
											
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/main.do')">리프레시 포인트</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/pointBuy.do')">포인트 구매</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/pointSearch.do')">포인트 조회</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/pointUse.do')">포인트 사용</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/memberBenefit/memberBenefit.do?param=newMember ')">신규회원 혜택</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/memberBenefit/memberBenefit.do?param=promotion')">프로모션 코드</a>
												
											
										</div>
									</div>
								
							
						
						
					</nav>
				</div>
			
	
			
			<div class="content" id="content">
				<main id="main" class="main ">
					
					<div class="page-title-wrap">
      <div class="page-title">쿠폰 등록하기</div>
      <div class="page-sub-title">보유하고 계신 쿠폰을 등록 해 주세요.
        </div>
    </div>

    <!--상단 배너 영역-->
    <div class="banner">
      <div class="banner_single-img" style="background-image: url(https://static.jejuair.net/hpgg/resources/images/@temp/img_main_coupon_banner.jpg);"></div>
    </div>

    <div class="section-wrap">
      <p class="text__default">코드를 입력하시면 해당하는 상품을 알려드리며, 제주항공 기프티켓과 리프레시 포인트는 자동으로 로그인한 계정에 등록 됩니다.</p>
    </div>
    
    <!-- 코드입력 영역 -->
    <div class="mt30">
      <div class="input-wrap input--line pc-col pc-col-2">
        <div id="divCouponNo" class="input-row coupon">
          <div id="txtCouponNo_div" class="input-item">
            <div class="input-box">
              <label for="txtCouponNo" class="input__label">
                코드를 입력해주세요.
              </label>
              <div data-element="form" class="input">
                <input type="text" data-element="input" id="txtCouponNo" name="txtCouponNo" class="input__text input_required" style="text-transform :uppercase;">
                <button type="button" data-element="remove" class="input__remove-button"><span class="hidden">취소</span></button>
              </div>
            </div>
            <p tabindex="0" class="input__error">코드를 정확히 입력해주세요.</p>
          </div>
          <!-- 버튼 활성화 : button--active 클래스 추가 -->
          <button type="button" class="button button--optional button--active" onclick="goCouponCheck();">
            <span class="button__text">쿠폰 등록하기</span>
          </button>
        </div>
      </div>
    </div>

    <!-- 당첨 내역 확인 -->
    <div class="section-wrap">
			<div class="section-title">등록 내역 확인</div>
			<div class="arrow-list arrow-list--box">
				<a href="javascript:goToLink('RG');" class="arrow-list__item">
					<span class="arrow-list__text arrow-list__text--title">나의 기프티켓</span>
				</a>
				<a href="javascript:goToLink('FF');" class="arrow-list__item">
					<span class="arrow-list__text arrow-list__text--title">나의 포인트</span>
				</a>
				<a href="javascript:goToLink('PT');" class="arrow-list__item">
					<span class="arrow-list__text arrow-list__text--title">나의 쿠폰</span>
				</a>
			</div>
		</div>

    <!-- 유의사항 -->
    <div class="section-wrap">
      <div class="service-information" data-element="toggle" data-options="{&quot;mode&quot;: &quot;slide&quot;}">
        <div class="service-information__title">
          <button type="button" class="service-information__anchor" data-element="toggle__anchor" aria-controls="toggle-3" aria-expanded="false">꼭 확인해주세요.</button>
        </div>
        <div class="service-information__content" data-element="toggle__panel" id="toggle-3">
        	<ul class="list-guide">
				<li class="list-guide__item">발급받은 코드 7자리 ~ 20자리를 입력해 주세요. (제주항공 기프티켓, 리프레시 포인트, 제휴처 쿠폰 등)</li>
				<li class="list-guide__item">등록된 코드는 당첨 상품 별 내역 확인에서 가능합니다.</li>
				<li class="list-guide__item">제주항공 기프티켓, 리프레시 포인트 코드는 당첨시 바로 로그인한 계정으로 등록 됩니다.</li>
				<li class="list-guide__item">등록결과 확인 후 취소 할 수 없습니다.</li>
				<li class="list-guide__item">제휴처 쿠폰은 이벤트 별 이용 설명에 따라 사용해 주시기 바랍니다.</li>
				<li class="list-guide__item">이벤트에 따라 APP에서만 코드 등록이 가능 할 수 있습니다.</li>
			</ul>
        </div>
      </div>
    </div>
          
<!-- alert 팝업 -->
<div id="alertModalLayer" class="modal modal--simple">
<div class="modal-content">
	<h2 class="alert-title">등록 결과 안내</h2>
	<p class="alert-text alertMsg"></p>
</div>
<div class="modal__button-area button-wrap">
<button type="button" class="button button--secondary button--active" rel="modal:close" onclick="javascript:closeCurrentModal(this);"><span class="button__text">확인</span></button><!-- 확인 -->
</div><!-- 확인 -->
</div>    
     
<!-- 컨펌 팝업 -->
<div id="confirmModalLayer" class="modal modal--simple">
<div class="modal-content"><h2 class="alert-title">등록 결과 안내</h2><p class="alert-text confirmMsg"></p></div>
<div class="modal__button-area button-wrap">
<button type="button" class="button button--secondary" rel="modal:close" onclick="javascript:closeCurrentModal(this);"><span class="button__text">확인</span></button><!-- 확인 -->
<button type="button" onclick="" class="button button--secondary button--active add--ml-10"><span class="button__text confirmLink">&nbsp;</span></button><!-- 확인 -->
</div>
<a href="javascript:void(0);" rel="modal:close" onclick="javascript:closeCurrentModal(this)" class="modal__close"><span class="blind">닫기</span></a>
</div>
				</main>
			</div>
			
		</div>
	</div>


<%@ include file="../common/include/footer.jsp" %>
</body>
</html>