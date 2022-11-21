<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
.SelectDate.asd {
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
.GoDate {
    text-align: center;
    line-height: 1;
}
.BackDate {
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
	  var HidItem = $(".item.selected").find('.HidItem').val(); //선택된 운행정보를 가져옴
	  var hiddenItem = document.getElementById('hiddenItem') // 선택된 운행정보 히든 태그
	  const depAirportLayer = document.getElementById('depAirportLayer');//출발지 선택 div
	  const AriAirportLayer = document.getElementById('AriAirportLayer');//도착지 선택 div
	  var changeRout = document.getElementById('changeRout')//항공권 정보 변경 히든 태그
	  changeRout.value="CHR" //운행정보가 변경됫다고 알리는 히든태그에 CHR를 넣어 탑승(비지니스,퍼스트클래스 등)유형 버튼 클릭 이벤트 함수 에서 체크함
	  $('.tab-btn.grade-bag.active').removeClass('active')//탑승(비지니스,퍼스트클래스 등)유형 버튼 액티브를 지워준다
	  $('.booking-sticky.booking-sticky--reservation').css('display','none');//다음페이지으로 넘어가는 DIV를 숨긴다
	  hiddenItem.value = HidItem //왕복or편도 를 히든태그에 넣어줌
	  
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
	  var changeRout = document.getElementById('changeRout')//항공권 정보 변경 히든 태그
	  changeRout.value="CHR"
	  $('.tab-btn.grade-bag.active').removeClass('active')//탑승(비지니스,퍼스트클래스 등)유형 버튼 액티브를 지워준다
	  $('.booking-sticky.booking-sticky--reservation').css('display','none');//다음페이지으로 넘어가는 DIV를 숨긴다
	  
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
	const adtNum = document.getElementById('adtNum')//어른수 히든태그
	const chdNum = document.getElementById('chdNum')//소아수 히든태그
	const infNum = document.getElementById('infNum')//유아수 히든태그
	const perText = document.getElementById('perText')//인원분류와 명수 텍스트  
	var changeRout = document.getElementById('changeRout')//항공권 정보 변경 히든 태그
	changeRout.value="CHR"
	$('.tab-btn.grade-bag.active').removeClass('active')//탑승(비지니스,퍼스트클래스 등)유형 버튼 액티브를 지워준다
	$('.booking-sticky.booking-sticky--reservation').css('display','none');//다음페이지으로 넘어가는 DIV를 숨긴다
	
	adtNum.value = adtCount
	chdNum.value = chdCount
	infNum.value = infCount
	
	/* console.log(adtNum.value)
	console.log(chdNum.value)
	console.log(infNum.value) */
	
	perText.innerHTML="성인 : "+adtCount+" , 소아 : "+chdCount+" , 유아 : "+infCount
	customerLayer.style.display = 'none';
}
function DatePicker(){//달력 div 오픈 버튼클릭
	var DepartureDate = document.getElementById('DepartureDate'); // 출발날짜 텍스트
	const dateLayer = document.getElementById('dateLayer');//달력 상위 div
	const DepDiv = document.getElementById('DepDiv');//출발날짜 달력 바디 div
	const BackDiv = document.getElementById('BackDiv');//돌아올날짜 달력 바디 div
	const DepSetBtn = document.getElementById('DepSetBtn');//출발날짜 결정 버튼 div
	const BackSetBtn = document.getElementById('BackSetBtn');//돌아올날짜 결정 버튼 div
	const Ari = document.getElementById('spanArrivalDesc').innerHTML;//도착지 텍스트
	var changeRout = document.getElementById('changeRout')//항공권 정보 변경 히든 태그
	changeRout.value="CHR"
	$('.tab-btn.grade-bag.active').removeClass('active')//탑승(비지니스,퍼스트클래스 등)유형 버튼 액티브를 지워준다
	$('.booking-sticky.booking-sticky--reservation').css('display','none');//다음페이지으로 넘어가는 DIV를 숨긴다
	DepartureDate.innerHTML = '날짜를 선택해 주세요.'
	if(Ari == '도착지'){
		alert('일정을 먼저 선택해 주세요.')
	}
	
	else if(dateLayer.style.display !== 'none'){
		dateLayer.style.display = 'none';
	}
	else{
		dateLayer.style.display = 'block';
		BackDiv.style.display = 'none';
		DepDiv.style.display = 'block';
		DepSetBtn.style.display = 'block';
		BackSetBtn.style.display = 'none';
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
            calendar_2.innerHTML = calendar_2.innerHTML + '<div class="day prev disable">' + i + '</div>'
        }
        // 이번달
        for (var i = 1; i <= nextDate; i++) {
            calendar.innerHTML = calendar.innerHTML + '<div class="day current" onclick="Datesel(' + currentMonth + ',' + i + ',' + currentYear + ')">' + '<button class="SelectDate" style="height: 40px;width: 40px;">' +  i + '</button>' + '</div>'
            calendar_2.innerHTML = calendar_2.innerHTML + '<div class="day current" onclick="Datesel_2(' + currentMonth + ',' + i + ',' + currentYear + ')">' + '<button class="SelectDate" style="height: 40px;width: 40px;">' +  i + '</button>' + '</div>'
        }
        // 다음달
        for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
            calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
            calendar_2.innerHTML = calendar_2.innerHTML + '<div class="day next disable">' + i + '</div>'
        }

        // 오늘 날짜 표기
        if (today.getMonth() == currentMonth) {
        	var hidToYear = document.getElementById('hidToYear').value = today.getFullYear() //현제 년도 히든태그에 값을 넣어줌
        	var hidToMonth = document.getElementById('hidToMonth').value = (today.getMonth()+1) //현제 월수 히든태그에 값을 넣어줌
        	var hidToDay = document.getElementById('hidToDay').value = today.getDate() //현제 일수 히든태그에 값을 넣어줌
        	/* 
        	현제 날짜
        	console.log(today.getFullYear()) 
        	console.log((today.getMonth()+1)) 
        	console.log(today.getDate())
        	*/
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
	
	var hidYear = document.getElementById('hidYear').value = currentYear //출발 년도 히든태그에 값을 넣어줌
	var hidMonth = document.getElementById('hidMonth').value = (currentMonth+1) //출발 월의 히든태그에 값을 넣어줌
	var hidDay = document.getElementById('hidDay').value = i //출발 일의 히든태그에 값을 넣어줌
	var hidToYear = document.getElementById('hidToYear').value //현제 년도 히든태그 값
	var hidToMonth = document.getElementById('hidToMonth').value //현제 월수 히든태그 값
	var hidToDay = document.getElementById('hidToDay').value //현제 일수 히든태그 값
	/* console.log('출발 : ' + hidYear)
	console.log(hidMonth)
	console.log(hidDay) */
	
	if(hidMonth == hidToMonth){
		//console.log('첫번째 if')
		if(hidDay < hidToDay){
			//console.log('두번째 if')
			document.getElementById('hidYear').value = ""
			alert('지난 날짜는 선택할수 없습니다')
		}else{
			//console.log('첫번째 else')
			$('.SelectDate').on('click',function(){//달력 날짜 div 안에 자녀개채인 button (달력안의 div끼리 와 button들끼리의  class명이 같기때문에  내가 선택한 날짜만 선택되게 만든 함수)
				if($('.SelectDate').hasClass('asd') == true){//이미 선택된 날짜가 잇다면 그 날짜의 active를 지워주고 새로 선택한 날짜에 active를 시켜준다
					$('.SelectDate.asd').removeClass('asd')
				}
				$(this).addClass('asd')
			});
			$('.SelectDate.asd').on('click',function(){//선택된 날짜를 한번더 클릭하면 active를 지워준다
				$(this).removeClass('asd')
			});
		}
		
	}
	else{
		
		//console.log('두번째 else')
		$('.SelectDate').on('click',function(){//달력 날짜 div 안에 자녀개채인 button (달력안의 div끼리 와 button들끼리의  class명이 같기때문에  내가 선택한 날짜만 선택되게 만든 함수)
			if($('.SelectDate').hasClass('asd') == true){//이미 선택된 날짜가 잇다면 그 날짜의 active를 지워주고 새로 선택한 날짜에 active를 시켜준다
				$('.SelectDate.asd').removeClass('asd')
			}
			$(this).addClass('asd')
		});
		$('.SelectDate.asd').on('click',function(){//선택된 날짜를 한번더 클릭하면 active를 지워준다
			$(this).removeClass('asd')
		});
	}
	
}
function Datesel_2(currentMonth,i,currentYear){//달력 날짜  div
	
	var BackYear = document.getElementById('BackYear').value = currentYear //도착 년도 히든태그에 값을 넣어줌
	var BackMonth = document.getElementById('BackMonth').value = (currentMonth+1) //도착 월의 히든태그에 값을 넣어줌
	var BackDay = document.getElementById('BackDay').value = i //도착 일의 히든태그에 값을 넣어줌
	
	/* console.log('돌아올 : ' + BackYear)
	console.log(BackMonth)
	console.log(BackDay) */
	$('.SelectDate').on('click',function(){//달력 날짜 div 안에 자녀개채인 button (달력안의 div끼리 와 button들끼리의  class명이 같기때문에  내가 선택한 날짜만 선택되게 만든 함수)
		if($('.SelectDate').hasClass('asd') == true){//이미 선택된 날짜가 잇다면 그 날짜의 active를 지워주고 새로 선택한 날짜에 active를 시켜준다
			$('.SelectDate.asd').removeClass('asd')
		}
		$(this).addClass('asd')
	});
	$('.SelectDate.asd').on('click',function(){//선택된 날짜를 한번더 클릭하면 active를 지워준다
		$(this).removeClass('asd')
	});
}
function DepartureDate(){//출발날자 선택완료 버튼 함수
	var DepartureDate = document.getElementById('DepartureDate'); // 출발날짜 텍스트
	var hidYear = document.getElementById('hidYear').value //출발 년도 히든 태그
	var hidMonth = document.getElementById('hidMonth').value // 출발 월 히든 태그
	var hidDay = document.getElementById('hidDay').value // 출발 일 히든 태그
	const dateLayer = document.getElementById('dateLayer'); //달력 상위 div
	const DepDiv = document.getElementById('DepDiv');//출발날짜 달력 바디 div
	const BackDiv = document.getElementById('BackDiv');//돌아올날짜 달력 바디 div
	const DepSetBtn = document.getElementById('DepSetBtn');//출발날짜 결정 버튼 div
	const BackSetBtn = document.getElementById('BackSetBtn');//돌아올날짜 결정 버튼 div
	var HidItem = $(".item.selected").find('.HidItem').val();//왕복 또는 편도 값이 담겨잇는 히든태그
	
	if(HidItem == '편도'){
		DepartureDate.innerHTML= hidYear + '.' + hidMonth + '.' + hidDay
		dateLayer.style.display = 'none';
	}
	else if(document.getElementById('hidYear').value != ""){
		DepDiv.style.display = 'none';
		BackDiv.style.display = 'block';
		DepSetBtn.style.display = 'none';
		BackSetBtn.style.display = 'block';
		DepartureDate.innerHTML= hidYear + '.' + hidMonth + '.' + hidDay + ' ~ ' //출발날짜 텍스트에 년,월,일 추가
	}
	else{
		alert('출발날짜를 선택해주세요')
	}
}
function ComeBackDate(){
	var DepartureDate = document.getElementById('DepartureDate'); // 출발날짜 텍스트
	var hidYear = document.getElementById('hidYear').value //출발 년도 히든 태그
	var hidMonth = document.getElementById('hidMonth').value // 출발 월 히든 태그
	var hidDay = document.getElementById('hidDay').value // 출발 일 히든 태그
	var BackYear = document.getElementById('BackYear').value //출발 년도 히든 태그
	var BackMonth = document.getElementById('BackMonth').value // 출발 월 히든 태그
	var BackDay = document.getElementById('BackDay').value // 출발 일 히든 태그
	const dateLayer = document.getElementById('dateLayer'); //달력 상위 div
	/* console.log(hidYear) 
	console.log(hidMonth) 
	console.log(hidDay) 
	console.log(BackYear) 
	console.log(BackMonth) 
	console.log(BackDay)  */
	
	if(hidMonth == BackMonth){
		if(hidDay > BackDay){
			alert('돌아오는 날짜를 정확히 선택해 주세요.')
		}
		else{
			DepartureDate.innerHTML= hidYear + '.' + hidMonth + '.' + hidDay + ' ~ ' + BackYear + '.' + BackMonth + '.' + BackDay
			dateLayer.style.display = 'none';
			}
	}
	else if(hidMonth > BackMonth){
		alert('돌아오는 날짜를 정확히 선택해 주세요.')
	}
	else if(hidYear > BackYear){
		alert('돌아오는 날짜를 정확히 선택해 주세요.')
	}
	else if(BackYear == ""){
		alert('돌아오는 날짜를 선택해주세요')
	}
	else{
	DepartureDate.innerHTML= hidYear + '.' + hidMonth + '.' + hidDay + ' ~ ' + BackYear + '.' + BackMonth + '.' + BackDay
	dateLayer.style.display = 'none';
	}
}
$(function(){//왕복 또는 편도 선택
	   $('.item').click(function(){//왕복 또는 편도 선택
         
       	 $('.item.selected').removeClass('selected')//왕복 또는 편도 선택 selected 클래스명 추가해서 표시함
       	 $(this).addClass('selected')
        var changeRout = document.getElementById('changeRout')//왕복 또는 편도 정보 변경시 히든태그에 운행정보가 변경됫다고 알리는 히든태그
       	var HidItem = $(".item.selected").find('.HidItem').val(); //선택된 운행정보를 가져옴
       	var hiddenItem = document.getElementById('hiddenItem') // 선택된 운행정보 히든 태그
       	var DepartureDate = document.getElementById('DepartureDate'); // 출발날짜 텍스트
       	const dateLayer = document.getElementById('dateLayer'); //달력 상위 div
       	var hidYear = document.getElementById('hidYear') //출발 년도 히든 태그
    	var hidMonth = document.getElementById('hidMonth') // 출발 월 히든 태그
    	var hidDay = document.getElementById('hidDay') // 출발 일 히든 태그
    	var BackYear = document.getElementById('BackYear') //출발 년도 히든 태그
    	var BackMonth = document.getElementById('BackMonth') // 출발 월 히든 태그
    	var BackDay = document.getElementById('BackDay') // 출발 일 히든 태그
    	hidYear.value = ''; //왕복 또는 편도로 운행정보를 변경할때마다 출발,돌아올 날짜 히든태그를 초기화시켜준다
   	 	hidMonth.value = '';
   	 	hidDay.value = '';
   	 	BackYear.value = '';
   	 	BackMonth.value = '';
   	 	BackDay.value = '';
   	    changeRout.value = "CHR"//운행정보가 변경됫다고 알리는 히든태그에 CHR를 넣어 탑승(비지니스,퍼스트클래스 등)유형 버튼 클릭시 이벤트 함수 에서 체크함
   	 	DepartureDate.innerHTML=('출발날짜를 선택해 주세요')
   	 	hiddenItem.value = HidItem //왕복or편도 를 히든태그에 넣어줌
   	 	
   	 	//console.log(HidItem)
	   	if($('.tab-btn.grade-bag').hasClass('active') == true){
				$('.tab-btn.grade-bag.active').removeClass('active')
				$('.booking-sticky.booking-sticky--reservation').css('display','none');
				
		 }
	   	else if(dateLayer.style.display == 'block'){
        	 dateLayer.style.display = 'none';
        	 
         }
   	/*  console.log(hidYear) 
 	console.log(hidMonth) 
 	console.log(hidDay) 
 	console.log(BackYear) 
 	console.log(BackMonth) 
 	console.log(BackDay)  */
     })
 })
$(function(){ //div 창의 X(닫기)버튼 클릭시 이벤트
	const depAirportLayer = document.getElementById('depAirportLayer');//출발지 선택 div
	const AriAirportLayer = document.getElementById('AriAirportLayer');//도착지 선택 div
	const dateLayer = document.getElementById('dateLayer');//달력 상위 div
	const customerLayer = document.getElementById('customerLayer');//인원추가 버튼
	$('.layer-close.on').click(function(){
		if(depAirportLayer.style.display == 'block'){
			depAirportLayer.style.display = 'none';
		}
		else if(AriAirportLayer.style.display == 'block'){
			AriAirportLayer.style.display = 'none';
		}
		else if(dateLayer.style.display == 'block'){
			dateLayer.style.display = 'none';
		}else if(customerLayer.style.display == 'block'){
			customerLayer.style.display = 'none';
		}
	})
})
function adtMinus(){//어른수 감소 버튼 이벤트
	var adtCount = document.getElementById('adtCount');
	let mounusnumber = adtCount.value;
	if(mounusnumber < 2){
		mounusnumber = 1
	}else{
		mounusnumber = parseInt(mounusnumber) - 1;
	}
	adtCount.value = mounusnumber;
}
function adtPlus(){//어른수 증가 버튼 이벤트
	const adtCount = document.getElementById('adtCount');
	let plusnumber = adtCount.value;
	if(plusnumber < 9){
		plusnumber = parseInt(plusnumber) + 1;
	}
	else{
		plusnumber = 9;
	}
	adtCount.value = plusnumber
}
function chdMinus(){//소아 감소 버튼 이벤트
	var chdCount = document.getElementById('chdCount');
	let mounusnumber = chdCount.value;
	if(mounusnumber < 1){
		mounusnumber = 0
	}else{
		mounusnumber = parseInt(mounusnumber) - 1;
	}
	chdCount.value = mounusnumber;
}
function chdPlus(){//소아 증가 버튼 이벤트
	const chdCount = document.getElementById('chdCount');
	let plusnumber = chdCount.value;
	if(plusnumber < 9){
		plusnumber = parseInt(plusnumber) + 1;
	}
	else{
		plusnumber = 9;
	}
	chdCount.value = plusnumber
}
function infMinus(){//소아 감소 버튼 이벤트
	var infCount = document.getElementById('infCount');
	let mounusnumber = infCount.value;
	if(mounusnumber < 1){
		mounusnumber = 0
	}else{
		mounusnumber = parseInt(mounusnumber) - 1;
	}
	infCount.value = mounusnumber;
}
function infPlus(){//소아 증가 버튼 이벤트
	const infCount = document.getElementById('infCount');
	let plusnumber = infCount.value;
	if(plusnumber < 9){
		plusnumber = parseInt(plusnumber) + 1;
	}
	else{
		plusnumber = 9;
	}
	infCount.value = plusnumber
}
//이전까진 index와 공통 js

var req
function check(){
	
	var spanDepartureDesc = document.getElementById('spanDepartureDesc').innerHTML//출발지 한국어
	var spanArrivalDesc = document.getElementById('spanArrivalDesc').innerHTML//도착지 한국어
	var hiddenItemCheck = document.getElementById('hiddenItem').value;
	var departureDataCheck = document.getElementById('departureData').value;
	var arrivalDataCheck = document.getElementById('arrivalData').value;
	var hidYearCheck = document.getElementById('hidYear').value;
	var hidMonthCheck = document.getElementById('hidMonth').value;
	var hidDayCheck = document.getElementById('hidDay').value;
	var hidToYearCheck = document.getElementById('hidToYear').value;
	var hidToMonthCheck = document.getElementById('hidToMonth').value;
	var hidToDayCheck = document.getElementById('hidToDay').value;
	var BackYearCheck = document.getElementById('BackYear').value;
	var BackMonthCheck = document.getElementById('BackMonth').value;
	var BackDayCheck = document.getElementById('BackDay').value;
	var adtNumCheck = document.getElementById('adtNum').value;
	var chdNumCheck = document.getElementById('chdNum').value;
	var infNumCheck = document.getElementById('infNum').value;
	var kodeCheck = document.getElementById('kode');
	var koarCheck = document.getElementById('koar');
	var DepartureDate = document.getElementById('DepartureDate').innerHTML;
	console.log(BackYearCheck)
	if(DepartureDate == "출발날짜를 선택해 주세요"){
		alert('날짜를 선택해 주세요.')
	}
	else{
	kodeCheck.value=spanDepartureDesc
	koarCheck.value=spanArrivalDesc
	console.log(BackYearCheck)
	req = new XMLHttpRequest()
	req.onreadystatechange = changeText
	req.open('post',"check")
	
	var reqData = {hiddenItem:hiddenItemCheck,departureData:departureDataCheck,arrivalData:arrivalDataCheck,hidYear:hidYearCheck,hidMonth:hidMonthCheck,hidDay:hidDayCheck,hidToYear:hidToYearCheck,
			hidToMonth:hidToMonthCheck,hidToDay:hidToDayCheck,BackYear:BackYearCheck,BackMonth:BackMonthCheck,BackDay:BackDayCheck,adtNum:adtNumCheck,chdNum:chdNumCheck,infNum:infNumCheck,kode:kodeCheck.value,koar:koarCheck.value}
	reqData = JSON.stringify(reqData)
	req.setRequestHeader('Content-Type',"application/json; charset=UTF-8")
	req.send(reqData)
	}
}
function changeText(){
	if(req.readyState == 4 && req.status == 200){
		if(req.responseText == '여행정보를 정확히 선택해 주세요.'){
			alert(req.responseText)
		}else{
			location.href = req.responseText //url과 파라미터값을 가지고 페이지 이동
		}
	}
	
}


//이후부턴 여기 페이지만의 js
$(function(){ //탑승(비지니스,퍼스트클래스 등)유형 버튼 클릭시 이벤트
	$('.tab-btn.grade-bag').on('click',function(){
		var changeRout = document.getElementById('changeRout')
		if(changeRout.value == "CHR"){
			alert('항공권 정보가 변경되었습니다.항공권을 다시 검색해주세요.')
		}
		else if($(this).hasClass('active') == true){//내가선택한 버튼에 active가 있다면 지워줌
			$(this).removeClass('active')
			$('.booking-sticky.booking-sticky--reservation').css('display','none');
		}
		else{
			$('.tab-btn.grade-bag.active').removeClass('active')//이미 다른 버튼에 active가있다면 다른버튼 active를 지워주고 내가 선택한 버튼에 active만들어줌
			$(this).addClass('active')
			$('.booking-sticky.booking-sticky--reservation').css('display','block');
		}
	})
})



</script>
<%@ include file="../common/include/header.jsp"%>
	
		
		<div id="body">
			
			<!-- Google Tag Manager (noscript) -->
			<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PD2BQQ4" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
			<!-- End Google Tag Manager (noscript) -->
			<!-- 	<form action="datatest" method="post"> -->
				<div class="main-ticketing round open">
					<div class="ticketing-in content-guide">
						<ul class="ticketing-type">
						<c:choose>
							<c:when test="${param.hiddenItem == '왕복'}">
							<li class="item selected" data-triptype="RT"><input type="hidden" class="HidItem" value="왕복"><a href="#" class="item-btn">왕복</a></li> <!-- 왕복 -->
							<li class="item" data-triptype="OW"><input type="hidden" class="HidItem" value="편도"><a href="#" class="item-btn">편도</a></li> <!-- 편도 --> 	
							</c:when>
							<c:otherwise>
							<li class="item" data-triptype="RT"><input type="hidden" class="HidItem" value="왕복"><a href="#" class="item-btn">왕복</a></li> <!-- 왕복 -->
							<li class="item selected" data-triptype="OW"><input type="hidden" class="HidItem" value="편도"><a href="#" class="item-btn">편도</a></li> <!-- 편도 --> 
							</c:otherwise>
						</c:choose>
						</ul>
						<!-- <input type="hidden" id="test1">
						<input type="hidden" id="test2"> -->
						
						<div class="ticketing-row-top single">
							<div class="ticketing-target">
								<button type="button" class="start js-target-pick active" onclick="DepPlace()"><span class="txt" id="spanDepartureDesc">${param.kode}</span></button> <!-- 출발지 -->	
								
								<button type="button" class="target js-target-pick active" onclick="AriPlace()"><span class="txt" id="spanArrivalDesc">${param.koar}</span></button> <!-- 도착지 -->
								
								<button type="button" class="btn-open js-target-pick" data-route="DEP" id="btnExchangeRoute1"><span class="blind">열기</span></button> <!--열기-->
							</div>
							<div class="ticketing-date">
							<c:choose>
								<c:when test="${param.hiddenItem == '편도'}">
									<button type="button" class="btn-date" id="btnDatePicker" onclick="DatePicker()"><span class="txt" id="DepartureDate">${param.hidYear}.${param.hidMonth}.${param.hidDay}</span></button>	
								</c:when>
								<c:otherwise>
									<button type="button" class="btn-date" id="btnDatePicker" onclick="DatePicker()"><span class="txt" id="DepartureDate">${param.hidYear}.${param.hidMonth}.${param.hidDay} ~ ${param.BackYear}.${param.BackMonth}.${param.BackDay}</span></button>
								</c:otherwise>
							</c:choose>													
															
								
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
									<h2 class="customer-layer__title">날짜를 선택해주세요</h2> <!-- 언제 떠나세요? -->	
								</div>								
								<div class="layer-content">
									<div class="picker picker--full"> 
										<div class="info-wrap"><span class="info">1인 편도 운임 기준</span><span class="currency" name="currency">통화 : 원</span></div> <!-- 1인 편도 운임  기준 -->
										<div class="flatpickr-wrapper">
											
										<!-- 출발날짜 선택 -->
										  <div class="sec_cal" id="DepDiv" style="display : none;">
											  <div class="cal_nav">
											    <a href="javascript:;" class="nav-btn go-prev">prev</a>
											    <div class="year-month"></div>
											    <a href="javascript:;" class="nav-btn go-next">next</a>
											  </div>
											  <div class="cal_wrap">
											  	<div class="GoDate">출발날짜 선택</div>
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
										<div class="sec_cal_2" id="BackDiv" style="display : none;">
											  <div class="cal_nav">
											    <a href="javascript:;" class="nav-btn go-prev">prev</a>
											    <div class="year-month"></div>
											    <a href="javascript:;" class="nav-btn go-next">next</a>
											  </div>
											  <div class="cal_wrap">
											  	<div class="BackDate">돌아올 날짜 선택</div>
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
									<div class="booking-button cal-button"  id="DepSetBtn" style="display:none">
										
										<button type="button" class="button button--primary button--active" onclick="DepartureDate()">
											<span class="button__text">선택</span> <!-- 선택 -->
										</button>              
									</div>
									<div class="booking-button cal-button"  id="BackSetBtn" style="display:none">
										
										<button type="button" class="button button--primary button--active" onclick="ComeBackDate()">
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
												<button type="button" class="input__number input__number-minus" onclick='adtMinus()'></button> <!-- 빼기 -->
												<input type="text" id="adtCount" placeholder="숫자입력" value="1" class="input__number"> <!-- 숫자입력 -->
												<button type="button" class="input__number input__number-plus" onclick='adtPlus()'></button> <!-- 더하기 -->
												</div>
												<p class="text__small text--color-gray" id="adtMsg">12세 이상</p> <!-- 12세 이상 -->
											</div>							
											<div class="input-row input-row--number input-row--icon">
												<label for="chdCount" class="input__label">소아</label> <!-- 소아 -->
												<div data-element="form" class="input input--number is-active">
												<button type="button" class="input__number input__number-minus" onclick='chdMinus()'></button> <!-- 빼기 -->
												<input type="text" id="chdCount" placeholder="숫자입력" value="0" class="input__number"> <!-- 숫자입력 -->
												<button type="button" class="input__number input__number-plus" onclick='chdPlus()'></button> <!-- 더하기 -->
												</div>
												<p class="text__small text--color-gray" name="chdMsg">국제선 기준 만 2세~12세 미만<br>(최초 출발일 기준)</p><!-- 국제선 기준<br>만 2세 ~ 만 12세 미만 -->
											</div>						
											<div class="input-row input-row--number input-row--icon">																
												<label for="infCount" class="input__label">유아</label> <!-- 유아 -->
												<div data-element="form" class="input input--number is-active">
												<button type="button" class="input__number input__number-minus" onclick='infMinus()'></button> <!-- 빼기 -->
												<input type="text" id="infCount" placeholder="숫자입력" value="0" class="input__number"> <!-- 숫자입력 -->
												<button type="button" id="btnInfCount" class="input__number input__number-plus" onclick='infPlus()'></button> <!-- 더하기 -->
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
													<button type="button" class="btn-passengers" id="personText" onclick="person()"><span id="perText" class="txt" >성인 : ${param.adtNum} , 소아 : ${param.chdNum} , 유아 : ${param.infNum}</span></button><!-- 성인1 -->
												</div>
											</div>
											<div class="ticketing-row-sub">
												
												<form action="datatest" method="post">			
												<input type="hidden" id="hiddenItem" name="hiddenItem" value="${param.hiddenItem}">	
												<input type="hidden" id="kode" name="kode" value="${param.kode}">	<!-- 출발지 한국어 -->	
												<input type="hidden" id="koar" name="koar" value="${param.koar}">	<!-- 도착지 한국어 -->	
												<input type="hidden" id="departureData" name="departureData" value="${param.departureData}">
												<input type="hidden" id="arrivalData" name="arrivalData" value="${param.arrivalData}">
												<input type="hidden" id="departureDate" name="departureDate" value="${param.departureDate}">
												<input type="hidden" id="arrivalDate" name="arrivalDate" value="${param.arrivalDate}">
												<input type="hidden" id="hidYear" name="hidYear" value="${param.hidYear}">
												<input type="hidden" id="hidMonth" name="hidMonth" value="${param.hidMonth}">
												<input type="hidden" id="hidDay" name="hidDay" value="${param.hidDay}">
												<input type="hidden" id="hidToYear" name="hidToYear" value="${param.hidToYear}">
												<input type="hidden" id="hidToMonth" name="hidToMonth" value="${param.hidToMonth}">
												<input type="hidden" id="hidToDay" name="hidToDay" value="${param.hidToDay}">
												<input type="hidden" id="BackYear" name="BackYear" value="${param.BackYear}">
												<input type="hidden" id="BackMonth" name="BackMonth" value="${param.BackMonth}">
												<input type="hidden" id="BackDay" name="BackDay" value="${param.BackDay}">
												<input type="hidden" id="adtNum" name="adtNum" value="${param.adtNum}">
												<input type="hidden" id="chdNum" name="chdNum" value="${param.chdNum}">
												<input type="hidden" id="infNum" name="infNum" value="${param.infNum}">
												<input type="hidden" id="changeRout" name="changeRout" value=""><!--기존에 선택한 왕복or편도 를 변경했을때 이곳에 값을 넣어서 판별할때 쓰임-->
												<button type="button" id="searchFlight" class="btn-flight-sch-again" onclick="check()">항공권 검색</button> <!-- 항공권  검색 -->
												</form>
												
											</div>
										</div>
									</div>
								</div>
							
				
		</div>
		<!-- </form> -->
		
		<div class="ticket-pare" name="DEP_area">
			<div class="content-guide">
				<div class="filter-row">
					<div class="filter-row-sub">
						<div class="select-wrap type01">
							<select title="정렬방식 선택" class="select-wrap__select" name="selSort"><!-- 정렬방식 선택 -->
								<option value="byDepTime" selected="">출발시간순</option><!-- 출발시간순 -->
								<option value="byPrice">최저가순</option><!-- 최저가순 -->							
							</select>
		                </div>
		            </div>					
				</div>
				<div class="finish-item-wrap" style="display:none;" id="DEP_empty">
					<div class="finish-item">
						<div class="finish-item__img"><img src="/images/icon/icon-result-none.png" alt=""></div>					
						<p class="finish-item__title">조건에 맞는 <br class="mobile-only">항공편이 없습니다.</p><!--조건에 맞는 <br class="mobile-only">항공편이 없습니다. -->
						<p class="finish-item__text">조건을 바꿔서 다시 검색해 주세요.</p><!-- 조건을 바꿔서 다시 검색해 주세요. -->
					</div>
				</div>
				<c:forEach var="index" items="${indexs}">
				<ul class="fare-list">
					<li class="list-item">
						<div class="list-summary">				
							<div class="head">														
								<span class="tk-num">${index.flightNo}</span>
									<div class="chips"><span class="chip lowest">최저가</span></div>
								<ul class="util-menu">
									<li class="util-menu-item">
									<button type="button" aria-label="share" data-element="sns_share" class="util-menu-btn share" onclick="shareMyFavorites(this);"><span class="blind">공유</span></button>
									</li><!-- 공유 -->
									<li class="util-menu-item"><button type="button" onclick="javascript:insertFlightFavorites(this);" class="util-menu-btn wish"><span class="blind">찜하기</span></button></li><!--찜하기-->
										</ul>
							</div>
							<div class="time">									
								<span class="time-num start" data-gmt="202212160210">${index.flightDep}</span>										
								<span class="moving-time">${index.flightTime}</span>							
								<span class="time-num target" data-landingdate="2022-12-16">
								${index.flightAri}</span>									
							</div>
						</div>
						<div class="fare-pare-tab">																										
						<a href="#" class="tab-btn sold-out">
							<div class="tab-btn-in">
								<span class="grade fly">ECONOMY</span>				
								<span class="price">
								<strong class="point">
								<span class="price_txt">125,000</span>
								<span class="unit">원</span>
								</strong>
								</span>
								<span class="remaining-seat">
									매진</span>
							</div>									
						</a>
						<a href="#" class="tab-btn grade-bag">
							<div class="tab-btn-in">																																			
								<span class="grade fly">BUSINESS</span>																							
								<span class="price">
								<strong class="point">
								<span class="price_txt">179,000</span>
								<span class="unit">원</span>
								</strong>															
								</span>																		
								<span class="remaining-seat">
									8석</span>
							</div>
						</a>																																																																												
						<a href="#" class="tab-btn grade-bag">
							<div class="tab-btn-in">
								<span class="grade new-class">FIRST CLASS</span>				
								<span class="price">
								<strong class="point">
								<span class="price_txt">314,000</span>
								<span class="unit">원</span>
								</strong>
								</span>
								<span class="remaining-seat">
									3석</span>
							</div>									
						</a>
						</div>								
						<div class="grade-info fly-bag" style="">								
							<ul class="rules">
								<li class="rules-item">
								<a href="#" class="rules-btn" data-element="modal_anchor" data-target="#fareRuleLayer" data-modal-type="full" data-databind="Y" onclick="javascript:openFareRule(this , 'DEP');">운임 및 수수료 규정</a><!-- 운임 및 수수료 규정 -->									
								</li><!--20210608 버튼명 변경-->								
							</ul>
							<div class="grade-info-sub">
								<ul class="benefit-list"><li class="benefit-list-item"><img src="https://static.jejuair.net/cms/images/fare_service_option/20211012131128759.png" data-src="https://static.jejuair.net/cms/images/fare_service_option/20211012131128759.png">기내수하물 10KG 제공</li><li class="benefit-list-item"><img src="https://static.jejuair.net/cms/images/fare_service_option/20211014165204436.png" data-src="https://static.jejuair.net/cms/images/fare_service_option/20211014165204436.png">위탁수하물 15KG 제공</li><li class="benefit-list-item"><img src="https://static.jejuair.net/hpgg/resources/images/ticketing/icon_point.png">리프레시 포인트 8,950P 적립</li></ul>
								<p class="caution">FLY는 위탁 수하물이 제공되지 않습니다. 맡기실 짐이 더 필요하신가요?</p><!-- FLY는 위탁 수하물이 제공되지 않습니다. 맡기실 짐이 더 필요하신가요? -->
								<a href="#none" class="btn-upgrade" onclick="javascript:upgradeFare(this);">FLYBAG으로 업그레이드 하기</a><!-- FLYBAG으로 업그레이드 하기 -->
							</div>					
						</div>
					</li>
				</ul>
				</c:forEach>
			</div>
			<input type="hidden" name="depLowestFareIdx" id="depLowestFareIdx" value="0">
			<input type="hidden" name="currencyCode" id="currencyCode" value="KRW">
			<input type="hidden" name="currencyCodeaaa" id="currencyCodeaaa" value="KRW">
		</div>
		<div class="booking-sticky booking-sticky--reservation" style="display:none" id="divBottom">
			<div class="reservation-container">
				<div class="booking-sticky__top">
					<div class="toggle-wrap toggle-wrap--button">									
						<div class="label">
							<span>예상 결제금액</span><!-- 예상 결제금액--> 
						</div>									
						<button type="button" class="summary" data-element="toggle__anchor" aria-controls="toggle-4" aria-expanded="false" id="btnTotAmount">
							<span class="price_txt">244,800</span>
							<span class="unit">원</span>
						</button>				
					</div>
					<c:choose>
						<c:when test="${param.hiddenItem == '왕복'}">		
						<button type="button" class="button button--primary pc-only button--active" name="btnAvailSch" onclick="javascript:printAvailSchedule('ARR');">
							<span class="button__text">오는 편 선택하기</span><!--오는 편 선택하기 -->
						</button>	
						</c:when>
						<c:otherwise>
						<button type="button" class="button button--primary pc-only button--active" name="btnAvailSch" onclick="javascript:printAvailSchedule('ARR');">
							<span class="button__text">다음</span><!--오는 편 선택하기 -->
						</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<%@ include file="../common/include/footer.jsp"%>