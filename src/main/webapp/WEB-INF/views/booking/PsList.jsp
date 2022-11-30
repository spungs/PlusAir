<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){//인원수 와 유형에 맞게 버튼 추가하기
	var divTabs = document.getElementById('divTabs')
	var divTabs2 = document.getElementById('divTabs2')
	var count = 1;
	var test = 1;
	var adtnum = ${downDto.adtNum}
	var infnum = ${downDto.infNum}
	var chdnum = ${downDto.chdNum}
	if(adtnum+infnum+chdnum <5){
		$('.button.tab__scroll-right').css('display','none')
	}
	if(${downDto.adtNum}>1){
		for(var i = 2;i <= ${downDto.adtNum};i++){
			count++
			if(test<4){
				test++
				divTabs.innerHTML = divTabs.innerHTML + '<div class="tab__button" data-element="tab__list" role="presentation">'+'<button id="psgrBtn'+(test-1)+'" class="tab__anchor" type="button">'+'<span class="passenger">'+'<span class="type">성인'+count+'</span>'+'<strong class="name">'+'</strong>'+'</span>'+'</button>'+'</div>'	
			}else{
				test++
				divTabs2.innerHTML = divTabs2.innerHTML + '<div class="tab__button" data-element="tab__list" role="presentation">'+'<button id="psgrBtn'+(test-1)+'" class="tab__anchor" type="button">'+'<span class="passenger">'+'<span class="type">성인'+count+'</span>'+'<strong class="name">'+'</strong>'+'</span>'+'</button>'+'</div>'	
			}
			
		}
	}
	count = 1;
	if(${downDto.infNum}>0){
		for(var i = 1;i <= ${downDto.infNum};i++){
			if(test<4){
				test++
				divTabs.innerHTML = divTabs.innerHTML + '<div class="tab__button" data-element="tab__list" role="presentation">'+'<button id="psgrBtn'+(test-1)+'" class="tab__anchor" type="button">'+'<span class="passenger baby">'+'<span class="type">유아'+count+'</span>'+'<strong class="name">'+'</strong>'+'</span>'+'</button>'+'</div>'
			}else{
				test++
				divTabs2.innerHTML = divTabs2.innerHTML + '<div class="tab__button" data-element="tab__list" role="presentation">'+'<button id="psgrBtn'+(test-1)+'" class="tab__anchor" type="button">'+'<span class="passenger baby">'+'<span class="type">유아'+count+'</span>'+'<strong class="name">'+'</strong>'+'</span>'+'</button>'+'</div>'
			}
			count++
		}
	}
	count = 1;
	if(${downDto.chdNum}>0){
		for(var i = 1;i <= ${downDto.chdNum};i++){
			if(test<4){
				test++
				divTabs.innerHTML = divTabs.innerHTML + '<div class="tab__button" data-element="tab__list" role="presentation">'+'<button id="psgrBtn'+(test-1)+'" class="tab__anchor" type="button">'+'<span class="passenger child">'+'<span class="type">소아'+count+'</span>'+'<strong class="name">'+'</strong>'+'</span>'+'</button>'+'</div>'
			}else{
				test++
				divTabs2.innerHTML = divTabs2.innerHTML + '<div class="tab__button" data-element="tab__list" role="presentation">'+'<button id="psgrBtn'+(test-1)+'" class="tab__anchor" type="button">'+'<span class="passenger child">'+'<span class="type">소아'+count+'</span>'+'<strong class="name">'+'</strong>'+'</span>'+'</button>'+'</div>'
			}
			count++
		}
	}
});
$(function(){//인원 버튼 클릭시 이벤트
	$('.tab__anchor').click(function(){
		$('.tab__anchor.is-active').removeClass('is-active')
		$(this).addClass('is-active')
		
	})
})
$(function(){//오른쪽 화살표 보튼 클릭 이벤트
	$('button.tab__scroll-right').click(function(){
		$('.tab__buttons').eq('0').css('display','none')
		$('.tab__buttons').eq('1').css('display','block')
	})
})
$(function(){//왼쪽 화살표 버튼 클릭 이벤트
	$('button.tab__scroll-left').click(function(){
		$('.tab__buttons').eq('0').css('display','block')
		$('.tab__buttons').eq('1').css('display','none')
	})
})
$(function(){
	$('#psgrBtn0').click(function(){
		var psgrContainer0 = document.getElementById('psgrContainer0')
		var psgrContainer1 = document.getElementById('psgrContainer1')
		var psgrContainer2 = document.getElementById('psgrContainer2')
		var psgrContainer3 = document.getElementById('psgrContainer3')
		var psgrContainer4 = document.getElementById('psgrContainer4')
		var psgrContainer5 = document.getElementById('psgrContainer5')
		var psgrContainer6 = document.getElementById('psgrContainer6')
		var psgrContainer7 = document.getElementById('psgrContainer7')
		psgrContainer0.style.display='block'
		psgrContainer1.style.display='none'
		psgrContainer2.style.display='none'
		psgrContainer3.style.display='none'
		psgrContainer4.style.display='none'
		psgrContainer5.style.display='none'
		psgrContainer6.style.display='none'
		psgrContainer7.style.display='none'
	})
})
$(function(){
	$('#psgrBtn1').click(function(){
		var psgrContainer0 = document.getElementById('psgrContainer0')
		var psgrContainer1 = document.getElementById('psgrContainer1')
		var psgrContainer2 = document.getElementById('psgrContainer2')
		var psgrContainer3 = document.getElementById('psgrContainer3')
		var psgrContainer4 = document.getElementById('psgrContainer4')
		var psgrContainer5 = document.getElementById('psgrContainer5')
		var psgrContainer6 = document.getElementById('psgrContainer6')
		var psgrContainer7 = document.getElementById('psgrContainer7')
		psgrContainer0.style.display='none'
		psgrContainer1.style.display='block'
		psgrContainer2.style.display='none'
		psgrContainer3.style.display='none'
		psgrContainer4.style.display='none'
		psgrContainer5.style.display='none'
		psgrContainer6.style.display='none'
		psgrContainer7.style.display='none'
	})
})
$(function(){
	$('#psgrBtn2').click(function(){
		var psgrContainer0 = document.getElementById('psgrContainer0')
		var psgrContainer1 = document.getElementById('psgrContainer1')
		var psgrContainer2 = document.getElementById('psgrContainer2')
		var psgrContainer3 = document.getElementById('psgrContainer3')
		var psgrContainer4 = document.getElementById('psgrContainer4')
		var psgrContainer5 = document.getElementById('psgrContainer5')
		var psgrContainer6 = document.getElementById('psgrContainer6')
		var psgrContainer7 = document.getElementById('psgrContainer7')
		psgrContainer0.style.display='none'
		psgrContainer1.style.display='none'
		psgrContainer2.style.display='block'
		psgrContainer3.style.display='none'
		psgrContainer4.style.display='none'
		psgrContainer5.style.display='none'
		psgrContainer6.style.display='none'
		psgrContainer7.style.display='none'
	})
})
$(function(){
	$('#psgrBtn3').click(function(){
		var psgrContainer0 = document.getElementById('psgrContainer0')
		var psgrContainer1 = document.getElementById('psgrContainer1')
		var psgrContainer2 = document.getElementById('psgrContainer2')
		var psgrContainer3 = document.getElementById('psgrContainer3')
		var psgrContainer4 = document.getElementById('psgrContainer4')
		var psgrContainer5 = document.getElementById('psgrContainer5')
		var psgrContainer6 = document.getElementById('psgrContainer6')
		var psgrContainer7 = document.getElementById('psgrContainer7')
		psgrContainer0.style.display='none'
		psgrContainer1.style.display='none'
		psgrContainer2.style.display='none'
		psgrContainer3.style.display='block'
		psgrContainer4.style.display='none'
		psgrContainer5.style.display='none'
		psgrContainer6.style.display='none'
		psgrContainer7.style.display='none'
	})
})
$(function(){
	$('#psgrBtn4').click(function(){
		var psgrContainer0 = document.getElementById('psgrContainer0')
		var psgrContainer1 = document.getElementById('psgrContainer1')
		var psgrContainer2 = document.getElementById('psgrContainer2')
		var psgrContainer3 = document.getElementById('psgrContainer3')
		var psgrContainer4 = document.getElementById('psgrContainer4')
		var psgrContainer5 = document.getElementById('psgrContainer5')
		var psgrContainer6 = document.getElementById('psgrContainer6')
		var psgrContainer7 = document.getElementById('psgrContainer7')
		psgrContainer0.style.display='none'
		psgrContainer1.style.display='none'
		psgrContainer2.style.display='none'
		psgrContainer3.style.display='none'
		psgrContainer4.style.display='block'
		psgrContainer5.style.display='none'
		psgrContainer6.style.display='none'
		psgrContainer7.style.display='none'
	})
})
$(function(){
	$('#psgrBtn5').click(function(){
		var psgrContainer0 = document.getElementById('psgrContainer0')
		var psgrContainer1 = document.getElementById('psgrContainer1')
		var psgrContainer2 = document.getElementById('psgrContainer2')
		var psgrContainer3 = document.getElementById('psgrContainer3')
		var psgrContainer4 = document.getElementById('psgrContainer4')
		var psgrContainer5 = document.getElementById('psgrContainer5')
		var psgrContainer6 = document.getElementById('psgrContainer6')
		var psgrContainer7 = document.getElementById('psgrContainer7')
		psgrContainer0.style.display='none'
		psgrContainer1.style.display='none'
		psgrContainer2.style.display='none'
		psgrContainer3.style.display='none'
		psgrContainer4.style.display='none'
		psgrContainer5.style.display='block'
		psgrContainer6.style.display='none'
		psgrContainer7.style.display='none'
	})
})
$(function(){
	$('#psgrBtn6').click(function(){
		var psgrContainer0 = document.getElementById('psgrContainer0')
		var psgrContainer1 = document.getElementById('psgrContainer1')
		var psgrContainer2 = document.getElementById('psgrContainer2')
		var psgrContainer3 = document.getElementById('psgrContainer3')
		var psgrContainer4 = document.getElementById('psgrContainer4')
		var psgrContainer5 = document.getElementById('psgrContainer5')
		var psgrContainer6 = document.getElementById('psgrContainer6')
		var psgrContainer7 = document.getElementById('psgrContainer7')
		psgrContainer0.style.display='none'
		psgrContainer1.style.display='none'
		psgrContainer2.style.display='none'
		psgrContainer3.style.display='none'
		psgrContainer4.style.display='none'
		psgrContainer5.style.display='none'
		psgrContainer6.style.display='block'
		psgrContainer7.style.display='none'
	})
})
$(function(){
	$('#psgrBtn7').click(function(){
		var psgrContainer0 = document.getElementById('psgrContainer0')
		var psgrContainer1 = document.getElementById('psgrContainer1')
		var psgrContainer2 = document.getElementById('psgrContainer2')
		var psgrContainer3 = document.getElementById('psgrContainer3')
		var psgrContainer4 = document.getElementById('psgrContainer4')
		var psgrContainer5 = document.getElementById('psgrContainer5')
		var psgrContainer6 = document.getElementById('psgrContainer6')
		var psgrContainer7 = document.getElementById('psgrContainer7')
		psgrContainer0.style.display='none'
		psgrContainer1.style.display='none'
		psgrContainer2.style.display='none'
		psgrContainer3.style.display='none'
		psgrContainer4.style.display='none'
		psgrContainer5.style.display='none'
		psgrContainer6.style.display='none'
		psgrContainer7.style.display='block'
	})
})
function submit(){
	
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post");  //Post 방식
	form.setAttribute("action", "PayPage"); //요청 보낼 주소
	
	var selMonth0 = document.getElementById('selMonth0')//생일 월 select
	var selDate0 = document.getElementById('selDate0')//생일 일 select
	var selMonth1 = document.getElementById('selMonth1')
	var selDate1 = document.getElementById('selDate1')
	var selMonth2 = document.getElementById('selMonth2')
	var selDate2 = document.getElementById('selDate2')
	var selMonth3 = document.getElementById('selMonth3')
	var selDate3 = document.getElementById('selDate3')
	var selMonth4 = document.getElementById('selMonth4')
	var selDate4 = document.getElementById('selDate4')
	var selMonth5 = document.getElementById('selMonth5')
	var selDate5 = document.getElementById('selDate5')
	var selMonth6 = document.getElementById('selMonth6')
	var selDate6 = document.getElementById('selDate6')
	var selMonth7 = document.getElementById('selMonth7')
	var selDate7 = document.getElementById('selDate7')
//---------------------------------------------------------------------------------여기부터 value값
	var txtLastName0 = document.getElementById('txtLastName0')//성
	var txtFirstName0 = document.getElementById('txtFirstName0')//이름
	var txtYear0 = document.getElementById('txtYear0')//생일 년도
	var SMonth0 = (selMonth0.options[selMonth0.selectedIndex].value);//생일 월값
	var SDate0 = (selDate0.options[selDate0.selectedIndex].value);//생일 월값
	var gender0 = $("input[type=radio][name=rdoGender0]:checked").val();//성별 값
	
	var txtLastName1 = document.getElementById('txtLastName1')
	var txtFirstName1 = document.getElementById('txtFirstName1')
	var txtYear1 = document.getElementById('txtYear1')
	var SMonth1 = (selMonth1.options[selMonth1.selectedIndex].value);
	var SDate1 = (selDate1.options[selDate1.selectedIndex].value);
	var gender1 = $("input[type=radio][name=rdoGender1]:checked").val();
	
	var txtLastName2 = document.getElementById('txtLastName2')
	var txtFirstName2 = document.getElementById('txtFirstName2')
	var txtYear2 = document.getElementById('txtYear2')
	var SMonth2 = (selMonth2.options[selMonth2.selectedIndex].value);
	var SDate2 = (selDate2.options[selDate2.selectedIndex].value);
	var gender2 = $("input[type=radio][name=rdoGender2]:checked").val();
	
	var txtLastName3 = document.getElementById('txtLastName3')
	var txtFirstName3 = document.getElementById('txtFirstName3')
	var txtYear3 = document.getElementById('txtYear3')
	var SMonth3 = (selMonth3.options[selMonth3.selectedIndex].value);
	var SDate3 = (selDate3.options[selDate3.selectedIndex].value);
	var gender3 = $("input[type=radio][name=rdoGender3]:checked").val();
	
	var txtLastName4 = document.getElementById('txtLastName4')
	var txtFirstName4 = document.getElementById('txtFirstName4')
	var txtYear4 = document.getElementById('txtYear4')
	var SMonth4 = (selMonth4.options[selMonth4.selectedIndex].value);
	var SDate4 = (selDate4.options[selDate4.selectedIndex].value);
	var gender4 = $("input[type=radio][name=rdoGender4]:checked").val();
	
	var txtLastName5 = document.getElementById('txtLastName5')
	var txtFirstName5 = document.getElementById('txtFirstName5')
	var txtYear5 = document.getElementById('txtYear5')
	var SMonth5 = (selMonth5.options[selMonth5.selectedIndex].value);
	var SDate5 = (selDate5.options[selDate5.selectedIndex].value);
	var gender5 = $("input[type=radio][name=rdoGender5]:checked").val();
	
	var txtLastName6 = document.getElementById('txtLastName6')
	var txtFirstName6 = document.getElementById('txtFirstName6')
	var txtYear6 = document.getElementById('txtYear6')
	var SMonth6 = (selMonth6.options[selMonth6.selectedIndex].value);
	var SDate6 = (selDate6.options[selDate6.selectedIndex].value);
	var gender6 = $("input[type=radio][name=rdoGender6]:checked").val();
	
	var txtLastName7 = document.getElementById('txtLastName7')
	var txtFirstName7 = document.getElementById('txtFirstName7')
	var txtYear7 = document.getElementById('txtYear7')
	var SMonth7 = (selMonth7.options[selMonth7.selectedIndex].value);
	var SDate7 = (selDate7.options[selDate7.selectedIndex].value);
	var gender7 = $("input[type=radio][name=rdoGender7]:checked").val();
	
	
	var txtContactPhone = document.getElementById('txtContactPhone')//대표 연락처
	var txtContactEmail = document.getElementById('txtContactEmail')//대표 이메일
	
	//------------------------------------------------첫번째 탑승자 정보
	
	var hiddenField = document.createElement("input"); // input 엘리멘트 생성 
	hiddenField.setAttribute("type","hidden"); // type 속성을 hidden으로 설정
	hiddenField.setAttribute("name","psg0fname"); // name 속성을 'm_nickname'으로 설정 
	hiddenField.setAttribute("value",txtLastName0.value); // value 속성을 neilong에 담겨있는 값으로 설정 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg0name"); 
	hiddenField.setAttribute("value",txtFirstName0.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg0gender"); 
	hiddenField.setAttribute("value",gender0); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg0year"); 
	hiddenField.setAttribute("value",txtYear0.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg0month"); 
	hiddenField.setAttribute("value",SMonth0); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg0day"); 
	hiddenField.setAttribute("value",SDate0); 
	form.appendChild(hiddenField);
	
	//---------------------------------------------------------다음 탑승자
	hiddenField = document.createElement("input"); 
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg1fname"); 
	hiddenField.setAttribute("value",txtLastName1.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg1name"); 
	hiddenField.setAttribute("value",txtFirstName1.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg1gender"); 
	hiddenField.setAttribute("value",gender1); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg1year"); 
	hiddenField.setAttribute("value",txtYear1.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg1month"); 
	hiddenField.setAttribute("value",SMonth1); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg1day"); 
	hiddenField.setAttribute("value",SDate1); 
	form.appendChild(hiddenField);
	//---------------------------------------------------------다음 탑승자
	hiddenField = document.createElement("input"); 
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg2fname"); 
	hiddenField.setAttribute("value",txtLastName2.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg2name"); 
	hiddenField.setAttribute("value",txtFirstName2.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg2gender"); 
	hiddenField.setAttribute("value",gender2); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg2year"); 
	hiddenField.setAttribute("value",txtYear2.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg2month"); 
	hiddenField.setAttribute("value",SMonth2); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg2day"); 
	hiddenField.setAttribute("value",SDate2); 
	form.appendChild(hiddenField);
	//---------------------------------------------------------다음 탑승자
	hiddenField = document.createElement("input"); 
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg3fname"); 
	hiddenField.setAttribute("value",txtLastName3.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg3name"); 
	hiddenField.setAttribute("value",txtFirstName3.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg3gender"); 
	hiddenField.setAttribute("value",gender3); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg3year"); 
	hiddenField.setAttribute("value",txtYear3.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg3month"); 
	hiddenField.setAttribute("value",SMonth3); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg3day"); 
	hiddenField.setAttribute("value",SDate3); 
	form.appendChild(hiddenField);
	//---------------------------------------------------------다음 탑승자
	hiddenField = document.createElement("input"); 
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg4fname"); 
	hiddenField.setAttribute("value",txtLastName4.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg4name"); 
	hiddenField.setAttribute("value",txtFirstName4.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg4gender"); 
	hiddenField.setAttribute("value",gender4); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg4year"); 
	hiddenField.setAttribute("value",txtYear4.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg4month"); 
	hiddenField.setAttribute("value",SMonth4); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg4day"); 
	hiddenField.setAttribute("value",SDate4); 
	form.appendChild(hiddenField);
	//---------------------------------------------------------다음 탑승자
	hiddenField = document.createElement("input"); 
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg5fname"); 
	hiddenField.setAttribute("value",txtLastName5.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg5name"); 
	hiddenField.setAttribute("value",txtFirstName5.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg5gender"); 
	hiddenField.setAttribute("value",gender5); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg5year"); 
	hiddenField.setAttribute("value",txtYear5.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg5month"); 
	hiddenField.setAttribute("value",SMonth5); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg5day"); 
	hiddenField.setAttribute("value",SDate5); 
	form.appendChild(hiddenField);
	//---------------------------------------------------------다음 탑승자
	hiddenField = document.createElement("input"); 
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg6fname"); 
	hiddenField.setAttribute("value",txtLastName6.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg6name"); 
	hiddenField.setAttribute("value",txtFirstName6.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg6gender"); 
	hiddenField.setAttribute("value",gender6); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg6year"); 
	hiddenField.setAttribute("value",txtYear6.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg6month"); 
	hiddenField.setAttribute("value",SMonth6); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg6day"); 
	hiddenField.setAttribute("value",SDate6); 
	form.appendChild(hiddenField);
	//---------------------------------------------------------다음 탑승자
	hiddenField = document.createElement("input"); 
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg7fname"); 
	hiddenField.setAttribute("value",txtLastName7.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg7name"); 
	hiddenField.setAttribute("value",txtFirstName7.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg7gender"); 
	hiddenField.setAttribute("value",gender7); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg7year"); 
	hiddenField.setAttribute("value",txtYear7.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg7month"); 
	hiddenField.setAttribute("value",SMonth7); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg7day"); 
	hiddenField.setAttribute("value",SDate7); 
	form.appendChild(hiddenField);
	
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg0phon"); 
	hiddenField.setAttribute("value",txtContactPhone.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type","hidden");
	hiddenField.setAttribute("name","psg0email"); 
	hiddenField.setAttribute("value",txtContactEmail.value); 
	form.appendChild(hiddenField);
	
	hiddenField = document.getElementById('flightNo')
	form.appendChild(hiddenField);
	hiddenField = document.getElementById('departTime')
	form.appendChild(hiddenField);
	hiddenField = document.getElementById('arrivalTime')
	form.appendChild(hiddenField);
	hiddenField = document.getElementById('flightTime')
	form.appendChild(hiddenField);
	hiddenField = document.getElementById('totalprice')
	form.appendChild(hiddenField);
	hiddenField = document.getElementById('hiddenItem')
	form.appendChild(hiddenField);
	hiddenField = document.getElementById('kode')
	form.appendChild(hiddenField);
	hiddenField = document.getElementById('koar')
	form.appendChild(hiddenField);
	hiddenField = document.getElementById('departureData')
	form.appendChild(hiddenField);
	hiddenField = document.getElementById('arrivalData')
	form.appendChild(hiddenField);
	hiddenField = document.getElementById('hidYear')
	form.appendChild(hiddenField);
	hiddenField = document.getElementById('hidMonth')
	form.appendChild(hiddenField);
	hiddenField = document.getElementById('hidDay')
	form.appendChild(hiddenField);
	hiddenField = document.getElementById('hidToYear')
	form.appendChild(hiddenField);
	hiddenField = document.getElementById('hidToMonth')
	form.appendChild(hiddenField);
	hiddenField = document.getElementById('hidToDay')
	form.appendChild(hiddenField);
	hiddenField = document.getElementById('flightRouteNo')
	form.appendChild(hiddenField);
	if(${downDto.hiddenItem == '왕복'}){
		hiddenField = document.getElementById('BackYear')
		form.appendChild(hiddenField);
		hiddenField = document.getElementById('BackMonth')
		form.appendChild(hiddenField);
		hiddenField = document.getElementById('BackDay')
		form.appendChild(hiddenField);
		hiddenField = document.getElementById('BackflightNo')
		form.appendChild(hiddenField);
		hiddenField = document.getElementById('backdepartTime')
		form.appendChild(hiddenField);
		hiddenField = document.getElementById('backarrivalTime')
		form.appendChild(hiddenField);
		hiddenField = document.getElementById('backflightTime')
		form.appendChild(hiddenField);
		hiddenField = document.getElementById('backflightRouteNo')
		form.appendChild(hiddenField);
	}
	hiddenField = document.getElementById('adtNum')
	form.appendChild(hiddenField);
	hiddenField = document.getElementById('chdNum')
	form.appendChild(hiddenField);
	hiddenField = document.getElementById('infNum')
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	form.submit();
}
function handleOnInput(e)  {
	  e.value = e.value.replace(/[^A-Za-z]/ig, '')
	}
</script>
<%@ include file="../common/include/header.jsp"%>
	<div id="body">
			
			
			<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PD2BQQ4" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
			
			
			<div class="wrap wrap--booking NA_1_51 step-ui">
				<div class="content" id="content">
					<main id="main" class="main ">
					<div class="page-title-wrap">
						<br>
						<br>
						<div id="divSubTitle" class="page-sub-title">여권 정보와 동일하게 <br class="mobile-only">입력해 주세요.</div>
					</div>
		
		<div class="section-wrap">
			<div id="divPsgr" class="tab tab--scroll tab--icon tab--icon-large tab__scroll" data-element="tab" data-options="{&quot;tabType&quot;: &quot;scroll&quot;}">
				<div class="sticky-wrap" style="padding-top: 169px;">
					<div class="sticky__inner is-sticky" data-sticky="" style="margin-top: 102px;">
						<div class="tab__inner">
							<button class="button tab__scroll-left" data-tab-direction="prev" style="display: block;">
								<span class="hidden">왼쪽 탭으로 이동</span>
							</button>
							<button class="button tab__scroll-right" data-tab-direction="next" style="display: block;">
								<span class="hidden">오른쪽 탭으로 이동</span>
							</button>
							<div class="tab__scroll-wrap tab__scroll-wrap--full" data-element="tab__scroll-wrap">
								<div id="divTabs" class="tab__buttons" data-element="tab__scroll" style="width: 749px;">
									<div id="psgrTab0" class="tab__button" data-element="tab__list" role="presentation">
										<button id="psgrBtn0" class="tab__anchor is-active" type="button">
											<span class="passenger">
											<span class="type">성인1</span>
											<strong id="tabName0" class="name">
											</strong>
											</span>
										</button>
									</div>
								</div>
								<div id="divTabs2" class="tab__buttons" data-element="tab__scroll" style="width: 749px;display:none">
									<div class="tab__button" data-element="tab__list" role="presentation">
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<c:choose>
					<c:when test="${sessionScope.memberNo eq null}">
						<div id="psgrContainer0" class="tab__panel is-active" style="display:block">
							<div class="passenger-info-box">
		                    	<div class="passenger-info">탑승객 정보</div>
							</div>
			       			<div class="sub-section">
								<div class="input-wrap input--line pc-col pc-col-2">
									<div id="divName0" class="input-row pc-row-100">
										<div id="txtLastName0_div" class="input-item">
											<div class="input-box">
												<label for="txtLastName0" class="input__label" style="top:0px">
													성 (영문)
													<span title="required" class="input__label-asterisk">*</span>
												</label>
												<div data-element="form" class="input">
													<input type="text" id="txtLastName0" name="txtLastName" class="input__text input_required" style="text-transform :uppercase;" oninput="handleOnInput(this)">
													<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
												</div>
											</div>
											<p tabindex="0" class="input__error">성을 입력해 주세요.</p>
										</div>
										<div id="txtFirstName0_div" class="input-item">
											<div class="input-box">
												<label for="txtFirstName0" class="input__label" style="top:0px">
													이름 (영문)<span title="required" class="input__label-asterisk">*</span>
												</label>
												<div data-element="form" class="input">
													<input type="text" data-element="input" id="txtFirstName0" name="txtFirstName" class="input__text input_required" style="text-transform :uppercase;" oninput="handleOnInput(this)">
													<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
												</div>
											</div>
											<p tabindex="0" class="input__error">이름을 입력해 주세요.</p>
										</div>
									</div>
									<div class="input-row pc-mgl-0 boarding__gender">
										<div class="radio-wrapper">
											<p class="radio__text">성별<span title="required" class="input__label-asterisk">*</span></p>
											<div class="radio-wrap">
												<span class="radio">
													<input type="radio" id="rdoGenderM0" name="rdoGender0" value="1" class="radio__input" checked="">
													<label for="rdoGenderM0" class="radio__label"> <i aria-hidden="true" class="radio__ico"></i> <span>남자</span>
													</label>
												</span>
												<span class="radio">
													<input type="radio" id="rdoGenderW0" name="rdoGender0" value="2" class="radio__input">
													<label for="rdoGenderW0" class="radio__label"> <i aria-hidden="true" class="radio__ico"></i> <span>여자</span>
													</label>
												</span>
											</div>
										</div>
									</div>
					           		<div id="divBirth0" class="input-row input-row--label boarding__column">
						            	<div id="birth0_div" class="boarding__birth">
											<div class="input-label label-top">생년월일<span title="required" class="input__label-asterisk">*</span></div>
											<div class="input-item" data-element="form">
												<div class="input-flex">
													<div class="input-box label-active">
														<div class="input" data-element="form">
															<input type="text" class="input__text input__text--placeholder input_required" id="txtYear0" name="txtYear" maxlength="4" data-element="input" title="연도 입력" placeholder="년"><button type="button" data-element="remove" class="input__remove-button">삭제</button>
														</div>
													</div>
													<div class="input-box">
														<div class="select-wrap select-wrap--line">
															<select class="select-wrap__select input_required selected" id="selMonth0" name="selMonth" title="월 선택"><option value="">월</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
														</div>
													</div>
													<div class="input-box">
														<div class="select-wrap select-wrap--line">
															<select class="select-wrap__select input_required selected" id="selDate0" name="selDate" title="일 선택"><option value="">일</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select>
														</div>
													</div>
												</div>
												<p tabindex="0" class="input__error">생년월일을 정확히 입력해 주세요.</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div id="psgrContainer0" class="tab__panel is-active" style="display:block">
							<div class="passenger-info-box">
		                    	<div class="passenger-info">탑승객 정보</div>
							</div>
			       			<div class="sub-section">
								<div class="input-wrap input--line pc-col pc-col-2">
									<div id="divName0" class="input-row pc-row-100">
										<div id="txtLastName0_div" class="input-item">
											<div class="input-box">
												<label for="txtLastName0" class="input__label" style="top:0px">
													성 (영문)
													<span title="required" class="input__label-asterisk">*</span>
												</label>
												<div data-element="form" class="input">
													<input type="text" id="txtLastName0" name="txtLastName" class="input__text input_required" value="${sessionScope.engFirstName}" style="text-transform :uppercase;" oninput="handleOnInput(this)">
													<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
												</div>
											</div>
											<p tabindex="0" class="input__error">성을 입력해 주세요.</p>
										</div>
										<div id="txtFirstName0_div" class="input-item">
											<div class="input-box">
												<label for="txtFirstName0" class="input__label" style="top:0px">
													이름 (영문)<span title="required" class="input__label-asterisk">*</span>
												</label>
												<div data-element="form" class="input">
													<input type="text" data-element="input" id="txtFirstName0" name="txtFirstName" class="input__text input_required" value="${sessionScope.engLastName}" style="text-transform :uppercase;" oninput="handleOnInput(this)">
													<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
												</div>
											</div>
											<p tabindex="0" class="input__error">이름을 입력해 주세요.</p>
										</div>
									</div>
									<div class="input-row pc-mgl-0 boarding__gender">
										<div class="radio-wrapper">
											<p class="radio__text">성별<span title="required" class="input__label-asterisk">*</span></p>
											<div class="radio-wrap">
												<span class="radio">
													<input type="radio" id="rdoGenderM0" name="rdoGender0" value="1" class="radio__input" checked="">
													<label for="rdoGenderM0" class="radio__label"> <i aria-hidden="true" class="radio__ico"></i> <span>남자</span>
													</label>
												</span>
												<span class="radio">
													<input type="radio" id="rdoGenderW0" name="rdoGender0" value="2" class="radio__input">
													<label for="rdoGenderW0" class="radio__label"> <i aria-hidden="true" class="radio__ico"></i> <span>여자</span>
													</label>
												</span>
											</div>
										</div>
									</div>
					           		<div id="divBirth0" class="input-row input-row--label boarding__column">
						            	<div id="birth0_div" class="boarding__birth">
											<div class="input-label label-top">생년월일<span title="required" class="input__label-asterisk">*</span></div>
											<div class="input-item" data-element="form">
												<div class="input-flex">
													<div class="input-box label-active">
														<div class="input" data-element="form">
															<input type="text" class="input__text input__text--placeholder input_required" id="txtYear0" name="txtYear" maxlength="4" data-element="input" title="연도 입력" placeholder="년"><button type="button" data-element="remove" class="input__remove-button">삭제</button>
														</div>
													</div>
													<div class="input-box">
														<div class="select-wrap select-wrap--line">
															<select class="select-wrap__select input_required selected" id="selMonth0" name="selMonth" title="월 선택"><option value="">월</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
														</div>
													</div>
													<div class="input-box">
														<div class="select-wrap select-wrap--line">
															<select class="select-wrap__select input_required selected" id="selDate0" name="selDate" title="일 선택"><option value="">일</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select>
														</div>
													</div>
												</div>
												<p tabindex="0" class="input__error">생년월일을 정확히 입력해 주세요.</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
				
				<div id="psgrContainer1" class="tab__panel is-active" style="display:none">
					<div class="passenger-info-box">
                    	<div class="passenger-info">탑승객 정보</div>
					</div>
	       			<div class="sub-section">
						<div class="input-wrap input--line pc-col pc-col-2">
							<div id="divName0" class="input-row pc-row-100">
								<div id="txtLastName0_div" class="input-item">
									<div class="input-box">
										<label for="txtLastName0" class="input__label" style="top:0px">
											성 (영문)
											<span title="required" class="input__label-asterisk">*</span>
										</label>
										<div data-element="form" class="input">
											<input type="text" data-element="input" id="txtLastName1" name="txtLastName" class="input__text input_required" style="text-transform :uppercase;" oninput="handleOnInput(this)">
											<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
										</div>
									</div>
									<p tabindex="0" class="input__error">성을 입력해 주세요.</p>
								</div>
								<div id="txtFirstName0_div" class="input-item">
									<div class="input-box">
										<label for="txtFirstName0" class="input__label" style="top:0px">
											이름 (영문)<span title="required" class="input__label-asterisk">*</span>
										</label>
										<div data-element="form" class="input">
											<input type="text" data-element="input" id="txtFirstName1" name="txtFirstName" class="input__text input_required" style="text-transform :uppercase;" oninput="handleOnInput(this)">
											<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
										</div>
									</div>
									<p tabindex="0" class="input__error">이름을 입력해 주세요.</p>
								</div>
							</div>
							<div class="input-row pc-mgl-0 boarding__gender">
								<div class="radio-wrapper">
									<p class="radio__text">성별<span title="required" class="input__label-asterisk">*</span></p>
									<div class="radio-wrap">
										<span class="radio">
											<input type="radio" id="rdoGenderM1" name="rdoGender1" value="1" class="radio__input" checked="">
											<label for="rdoGenderM1" class="radio__label"> <i aria-hidden="true" class="radio__ico"></i> <span>남자</span>
											</label>
										</span>
										<span class="radio">
											<input type="radio" id="rdoGenderW1" name="rdoGender1" value="2" class="radio__input">
											<label for="rdoGenderW1" class="radio__label"> <i aria-hidden="true" class="radio__ico"></i> <span>여자</span>
											</label>
										</span>
									</div>
								</div>
							</div>
			           		<div id="divBirth0" class="input-row input-row--label boarding__column">
				            	<div id="birth0_div" class="boarding__birth">
									<div class="input-label label-top">생년월일<span title="required" class="input__label-asterisk">*</span></div>
									<div class="input-item" data-element="form">
										<div class="input-flex">
											<div class="input-box label-active">
												<div class="input" data-element="form">
													<input type="text" class="input__text input__text--placeholder input_required" id="txtYear1" name="txtYear" maxlength="4" data-element="input" title="연도 입력" placeholder="년"><button type="button" data-element="remove" class="input__remove-button">삭제</button>
												</div>
											</div>
											<div class="input-box">
												<div class="select-wrap select-wrap--line">
													<select class="select-wrap__select input_required selected" id="selMonth1" name="selMonth" title="월 선택"><option value="">월</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
												</div>
											</div>
											<div class="input-box">
												<div class="select-wrap select-wrap--line">
													<select class="select-wrap__select input_required selected" id="selDate1" name="selDate" title="일 선택"><option value="">일</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select>
												</div>
											</div>
										</div>
										<p tabindex="0" class="input__error">생년월일을 정확히 입력해 주세요.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="psgrContainer2" class="tab__panel" style="display:none">
					<div class="passenger-info-box">
                    	<div class="passenger-info">탑승객 정보</div>
					</div>
	       			<div class="sub-section">
						<div class="input-wrap input--line pc-col pc-col-2">
							<div id="divName0" class="input-row pc-row-100">
								<div id="txtLastName0_div" class="input-item">
									<div class="input-box">
										<label for="txtLastName0" class="input__label" style="top:0px">
											성 (영문)
											<span title="required" class="input__label-asterisk">*</span>
										</label>
										<div data-element="form" class="input">
											<input type="text" data-element="input" id="txtLastName2" name="txtLastName" class="input__text input_required" style="text-transform :uppercase;" oninput="handleOnInput(this)">
											<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
										</div>
									</div>
									<p tabindex="0" class="input__error">성을 입력해 주세요.</p>
								</div>
								<div id="txtFirstName0_div" class="input-item">
									<div class="input-box">
										<label for="txtFirstName0" class="input__label" style="top:0px">
											이름 (영문)<span title="required" class="input__label-asterisk">*</span>
										</label>
										<div data-element="form" class="input">
											<input type="text" data-element="input" id="txtFirstName2" name="txtFirstName" class="input__text input_required" style="text-transform :uppercase;" oninput="handleOnInput(this)">
											<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
										</div>
									</div>
									<p tabindex="0" class="input__error">이름을 입력해 주세요.</p>
								</div>
							</div>
							<div class="input-row pc-mgl-0 boarding__gender">
								<div class="radio-wrapper">
									<p class="radio__text">성별<span title="required" class="input__label-asterisk">*</span></p>
									<div class="radio-wrap">
										<span class="radio">
											<input type="radio" id="rdoGenderM2" name="rdoGender2" value="1" class="radio__input" checked="">
											<label for="rdoGenderM2" class="radio__label"> <i aria-hidden="true" class="radio__ico"></i> <span>남자</span>
											</label>
										</span>
										<span class="radio">
											<input type="radio" id="rdoGenderW2" name="rdoGender2" value="2" class="radio__input">
											<label for="rdoGenderW2" class="radio__label"> <i aria-hidden="true" class="radio__ico"></i> <span>여자</span>
											</label>
										</span>
									</div>
								</div>
							</div>
			           		<div id="divBirth0" class="input-row input-row--label boarding__column">
				            	<div id="birth0_div" class="boarding__birth">
									<div class="input-label label-top">생년월일<span title="required" class="input__label-asterisk">*</span></div>
									<div class="input-item" data-element="form">
										<div class="input-flex">
											<div class="input-box label-active">
												<div class="input" data-element="form">
													<input type="text" class="input__text input__text--placeholder input_required" id="txtYear2" name="txtYear" maxlength="4" data-element="input" title="연도 입력" placeholder="년"><button type="button" data-element="remove" class="input__remove-button">삭제</button>
												</div>
											</div>
											<div class="input-box">
												<div class="select-wrap select-wrap--line">
													<select class="select-wrap__select input_required selected" id="selMonth2" name="selMonth" title="월 선택"><option value="">월</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
												</div>
											</div>
											<div class="input-box">
												<div class="select-wrap select-wrap--line">
													<select class="select-wrap__select input_required selected" id="selDate2" name="selDate" title="일 선택"><option value="">일</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select>
												</div>
											</div>
										</div>
										<p tabindex="0" class="input__error">생년월일을 정확히 입력해 주세요.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="psgrContainer3" class="tab__panel" style="display:none">
					<div class="passenger-info-box">
                    	<div class="passenger-info">탑승객 정보</div>
					</div>
	       			<div class="sub-section">
						<div class="input-wrap input--line pc-col pc-col-2">
							<div id="divName0" class="input-row pc-row-100">
								<div id="txtLastName0_div" class="input-item">
									<div class="input-box">
										<label for="txtLastName0" class="input__label" style="top:0px">
											성 (영문)
											<span title="required" class="input__label-asterisk">*</span>
										</label>
										<div data-element="form" class="input">
											<input type="text" data-element="input" id="txtLastName3" name="txtLastName" class="input__text input_required" style="text-transform :uppercase;" oninput="handleOnInput(this)">
											<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
										</div>
									</div>
									<p tabindex="0" class="input__error">성을 입력해 주세요.</p>
								</div>
								<div id="txtFirstName0_div" class="input-item">
									<div class="input-box">
										<label for="txtFirstName0" class="input__label" style="top:0px">
											이름 (영문)<span title="required" class="input__label-asterisk">*</span>
										</label>
										<div data-element="form" class="input">
											<input type="text" data-element="input" id="txtFirstName3" name="txtFirstName" class="input__text input_required" style="text-transform :uppercase;" oninput="handleOnInput(this)">
											<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
										</div>
									</div>
									<p tabindex="0" class="input__error">이름을 입력해 주세요.</p>
								</div>
							</div>
							<div class="input-row pc-mgl-0 boarding__gender">
								<div class="radio-wrapper">
									<p class="radio__text">성별<span title="required" class="input__label-asterisk">*</span></p>
									<div class="radio-wrap">
										<span class="radio">
											<input type="radio" id="rdoGenderM3" name="rdoGender3" value="1" class="radio__input" checked="">
											<label for="rdoGenderM3" class="radio__label"> <i aria-hidden="true" class="radio__ico"></i> <span>남자</span>
											</label>
										</span>
										<span class="radio">
											<input type="radio" id="rdoGenderW3" name="rdoGender3" value="2" class="radio__input">
											<label for="rdoGenderW3" class="radio__label"> <i aria-hidden="true" class="radio__ico"></i> <span>여자</span>
											</label>
										</span>
									</div>
								</div>
							</div>
			           		<div id="divBirth0" class="input-row input-row--label boarding__column">
				            	<div id="birth0_div" class="boarding__birth">
									<div class="input-label label-top">생년월일<span title="required" class="input__label-asterisk">*</span></div>
									<div class="input-item" data-element="form">
										<div class="input-flex">
											<div class="input-box label-active">
												<div class="input" data-element="form">
													<input type="text" class="input__text input__text--placeholder input_required" id="txtYear3" name="txtYear" maxlength="4" data-element="input" title="연도 입력" placeholder="년"><button type="button" data-element="remove" class="input__remove-button">삭제</button>
												</div>
											</div>
											<div class="input-box">
												<div class="select-wrap select-wrap--line">
													<select class="select-wrap__select input_required selected" id="selMonth3" name="selMonth" title="월 선택"><option value="">월</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
												</div>
											</div>
											<div class="input-box">
												<div class="select-wrap select-wrap--line">
													<select class="select-wrap__select input_required selected" id="selDate3" name="selDate" title="일 선택"><option value="">일</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select>
												</div>
											</div>
										</div>
										<p tabindex="0" class="input__error">생년월일을 정확히 입력해 주세요.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="psgrContainer4" class="tab__panel" style="display:none">
					<div class="passenger-info-box">
                    	<div class="passenger-info">탑승객 정보</div>
					</div>
	       			<div class="sub-section">
						<div class="input-wrap input--line pc-col pc-col-2">
							<div id="divName0" class="input-row pc-row-100">
								<div id="txtLastName0_div" class="input-item">
									<div class="input-box">
										<label for="txtLastName0" class="input__label" style="top:0px">
											성 (영문)
											<span title="required" class="input__label-asterisk">*</span>
										</label>
										<div data-element="form" class="input">
											<input type="text" data-element="input" id="txtLastName4" name="txtLastName" class="input__text input_required" style="text-transform :uppercase;" oninput="handleOnInput(this)">
											<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
										</div>
									</div>
									<p tabindex="0" class="input__error">성을 입력해 주세요.</p>
								</div>
								<div id="txtFirstName0_div" class="input-item">
									<div class="input-box">
										<label for="txtFirstName0" class="input__label" style="top:0px">
											이름 (영문)<span title="required" class="input__label-asterisk">*</span>
										</label>
										<div data-element="form" class="input">
											<input type="text" data-element="input" id="txtFirstName4" name="txtFirstName" class="input__text input_required" style="text-transform :uppercase;" oninput="handleOnInput(this)">
											<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
										</div>
									</div>
									<p tabindex="0" class="input__error">이름을 입력해 주세요.</p>
								</div>
							</div>
							<div class="input-row pc-mgl-0 boarding__gender">
								<div class="radio-wrapper">
									<p class="radio__text">성별<span title="required" class="input__label-asterisk">*</span></p>
									<div class="radio-wrap">
										<span class="radio">
											<input type="radio" id="rdoGenderM4" name="rdoGender4" value="1" class="radio__input" checked="">
											<label for="rdoGenderM4" class="radio__label"> <i aria-hidden="true" class="radio__ico"></i> <span>남자</span>
											</label>
										</span>
										<span class="radio">
											<input type="radio" id="rdoGenderW4" name="rdoGender4" value="2" class="radio__input">
											<label for="rdoGenderW4" class="radio__label"> <i aria-hidden="true" class="radio__ico"></i> <span>여자</span>
											</label>
										</span>
									</div>
								</div>
							</div>
			           		<div id="divBirth0" class="input-row input-row--label boarding__column">
				            	<div id="birth0_div" class="boarding__birth">
									<div class="input-label label-top">생년월일<span title="required" class="input__label-asterisk">*</span></div>
									<div class="input-item" data-element="form">
										<div class="input-flex">
											<div class="input-box label-active">
												<div class="input" data-element="form">
													<input type="text" class="input__text input__text--placeholder input_required" id="txtYear4" name="txtYear" maxlength="4" data-element="input" title="연도 입력" placeholder="년"><button type="button" data-element="remove" class="input__remove-button">삭제</button>
												</div>
											</div>
											<div class="input-box">
												<div class="select-wrap select-wrap--line">
													<select class="select-wrap__select input_required selected" id="selMonth4" name="selMonth" title="월 선택"><option value="">월</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
												</div>
											</div>
											<div class="input-box">
												<div class="select-wrap select-wrap--line">
													<select class="select-wrap__select input_required selected" id="selDate4" name="selDate" title="일 선택"><option value="">일</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select>
												</div>
											</div>
										</div>
										<p tabindex="0" class="input__error">생년월일을 정확히 입력해 주세요.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="psgrContainer5" class="tab__panel" style="display:none">
					<div class="passenger-info-box">
                    	<div class="passenger-info">탑승객 정보</div>
					</div>
	       			<div class="sub-section">
						<div class="input-wrap input--line pc-col pc-col-2">
							<div id="divName0" class="input-row pc-row-100">
								<div id="txtLastName0_div" class="input-item">
									<div class="input-box">
										<label for="txtLastName0" class="input__label" style="top:0px">
											성 (영문)
											<span title="required" class="input__label-asterisk">*</span>
										</label>
										<div data-element="form" class="input">
											<input type="text" data-element="input" id="txtLastName5" name="txtLastName" class="input__text input_required" style="text-transform :uppercase;" oninput="handleOnInput(this)">
											<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
										</div>
									</div>
									<p tabindex="0" class="input__error">성을 입력해 주세요.</p>
								</div>
								<div id="txtFirstName0_div" class="input-item">
									<div class="input-box">
										<label for="txtFirstName0" class="input__label" style="top:0px">
											이름 (영문)<span title="required" class="input__label-asterisk">*</span>
										</label>
										<div data-element="form" class="input">
											<input type="text" data-element="input" id="txtFirstName5" name="txtFirstName" class="input__text input_required" style="text-transform :uppercase;" oninput="handleOnInput(this)">
											<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
										</div>
									</div>
									<p tabindex="0" class="input__error">이름을 입력해 주세요.</p>
								</div>
							</div>
							<div class="input-row pc-mgl-0 boarding__gender">
								<div class="radio-wrapper">
									<p class="radio__text">성별<span title="required" class="input__label-asterisk">*</span></p>
									<div class="radio-wrap">
										<span class="radio">
											<input type="radio" id="rdoGenderM5" name="rdoGender5" value="1" class="radio__input" checked="">
											<label for="rdoGenderM5" class="radio__label"> <i aria-hidden="true" class="radio__ico"></i> <span>남자</span>
											</label>
										</span>
										<span class="radio">
											<input type="radio" id="rdoGenderW5" name="rdoGender5" value="2" class="radio__input">
											<label for="rdoGenderW5" class="radio__label"> <i aria-hidden="true" class="radio__ico"></i> <span>여자</span>
											</label>
										</span>
									</div>
								</div>
							</div>
			           		<div id="divBirth0" class="input-row input-row--label boarding__column">
				            	<div id="birth0_div" class="boarding__birth">
									<div class="input-label label-top">생년월일<span title="required" class="input__label-asterisk">*</span></div>
									<div class="input-item" data-element="form">
										<div class="input-flex">
											<div class="input-box label-active">
												<div class="input" data-element="form">
													<input type="text" class="input__text input__text--placeholder input_required" id="txtYear5" name="txtYear" maxlength="4" data-element="input" title="연도 입력" placeholder="년"><button type="button" data-element="remove" class="input__remove-button">삭제</button>
												</div>
											</div>
											<div class="input-box">
												<div class="select-wrap select-wrap--line">
													<select class="select-wrap__select input_required selected" id="selMonth5" name="selMonth" title="월 선택"><option value="">월</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
												</div>
											</div>
											<div class="input-box">
												<div class="select-wrap select-wrap--line">
													<select class="select-wrap__select input_required selected" id="selDate5" name="selDate" title="일 선택"><option value="">일</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select>
												</div>
											</div>
										</div>
										<p tabindex="0" class="input__error">생년월일을 정확히 입력해 주세요.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="psgrContainer6" class="tab__panel" style="display:none">
					<div class="passenger-info-box">
                    	<div class="passenger-info">탑승객 정보</div>
					</div>
	       			<div class="sub-section">
						<div class="input-wrap input--line pc-col pc-col-2">
							<div id="divName0" class="input-row pc-row-100">
								<div id="txtLastName0_div" class="input-item">
									<div class="input-box">
										<label for="txtLastName0" class="input__label" style="top:0px">
											성 (영문)
											<span title="required" class="input__label-asterisk">*</span>
										</label>
										<div data-element="form" class="input">
											<input type="text" data-element="input" id="txtLastName6" name="txtLastName" class="input__text input_required" style="text-transform :uppercase;" oninput="handleOnInput(this)">
											<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
										</div>
									</div>
									<p tabindex="0" class="input__error">성을 입력해 주세요.</p>
								</div>
								<div id="txtFirstName0_div" class="input-item">
									<div class="input-box">
										<label for="txtFirstName0" class="input__label" style="top:0px">
											이름 (영문)<span title="required" class="input__label-asterisk">*</span>
										</label>
										<div data-element="form" class="input">
											<input type="text" data-element="input" id="txtFirstName6" name="txtFirstName" class="input__text input_required" style="text-transform :uppercase;" oninput="handleOnInput(this)">
											<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
										</div>
									</div>
									<p tabindex="0" class="input__error">이름을 입력해 주세요.</p>
								</div>
							</div>
							<div class="input-row pc-mgl-0 boarding__gender">
								<div class="radio-wrapper">
									<p class="radio__text">성별<span title="required" class="input__label-asterisk">*</span></p>
									<div class="radio-wrap">
										<span class="radio">
											<input type="radio" id="rdoGenderM6" name="rdoGender6" value="1" class="radio__input" checked="">
											<label for="rdoGenderM6" class="radio__label"> <i aria-hidden="true" class="radio__ico"></i> <span>남자</span>
											</label>
										</span>
										<span class="radio">
											<input type="radio" id="rdoGenderW6" name="rdoGender6" value="2" class="radio__input">
											<label for="rdoGenderW6" class="radio__label"> <i aria-hidden="true" class="radio__ico"></i> <span>여자</span>
											</label>
										</span>
									</div>
								</div>
							</div>
			           		<div id="divBirth0" class="input-row input-row--label boarding__column">
				            	<div id="birth0_div" class="boarding__birth">
									<div class="input-label label-top">생년월일<span title="required" class="input__label-asterisk">*</span></div>
									<div class="input-item" data-element="form">
										<div class="input-flex">
											<div class="input-box label-active">
												<div class="input" data-element="form">
													<input type="text" class="input__text input__text--placeholder input_required" id="txtYear6" name="txtYear" maxlength="4" data-element="input" title="연도 입력" placeholder="년"><button type="button" data-element="remove" class="input__remove-button">삭제</button>
												</div>
											</div>
											<div class="input-box">
												<div class="select-wrap select-wrap--line">
													<select class="select-wrap__select input_required selected" id="selMonth6" name="selMonth" title="월 선택"><option value="">월</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
												</div>
											</div>
											<div class="input-box">
												<div class="select-wrap select-wrap--line">
													<select class="select-wrap__select input_required selected" id="selDate6" name="selDate" title="일 선택"><option value="">일</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select>
												</div>
											</div>
										</div>
										<p tabindex="0" class="input__error">생년월일을 정확히 입력해 주세요.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="psgrContainer7" class="tab__panel" style="display:none">
					<div class="passenger-info-box">
                    	<div class="passenger-info">탑승객 정보</div>
					</div>
	       			<div class="sub-section">
						<div class="input-wrap input--line pc-col pc-col-2">
							<div id="divName0" class="input-row pc-row-100">
								<div id="txtLastName0_div" class="input-item">
									<div class="input-box">
										<label for="txtLastName0" class="input__label" style="top:0px">
											성 (영문)
											<span title="required" class="input__label-asterisk">*</span>
										</label>
										<div data-element="form" class="input">
											<input type="text" data-element="input" id="txtLastName7" name="txtLastName" class="input__text input_required" style="text-transform :uppercase;" oninput="handleOnInput(this)">
											<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
										</div>
									</div>
									<p tabindex="0" class="input__error">성을 입력해 주세요.</p>
								</div>
								<div id="txtFirstName0_div" class="input-item">
									<div class="input-box">
										<label for="txtFirstName0" class="input__label" style="top:0px">
											이름 (영문)<span title="required" class="input__label-asterisk">*</span>
										</label>
										<div data-element="form" class="input">
											<input type="text" data-element="input" id="txtFirstName7" name="txtFirstName" class="input__text input_required" style="text-transform :uppercase;" oninput="handleOnInput(this)">
											<button type="button" data-element="remove" class="input__remove-button"><span class="hidden">삭제</span></button>
										</div>
									</div>
									<p tabindex="0" class="input__error">이름을 입력해 주세요.</p>
								</div>
							</div>
							<div class="input-row pc-mgl-0 boarding__gender">
								<div class="radio-wrapper">
									<p class="radio__text">성별<span title="required" class="input__label-asterisk">*</span></p>
									<div class="radio-wrap">
										<span class="radio">
											<input type="radio" id="rdoGenderM7" name="rdoGender7" value="1" class="radio__input" checked="">
											<label for="rdoGenderM7" class="radio__label"> <i aria-hidden="true" class="radio__ico"></i> <span>남자</span>
											</label>
										</span>
										<span class="radio">
											<input type="radio" id="rdoGenderW7" name="rdoGender7" value="2" class="radio__input">
											<label for="rdoGenderW7" class="radio__label"> <i aria-hidden="true" class="radio__ico"></i> <span>여자</span>
											</label>
										</span>
									</div>
								</div>
							</div>
			           		<div id="divBirth0" class="input-row input-row--label boarding__column">
				            	<div id="birth0_div" class="boarding__birth">
									<div class="input-label label-top">생년월일<span title="required" class="input__label-asterisk">*</span></div>
									<div class="input-item" data-element="form">
										<div class="input-flex">
											<div class="input-box label-active">
												<div class="input" data-element="form">
													<input type="text" class="input__text input__text--placeholder input_required" id="txtYear7" name="txtYear" maxlength="4" data-element="input" title="연도 입력" placeholder="년"><button type="button" data-element="remove" class="input__remove-button">삭제</button>
												</div>
											</div>
											<div class="input-box">
												<div class="select-wrap select-wrap--line">
													<select class="select-wrap__select input_required selected" id="selMonth7" name="selMonth" title="월 선택"><option value="">월</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option></select>
												</div>
											</div>
											<div class="input-box">
												<div class="select-wrap select-wrap--line">
													<select class="select-wrap__select input_required selected" id="selDate7" name="selDate" title="일 선택"><option value="">일</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select>
												</div>
											</div>
										</div>
										<p tabindex="0" class="input__error">생년월일을 정확히 입력해 주세요.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			
			</div>
		</div>
		
		<div id="divContact" class="section-wrap">
		<div class="section-title">대표 연락처 정보</div>
			<div class="section-sub-txt">기상악화 등에 따른 항공편 지연/결항 시 알려 드립니다. 휴대전화번호와 이메일을 입력해 주세요.</div>
		
			<div class="input-wrap input--line pc-col pc-col-2">
				<div class="input-row input-row--label">
					<div class="input-label label-top">휴대전화번호<span title="required" class="input__label-asterisk">*</span></div>
					<div id="txtContactPhone_div" class="input-item">
						<div class="input-flex">
							<div class="input-box input-box--tel">
								<div class="select-wrap select-wrap--line">
									<button class="select-wrap__button active" id="btnCountryCode" name="btnCountryCode" type="button">+82</button>
									<input type="hidden" id="hidCountryCode" class="input_contact" value="82">
								</div>
							</div>
							<div class="input-box">
								<div data-element="form" class="input">
									<input type="text" data-element="input" id="txtContactPhone" class="input__text input_contact input_required" value="${sessionScope.mobile}" name="txtContactPhone" maxlength="13">
									<button type="button" data-element="remove" class="input__remove-button">
										<span class="hidden">삭제</span>
									</button>
								</div>
							</div>
						</div>
						<p tabindex="0" class="input__error">휴대전화번호 오류입니다. 다시 확인해 주세요.</p>
					</div>
				</div>
				<div class="input-row">
					<div id="txtContactEmail_div" class="input-item">
						<div class="input-box label-active">
							<label for="txtContactEmail" class="input__label">
								이메일<span title="required" class="input__label-asterisk">*</span>
							</label>
							<div data-element="form" class="input">
								<input type="text" data-element="email" id="txtContactEmail" class="input__text input_contact input_required" value="${sessionScope.email}" maxlength="266">
								<button type="button" data-element="remove" class="input__remove-button">
									<span class="hidden">삭제</span>
								</button>
							</div>
						</div>
						<p class="input__sub-text">예) kimjeju@jejuair.com</p>
						<p tabindex="0" class="input__error">이메일을 입력해 주세요.</p>
					</div>
				</div>
			</div>
			</div>
		<div class="section-wrap">
			<div class="service-information" data-element="toggle" data-options="{&quot;mode&quot;: &quot;slide&quot;}">
				<div class="service-information__title">
					<button type="button" class="service-information__anchor is-active" id="btnServiceInfo" data-element="toggle__anchor" aria-controls="toggle-2" aria-expanded="true">꼭 확인해 주세요.</button>
				</div>
				<div class="service-information__content" data-element="toggle__panel" id="toggle-2" style="display: block;">
					<ul class="list-guide list-guide--small">
						<li class="list-guide__item" style="color:#FF5000">대한민국에 비자없이 입국이 가능한 외국인은 출발 72시간 전까지 <a style="color:#FF5000; border-bottom:1px solid #FF5000" onclick="">www.k-eta.go.kr</a> 또는 모바일앱(K-ETA)을 통해 K-ETA를 신청 및 발급 받은 후 입국이 가능합니다.</li>
						<li class="list-guide__item">탑승자명은 여권 및 신분증 정보와 동일하게 입력해 주세요.
						</li>
						<li class="list-guide__item">결제 이후 탑승자명을 변경할 수 없습니다.
						</li>
						<li class="list-guide__item">항공기에 탑승하기 위해 반드시 유효한 신분증을 소지해 주세요.
						</li>
						<li class="list-guide__item">유아가 좌석에 착석하는 경우 안전을 위해 기내용 안전의자(Cat Seat)를 반드시 준비해주시기 바랍니다.<br>- 미연방항공청(FAA) 승인 받은 유아용 안전의자 또는 기내 사용 가능한 인증 제품에 한하여 이용 가능합니다. 예) 포브 보네떼 제품 등 </li> 
						<li class="list-guide__item">도움이 필요한 탑승객(임산부, 휠체어 이용 고객 또는 지병이 있는 고객 등)은 체크인 카운터에서 탑승권 발급 시 직원에게 알려 주세요.
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="booking-sticky booking-sticky--reservation" data-element="toggle" data-options="{&quot;mode&quot;: &quot;slide&quot;}">
			<div class="reservation-container">
				<div class="booking-sticky__top ">
					<div id="divBottomSheetTop" class="toggle-wrap toggle-wrap--button toggle-wrap--height">
						<div class="label label--point">
							<span>예상 결제금액</span>
							</div>
						<button type="button" class="summary" data-element="toggle__anchor" aria-controls="divBottomSheet" aria-expanded="false">
							<span class="cost"><span class="price_txt">${totalprice}</span>
							<span class="unit">원</span></span>
							<span class="point" style="display: none;">
								<span class="cost"></span>
							</span>
						</button>
					</div>
					<input type="hidden" id="flightNo" name="flightNo" value="${downDto.flightNo}">
					<input type="hidden" id="departTime" name="departTime" value="${downDto.departTime}">
					<input type="hidden" id="arrivalTime" name="arrivalTime" value="${downDto.arrivalTime}">
					<input type="hidden" id="flightTime" name="flightTime" value="${downDto.flightTime}">
					<input type="hidden" id="totalprice" name="totalprice" value="${totalprice}">
					<input type="hidden" id="hiddenItem" name="hiddenItem" value="${downDto.hiddenItem}">	
					<input type="hidden" id="kode" name="kode" value="${downDto.kode}">	<!-- 출발지 한국어 -->	
					<input type="hidden" id="koar" name="koar" value="${downDto.koar}">	<!-- 도착지 한국어 -->	
					<input type="hidden" id="departureData" name="departureData" value="${downDto.departureData}">
					<input type="hidden" id="arrivalData" name="arrivalData" value="${downDto.arrivalData}">
					<input type="hidden" id="hidYear" name="hidYear" value="${downDto.hidYear}">
					<input type="hidden" id="hidMonth" name="hidMonth" value="${downDto.hidMonth}">
					<input type="hidden" id="hidDay" name="hidDay" value="${downDto.hidDay}">
					<input type="hidden" id="hidToYear" name="hidToYear" value="${downDto.hidToYear}">
					<input type="hidden" id="hidToMonth" name="hidToMonth" value="${downDto.hidToMonth}">
					<input type="hidden" id="hidToDay" name="hidToDay" value="${downDto.hidToDay}">
					<input type="hidden" id="flightRouteNo" name="flightRouteNo" value="${downDto.flightRouteNo}"><!-- 추가됨 -->
					<c:choose>
						<c:when test="${downDto.hiddenItem == '왕복'}">
							<input type="hidden" id="BackYear" name="BackYear" value="${downDto.backYear}">
							<input type="hidden" id="BackMonth" name="BackMonth" value="${downDto.backMonth}">
							<input type="hidden" id="BackDay" name="BackDay" value="${downDto.backDay}">
							<input type="hidden" id="BackflightNo" name="BackflightNo" value="${downDto.backflightNo}">
							<input type="hidden" id="backdepartTime" name="backdepartTime" value="${downDto.backdepartTime}">
							<input type="hidden" id="backarrivalTime" name="backarrivalTime" value="${downDto.backarrivalTime}">
							<input type="hidden" id="backflightTime" name="backflightTime" value="${downDto.backflightTime}">
							<input type="hidden" id="backflightRouteNo" name="backflightRouteNo" value="${downDto.backflightRouteNo}"><!-- 추가됨 -->
						</c:when>
					</c:choose>
					<input type="hidden" id="adtNum" name="adtNum" value="${downDto.adtNum}">
					<input type="hidden" id="chdNum" name="chdNum" value="${downDto.chdNum}">
					<input type="hidden" id="infNum" name="infNum" value="${downDto.infNum}">
					<button name="btnNext" type="button" class="button button--primary pc-only button--active" onclick="submit()">
						<span class="button__text">좌석 선택하기</span>
					</button>
				</div>
			</div>
	    </div>
		
					</main>
				</div>
			</div>
		</div>
<%@ include file="../common/include/footer.jsp"%>