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
										
											
										
											
										
											
										
											
										
											
										
											
										
											
												<button type="button" class="breadcrumb__link breadcrumb__link--list" data-element="toggle__anchor" aria-controls="toggle-2" aria-expanded="false">신규회원 혜택</button>
											
										
											
										

										<div class="breadcrumb__siblings-list" data-element="toggle__panel" id="toggle-2">
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/additionalService/service/gifticket.do')">기프티켓</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/memberBenefit/regCoupon.do')">쿠폰 등록</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/main.do')">리프레시 포인트</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/pointBuy.do')">포인트 구매</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/pointSearch.do')">포인트 조회</a>
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/memberBenefit/refreshPoint/pointUse.do')">포인트 사용</a>
												
											
												
											
												
													<a href="javascript:void(0);" class="item" onclick="URL_LINK.getI18Url('/memberBenefit/memberBenefit.do?param=promotion')">프로모션 코드</a>
												
											
										</div>
									</div>
								
							
						
						
					</nav>
				</div>
			
	
			
			<div class="content" id="content">
				<main id="main" class="main ">
					
					<div class="page-title-wrap">
            <div class="page-title">회원 전용 혜택</div>
            <div class="page-sub-title">포인트 적립에서 운임할인까지<br>제주항공 회원 가입하고 혜택 받자!
              </div>
          </div>
          
         

          <div class="member-benefit">
            <div class="tab tab--default" data-element="tab" id="tabSelect" data-options="{&quot;linkedTab&quot;: &quot;#linkedTab2&quot;, &quot;initIndex&quot;: &quot;0&quot;}">
              <div class="tab__button-wrap">
                <div class="tab__buttons">
                  <div class="tab__button" data-element="tab__list" role="presentation">
                    <button class="tab__anchor is-active" type="button" data-element="tab__anchor" id="tabNew" data-index="0" role="tab" tabindex="" aria-selected="true" aria-expanded="true">신규회원 혜택</button>
                  </div>
                  <div class="tab__button" data-element="tab__list" role="presentation">
                    <button class="tab__anchor" type="button" data-element="tab__anchor" id="tabProm" data-index="1" role="tab" tabindex="" aria-selected="false" aria-expanded="false">프로모션 코드</button>
                  </div>
                </div>
              </div>
            </div>

            <div class="linked-tab" id="linkedTab2" data-element="tab__link">
              <!-- 신규회원 혜택 -->
              <div class="tab__panel cancel--pt is-active" id="tabNew2" data-element="tab__panel" aria-labelledby="tabNew" role="tabpanel" tabindex="0" style="display: inline">
                <div class="banner">
                  <div class="banner_single-img" style="background-image: url(https://static.jejuair.net/hpgg/resources/images/banner/banner_nc_2_1.png);"></div>
                </div>
        
                <div class="section-wrap">
                  <div class="section-title">신규회원 혜택</div>
                  <div class="border-box__ico benefit-box">
                    <ul class="step-wrap step-wrap__ico">
                      <li>
                        <i class="icon">
                          <img src="https://static.jejuair.net/hpgg/resources/images/@temp/member-benefit_01.png" alt="이미지설명">
                      </i>
                        <dl class="step-wrap__text">
                          <dt>혜택 1</dt>
                          <dd>가입과 동시에 적립<br>리프레시 포인트 1,000P</dd>
                        </dl> 
                      </li>
                      <li>
                        <i class="icon">
                          <span class="app-only">앱 전용</span>
                          <img src="https://static.jejuair.net/hpgg/resources/images/@temp/member-benefit_02.png" alt="이미지설명">
                        </i>
                        <dl class="step-wrap__text">
                          <dt>혜택 2</dt>
                          <dd>국내선 최초 예약시<br>운임 7% 회원 할인</dd>
                        </dl>
                      </li>
                      <li>
                        <i class="icon">
                          <span class="app-only">앱 전용</span>
                          <img src="https://static.jejuair.net/hpgg/resources/images/@temp/member-benefit_03.png" alt="이미지설명">
                      </i>
                        <dl class="step-wrap__text">
                          <dt>혜택 3</dt>
                          <dd>국제선 최초 예약시<br>운임 5% 회원 할인</dd>
                        </dl>
                      </li>
                    </ul>
                  </div>
                </div>

				
				
					<div class="button-wrap pc-center section-wrap">
						<button type="button" class="button button--primary button--active" onclick="javascript:URL_LINK.getI18Url('/member/memberJoin/join.do')"><span class="button__text">회원가입</span></button>
					</div>
				

                  <div class="section-wrap">
                    <ul class="list-guide">
                      <li class="list-guide__item">포인트 적립은 최초 신규 가입 시 자동 적용</li>
                      <li class="list-guide__item">신규회원 할인은 성인 운임에만 적용</li>
                      <li class="list-guide__item">신규회원 할인은 국제선/국내선 각각 최초 예약 시 사용 가능 </li>
                      <li class="list-guide__item">국내선/국제선 BIZ LITE 운임은 신규회원 할인 제외</li>
                    </ul>
                    <ul class="list-guide">
                      <li class="list-guide__item">신규회원 할인 사용기간 : 가입일로부터 30일 이내 </li>
                      <li class="list-guide__item">신규회원 할인 탑승기간 : 가입일로부터 90일 이내 </li>
                      <li class="list-guide__item">운임 조회 시 회원할인으로 사용 가능 </li>
                      <li class="list-guide__item">사용채널&nbsp;: 제주항공 모바일 앱 사용 전용 </li>
                    </ul>                    
                  </div>
  
                <!-- 아이콘 리스트 -->
                  <div class="section-wrap">
                      <div class="section-title">신규회원할인 사용방법</div>
                      <div class="main-sel">
                        <ul class="step-wrap thum-txt">
                          <li>
                            <div class="step-wrap__image">
							    
									 
										<img src="https://static.jejuair.net/hpgg/resources/images/@temp/member_step01.png" alt="이미지설명">
									
									                                                                         
									                                                                        
									                                                                         
									                                                                        
									
							  
							</div>
                            <dl class="step-wrap__text">
                              <dt>STEP 01</dt>
                              <dd>제주항공 홈페이지 회원 가입 후 로그인</dd>
                            </dl>
                          </li>
                          <li>
                            <div class="step-wrap__image">
							    
									 
										<img src="https://static.jejuair.net/hpgg/resources/images/@temp/member_step02.png" alt="이미지설명">
									
									                                                                         
									                                                                        
									                                                                         
									                                                                        
									
							  
							</div>
                            <dl class="step-wrap__text">
                              <dt>STEP 02</dt>
                              <dd>신규회원 할인 조건에 맞는 여정 선택</dd>
                            </dl>
                          </li>
                          <li>
                             <div class="step-wrap__image">
							    
									 
										<img src="https://static.jejuair.net/hpgg/resources/images/@temp/member_step03.png" alt="이미지설명">
									
									                                                                         
									                                                                        
									                                                                         
									                                                                        
									
							  
							</div>
                            <dl class="step-wrap__text">
                              <dt>STEP 03</dt>
                              <dd>탑승객 정보 입력 단계<br> 회원 할인 &gt; 신규회원 할인 적용</dd>
                            </dl>
                          </li>
                          <li>
                            <div class="step-wrap__image">
							    
									 
										<img src="https://static.jejuair.net/hpgg/resources/images/@temp/member_step04.png" alt="이미지설명">
									
									                                                                         
									                                                                        
									                                                                         
									                                                                        
									
							  
							</div>
                            <dl class="step-wrap__text">
                              <dt>STEP 04</dt>
                              <dd>항목별 운임 상세에서 신규가입 할인 확인 후 결제</dd>
                            </dl>
                          </li>
                        </ul>
                      </div>  
                  </div>
                  
                  <div class="section-wrap mt10">
                    <div class="service-information" data-action="info-toggle" data-toggle-id="0000000709" data-options="{&quot;mode&quot;: &quot;move scroll&quot;}">
                      <div class="service-information__title">
                        <button type="button" class="service-information__anchor" data-element="toggle__anchor" aria-controls="toggle-4" aria-expanded="false">신규회원 가입 혜택 공통 유의사항</button>
                      </div>
                      <div class="service-information__content" data-element="toggle__panel" id="toggle-4"><style>
.cms li{word-break:keep-all;word-wrap:break-word;font-size:14px;}
.cms ol>li{margin-top:40px; font-weight:700; font-size:16px;}
.cms ol>ol{margin-bottom:22px;padding-left:7px;}
.cms ol>ol>li{margin-top:8px;font-weight:inherit;font-size:14px;padding-left:15px;}
.cms ol>ol>ol>li{padding-left:20px;}
.cms ol.part{counter-reset:part;list-style-type:none;}
.cms ol.part>ol{counter-reset:part2;list-style-type:none;}
.cms ol.part>ol>ol{counter-reset:part3;list-style-type:none;}
.cms ol>li::before{counter-increment:part;content:counter(part,decimal)". ";}
.cms ol>ol>li::before{counter-increment:part2;content:counter(part2,decimal)") ";margin-left:-15px;}
.cms ol>ol>ol>li::before{counter-increment:part3;content:"("counter(part3,decimal)") ";margin-left:-20px;}

.cms ul{list-style-type:none;margin:8px 0;}
.cms ul>li{text-indent:-5px;}
.cms ul>ul{padding-left:7px;}
.cms ul>ul>li{font-size:13px;color:#888;}
.cms ul>li::before{content:''; display:inline-block;transform:translate(-0.3em, -0.3em); width:2px;height:2px;background-color:#707070;}
.cms ul>ul>li::before{content:''; display:inline-block; transform:translate(-0.3em, -0.3em);width:4px; height:1px; background-color:#707070;}
</style>

<div class="cms">

<ul>
	<li>
		포인트 적립은 최초 신규 가입 시 자동 지급 됩니다.</li>
	<li>
		신규회원 할인은 본인 탑승 예약건에 한하여 사용이 가능합니다.</li>
	<li>
		신규회원 할인은 2021년 10월 25일 이후 신규 가입 회원에게 제공 됩니다.</li>
	<li>
		리프레시 포인트, 기프티켓 항공권 결제 시 운임 할인 혜택을 사용 할 수 없습니다.</li>
	<li>
		신규회원 할인 사용 시 운임할인이 가능한 다른 신분할인과는 중복 사용 할 수 없습니다.</li>
	<li>
		신규회원 할인은 성인 운임에만 사용 할 수 있으며, 소아 및 유아는 할인이 적용되지 않습니다.</li>
	<li>
		1인(ID) 당 제공되는 운임 할인혜택은 국내선과 국제선 각각 최초 1회에 한하여 사용할 수 있습니다.</li>
	<li>
		신규회원 할인은 모바일 APP 결제시 탑승자정보 입력단계에서 회원할인 선택을 통해 적용 가능합니다.</li>
	<li>
		신규회원 할인혜택은 신규 회원가입 후 30일 동안 사용할 수 있으며, 항공탑승 기간은 회원가입 후 90일 까지 입니다.</li>
	<li>
		왕복 또는 다구간 여정의 경우 한 구간이라도 운임할인이 가능한 경우에는 회원할인이 표출은 되지만, 실제 할인은 운임할인은 가능한 구간에만 적용됩니다.</li>
	<li>
		BIZ LITE 운임은 신규회원 할인에서 제외 됩니다.</li>
</ul>


</div></div>
                    </div>
                  </div>
              </div>
              <!-- // 신규회원 혜택 -->

              <!-- 프로모션 코드 -->
              <div class="tab__panel cancel--pt" id="tabProm2" data-element="tab__panel" aria-labelledby="tabProm" role="tabpanel" tabindex="0" style="display: none">
                <div class="banner">
                  <div class="banner_single-img" style="background-image: url(https://static.jejuair.net/hpgg/resources/images/banner/banner_nc_2_2.png);"></div>
                </div>
                
                <div class="section-wrap">
                  <div class="section-title">프로모션 코드</div>
                  <div class="section-sub-txt">제주항공 회원만 사용 가능! 프로모션 코드 안내</div>
                  <div class="main-sel">
                    <ul class="step-wrap thum-txt">
                      <li>
                        <div class="step-wrap__image">
                      	  
    						
    							<img src="https://static.jejuair.net/hpgg/resources/images/@temp/member_step05.jpg" alt="이미지설명">
    						
    						
							
							
							
							
    					  
                        </div>
                        <dl class="step-wrap__text">
                          <dt>STEP 01</dt>
                          <dd>프로모션 코드 확인</dd>
                        </dl>
                      </li>
                      <li>
                        <div class="step-wrap__image">
                          
	  						
	  							<img src="https://static.jejuair.net/hpgg/resources/images/@temp/member_step06.jpg" alt="이미지설명">
	  						
	  						
							
							
							
							
	  					  
                        </div>
                        <dl class="step-wrap__text">
                          <dt>STEP 02</dt>
                          <dd>할인코드 입력</dd>
                        </dl>
                      </li>
                  
                      <li>
                        <div class="step-wrap__image">
                          
	  						
	  							<img src="https://static.jejuair.net/hpgg/resources/images/@temp/member_step07.jpg" alt="이미지설명">
	  						
	  						
							
							
							
							
	  					  
                        </div>
                        <dl class="step-wrap__text">
                          <dt>STEP 03</dt>
                          <dd>항공권 검색</dd>
                        </dl>
                      </li>
                      <li>
                        <div class="step-wrap__image">
                          
	  						
	  							<img src="https://static.jejuair.net/hpgg/resources/images/@temp/member_step08.jpg" alt="이미지설명">
	  						
	  						
							
							
							
							
	  					  
                        </div>
                        <dl class="step-wrap__text">
                          <dt>STEP 04</dt>
                          <dd>항공권 구매</dd>
                        </dl>
                      </li>
                    </ul>
                  </div>  
              </div>

                <div class="section-wrap mt0">
                  <ul class="list-guide">
                    <li class="list-guide__item">모든 프로모션 코드는 회원 로그인 후 본인이 포함 된 탑승 예약에 사용 가능</li>
                    <li class="list-guide__item">프로모션 코드를 입력하여 항공권 검색하면 할인이 적용 된 운임으로 조회 </li>
                    <li class="list-guide__item">프로모션 코드 할인 혜택과 사용조건은 이벤트 별로 상이, 자세한 사항은 이벤트 페이지 참고</li>
                  </ul>             
                </div>

                <div class="section-wrap">
                  <div class="service-information" data-action="info-toggle" data-toggle-id="0000000710" data-options="{&quot;mode&quot;: &quot;move scroll&quot;}">
                    <div class="service-information__title">
                      <button type="button" class="service-information__anchor" data-element="toggle__anchor" aria-controls="toggle-5" aria-expanded="false">프로모션 코드 공통 유의사항</button>
                    </div>
                    <div class="service-information__content" data-element="toggle__panel" id="toggle-5"><style>
  .cms li{word-break: break-all;font-size:14px;margin-top:8px;}
  .cms ol>li{margin-top:40px; font-weight:700; font-size:16px;}
  .cms ol>ol{margin-bottom:22px;}
  .cms ol>ol>li {margin-top:8px;font-weight:inherit;font-size:14px;}
  .cms ol>ol>ol{padding-left:7px;}
  .cms ol.part{counter-reset:part;list-style-type:none;}
  .cms ol.part>ol{counter-reset:part2;list-style-type:none;}
  .cms ol.part>ol>ol{counter-reset:part3;list-style-type:none;}
  .cms ol>li::before{counter-increment:part;content:counter(part,decimal)". ";}
  .cms ol>ol>li::before{counter-increment:part2;content:counter(part2,decimal)") ";}
  .cms ol>ol>ol>li::before{counter-increment:part3;content:counter(part3,lower-alpha)". ";}
  
  .cms ul{list-style-type:none;padding-left:7px;margin:8px 0;}
  .cms ul>ul{padding-left:7px;}
  .cms ul>ul>li{font-size:13px;color:#888;}
  .cms ul>li::before{content:''; display:inline-block;transform:translate(-0.3em, -0.3em); width:2px;height:2px;background-color:#707070;}
  .cms ul>ul>li::before{content:''; display:inline-block; transform:translate(-0.3em, -0.3em);width:4px; height:1px; background:#707070;}
</style>

<div class="cms">

<ul>
	<li>
		모든 프로모션 코드는 회원 로그인 후 사용 가능합니다.</li>
	<li>
		프로모션 코드 할인은 회원 본인 탑승 예약건에 적용 가능합니다.</li>
	<li>
		프로모션 코드를 입력하여 항공권을 검색하면 할인이 적용 된 운임으로 조회 됩니다.</li>
	<li>
		프로모션 코드를 사용한 할인은 항공 운임에만 적용되며, 모든 부가서비스와 유류세 및 공항세에는 적용되지 않습니다.</li>
	<li>
		프로모션 코드는 여정 변경 시에는 입력하실 수 없으며, 최초 예약 시에만 입력 가능합니다.</li>
	<li>
		프로모션 코드 할인이 적용된 예약에 대하여 여정 변경 시, 변경하신 항공편 또는 운임이 할인 조건과 맞지 않을 경우 할인이 적용되지 않습니다.</li>
	<li>
		프로모션 코드 할인 혜택과 사용조건은 이벤트 별로 상이하오니 자세한 사항은 이벤트 페이지를 참고해 주시기 바랍니다.</li>
	<li>
		부정적인 방법 및 중복된 정보로 구매 할 경우 예약이 제한될 수 있습니다.</li>
</ul>

</div></div>
                  </div>
                </div>

              </div>
              <!-- // 프로모션 코드-->

            </div>
          </div>
				</main>
			</div>
			
		</div>
	</div>
<%@ include file="../common/include/footer.jsp" %>
</body></html>