<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 달력 css -->
<style>
.sec_cal {
    width: 360px;
    margin: 0 auto;
    font-family: "NotoSansR";
}

.sec_cal .cal_nav {
    display: flex;
    justify-content: center;
    align-items: center;
    font-weight: 700;
    font-size: 48px;
    line-height: 78px;
}

.sec_cal .cal_nav .year-month {
    width: 300px;
    text-align: center;
    line-height: 1;
}

.sec_cal .cal_nav .nav {
    display: flex;
    border: 1px solid #333333;
    border-radius: 5px;
}

.sec_cal .cal_nav .go-prev,
.sec_cal .cal_nav .go-next {
    display: block;
    width: 50px;
    height: 78px;
    font-size: 0;
    display: flex;
    justify-content: center;
    align-items: center;
}

.sec_cal .cal_nav .go-prev::before,
.sec_cal .cal_nav .go-next::before {
    content: "";
    display: block;
    width: 20px;
    height: 20px;
    border: 3px solid #000;
    border-width: 3px 3px 0 0;
    transition: border 0.1s;
}

.sec_cal .cal_nav .go-prev:hover::before,
.sec_cal .cal_nav .go-next:hover::before {
    border-color: #ed2a61;
}

.sec_cal .cal_nav .go-prev::before {
    transform: rotate(-135deg);
}

.sec_cal .cal_nav .go-next::before {
    transform: rotate(45deg);
}

.sec_cal .cal_wrap {
    padding-top: 40px;
    position: relative;
    margin: 0 auto;
}

.sec_cal .cal_wrap .days {
    display: flex;
    margin-bottom: 20px;
    padding-bottom: 20px;
    border-bottom: 1px solid #ddd;
}

.sec_cal .cal_wrap::after {
    top: 368px;
}

.sec_cal .cal_wrap .day {
    display:flex;
    align-items: center;
    justify-content: center;
    width: calc(100% / 7);
    text-align: left;
    color: #999;
    font-size: 12px;
    text-align: center;
    border-radius:5px
}

.current.today {background: rgb(242 242 242);background-color: yellow;}

.sec_cal .cal_wrap .dates {
    display: flex;
    flex-flow: wrap;
    height: 290px;
}

.sec_cal .cal_wrap .day:nth-child(7n -1) {
    color: #3c6ffa;
}

.sec_cal .cal_wrap .day:nth-child(7n) {
    color: #ed2a61;
}

.sec_cal .cal_wrap .day.disable {
    color: #ddd;
}
.SelectDate {
	background-color: white;
}
.SelectDate.active {
	background-color: #AFE1FF;
}
.sec_cal_2 {
    width: 360px;
    margin: 0 auto;
    font-family: "NotoSansR";
}

.sec_cal_2 .cal_nav {
    display: flex;
    justify-content: center;
    align-items: center;
    font-weight: 700;
    font-size: 48px;
    line-height: 78px;
}

.sec_cal_2 .cal_nav .year-month {
    width: 300px;
    text-align: center;
    line-height: 1;
}

.sec_cal_2 .cal_nav .nav {
    display: flex;
    border: 1px solid #333333;
    border-radius: 5px;
}

.sec_cal_2 .cal_nav .go-prev,
.sec_cal_2 .cal_nav .go-next {
    display: block;
    width: 50px;
    height: 78px;
    font-size: 0;
    display: flex;
    justify-content: center;
    align-items: center;
}

.sec_cal_2 .cal_nav .go-prev::before,
.sec_cal_2 .cal_nav .go-next::before {
    content: "";
    display: block;
    width: 20px;
    height: 20px;
    border: 3px solid #000;
    border-width: 3px 3px 0 0;
    transition: border 0.1s;
}

.sec_cal_2 .cal_nav .go-prev:hover::before,
.sec_cal_2 .cal_nav .go-next:hover::before {
    border-color: #ed2a61;
}

.sec_cal_2 .cal_nav .go-prev::before {
    transform: rotate(-135deg);
}

.sec_cal_2 .cal_nav .go-next::before {
    transform: rotate(45deg);
}

.sec_cal_2 .cal_wrap {
    padding-top: 40px;
    position: relative;
    margin: 0 auto;
}

.sec_cal_2 .cal_wrap .days {
    display: flex;
    margin-bottom: 20px;
    padding-bottom: 20px;
    border-bottom: 1px solid #ddd;
}

.sec_cal_2 .cal_wrap::after {
    top: 368px;
}

.sec_cal_2 .cal_wrap .day {
    display:flex;
    align-items: center;
    justify-content: center;
    width: calc(100% / 7);
    text-align: left;
    color: #999;
    font-size: 12px;
    text-align: center;
    border-radius:5px
}

.current.today {background: rgb(242 242 242);background-color: yellow;}

.sec_cal_2 .cal_wrap .dates_2 {
    display: flex;
    flex-flow: wrap;
    height: 290px;
}

.sec_cal_2 .cal_wrap .day:nth-child(7n -1) {
    color: #3c6ffa;
}

.sec_cal_2 .cal_wrap .day:nth-child(7n) {
    color: #ed2a61;
}

.sec_cal_2 .cal_wrap .day.disable {
    color: #ddd;
}



</style>

<script>
function DepPlace() {//출발지 검색 버튼 액션
	  const depAirportLayer = document.getElementById('depAirportLayer');//출발지 선택 div
	  const AriAirportLayer = document.getElementById('AriAirportLayer');//도착지 선택 div
	  
	  if(depAirportLayer.style.display !== 'none') {
		  depAirportLayer.style.display = 'none';
	  }
	  else {
		  depAirportLayer.style.display = 'block';
		  AriAirportLayer.style.display = 'none';
		}
	}
function selectICN() {//출발지 선택후 출발지 텍스트에 담아주는 함수
	const Dep = document.getElementById('spanDepartureDesc');//출발지 텍스트
	const depAirportLayer = document.getElementById('depAirportLayer');//출발지 선택 div
	const departureData = document.getElementById('departureData').value='ICN';//출발지 공항정보 히든태그
	const Ari = document.getElementById('spanArrivalDesc');//도착지 텍스트
	Ari.innerHTML='도착지'//출발지를 선택할때마다 도착지는 초기화
	Dep.innerHTML='서울(인천)'
	depAirportLayer.style.display = 'none';
}
function selectGMP() {//출발지 선택후 출발지 텍스트에 담아주는 함수
	const Dep = document.getElementById('spanDepartureDesc');//출발지 텍스트
	const depAirportLayer = document.getElementById('depAirportLayer');//출발지 선택 div
	const departureData = document.getElementById('departureData').value='GMP';//출발지 공항정보 히든태그
	const Ari = document.getElementById('spanArrivalDesc');//도착지 텍스트
	Ari.innerHTML='도착지'//출발지를 선택할때마다 도착지는 초기화
	Dep.innerHTML='서울(김포)'
	depAirportLayer.style.display = 'none';
}

function AriPlace() {//도착지 검색 버튼 함수
	  const depAirportLayer = document.getElementById('depAirportLayer');//출발지 선택 div
	  const AriAirportLayer = document.getElementById('AriAirportLayer');//도착지 선택 div
	  const koplace = document.getElementById('koplace');//국내 행성지 div 301번째줄
	  const ItnPlace = document.getElementById('ItnPlace');//국제 행성지 div 316번째줄
	  var Dep = document.getElementById('spanDepartureDesc').innerHTML;//출발지 텍스트
	  
	  if(AriAirportLayer.style.display !== 'none') {
		  AriAirportLayer.style.display = 'none';
	  }
	  else if(Dep == '출발지'){
		  alert('출발지를 먼저 선택해주세요');
	  }
	  else if(Dep == '서울(인천)'){
		  AriAirportLayer.style.display = 'block';
		  depAirportLayer.style.display = 'none';
		  koplace.style.display = 'none';//출발지가 인천일땐 국내선 비행기가 없으므로 숨겨줌
		  ItnPlace.style.display = 'block';//출발지가 인천일땐 국제선 보여줌
	  }
	  else if(Dep == '서울(김포)'){
		  AriAirportLayer.style.display = 'block';
		  depAirportLayer.style.display = 'none';
		  koplace.style.display = 'block';//출발지가 김포 선택시 국내선 보여줌
		  ItnPlace.style.display = 'none';//출발지가 김포일땐 국제선 비행기가 없으므로 숨겨줌
	  }
	  
	  
	}
function selectPUS() {//도착지 선택후 도착지 텍스트에 담아주는 함수
	const Ari = document.getElementById('spanArrivalDesc');//도착지 텍스트
	const AriAirportLayer = document.getElementById('AriAirportLayer');
	const arrivalData = document.getElementById('arrivalData').value='PUS';//도착지 공항정보 히든태그
	//console.log(arrivalData)
	Ari.innerHTML='부산'
	AriAirportLayer.style.display = 'none';
}
function selectCJU() {//도착지 선택후 도착지 텍스트에 담아주는 함수
	const Ari = document.getElementById('spanArrivalDesc');//도착지 텍스트
	const AriAirportLayer = document.getElementById('AriAirportLayer');
	const arrivalData = document.getElementById('arrivalData').value='CJU';//도착지 공항정보 히든태그
	//console.log(arrivalData)
	Ari.innerHTML='제주'
	AriAirportLayer.style.display = 'none';
}
function selectNRT() {//도착지 선택후 도착지 텍스트에 담아주는 함수
	const Ari = document.getElementById('spanArrivalDesc');//도착지 텍스트
	const AriAirportLayer = document.getElementById('AriAirportLayer');
	const arrivalData = document.getElementById('arrivalData').value='NRT';//도착지 공항정보 히든태그
	//console.log(arrivalData)
	Ari.innerHTML='도쿄(나리타)'
	AriAirportLayer.style.display = 'none';
}
function selectPEK() {//도착지 선택후 도착지 텍스트에 담아주는 함수
	const Ari = document.getElementById('spanArrivalDesc');//도착지 텍스트
	const AriAirportLayer = document.getElementById('AriAirportLayer');
	const arrivalData = document.getElementById('arrivalData').value='PEK';//도착지 공항정보 히든태그
	//console.log(arrivalData)
	Ari.innerHTML='북경(베이징)'
	AriAirportLayer.style.display = 'none';
}
function selectDPS() {//도착지 선택후 도착지 텍스트에 담아주는 함수
	const Ari = document.getElementById('spanArrivalDesc');//도착지 텍스트
	const AriAirportLayer = document.getElementById('AriAirportLayer');
	const arrivalData = document.getElementById('arrivalData').value='DPS';//도착지 공항정보 히든태그
	//console.log(arrivalData)
	Ari.innerHTML='발리'
	AriAirportLayer.style.display = 'none';
}
function selectBKK() {//도착지 선택후 도착지 텍스트에 담아주는 함수
	const Ari = document.getElementById('spanArrivalDesc');//도착지 텍스트
	const AriAirportLayer = document.getElementById('AriAirportLayer');
	const arrivalData = document.getElementById('arrivalData').value='BKK';//도착지 공항정보 히든태그
	//console.log(arrivalData)
	Ari.innerHTML='방콕'
	AriAirportLayer.style.display = 'none';
}
function selectJFK() {//도착지 선택후 도착지 텍스트에 담아주는 함수
	const Ari = document.getElementById('spanArrivalDesc');//도착지 텍스트
	const AriAirportLayer = document.getElementById('AriAirportLayer');
	const arrivalData = document.getElementById('arrivalData').value='JFK';//도착지 공항정보 히든태그
	//console.log(arrivalData)
	Ari.innerHTML='뉴욕'
	AriAirportLayer.style.display = 'none';
}
function selectLAX() {//도착지 선택후 도착지 텍스트에 담아주는 함수
	const Ari = document.getElementById('spanArrivalDesc');//도착지 텍스트
	const AriAirportLayer = document.getElementById('AriAirportLayer');
	const arrivalData = document.getElementById('arrivalData').value='LAX';//도착지 공항정보 히든태그
	//console.log(arrivalData)
	Ari.innerHTML='로스앤젤레스'
	AriAirportLayer.style.display = 'none';
}
function selectLHR() {//도착지 선택후 도착지 텍스트에 담아주는 함수
	const Ari = document.getElementById('spanArrivalDesc');//도착지 텍스트
	const AriAirportLayer = document.getElementById('AriAirportLayer');
	const arrivalData = document.getElementById('arrivalData').value='LHR';//도착지 공항정보 히든태그
	//console.log(arrivalData)
	Ari.innerHTML='런던'
	AriAirportLayer.style.display = 'none';
}
function selectCDG() {//도착지 선택후 도착지 텍스트에 담아주는 함수
	const Ari = document.getElementById('spanArrivalDesc');//도착지 텍스트
	const AriAirportLayer = document.getElementById('AriAirportLayer');
	const arrivalData = document.getElementById('arrivalData').value='CDG';//도착지 공항정보 히든태그
	//console.log(arrivalData)
	Ari.innerHTML='파리'
	AriAirportLayer.style.display = 'none';
}
function selectSYD() {//도착지 선택후 도착지 텍스트에 담아주는 함수
	const Ari = document.getElementById('spanArrivalDesc');//도착지 텍스트
	const AriAirportLayer = document.getElementById('AriAirportLayer');
	const arrivalData = document.getElementById('arrivalData').value='SYD';//도착지 공항정보 히든태그
	//console.log(arrivalData)
	Ari.innerHTML='시드니'
	AriAirportLayer.style.display = 'none';
}
function selectGUM() {//도착지 선택후 도착지 텍스트에 담아주는 함수
	const Ari = document.getElementById('spanArrivalDesc');//도착지 텍스트
	const AriAirportLayer = document.getElementById('AriAirportLayer');
	const arrivalData = document.getElementById('arrivalData').value='GUM';//도착지 공항정보 히든태그
	//console.log(arrivalData)
	Ari.innerHTML='괌'
	AriAirportLayer.style.display = 'none';
}
function selectDXB() {//도착지 선택후 도착지 텍스트에 담아주는 함수
	const Ari = document.getElementById('spanArrivalDesc');//도착지 텍스트
	const AriAirportLayer = document.getElementById('AriAirportLayer');
	const arrivalData = document.getElementById('arrivalData').value='DXB';//도착지 공항정보 히든태그
	//console.log(arrivalData)
	Ari.innerHTML='두바이'
	AriAirportLayer.style.display = 'none';
}
function selectAUH() {//도착지 선택후 도착지 텍스트에 담아주는 함수
	const Ari = document.getElementById('spanArrivalDesc');//도착지 텍스트
	const AriAirportLayer = document.getElementById('AriAirportLayer');
	const arrivalData = document.getElementById('arrivalData').value='AUH';//도착지 공항정보 히든태그
	//console.log(arrivalData)
	Ari.innerHTML='아부다비'
	AriAirportLayer.style.display = 'none';
}
function person() {//인원 추가 div 여는 버튼
	const customerLayer = document.getElementById('customerLayer');//인원추가 버튼
	const Ari = document.getElementById('spanArrivalDesc').innerHTML;//도착지 텍스트
	if(Ari == '도착지'){
		alert('일정을 먼저 선택해 주세요.')
	}
	else{
		customerLayer.style.display = 'block';
	}
}
function SetPersonProc(){//인원추가후 확인 버튼 클릭
	const customerLayer = document.getElementById('customerLayer');
	const adtCount = document.getElementById('adtCount').value//어른수
	const chdCount = document.getElementById('chdCount').value//소아수
	const infCount = document.getElementById('infCount').value//유아수
	const personText = document.getElementById('personText')//인원분류와 명수 텍스트  
	
	console.log(adtCount)
	console.log(chdCount)
	console.log(infCount)
	personText.innerHTML="성인 : "+adtCount+" , 소아 : "+chdCount+" , 유아 : "+infCount
	customerLayer.style.display = 'none';
}
function DatePicker(){//달력 div 오픈 버튼클릭
	const dateLayer = document.getElementById('dateLayer');
	if(dateLayer.style.display !== 'none'){
		dateLayer.style.display = 'none';
	}else{
		dateLayer.style.display = 'block';
		calendarInit();//달력 div가 열렸을때 달력 데이터 가져오는 함수 실행
	}
}
function calendarInit() { //달력 데이터 가져오는 함수

    // 날짜 정보 가져오기
    var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
    var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
    var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
    var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
  
    var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
    // 달력에서 표기하는 날짜 객체
  
    
    var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
    var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
    var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

    // kst 기준 현재시간
    // console.log(thisMonth);

    // 캘린더 렌더링
    renderCalender(thisMonth);

    function renderCalender(thisMonth) {

        // 렌더링을 위한 데이터 정리
        currentYear = thisMonth.getFullYear();
        currentMonth = thisMonth.getMonth();
        currentDate = thisMonth.getDate();

        // 이전 달의 마지막 날 날짜와 요일 구하기
        var startDay = new Date(currentYear, currentMonth, 0);
        var prevDate = startDay.getDate();
        var prevDay = startDay.getDay();

        // 이번 달의 마지막날 날짜와 요일 구하기
        var endDay = new Date(currentYear, currentMonth + 1, 0);
        var nextDate = endDay.getDate();
        var nextDay = endDay.getDay();

        // console.log(prevDate, prevDay, nextDate, nextDay);

        // 현재 월 표기
        $('.year-month').text(currentYear + '.' + (currentMonth + 1));

        // 렌더링 html 요소 생성
        calendar = document.querySelector('.dates')
        calendar_2 = document.querySelector('.dates_2')
        calendar.innerHTML = '';
        calendar_2.innerHTML = '';
        
        // 지난달
        for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
            calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
            calendar_2.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
        }
        // 이번달
        for (var i = 1; i <= nextDate; i++) {
            calendar.innerHTML = calendar.innerHTML + '<div class="day current" onclick="Datesel(' + currentMonth + ',' + i + ',' + currentYear + ')">' + '<button class="SelectDate" style="height: 40px;width: 40px;">' +  i + '</button>' + '</div>'
            calendar_2.innerHTML = calendar.innerHTML + '<div class="day current" onclick="Datesel(' + currentMonth + ',' + i + ',' + currentYear + ')">' + '<button class="SelectDate" style="height: 40px;width: 40px;">' +  i + '</button>' + '</div>'
        }
        // 다음달
        for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
            calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
            calendar_2.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
        }

        // 오늘 날짜 표기
        if (today.getMonth() == currentMonth) {
            todayDate = today.getDate();
            var currentMonthDate = document.querySelectorAll('.dates .current');
            currentMonthDate[todayDate -1].classList.add('today');
        }
    }

    // 이전달로 이동
    $('.go-prev').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth - 1, 1);
        renderCalender(thisMonth);
    });

    // 다음달로 이동
    $('.go-next').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth + 1, 1);
        renderCalender(thisMonth); 
    });
}
function Datesel(currentMonth,i,currentYear){//달력 날짜  div
	/* console.log(currentMonth);
	console.log(i)
	console.log(currentYear) */
	var hidYear = document.getElementById('hidYear').value = currentYear
	var hidMonth = document.getElementById('hidMonth').value = (currentMonth+1)
	var hidDay = document.getElementById('hidDay').value = i
	/* console.log(hidYear);
	console.log(hidMonth)
	console.log(hidDay) */
	$('.SelectDate').on('click',function(){//달력 날짜 div 안에 자녀개채인 button (달력안의 div끼리 와 button들끼리의  class명이 같기때문에  내가 선택한 날짜만 선택되게 만든 함수)
		if($('.SelectDate').hasClass('active') == true){//이미 선택된 날짜가 잇다면 그 날짜의 active를 지워주고 새로 선택한 날짜에 active를 시켜준다
			$('.SelectDate.active').removeClass('active')
		}
		$(this).addClass('active')
	});
	$('.SelectDate.active').on('click',function(){//선택된 날짜를 한번더 클릭하면 active를 지워준다
		$(this).removeClass('active')
	});
}
function DepartureDate(){//출발날자 선택완료 버튼 함수
	var DepartureDate = document.getElementById('DepartureDate'); // 출발날짜 텍스트
	var hidYear = document.getElementById('hidYear').value //출발 년도 히든 태그
	var hidMonth = document.getElementById('hidMonth').value // 출발 월 히든 태그
	var hidDay = document.getElementById('hidDay').value // 출발 일 히든 태그
	const dateLayer = document.getElementById('dateLayer'); //달력 div
	DepartureDate.innerHTML= hidYear + '.' + hidMonth + '.' + hidDay + ' ~ ' //출발날짜 텍스트에 년,월,일 추가
	if(dateLayer.style.display !== 'none'){
		dateLayer.style.display = 'none';
	}
}


</script>
<%@ include file="../common/include/header.jsp"%>
	
		
		<div id="body">
			
			<!-- Google Tag Manager (noscript) -->
			<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PD2BQQ4" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
			<!-- End Google Tag Manager (noscript) -->
			
				<div class="main-ticketing round open">
					<div class="ticketing-in content-guide">
						<ul class="ticketing-type">
							<li class="item selected" data-triptype="RT"><a href="#" class="item-btn">왕복</a></li> <!-- 왕복 -->
							<li class="item" data-triptype="OW"><a href="#" class="item-btn">편도</a></li> <!-- 편도 --> 	
						</ul>
						
						<div class="ticketing-row-top single">
							<div class="ticketing-target">
								<button type="button" class="start js-target-pick active" onclick="DepPlace()"><span class="txt" id="spanDepartureDesc">출발지</span></button> <!-- 출발지 -->	
								<input type="hidden" id="departureData" value="">
								<button type="button" class="target js-target-pick active" onclick="AriPlace()"><span class="txt" id="spanArrivalDesc">도착지</span></button> <!-- 도착지 -->
								<input type="hidden" id="arrivalData">
								<button type="button" class="btn-open js-target-pick" data-route="DEP" id="btnExchangeRoute1"><span class="blind">열기</span></button> <!--열기-->
							</div>
							<div class="ticketing-date">													
								<button type="button" class="btn-date" id="btnDatePicker" onclick="DatePicker()"><span class="txt" id="DepartureDate">2022.12.08 (목)  ~ 2022.12.10 (토) </span></button>								
								<input type="hidden" id="departureDate" value="2022-12-08">
								<input type="hidden" id="arrivalDate" value="2022-12-10">
							</div>				
						</div>		
										
						<div class="ticketing-row-hidden single">
						
						<!-- 출발지 선택 -->
						
							<div class="flight-layer flight-start" id="depAirportLayer" style="display: none;">		
								<div class="layer-header">
									<div class="header__input-wrap input is-focus" data-element="form">
										<button type="button" class="header__button" name="header_btn"><span class="hidden">이전으로</span></button> <!-- 이전으로 -->
										<button type="button" class="header__input-search"><img src="https://static.jejuair.net/hpgg/resources/images/icon/icon-header-search.png" alt="검색"></button>
										<input type="text" id="txtDEPAirport" class="header__input ui-autocomplete-input" data-element="input" placeholder="어디에서 출발하세요?" autocomplete="off"> <!-- 어디에서 출발하세요? -->
										<p class="map-list-txt" id="mapDEPAirport">어디에서 출발하세요?</p> <!-- 어디에서 출발하세요? -->
										<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button> <!-- 삭제 -->
									</div>									
									<div id="divDEPAirportAC" name="search_auto" target="txtDepAirport"><ul class="predictive-search ui-menu ui-widget ui-widget-content" id="ui-id-1" tabindex="0" style="display: none;"></ul></div>
								</div>
								<div class="txt-list">
									<div class="main--destination-select">
										<hr class="booking-line">
										<div data-element="tab" class="tab tab--vertical tab--booking">
											<div class="tab__buttons vertical_scroll_set" id="divDepArea">
												<div data-element="tab__list" class="tab__button" role="presentation"><button type="button" tabindex="" data-element="tab__anchor" role="tab" data-index="0" id="plugin-DEPtab-2" class="tab__anchor is-active" aria-selected="true" aria-expanded="true">대한민국</button></div>
											</div>
											<div class="tab__panel-wrap scrollbar-inner" data-element="tab__panel-wrap">
											<div data-element="tab__panel" class="tab__panel is-active" aria-labelledby="plugin-DEPtab-2" role="tabpanel" tabindex="0" style="display: block;">
											<div class="choise">
												<button type="button" class="choise__button" onclick="selectICN()">
												<span class="stationName">서울(인천)</span>
												<span class="airport">ICN</span>
												</button>
											</div>
											<div class="choise">
												<button type="button" class="choise__button" onclick="selectGMP()">
												<span class="stationName">서울(김포)</span>
												<span class="airport">GMP</span>
												</button>
											</div>
											</div>
											</div>
										
								<div class="map-list">
									<div class="map-wrap">
										<div id="map-start" class="flight-map"></div>
										
									</div>
									<button type="button" class="floating-button btn-list" onclick="viewTabMap('start', 'list')">
										<span class="hidden">리스트보기</span> <!-- 리스트보기 -->
									</button>
								</div>
								<a href="#a" class="layer-close on"><span class="blind">닫기</span></a> <!-- 닫기 -->		 	
							</div>				
							
																		
							</div>
							</div>
							</div>
							
							
							<!-- 도착지 선택 -->
							
							<div class="flight-layer flight-start" id="AriAirportLayer" style="display: none;">		
								<div class="layer-header">
									<div class="header__input-wrap input is-focus" data-element="form">
										<button type="button" class="header__button" name="header_btn"><span class="hidden">이전으로</span></button> <!-- 이전으로 -->
										<button type="button" class="header__input-search"><img src="https://static.jejuair.net/hpgg/resources/images/icon/icon-header-search.png" alt="검색"></button>
										<input type="text" id="txtDEPAirport" class="header__input ui-autocomplete-input" data-element="input" placeholder="어디에서 출발하세요?" autocomplete="off"> <!-- 어디에서 출발하세요? -->
										<p class="map-list-txt" id="mapDEPAirport">어디에서 출발하세요?</p> <!-- 어디에서 출발하세요? -->
										<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button> <!-- 삭제 -->
									</div>									
									<div id="divDEPAirportAC" name="search_auto" target="txtDepAirport"><ul class="predictive-search ui-menu ui-widget ui-widget-content" id="ui-id-1" tabindex="0" style="display: none;"></ul></div>
								</div>
								<div class="txt-list">
									<div class="header-sub" data-element="tab">
										<div class="tab__buttons">
											<div data-element="tab__list" class="tab__button" role="presentation">
												<button type="button" class="tab__anchor is-active" id="selectTab01" data-element="tab__anchor" data-index="0" role="tab" tabindex="" aria-selected="true" aria-expanded="true">최근 검색</button> <!-- 최근 검색 -->
											</div>
										</div>														
									</div>
									<div class="main--destination-select">
										<hr class="booking-line">
										<div data-element="tab" class="tab tab--vertical tab--booking">
											<div class="tab__buttons vertical_scroll_set" id="divDepArea">
												<div data-element="tab__list" class="tab__button" role="presentation"><button type="button" tabindex="" data-element="tab__anchor" role="tab" data-index="0" id="plugin-DEPtab-2" class="tab__anchor is-active" aria-selected="true" aria-expanded="true">대한민국</button></div>
												<div data-element="tab__list" class="tab__button" role="presentation"><button type="button" id="plugin-DEPtab-3" class="tab__anchor">일본</button></div>
											</div>
											<div class="tab__panel-wrap scrollbar-inner" data-element="tab__panel-wrap">
											<div data-element="tab__panel" id="koplace" class="tab__panel is-active" aria-labelledby="plugin-DEPtab-2" role="tabpanel" tabindex="0" style="display: block;">
											<div class="choise">
											<!-- 국내항 도착지 -->
												<button type="button" class="choise__button" onclick="selectPUS()">
												<span class="stationName">부산</span>
												<span class="airport">PUS</span>
												</button>
											</div>
											<div class="choise">
												<button type="button" class="choise__button" onclick="selectCJU()">
												<span class="stationName">제주</span>
												<span class="airport">CJU</span>
												</button>
											</div>
											</div>
											<!-- 국제항 도착지 -->
											<div data-element="tab__panel" id="ItnPlace" class="tab__panel is-active" aria-labelledby="plugin-DEPtab-3" role="tabpanel" tabindex="0" style="display: block">
											<div class="choise">
												<button type="button" class="choise__button" onclick="selectNRT()">
												<span class="stationName">도쿄(나리타)</span>
												<span class="airport">NRT</span>
												</button>
											</div>
											<div class="choise">
												<button type="button" class="choise__button" onclick="selectPEK()">
												<span class="stationName">북경(베이징)</span>
												<span class="airport">PEK</span>
												</button>
											</div>
											<div class="choise">
												<button type="button" class="choise__button" onclick="selectDPS()">
												<span class="stationName">발리</span>
												<span class="airport">DPS</span>
												</button>
											</div>
											<div class="choise">
												<button type="button" class="choise__button" onclick="selectBKK()">
												<span class="stationName">방콕</span>
												<span class="airport">BKK</span>
												</button>
											</div>
											<div class="choise">
												<button type="button" class="choise__button" onclick="selectJFK()">
												<span class="stationName">뉴욕</span>
												<span class="airport">JFK</span>
												</button>
											</div>
											<div class="choise">
												<button type="button" class="choise__button" onclick="selectLAX()">
												<span class="stationName">로스앤젤레스</span>
												<span class="airport">LAX</span>
												</button>
											</div>	
											<div class="choise">
												<button type="button" class="choise__button" onclick="selectLHR()">
												<span class="stationName">런던</span>
												<span class="airport">LHR</span>
												</button>
											</div>		
											<div class="choise">
												<button type="button" class="choise__button" onclick="selectCDG()">
												<span class="stationName">파리</span>
												<span class="airport">CDG</span>
												</button>
											</div>	
											<div class="choise">
												<button type="button" class="choise__button" onclick="selectSYD()">
												<span class="stationName">시드니</span>
												<span class="airport">SYD</span>
												</button>
											</div>	
											<div class="choise">
												<button type="button" class="choise__button" onclick="selectGUM()">
												<span class="stationName">괌</span>
												<span class="airport">GUM</span>
												</button>
											</div>		
											<div class="choise">
												<button type="button" class="choise__button" onclick="selectDXB()">
												<span class="stationName">두바이</span>
												<span class="airport">DXB</span>
												</button>
											</div>	
											<div class="choise">
												<button type="button" class="choise__button" onclick="selectAUH()">
												<span class="stationName">아부다비</span>
												<span class="airport">AUH</span>
												</button>
											</div>			
											</div>
								</div>
								<div class="map-list">
									<div class="map-wrap">
										<div id="map-start" class="flight-map"></div>
										
									</div>
									<button type="button" class="floating-button btn-list" onclick="viewTabMap('start', 'list')">
										<span class="hidden">리스트보기</span> <!-- 리스트보기 -->
									</button>
								</div>
								<a href="#a" class="layer-close on"><span class="blind">닫기</span></a> <!-- 닫기 -->		 	
							</div>				
							
																		
							</div>
							</div>
							</div>
							<!-- 달력 선택 -->
							<div class="date-layer" id="dateLayer" style="display: none;">
								<div class="layer-header">								
									<button type="button" class="header__button" name="header_btn">
									<span class="hidden">이전으로</span> <!-- 이전으로 -->
									</button>								
									<h2 class="customer-layer__title">언제 떠나세요?</h2> <!-- 언제 떠나세요? -->	
								</div>								
								<div class="layer-content">
									<div class="picker picker--full"> 
										<div class="info-wrap"><span class="info">1인 편도 운임 기준</span><span class="currency" name="currency">통화 : 원</span></div> <!-- 1인 편도 운임  기준 -->
										<div class="flatpickr-wrapper">
											
										<!-- 출발날짜 선택 -->
										  <div class="sec_cal" style="display : none;">
											  <div class="cal_nav">
											    <a href="javascript:;" class="nav-btn go-prev">prev</a>
											    <div class="year-month"></div>
											    <a href="javascript:;" class="nav-btn go-next">next</a>
											  </div>
											  <div class="cal_wrap">
											    <div class="days">
											      <div class="day">MON</div>
											      <div class="day">TUE</div>
											      <div class="day">WED</div>
											      <div class="day">THU</div>
											      <div class="day">FRI</div>
											      <div class="day">SAT</div>
											      <div class="day">SUN</div>
											    </div>
											    <div class="dates"></div>
											  </div>
										</div>
										<!-- 돌아올 날짜 선택 -->
										<div class="sec_cal_2" style="display : block;">
											  <div class="cal_nav">
											    <a href="javascript:;" class="nav-btn go-prev">prev</a>
											    <div class="year-month"></div>
											    <a href="javascript:;" class="nav-btn go-next">next</a>
											  </div>
											  <div class="cal_wrap">
											    <div class="days">
											      <div class="day">MON</div>
											      <div class="day">TUE</div>
											      <div class="day">WED</div>
											      <div class="day">THU</div>
											      <div class="day">FRI</div>
											      <div class="day">SAT</div>
											      <div class="day">SUN</div>
											    </div>
											    <div class="dates_2"></div>
											  </div>
											</div>
										</div>
									</div>
									<div class="booking-button cal-button">
										<input type="hidden" id="hidYear">
										<input type="hidden" id="hidMonth">
										<input type="hidden" id="hidDay">
										<button type="button" class="button button--primary button--active" data-select-date="#selectDate" rel="modal:close" onclick="DepartureDate()">
											<span class="button__text">선택</span> <!-- 선택 -->
										</button>              
									</div>
								</div>
								<a href="#a" class="layer-close on"><span class="blind">닫기</span></a> <!-- 닫기 -->
							</div>
							
							<div class="customer-layer" id="customerLayer" style="display: none;">
								<div class="layer-header">
									<button type="button" class="header__button" name="header_btn"><span class="hidden">이전으로</span></button> <!-- 이전으로 -->
									<h2 class="customer-layer__title">누구와 함께 떠나세요?</h2> <!-- 누구와 함께 떠나세요? -->
								</div>					
								<div class="layer-content">
									<div class="booking-trip">
										<div class="booking-trip__from" id="divFromPas"><span class="location"></span></div>
										<span class="booking-trip__switch"><span class="hidden">에서</span></span> <!-- 에서 -->
										<div class="booking-trip__to" id="divToPax"><span class="location"></span></div>							
									</div>																					
									<hr class="section-spacer">
									<div class="booking-members">
										<div class="input-wrap input--line">
											<div class="input-row input-row--number input-row--icon">																
												<label for="adtCount" class="input__label">성인</label> <!-- 성인 -->
												<div data-element="form" class="input input--number is-active">
												<button type="button" data-element="number__button" onclick="javascript:chkAdtCount('');" data-type="decrease" class="input__number input__number-minus" aria-label="빼기" disabled=""></button> <!-- 빼기 -->
												<input type="text" id="adtCount" placeholder="숫자입력" data-element="number__input" value="1" data-max="9" data-min="1" data-string-number="" class="input__number"> <!-- 숫자입력 -->
												<button type="button" data-element="number__button" data-type="increase" class="input__number input__number-plus" aria-label="더하기"></button> <!-- 더하기 -->
												</div>
												<p class="text__small text--color-gray" id="adtMsg">12세 이상</p> <!-- 12세 이상 -->
											</div>							
											<div class="input-row input-row--number input-row--icon">
												<label for="chdCount" class="input__label">소아</label> <!-- 소아 -->
												<div data-element="form" class="input input--number is-active">
												<button type="button" data-element="number__button" data-type="decrease" class="input__number input__number-minus" aria-label="빼기" disabled=""></button> <!-- 빼기 -->
												<input type="text" id="chdCount" placeholder="숫자입력" data-element="number__input" value="0" data-max="9" data-min="0" data-string-number="" class="input__number"> <!-- 숫자입력 -->
												<button type="button" data-element="number__button" data-type="increase" class="input__number input__number-plus" aria-label="더하기"></button> <!-- 더하기 -->
												</div>
												<p class="text__small text--color-gray" name="chdMsg">국제선 기준 만 2세~12세 미만<br>(최초 출발일 기준)</p><!-- 국제선 기준<br>만 2세 ~ 만 12세 미만 -->
											</div>						
											<div class="input-row input-row--number input-row--icon">																
												<label for="infCount" class="input__label">유아</label> <!-- 유아 -->
												<div data-element="form" class="input input--number is-active">
												<button type="button" data-element="number__button" data-type="decrease" class="input__number input__number-minus" aria-label="빼기" disabled=""></button> <!-- 빼기 -->
												<input type="text" id="infCount" placeholder="숫자입력" data-element="number__input" value="0" data-max="9" data-min="0" data-string-number="" class="input__number"> <!-- 숫자입력 -->
												<button type="button" id="btnInfCount" onclick="javascript:chkInfCount('');" data-element="number__button" data-type="increase" class="input__number input__number-plus" aria-label="더하기"></button> <!-- 더하기 -->
												</div>
												<p class="text__small text--color-gray" name="infantDesc">생후 14일 이상~만 2세 미만<br>(만 24개월 미만/최종 탑승일 기준)<br>유아의 여정이 동반 성인과 일치하지 않으면 환불 후 재구매해야 합니다.</p> <!-- 생후 7일 이상~만 2세 미만<br>(만 24개월 미만) -->
											</div>															
										</div>
									</div>
																
								</div>
								<div class="fixed-wrap fixed-wrap--multi-line border-none">
									<div class="button-wrap">
										<button type="button" class="button button--active" name="btnSetPassenger" onclick="SetPersonProc()"><span class="button__text">선택 완료</span></button> <!-- 선택 완료 -->
									</div>													
								</div>
									<a href="#a" class="layer-close on"><span class="blind">닫기</span></a> <!-- 닫기 -->
								</div>
							
											
																						
										<div class="ticketing-row-bot">
											<div class="ticketing-row-sub">
												<div class="ticketing-people">
													<button type="button" class="btn-passengers" id="personText" onclick="person()"><span id="personText" class="txt" >성인1</span></button><!-- 성인1 -->
												</div>
												<div class="payment">
												<div class="payment-head">
													<div class="payment-tit">결제 방법</div> <!-- 결제 방법 -->
													<span class="tooltip">
														<button type="button" class="tooltip__button" data-element="modal_anchor" data-target="#toolTipModalLayer2" data-modal-type="full"></button>	
													</span>
												</div>
												
												</div>
											</div>
											<div class="ticketing-row-sub">
												
												<div class="g-ticket" style="display: none;">
													<select class="g-ticket-select" id="selectGifticket"></select>																																												
													<div class="g-ticket-select nodata" style="display:none;" name="nodataGift">선택 가능한 기프티켓이 없습니다.</div>
													<a href="/ko/additionalService/service/gifticket.do" target="_blank" class="go-detail" name="nodataGift" style="display:none;">기프티켓 자세히 보기 &gt;</a><!-- 선택 가능한 기프티켓이 없습니다. 기프티켓 자세히 보기  -->													
												</div>						
												<button type="button" id="searchFlight" onclick="javascript:setSearchAvailParam(true);" class="btn-flight-sch-again">항공권 검색</button> <!-- 항공권  검색 -->
											</div>
										</div>
									</div>
								</div>
							
				
		</div>
		
		<%@ include file="../common/include/footer.jsp"%>