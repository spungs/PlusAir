<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="">
<!-- Jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- //Jquery -->
<!-- modal -->
<!-- Jquery 선언인데 위에껄로 사용하므로 주석처리 -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script> -->
<!-- Jquery에서 modal메서드를 사용하기 위한 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<!-- modal창 CSS -->
<style>
.blocker{position:fixed;top:0;right:0;bottom:0;left:0;width:100%;height:100%;overflow:auto;z-index:1;padding:20px;box-sizing:border-box;background-color:#000;background-color:rgba(0,0,0,0.75);text-align:center}
.blocker:before{content:"";display:inline-block;height:100%;vertical-align:middle;margin-right:-0.05em}
.blocker.behind{background-color:transparent}
.modal{display:none;vertical-align:middle;position:relative;z-index:2;max-width:500px;box-sizing:border-box;width:90%;background:#fff;padding:15px 30px;-webkit-border-radius:8px;-moz-border-radius:8px;-o-border-radius:8px;-ms-border-radius:8px;border-radius:8px;-webkit-box-shadow:0 0 10px #000;-moz-box-shadow:0 0 10px #000;-o-box-shadow:0 0 10px #000;-ms-box-shadow:0 0 10px #000;box-shadow:0 0 10px #000;text-align:left}
.modal a.close-modal{position:absolute;top:-12.5px;right:-12.5px;display:block;width:30px;height:30px;text-indent:-9999px;background-size:contain;background-repeat:no-repeat;background-position:center center;background-image:url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6/NlyAAAAAXNSR0IArs4c6QAAA3hJREFUaAXlm8+K00Acx7MiCIJH/yw+gA9g25O49SL4AO3Bp1jw5NvktC+wF88qevK4BU97EmzxUBCEolK/n5gp3W6TTJPfpNPNF37MNsl85/vN/DaTmU6PknC4K+pniqeKJ3k8UnkvDxXJzzy+q/yaxxeVHxW/FNHjgRSeKt4rFoplzaAuHHDBGR2eS9G54reirsmienDCTRt7xwsp+KAoEmt9nLaGitZxrBbPFNaGfPloGw2t4JVamSt8xYW6Dg1oCYo3Yv+rCGViV160oMkcd8SYKnYV1Nb1aEOjCe6L5ZOiLfF120EjWhuBu3YIZt1NQmujnk5F4MgOpURzLfAwOBSTmzp3fpDxuI/pabxpqOoz2r2HLAb0GMbZKlNV5/Hg9XJypguryA7lPF5KMdTZQzHjqxNPhWhzIuAruOl1eNqKEx1tSh5rfbxdw7mOxCq4qS68ZTjKS1YVvilu559vWvFHhh4rZrdyZ69Vmpgdj8fJbDZLJpNJ0uv1cnr/gjrUhQMuI+ANjyuwftQ0bbL6Erp0mM/ny8Fg4M3LtdRxgMtKl3jwmIHVxYXChFy94/Rmpa/pTbNUhstKV+4Rr8lLQ9KlUvJKLyG8yvQ2s9SBy1Jb7jV5a0yapfF6apaZLjLLcWtd4sNrmJUMHyM+1xibTjH82Zh01TNlhsrOhdKTe00uAzZQmN6+KW+sDa/JD2PSVQ873m29yf+1Q9VDzfEYlHi1G5LKBBWZbtEsHbFwb1oYDwr1ZiF/2bnCSg1OBE/pfr9/bWx26UxJL3ONPISOLKUvQza0LZUxSKyjpdTGa/vDEr25rddbMM0Q3O6Lx3rqFvU+x6UrRKQY7tyrZecmD9FODy8uLizTmilwNj0kraNcAJhOp5aGVwsAGD5VmJBrWWbJSgWT9zrzWepQF47RaGSiKfeGx6Szi3gzmX/HHbihwBser4B9UJYpFBNX4R6vTn3VQnez0SymnrHQMsRYGTr1dSk34ljRqS/EMd2pLQ8YBp3a1PLfcqCpo8gtHkZFHKkTX6fs3MY0blKnth66rKCnU0VRGu37ONrQaA4eZDFtWAu2fXj9zjFkxTBOo8F7t926gTp/83Kyzzcy2kZD6xiqxTYnHLRFm3vHiRSwNSjkz3hoIzo8lCKWUlg/YtGs7tObunDAZfpDLbfEI15zsEIY3U/x/gHHc/G1zltnAgAAAABJRU5ErkJggg==')}
.modal-spinner{display:none;position:fixed;top:50%;left:50%;transform:translateY(-50%) translateX(-50%);padding:12px 16px;border-radius:5px;background-color:#111;height:20px}
.modal-spinner>div{border-radius:100px;background-color:#fff;height:20px;width:2px;margin:0 1px;display:inline-block;-webkit-animation:sk-stretchdelay 1.2s infinite ease-in-out;animation:sk-stretchdelay 1.2s infinite ease-in-out}
.modal-spinner .rect2{-webkit-animation-delay:-1.1s;animation-delay:-1.1s}
.modal-spinner .rect3{-webkit-animation-delay:-1.0s;animation-delay:-1.0s}
.modal-spinner .rect4{-webkit-animation-delay:-0.9s;animation-delay:-0.9s}
@-webkit-keyframes sk-stretchdelay{0%,40%,100%{-webkit-transform:scaleY(0.5)}
20%{-webkit-transform:scaleY(1.0)}}
@keyframes sk-stretchdelay
{0%,40%,100%{transform:scaleY(0.5);-webkit-transform:scaleY(0.5)}
20%{transform:scaleY(1.0);-webkit-transform:scaleY(1.0)}}
</style>
<!-- //modal -->
<script>
var chkKor = /[^가-힇]/;
var chkEng = /[^a-zA-Z]/;
var chkEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
var chkId = /^[a-z]+[a-z0-9]{5,}/;
var chkPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@$%^&*~])[A-Za-z\d!@$%^&*~]{8,16}$/;
var chkMobile = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}/;
var num = /[^0-9]/;
var kor = /[^ㄱ-ㅎ]/;

	// korLastName
	$(function(){
		// input 관련 function
		$('#korLastName').focus(function(){
			$('#korLastNameDiv').addClass('label-active');
			$('#korLastNameDiv div[class="input"]').addClass('is-focus');
			if($('#korLastName').val() != ""){
				$('#korLastNameDiv .input__remove-button').removeClass('hide');
				$('#korLastNameDiv .input__remove-button').addClass('show');
			}
			// 유효성검사
			if(!chkKor.test($('#korLastName').val())){
				$('#errorText1').css('display','none');
			}
		}); //click event end
		$('#korLastName').keyup(function(){
			if(kor.test($('#korLastName').val()) || chkKor.test($('#korLastName').val()))
				$('#korLastName').val($('#korLastName').val().replace(/[A-Za-z0-9]/g,''))
				
			if($('#korLastName').val() == ""){
				$('#korLastNameDiv .input__remove-button').removeClass('show');
				$('#korLastNameDiv .input__remove-button').addClass('hide');
			}
			else if($('#korLastName').val() != ""){
				$('#korLastNameDiv div[data-element="form"]').addClass('is-active');
				$('#korLastNameDiv .input__remove-button').addClass('show');
				$('#korLastNameDiv .input__remove-button').removeClass('hide');
				$('#errorText1').css('display','none');
			}
			// 유효성검사
			if(chkKor.test($('#korLastName').val())){
				$('#errorText1').css('display','block');
			}
		}); //keydown event end
		$('#korLastName').blur(function(){
			$('#korLastNameDiv div[data-element="form"]').removeClass('is-focus');
			if($('#korLastName').val() == ""){
				$('#korLastNameDiv .input__remove-button').removeClass('show');
				$('#korLastNameDiv .input__remove-button').addClass('hide');
				$('#korLastNameDiv').removeClass('label-active');
				$('#errorText1').css('display','block');
			}
			$('#korLastName').val($('#korLastName').val().replace(/[ㄱ-ㅎ]/g,''))
		}); //blur event end
	}); // input 관련 function end
	
	$(function(){
		// 취소버튼 관련 function
		$('#korLastNameDiv button[data-element="remove"]').on('click', function(){
			$('#korLastName').val('');
			$('#korLastNameDiv div[data-element="form"]').removeClass('is-focus');
			$('#korLastNameDiv .input__remove-button').removeClass('show');
			$('#korLastNameDiv .input__remove-button').addClass('hide');
			if($('#korLastName').val() == ""){
				$('#korLastNameDiv').removeClass('label-active');
				$('#errorText1').css('display','block');				
			}
		}); // 취소버튼 클릭 event end
	}); // 취소버튼 관련 function end
	
	// korFirstName
	$(function(){
		// input 관련 function
		$('#korFirstName').focus(function(){
			$('#korFirstNameDiv').addClass('label-active');
			$('#korFirstNameDiv div[class="input"]').addClass('is-focus');
			if($('#korFirstName').val() != ""){
				$('#korFirstNameDiv .input__remove-button').removeClass('hide');
				$('#korFirstNameDiv .input__remove-button').addClass('show');
			}
			// 유효성검사
			if(!chkKor.test($('#korFirstName').val())){
				$('#errorText2').css('display','none');
			}
		}); //click event end
		$('#korFirstName').keyup(function(){
			if(kor.test($('#korFirstName').val()) || chkKor.test($('#korFirstName').val()))
				$('#korFirstName').val($('#korFirstName').val().replace(/[A-Za-z0-9]/g,''))
				
			if($('#korFirstName').val() == ""){
				$('#korFirstNameDiv .input__remove-button').removeClass('show');
				$('#korFirstNameDiv .input__remove-button').addClass('hide');
			}
			else if($('#korFirstName').val() != ""){
				$('#korFirstNameDiv div[data-element="form"]').addClass('is-active');
				$('#korFirstNameDiv .input__remove-button').addClass('show');
				$('#korFirstNameDiv .input__remove-button').removeClass('hide');
				$('#errorText2').css('display','none');
			}
			// 유효성검사
			if(chkKor.test($('#korFirstName').val())){
				$('#errorText2').css('display','block');
			}
		}); //keydown event end
		$('#korFirstName').blur(function(){
			$('#korFirstNameDiv div[data-element="form"]').removeClass('is-focus');
			if($('#korFirstName').val() == ""){
				$('#korFirstNameDiv .input__remove-button').removeClass('show');
				$('#korFirstNameDiv .input__remove-button').addClass('hide');
				$('#korFirstNameDiv').removeClass('label-active');
				$('#errorText2').css('display','block');
			}
			$('#korFirstName').val($('#korFirstName').val().replace(/[ㄱ-ㅎ]/g,''))
		}); //blur event end
	}); // input 관련 function end

	$(function(){
		// 취소버튼 관련 function
		$('#korFirstNameDiv button[data-element="remove"]').on('click', function(){
			$('#korFirstName').val('');
			$('#korFirstNameDiv div[data-element="form"]').removeClass('is-focus');
			$('#korFirstNameDiv .input__remove-button').removeClass('show');
			$('#korFirstNameDiv .input__remove-button').addClass('hide');
			if($('#korFirstName').val() == ""){
				$('#korFirstNameDiv').removeClass('label-active');
				$('#errorText2').css('display','block');				
			}
		}); // 취소버튼 클릭 event end
	}); // 취소버튼 관련 function end
	
	// engLastName
	$(function(){
		// input 관련 function
		$('#engLastName').focus(function(){
			$('#engLastNameDiv').addClass('label-active');
			$('#engLastNameDiv div[class="input"]').addClass('is-focus');
			if($('#engLastName').val() != ""){
				$('#engLastNameDiv .input__remove-button').removeClass('hide');
				$('#engLastNameDiv .input__remove-button').addClass('show');
			}
			if(!chkEng.test($('#engLastName').val())){ 
				$('#errorText3').css('display','none'); 
			}
		}); //click event end
		$('#engLastName').keyup(function(){
			if(chkEng.test($('#engLastName').val()))
				$('#engLastName').val($('#engLastName').val().replace(/[ㄱ-힣0-9]/g,''))
			
			if($('#engLastName').val() == ""){
				$('#engLastNameDiv .input__remove-button').removeClass('show');
				$('#engLastNameDiv .input__remove-button').addClass('hide');
			}
			else if($('#engLastName').val() != ""){
				$('#engLastNameDiv div[data-element="form"]').addClass('is-active');
				$('#engLastNameDiv .input__remove-button').addClass('show');
				$('#engLastNameDiv .input__remove-button').removeClass('hide');
				$('#errorText3').css('display','none');
			}
			// 유효성검사
			if(chkEng.test($('#engLastName').val())){
				$('#errorText3').css('display','block');
			}
		}); //keydown event end
		$('#engLastName').blur(function(){
			$('#engLastNameDiv div[data-element="form"]').removeClass('is-focus');
			if($('#engLastName').val() == ""){
				$('#engLastNameDiv .input__remove-button').removeClass('show');
				$('#engLastNameDiv .input__remove-button').addClass('hide');
				$('#engLastNameDiv').removeClass('label-active');
				$('#errorText3').css('display','block');
			}
		}); //blur event end
	}); // input 관련 function end

	$(function(){
		// 취소버튼 관련 function
		$('#engLastNameDiv button[data-element="remove"]').on('click', function(){
			$('#engLastName').val('');
			$('#engLastNameDiv div[data-element="form"]').removeClass('is-focus');
			$('#engLastNameDiv .input__remove-button').removeClass('show');
			$('#engLastNameDiv .input__remove-button').addClass('hide');
			if($('#engLastName').val() == ""){
				$('#engLastNameDiv').removeClass('label-active');
				$('#errorText3').css('display','block');
			}
		}); // 취소버튼 클릭 event end
	}); // 취소버튼 관련 function end
	
	// engFirstName
	$(function(){
		// input 관련 function
		$('#engFirstName').focus(function(){
			$('#engFirstNameDiv').addClass('label-active');
			$('#engFirstNameDiv div[class="input"]').addClass('is-focus');
			if($('#engFirstName').val() != ""){
				$('#engFirstNameDiv .input__remove-button').removeClass('hide');
				$('#engFirstNameDiv .input__remove-button').addClass('show');
			}
			if(!chkEng.test($('#engFirstName').val())){ 
				$('#errorText4').css('display','none'); 
			}
		}); //click event end
		$('#engFirstName').keyup(function(){
			if(chkEng.test($('#engFirstName').val()))
				$('#engFirstName').val($('#engFirstName').val().replace(/[ㄱ-힣0-9]/g,''))
				
			if($('#engFirstName').val() == ""){
				$('#engFirstNameDiv .input__remove-button').removeClass('show');
				$('#engFirstNameDiv .input__remove-button').addClass('hide');
			}
			else if($('#engFirstName').val() != ""){
				$('#engFirstNameDiv div[data-element="form"]').addClass('is-active');
				$('#engFirstNameDiv .input__remove-button').addClass('show');
				$('#engFirstNameDiv .input__remove-button').removeClass('hide');
				$('#errorText4').css('display','none');
			}
			// 유효성검사
			if(chkEng.test($('#engFirstName').val())){
				$('#errorText4').css('display','block');
			}
		}); //keydown event end
		$('#engFirstName').blur(function(){
			$('#engFirstNameDiv div[data-element="form"]').removeClass('is-focus');
			if($('#engFirstName').val() == ""){
				$('#engFirstNameDiv .input__remove-button').removeClass('show');
				$('#engFirstNameDiv .input__remove-button').addClass('hide');
				$('#engFirstNameDiv').removeClass('label-active');
				$('#errorText4').css('display','block');
			}
		}); //blur event end
	}); // input 관련 function end

	$(function(){
		// 취소버튼 관련 function
		$('#engFirstNameDiv button[data-element="remove"]').on('click', function(){
			$('#engFirstName').val('');
			$('#engFirstNameDiv div[data-element="form"]').removeClass('is-focus');
			$('#engFirstNameDiv .input__remove-button').removeClass('show');
			$('#engFirstNameDiv .input__remove-button').addClass('hide');
			if($('#engFirstName').val() == ""){
				$('#engFirstNameDiv').removeClass('label-active');
				$('#errorText4').css('display','block');				
			}
		}); // 취소버튼 클릭 event end
	}); // 취소버튼 관련 function end
	
	// 인증번호
	$(function(){
		// input 관련 function
		$('#inputAuthNum').keyup(function(){
			if(num.test($('#inputAuthNum').val()))
				$('#inputAuthNum').val($('#inputAuthNum').val().replace(/[ㄱ-힣A-Za-z]/g,''))
		}); //keydown event end
	}); // input 관련 function end
	
	// 아이디
	$(function(){
		// input 관련 function
		$('#inp-01').focus(function(){
			$('.inp-01Div').addClass('label-active');
			$('.inp-01Div div[class="input"]').addClass('is-focus');
			if($('#inp-01').val() != ""){
				$('.inp-01Div .input__remove-button').removeClass('hide');
				$('.inp-01Div .input__remove-button').addClass('show');
			}
		}); //click event end
		$('#inp-01').keyup(function(){
			//아이디 중복 체크
			req = new XMLHttpRequest();
			req.onreadystatechange = changeText
			req.open('post', 'isExistId')
			var reqData = $('#inp-01').val()
			req.send(reqData)
				
			function changeText() {
				if (req.readyState == 4 && req.status == 200) {
					if(req.responseText == "중복 아이디"){
					$('#txtIdChk2').css('display','none');
					$('#txtIdChk1').css('display','block');
					}
					else
						$('#txtIdChk1').css('display','none');
				}
			}
			
			if($('#inp-01').val() == ""){
				$('.inp-01Div .input__remove-button').removeClass('show');
				$('.inp-01Div .input__remove-button').addClass('hide');
			}
			else if($('#inp-01').val() != ""){
				$('.inp-01Div div[data-element="form"]').addClass('is-active');
				$('.inp-01Div .input__remove-button').addClass('show');
				$('.inp-01Div .input__remove-button').removeClass('hide');
				$('#txtIdChk2').css('display','none');
			}
			// 유효성검사
			if(!chkId.test($('#inp-01').val())){
				$('#txtIdChk2').css('display','block');
			}
		}); //keydown event end
		$('#inp-01').blur(function(){
			$('.inp-01Div div[data-element="form"]').removeClass('is-focus');
			if($('#inp-01').val() == ""){
				$('.inp-01Div .input__remove-button').removeClass('show');
				$('.inp-01Div .input__remove-button').addClass('hide');
				$('.inp-01Div').removeClass('label-active');
				$('#txtIdChk2').css('display','block');
			}
		}); //blur event end
	}); // input 관련 function end

	$(function(){
		// 취소버튼 관련 function
		$('.inp-01Div button[data-element="remove"]').on('click', function(){
			$('#inp-01').val('');
			$('.inp-01Div div[data-element="form"]').removeClass('is-focus');
			$('.inp-01Div .input__remove-button').removeClass('show');
			$('.inp-01Div .input__remove-button').addClass('hide');
			if($('#inp-01').val() == ""){
				$('.inp-01Div').removeClass('label-active');
				$('#txtIdChk2').css('display','block');				
			}
		}); // 취소버튼 클릭 event end
	}); // 취소버튼 관련 function end
	
	// 비밀번호
	$(function(){
		// input 관련 function
		$('#inp-02').focus(function(){
			$('.inp-02Div').addClass('label-active');
			$('.inp-02Div div[class="input"]').addClass('is-focus');
			if($('#inp-02').val() != ""){
				$('.inp-02Div .input__remove-button').removeClass('hide');
				$('.inp-02Div .input__remove-button').addClass('show');
			}
		}); //click event end
		$('#inp-02').keyup(function(){
			if($('#inp-02').val() == ""){
				$('.inp-02Div .input__remove-button').removeClass('show');
				$('.inp-02Div .input__remove-button').addClass('hide');
			}
			else if($('#inp-02').val() != ""){
				$('.inp-02Div div[data-element="form"]').addClass('is-active');
				$('.inp-02Div .input__remove-button').addClass('show');
				$('.inp-02Div .input__remove-button').removeClass('hide');
				$('#txtPwChk1').css('display','none');
			}
			// 유효성검사
			if(!chkPw.test($('#inp-02').val())){
				$('#txtPwChk1').css('display','block');
			}
		}); //keydown event end
		$('#inp-02').blur(function(){
			$('.inp-02Div div[data-element="form"]').removeClass('is-focus');
			if($('#inp-02').val() == ""){
				$('.inp-02Div .input__remove-button').removeClass('show');
				$('.inp-02Div .input__remove-button').addClass('hide');
				$('.inp-02Div').removeClass('label-active');
				$('#txtPwChk1').css('display','block');
			}
		}); //blur event end
	}); // input 관련 function end

	$(function(){
		// 취소버튼 관련 function
		$('.inp-02Div button[data-element="remove"]').on('click', function(){
			$('#inp-02').val('');
			$('.inp-02Div div[data-element="form"]').removeClass('is-focus');
			$('.inp-02Div .input__remove-button').removeClass('show');
			$('.inp-02Div .input__remove-button').addClass('hide');
			if($('#inp-02').val() == ""){
				$('.inp-02Div').removeClass('label-active');
				$('#txtPwChk1').css('display','block');				
			}
		}); // 취소버튼 클릭 event end
		// 눈동자 버튼
		$('.pwEyeBtn').click(function(){
			var dataChk = $('.inp-02Div div').attr('data-check')
			if(dataChk == 0){
				$('.inp-02Div div[data-element="form"]').addClass('show-password');
				$('.inp-02Div div[data-element="form"]').attr('data-check','1');
				$('#inp-02').prop("type", "text");
			}
			if(dataChk == 1){
				$('.inp-02Div div[data-element="form"]').removeClass('show-password');
				$('.inp-02Div div[data-element="form"]').attr('data-check','0');
				$('#inp-02').prop("type", "password");
			}
		});		
	}); // 취소버튼 관련 function end
	
	// 비밀번호 확인
	$(function(){
		// input 관련 function
		$('#inp-03').focus(function(){
			$('.inp-03Div').addClass('label-active');
			$('.inp-03Div div[class="input"]').addClass('is-focus');
			if($('#inp-03').val() != ""){
				$('.inp-03Div .input__remove-button').removeClass('hide');
				$('.inp-03Div .input__remove-button').addClass('show');
			}
		}); //click event end
		$('#inp-03').keyup(function(){
			if($('#inp-03').val() == ""){
				$('.inp-03Div .input__remove-button').removeClass('show');
				$('.inp-03Div .input__remove-button').addClass('hide');
			}
			else if($('#inp-03').val() != ""){
				$('.inp-03Div div[data-element="form"]').addClass('is-active');
				$('.inp-03Div .input__remove-button').addClass('show');
				$('.inp-03Div .input__remove-button').removeClass('hide');
				$('#txtPwChk2').css('display','none');
			}
			// 유효성검사
			if($('#inp-03').val() != $('#inp-02').val()){
				$('#txtPwChk2').css('display','block');
			}
		}); //keydown event end
		$('#inp-03').blur(function(){
			$('.inp-03Div div[data-element="form"]').removeClass('is-focus');
			if($('#inp-03').val() == ""){
				$('.inp-03Div .input__remove-button').removeClass('show');
				$('.inp-03Div .input__remove-button').addClass('hide');
				$('.inp-03Div').removeClass('label-active');
				$('#txtPwChk2').css('display','block');
			}
		}); //blur event end
	}); // input 관련 function end

	$(function(){
		// 취소버튼 관련 function
		$('.inp-03Div button[data-element="remove"]').on('click', function(){
			$('#inp-03').val('');
			$('.inp-03Div div[data-element="form"]').removeClass('is-focus');
			$('.inp-03Div .input__remove-button').removeClass('show');
			$('.inp-03Div .input__remove-button').addClass('hide');
			if($('#inp-03').val() == ""){
				$('.inp-03Div').removeClass('label-active');
				$('#txtPwChk2').css('display','block');				
			}
		}); // 취소버튼 클릭 event end
		// 눈동자 버튼
		$('.pwConfirmEyeBtn').click(function(){
			var dataChk = $('.inp-03Div div').attr('data-check')
			if(dataChk == 0){
				$('.inp-03Div div[data-element="form"]').addClass('show-password');
				$('.inp-03Div div[data-element="form"]').attr('data-check','1');
				$('#inp-03').prop("type", "text");
			}
			if(dataChk == 1){
				$('.inp-03Div div[data-element="form"]').removeClass('show-password');
				$('.inp-03Div div[data-element="form"]').attr('data-check','0');
				$('#inp-03').prop("type", "password");
			}
		});		
	}); // 취소버튼 관련 function end
	
	// 휴대전화번호
	$(function(){
		// input 관련 function
		$('#inputPhone-02').focus(function(){
			$('.inpPhoneDiv').addClass('label-active');
			$('.inpPhoneDiv div[class="input"]').addClass('is-focus');
			if($('#inputPhone-02').val() != ""){
				$('.inpPhoneDiv .input__remove-button').removeClass('hide');
				$('.inpPhoneDiv .input__remove-button').addClass('show');
			}
		}); //click event end
		$('#inputPhone-02').keyup(function(){
			// 000-0000-0000으로 바꿔주는 함수
			$('#inputPhone-02').val($('#inputPhone-02').val()
					.replace(/[^0-9]/g, '')
				  	.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, ""))
		  	// //000-0000-0000으로 바꿔주는 함수
				
			if($('#inputPhone-02').val() == ""){
				$('.inpPhoneDiv .input__remove-button').removeClass('show');
				$('.inpPhoneDiv .input__remove-button').addClass('hide');
			}
			else if($('#inputPhone-02').val() != ""){
				$('.inpPhoneDiv div[data-element="form"]').addClass('is-active');
				$('.inpPhoneDiv .input__remove-button').addClass('show');
				$('.inpPhoneDiv .input__remove-button').removeClass('hide');
				$('#inputErrMessage').css('display','none');
			}
			// 유효성검사
			if(!chkMobile.test($('#inputPhone-02').val())){
				$('#inputErrMessage').css('display','block');
			}
		}); //keydown event end
		$('#inputPhone-02').blur(function(){
			$('.inpPhoneDiv div[data-element="form"]').removeClass('is-focus');
			if($('#inputPhone-02').val() == ""){
				$('.inpPhoneDiv .input__remove-button').removeClass('show');
				$('.inpPhoneDiv .input__remove-button').addClass('hide');
				$('.inpPhoneDiv').removeClass('label-active');
				$('#inputErrMessage').css('display','block');
			}
		}); //blur event end
	}); // input 관련 function end

	$(function(){
		// 취소버튼 관련 function
		$('.inpPhoneDiv button[data-element="remove"]').on('click', function(){
			$('#inputPhone-02').val('');
			$('.inpPhoneDiv div[data-element="form"]').removeClass('is-focus');
			$('.inpPhoneDiv .input__remove-button').removeClass('show');
			$('.inpPhoneDiv .input__remove-button').addClass('hide');
			if($('#inputPhone-02').val() == ""){
				$('.inpPhoneDiv').removeClass('label-active');
				$('#inputErrMessage').css('display','block');				
			}
		}); // 취소버튼 클릭 event end
	}); // 취소버튼 관련 function end
	
	
	//=======================회원가입 버튼===========================
	// 회원가입 버튼 클릭 시 input check alert
	function joinBtn() {
		// 성(한글)
		if ($('#korLastName').val() == "" || chkKor.test($('#korLastName').val())) {
			$("#korLastName").focus();
			Swal.fire({
				text:'성(한글)을 입력해 주세요.\n한글은 5자까지 입력해주세요.'
			})
			return;
		}
		// 이름(한글)
		if ($('#korFirstName').val() == "" || chkKor.test($('#korFirstName').val())) {
			$("#korFirstName").focus();
			Swal.fire({
				text:'이름(한글)을 입력해 주세요.\n한글은 15자까지 입력해주세요.'
			})
			return;
		}
		// 성(영문)
		if ($('#engLastName').val() == "" || chkEng.test($('#engLastName').val())) {
			$("#engLastName").focus();
			Swal.fire({
				text:'성(영문)을 입력해 주세요.\n영문은 32자까지  입력해주세요.'
			})
			return;
		}
		// 이름(한글)
		if ($('#engFirstName').val() == "" || chkEng.test($('#engFirstName').val())) {
			$("#engFirstName").focus();
			Swal.fire({
				text:'이름(한글)을 입력해 주세요.\n영문은 32자까지  입력해주세요.'
			})
			return;
		}
		// 이메일
		if ($('#inputEmail1').val() == "" || chkEmail.test($('#engFirstName').val())) {
			$('#inputEmail1').focus();
			Swal.fire({
				text:'이메일을 확인 해주세요.'
			})
			return;
		}
		// 인증번호
		if ($('#inputAuthNum').val() == "" || $('#authStatus').val() != 'true') {
			$('#inputAuthNum').focus();
			Swal.fire({
				text:'인증번호를 입력 또는 인증 해주세요.'
			})
			return;
		}
		// 아이디
		if ($('#inp-01').val() == "" || !chkId.test($('#inp-01').val()) || $('#txtIdChk1').css('display') === 'block') {
			$('#inp-01').focus();
			Swal.fire({
				text:'아이디를 확인해주세요.'
			})
			return;
		}
		// 비밀번호
		if ($('#inp-02').val() == "" || !chkPw.test($('#inp-02').val())) {
			$('#inp-02').focus();
			Swal.fire({
				text:'비밀번호를 입력해주세요.'
			})
			return;
		}
		// 비밀번호 확인
		if ($('#inp-03').val() == "" || $('#inp-03').val() != $('#inp-02').val()) {
			$('#inp-03').focus();
			Swal.fire({
				text:'비밀번호 확인을 해주세요.'
			})
			return;
		}
		// 휴대전화 확인
		if ($('#inputPhone-02').val() == "" || $('#inputPhone-02').val().length != 13) {
			$('#inputPhone-02').focus();
			Swal.fire({
				text:'휴대전화를 확인 해주세요.'
			})
			return;
		}
		
		req = new XMLHttpRequest();
		req.onreadystatechange = changeText
		req.open('post', 'isExistMobile')
		var reqData = $('#inputPhone-02').val()
		req.send(reqData)
			
		function changeText() {
			if (req.readyState == 4 && req.status == 200) {
				if(req.responseText == "이미 가입된 전화번호"){
					Swal.fire({
						text:'이미 가입된 전화번호입니다.'
					})
					return;
				}
			}
		}
		
		document.getElementById('frm').submit();
	}

	// 모달 내부 동의 동의안함 버튼 function
	$(function() {
		$('.check-wrap__all-check').click(function() {
			var checked = $('#inpAgree-All').is(':checked');
			if (checked) {
				$('input:checkbox').prop('checked', true);
			} else
				$('input:checkbox').prop('checked', false);
		});
		$('#confirmBtn01').click(function() {
			$('#inpAgree-01').prop('checked',true);
		})
		$('#confirmBtn02').click(function() {
			$('#inpAgree-02').prop('checked',true);
		})
		$('#confirmBtn03').click(function() {
			$('#inpAgree-03').prop('checked',true);
		})
		$('#confirmBtn04').click(function() {
			$('#inpAgree-04').prop('checked',true);
		})
		/* 마케팅 정보 수신 동의는 모달창이 안나오고 있음
		$('#confirmBtn05').click(function() {
			$('#inpAgree-06').prop('checked',true);
		})
		*/
		$('#cancelBtn01').click(function(){
			$('#inpAgree-01').prop('checked',false);
		});
		$('#cancelBtn02').click(function(){
			$('#inpAgree-02').prop('checked',false);
		});
		$('#cancelBtn03').click(function(){
			$('#inpAgree-03').prop('checked',false);
		});
		$('#cancelBtn04').click(function(){
			$('#inpAgree-04').prop('checked',false);
		});
		
		// <a href="#modalLayer01>
		// test	
// 		$('a[href="#modalLayer01"]').click(function(e){
// 			e.preventDefault();
// 			$(this).modal({
// 			});
// 		});
		
		// modal 관련
		$('#inpAgree-All').click(function(event){
			$('html').addClass('open-modal open-modal--full');
			$('html').css({"height":"100%","overflow":"hidden","touch-action":"none"});
		});
		
		$('.agree-wrap__item').click(function(event){
			event.preventDefault(); // 부모창 위로 올려주는거 막으려고 쓴건데 안먹고 있음
			var target = $(this).attr('data-target');
			
			// heml에 class, css 추가
			$('html').addClass('open-modal open-modal--full');
			$('html').css({"height":"100%","overflow":"hidden","touch-action":"none"});
			
			// body id 변경 subLayoutBody > bookingLayoutBody
			$('#subLayoutBody').attr('id','bookingLayoutBody');
			
			
// 			$(target).wrap('<div calss="jquery-modal blocker current jquery-modal--full"></div>');
// 			$('.modal .modal-full .modal-scroll .modal--fixed-multi').css('display','inline-block');
			
			//test
// 			$('.modal').css('max-height', '500px'); 
// 			$('.modal-header__title').css('position', 'fixed'); 
// 			$('.button-wrap').css('position', 'fixed'); 
			
// 			$('.modal').css('overflow', 'auto'); // x축만 scroll
// 			$('.open-modal').css('overflow', 'auto'); // 둘다 안됨
// 			$('.modal-full').css('overflow', 'auto'); // x축만 scroll
// 			$('.modal-content').css('overflow', 'auto'); // 둘다 안됨
// 			$('.modal-scroll').css('overflow', 'auto');
// 			$('.modal-wrapper').css('overflow', 'auto');

// 			$('.modal-wrapper--picker').css('overflow', 'auto');
// 			$('.modal-full').css('overflow', 'auto');
// 			$('.modal-full--picker').css('overflow', 'auto');
// 			$('.modal-header').css('overflow', 'auto');

// 			$('.jquery-modal').css('overflow', 'auto');
// 			$('.jquery-modal-picker').css('overflow', 'auto');
			$(target).modal({
				});
			$('.jquery-modal').addClass('jquery-modal--full');
		});
		
// 		$('.modal__close').click(function(event){
// 			event.preventDefault();
// 			$('div[class="jquery-modal blocker current"]').remove();
// 		});
	});
</script>

<!-- 이메일 유효성 검사 및 인증번호 전송 -->
<script>
var chkEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

	function sendAuth(){
		var reqData = document.getElementById('inputEmail1').value
		if(reqData == ""){
			Swal.fire({
				text: '이메일을 입력해주세요.'
				})
		}
		else if(!chkEmail.test(reqData)){
			Swal.fire({
				text: '이메일을 다시 확인해주세요.'
				})
		}
		else{
		req = new XMLHttpRequest();
		req.onreadystatechange = Msg
		req.open('post', 'sendAuth')
		req.send(reqData)
		}
	}
	
	function checkAuth(){		// 인증번호를 확인하는 함수
		req = new XMLHttpRequest();
		req.onreadystatechange = Msg
		req.open('post', 'checkAuth')
		var reqData = document.getElementById('inputAuthNum').value
		req.send(reqData)
	}
	
	function Msg(){
		if (req.readyState == 4 && req.status == 200) {
			Swal.fire({
				text: req.responseText
				})
			if(req.responseText == '인증 성공')
				$('#authStatus').val('true')
		}
	}
</script>
<style>
/* .modal { */
/* 	position: absolute; */
/* 	width: 100%; */
/* 	height: 100%; */
/* 	background: rgba(0, 0, 0, 0.8); */
/* 	top: 0; */
/* 	left: 0; */
/* 	display: none; */
/* } */

/* .modal_content { */
/* 	width: 400px; */
/* 	height: 200px; */
/* 	background: #fff; */
/* 	border-radius: 10px; */
/* 	position: relative; */
/* 	top: 50%; */
/* 	left: 50%; */
/* 	margin-top: -100px; */
/* 	margin-left: -200px; */
/* 	text-align: center; */
/* 	box-sizing: border-box; */
/* 	padding: 74px 0; */
/* 	line-height: 23px; */
/* 	cursor: pointer; */
/* 	overflow-y: auto; */
/* } */

#authBtn, #authConfirmBtn{
	position: relative;
	top: -30px;
	border-radius: 12px;
 	color: white;
	background-color: #1F50B5;
	border-color: #1F50B5;
	
}

.authConfirmBtn {
	position: relative;
	top: -50px !important;
}

.authNumDiv {
	position: relative;
	top: -20px;
}

.step-ui .page-title-wrap .page-sub-title2 {
	margin-top: 0;
	font-size: 22px;
	color: #000;
	font-weight: 700;
}
.button--active2 {
	color: #AAAAAA;
}
</style>
<%@ include file="../../common/include/header.jsp"%>
<div id="body" class="body">

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


				<form id="frm" name="frm" method="post" action="joinComplete">
					<!-- 이름 -->
					<div class="page-title-wrap">
						<div class="page-title">이름 입력</div>
						<div class="page-sub-title">회원가입 정보입력</div>
					</div>
					<div class="section-wrap">
						<div class="input-wrap input--line">

							<div class="input-row">
								<div class="input-item">
									<div id="korLastNameDiv" class="input-box">
										<label for="korLastName" class="input__label">성(한글)<span
											title="required" class="input__label-asterisk">*</span></label>
										<div data-element="form" class="input">
											<input type="text" data-element="input" id="korLastName" value="${member.korLastName}"
												name="korLastName" class="input__text" maxlength="5">
											<button type="button" data-element="remove"
												class="input__remove-button">
												<span class="hidden">삭제</span>
											</button>
										</div>
									</div>
									<p tabindex="0" class="input__error" id="errorText1"
										style="display: none;">성(한글) 을 입력해 주세요.</p>
									<p tabindex="0" class="input__error" id="errorText5"
										style="display: none;">한글은 5자, 영문은 32자까지 입력해주세요.</p>
								</div>
								<div class="input__mark"></div>
								<div class="input-item">
									<div id="korFirstNameDiv" class="input-box">
										<label for="korFirstName" class="input__label">이름(한글)<span
											title="required" class="input__label-asterisk">*</span></label>
										<div data-element="form" class="input">
											<input type="text" data-element="input" id="korFirstName" value="${member.korFirstName}"
												name="korFirstName" class="input__text" maxlength="15">
											<button type="button" data-element="remove"
												class="input__remove-button">
												<span class="hidden">삭제</span>
											</button>
										</div>
									</div>
									<p tabindex="0" class="input__error" id="errorText2"
										style="display: none;">이름(한글) 을 입력해 주세요.</p>
									<p tabindex="0" class="input__error" id="errorText6"
										style="display: none;">한글은 성/이름 포함 15자, 영문은 32자까지 입력해주세요.</p>
								</div>
							</div>

							<div class="input-row">
								<div class="input-item">
									<div id="engLastNameDiv" class="input-box">
										<label for="engLastName" class="input__label">성(영문)<span
											title="required" class="input__label-asterisk">*</span></label>
										<div data-element="form" class="input">
											<input type="text" data-element="input" id="engLastName"  value="${member.engLastName}"
												name="engLastName" class="input__text" maxlength="32">
											<button type="button" data-element="remove"
												class="input__remove-button">
												<span class="hidden">삭제</span>
											</button>
										</div>
									</div>
									<p tabindex="0" class="input__error" id="errorText3"
										style="display: none;">성(영문) 을 입력해 주세요.</p>
								</div>
								<div class="input__mark"></div>
								<div class="input-item">
									<div id="engFirstNameDiv" class="input-box">
										<label for="engFirstName" class="input__label">이름(영문)<span
											title="required" class="input__label-asterisk">*</span></label>
										<div data-element="form" class="input">
											<input type="text" data-element="input" id="engFirstName" value="${member.engFirstName}"
												name="engFirstName" class="input__text" maxlength="32">
											<button type="button" data-element="remove"
												class="input__remove-button">
												<span class="hidden">삭제</span>
											</button>
										</div>
									</div>
									<p tabindex="0" class="input__error" id="errorText4"
										style="display: none;">이름(영문) 을 입력해 주세요.</p>
								</div>
							</div>
						</div>
					</div>
					<!-- //이름 -->

					<!-- 이메일 -->
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
												<input type="email" data-element="email" id="inputEmail1" value="${member.inputEmail1}"
													name="email" class="input__text" autocomplete="off" placeholder="example@gmail.com"> <span
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
									<div align="right"><input type="button" id="authBtn" value="인증번호 전송" onclick="sendAuth()"></div>
									<div></div>
								</div>
							</div>
						</div>
					</div>
					<!-- //이메일 -->
					<!-- 이메일 인증번호 -->
					<div class="section-wrap">
						<div class="input-wrap input--line">
							<div class="">
								<div class="input-item authNumDiv">
									<label for="inputAuthNum" class="input-label label-top authNumDiv">인증번호
										<span title="required" class="input__label-asterisk">*</span>
									</label>
									<div class="input-box authNumDiv">
										<div data-element="form" class="input">
											<div class="eac-input-wrap"
												style="display: block; position: relative; font-size: 14px;">
												<input type="text" data-element="authNum" id="inputAuthNum"
													class="input__text" autocomplete="off"> 
													<input type="hidden" id="auth">
													<span
													class="authNum-auto"
													style="display: block; box-sizing: content-box; font-family: SpoqaHanSansNeo, roboto, sans-serif, Arial; font-weight: 400; letter-spacing: 0px; left: 0px;"></span>
												<span class="eac-cval"
													style="visibility: hidden; position: absolute; display: inline-block; font-family: SpoqaHanSansNeo, roboto, sans-serif, Arial; font-weight: 400; letter-spacing: 0px;"></span>
											</div>
										</div>
									</div>
									<div align="right"><input type="button" id="authConfirmBtn" class="authConfirmBtn" value="인증번호 확인" onclick="checkAuth()"></div>
									<div></div>
								</div>
							</div>
						</div>
					</div>
					<!-- //이메일 인증번호 -->
					<!-- 아이디,비밀번호 -->
					<div class="input-wrap input--line">
						<div class="input-row">
							<div class="input-item">
								<div class="input-box inp-01Div">
									<label for="input-01" class="input__label">아이디
										<span title="required" class="input__label-asterisk">*</span>
									</label>
									<div data-element="form" class="input">
										<input type="text" id="inp-01" class="input__text" name="id">
										<button type="button" data-element="remove"
											class="input__remove-button">
											<span class="hidden">삭제</span>
										</button>
									</div>
								</div>
								<!-- 에러메세지 노출 텍스트 -->

								<p tabindex="0" class="input__error" id="txtIdChk1"
									style="display: none;">이미 사용 중인 아이디입니다.</p>


								<p tabindex="0" class="input__error" id="txtIdChk2"
									style="display: none;">영문 소문자와 숫자 6자 이상을 조합해 주세요. (﻿※ 영문 소문자로 시작)</p>

								<!-- //에러메세지 노출 텍스트 -->
							</div>
						</div>
						<div class="input-row input-row--password">
							<div class="input-item">
								<div class="input-box inp-02Div">
									<label for="inp-02" class="input__label">비밀번호<span
										title="required" class="input__label-asterisk">*</span></label>
									<div data-element="form" class="input" data-check="0">
										<input type="password" class="input__text" id="inp-02" name="pw">
										<button type="button" data-element="remove"
											class="input__remove-button">
											<span class="hidden">삭제</span>
										</button>
										<button type="button" data-element="toggleShow"
											class="input__show-button pwEyeBtn" aria-label="비밀번호 보기"></button>
									</div>
								</div>
								<p class="input__sub-text">영문/숫자/특수문자 각 하나 이상 사용하여 8~16자로
									입력해 주세요.
									(사용 가능한 특수문자 : !, @, $, %, ^, &amp;,
									*, ~)</p>
								<!-- 에러메세지 노출 텍스트 -->
								<!-- 6자 이상 미입력 or 문자/숫자 각 1글자 미포함 시 -->
								<p class="input__error" tabindex="0" id="txtPwChk1"
									style="display: none;">조건에 맞게 입력해주세요.</p>
								<!-- //6자 이상 미입력 or 문자/숫자 각 1글자 미포함 시 -->
								<!-- //에러메세지 노출 텍스트 -->
							</div>
						</div>
						<div class="input-row input-row--password">
							<div class="input-item">
								<div class="input-box inp-03Div">
									<label for="inp-03" class="input__label">비밀번호 확인<span
										title="required" class="input__label-asterisk">*</span></label>
									<div data-element="form" class="input" data-check="0">
										<input type="password" class="input__text"
											data-element="input" id="inp-03">
										<button type="button" data-element="remove"
											class="input__remove-button">
											<span class="hidden">삭제</span>
										</button>
										<button type="button" data-element="toggleShow"
											class="input__show-button pwConfirmEyeBtn" aria-label="비밀번호 보기"></button>
									</div>
								</div>
								<!-- 비밀번호 확인 입력 값과 불일치 시 -->
								<p tabindex="0" class="input__error" id="txtPwChk2"
									style="display: none;">비밀번호가 일치하지 않습니다.</p>
								<!-- //비밀번호 확인 입력 값과 불일치 시 -->
							</div>
						</div>
					<!-- //아이디,비밀번호 -->
					<!-- mobile -->
					<div class="input-row input-row--mobile">
						<div class="input-item">
								<div class="input-box inpPhoneDiv">
									<label for="inputPhone-02" class="input__label">휴대전화번호<span
										title="required" class="input__label-asterisk">*</span></label>
									<div data-element="form" class="input">
										<input type="text" id="inputPhone-02" class="input__text"
											maxlength="13" numberonly="" name="mobile">
										<button type="button" data-element="remove"
											class="input__remove-button">
											<span class="hidden">삭제</span>
										</button>
									</div>
								</div>
							<p tabindex="0" class="input__error" id="inputErrMessage"
								style="display: none;">입력하신 휴대전화번호를 다시 확인해주세요.</p>
						</div>
					</div>
					<!-- //mobile -->
					</div>
					<!-- 약관 동의 -->
					<div class="page-title-wrap">
						<div class="page-title">약관 동의</div>
						<div class="page-sub-title2">약관 동의</div>
					</div>
					<div class="agree-wrap mt0">
						<!--20210428 class추가-->
						<div class="check-wrap" data-element="checkList">
							<div class="check-wrap__all-check">
								<span class="checkbox"> <input type="checkbox"
									class="checkbox__input" id="inpAgree-All"
									data-gtm-form-interact-field-id="0"> <label
									for="inpAgree-All" class="checkbox__label"> <i
										class="checkbox__ico" aria-hidden="true"></i> <span>전체
											동의</span>
								</label>
								</span>
							</div>
							<ul class="check-wrap__list">
								<li class="agree-wrap__item" data-element="modal_anchor"
									data-target="#modalLayer01" data-modal-type="full"
									aria-label="(필수) 서비스 약관"><a href="#modalLayer01"><span
									class="checkbox checkbox--small"> <input type="checkbox"
										class="checkbox__input required chk" id="inpAgree-01"
										data-element="checkbox"> <label for="inpAgree-01"
										class="checkbox__label"> <i class="checkbox__ico"
											aria-hidden="true"></i> <span>(필수) 서비스 약관</span>
									</label>
								</span></a>
								</li>
								<li class="agree-wrap__item" data-element="modal_anchor"
									data-target="#modalLayer02" data-modal-type="full"
									aria-label="(필수) 개인정보 수집, 이용 동의"><span
									class="checkbox checkbox--small"> <input type="checkbox"
										class="checkbox__input required chk" id="inpAgree-02"
										data-element="checkbox"> <label for="inpAgree-02"
										class="checkbox__label"> <i class="checkbox__ico"
											aria-hidden="true"></i> <span>(필수) 개인정보 수집, 이용 동의</span>
									</label>
								</span>
								</li>

								<li class="agree-wrap__item" data-element="modal_anchor"
									data-target="#modalLayer03" data-modal-type="full"
									aria-label="(필수) 고유식별정보의 수집, 이용 동의"><span
									class="checkbox checkbox--small"> <input type="checkbox"
										class="checkbox__input required chk" id="inpAgree-03"
										data-element="checkbox"> <label for="inpAgree-03"
										class="checkbox__label"> <i class="checkbox__ico"
											aria-hidden="true"></i> <span>(필수) 고유식별정보의 수집, 이용 동의</span>
									</label>
								</span>
									<button type="button" class="agree-wrap__button"></button></li>

								<li class="agree-wrap__item" data-element="modal_anchor"
									data-target="#modalLayer04" data-modal-type="full"
									aria-label="(선택) 개인정보 유효기간 규정"><span
									class="checkbox checkbox--small"> <input type="checkbox"
										class="checkbox__input chk" id="inpAgree-04"
										data-element="checkbox"> <label for="inpAgree-04"
										class="checkbox__label"> <i class="checkbox__ico"
											aria-hidden="true"></i> <span>(선택) 개인정보 유효기간 규정</span>
									</label>
								</span>
									<button type="button" class="agree-wrap__button"></button></li>
								<!-- 간편 회원가입 -->
								<!-- [수정 : 210216] agree-wrap--toggle 추가 -->
								<li data-element="inputToggle" class="agree-wrap--toggle">
									<div class="agree-wrap__item">
										<span class="checkbox checkbox--small"> <input
											type="checkbox" class="checkbox__input chk" id="inpAgree-06"
											data-element="checkbox" data-toggle="toggle__anchor"
											aria-controls="inpAgree-06-0" aria-expanded="false">
											<label for="inpAgree-06" class="checkbox__label"> <i
												class="checkbox__ico" aria-hidden="true"></i> <span>(선택)
													마케팅 정보 수신 동의</span>
										</label>
										</span>
										<button type="button" class="agree-wrap__button"
											data-element="modal_anchor" data-target="#modalLayer05"
											data-modal-type="full" aria-label="(선택) 마케팅 정보 수신 동의"></button>
									</div>
									<div data-toggle="toggle__panel" id="inpAgree-06-0"
										style="display: none;">
										<div class="gray-box cancel--mt">
											<div class="check-wrap">

												<span class="checkbox checkbox--line"> <input
													type="checkbox" id="inputCheck5-2" data-element="checkbox"
													class="checkbox__input" data-target-depth="sub"> <label
													for="inputCheck5-2" class="checkbox__label"> <span>문자</span>
														<i aria-hidden="true" class="checkbox__ico"></i>
												</label>
												</span> <span class="checkbox checkbox--line"> <input
													type="checkbox" id="inputCheck5-3" data-element="checkbox"
													class="checkbox__input" data-target-depth="sub"> <label
													for="inputCheck5-3" class="checkbox__label"> <span>이메일</span>
														<i aria-hidden="true" class="checkbox__ico"></i>
												</label>
												</span>
											</div>
										</div>
									</div> <!-- (국외) 이메일 인증 가입, 간편 회원가입 -->
									<div class="guide-info guide-info--gray">
										<p class="guide-info__text">마케팅 정보 수신에 동의하시면 이벤트, 프로모션 등
											특가 정보를 발송해 드립니다.</p>
									</div> <!-- //(국외) 이메일 인증 가입, 간편 회원가입 -->
								</li>
								<li class="14up" style="display: none;">
									<div class="agree-wrap__item">
										<span class="checkbox checkbox--small"> <input
											type="checkbox" class="checkbox__input chk" id="inpAgree-07"
											data-element="checkbox"> <label for="inpAgree-07"
											class="checkbox__label"> <i class="checkbox__ico"
												aria-hidden="true"></i> <span> (필수) 14세 이상입니다 </span>
										</label>
										</span>
									</div>
								</li>
								<!-- //간편 회원가입 -->
							</ul>
						</div>

					</div>
					<!-- //약관 동의 -->
					<!-- 풀팝업 -->
					<div id="modalLayer01" class="modal modal-full modal-scroll modal--fixed-multi">
					<div class="modal-header">
						<div class="modal-header__title">서비스 약관</div>
					</div>
					<div class="modal-content" id="termBox01"><div class="section-sub-txt"><p><b>제1조(목적)</b></p><p>이 약관은 ㈜제주항공(이하 "제주항공"이라 합니다)이 운영하는 제주항공 인터넷 웹사이트 이하 "www.jejuair.net"이라 합니다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 합니다)를 이용함에 있어 제주항공과 이용자의 권리.의무 및 책임사항을 규정함을 목적으로 합니다.,</p><p><br></p><p><br></p><p><b>제2조(정의)</b></p><p>① "www.jejuair.net"이란 제주항공이 컴퓨터 등 정보통신설비와 정보통신망을 이용하여 정보 및 서비스를 이용자에게 제공하고 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말합니다.</p><p><br></p><p>② "이용자"란 www.jejuair.net에 접속하여 이 약관에 따라 제주항공이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.</p><p><br></p><p>③ "회원"이라 함은 www.jejuair.net에 개인정보를 제공하여 회원등록을 한 자로서, 제주항공이 www.jejuair.net을 통하여 지속적으로 제공하는 정보 및 서비스를 계속적으로 이용할 수 있는 자를 말합니다.</p><p><br></p><p>④ "비회원"이라 함은 회원으로 가입하지 않고 제주항공이 제공하는 정보 및 서비스를 이용하는 자를 말합니다.</p><p><br></p><p><br></p><p><b>제3조 (약관의 명시와 개정)</b></p><p>① 제주항공은 이 약관의 내용과 상호, 연락처(전자우편주소, 전화번호, 팩스번호 등) 등을 이용자가 알 수 있도록 www.jejuair.net의 초기 서비스화면(전면)에 게시합니다.</p><p><br></p><p>② 제주항공은 약관의 규제 등에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용촉진 및 정보보호등에 관한 법률, 방문판매등에 관한 법률, 소비자보호법 등 관련법령을 위반하지 않는 범위에서 이 약관을 개정할 수 있습니다.</p><p><br></p><p>③ 약관을 개정할 경우에는 개정사유 및 적용일자를 명시하여 현행약관과 함께 www.jejuair.net의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.</p><p><br></p><p>④ 개정약관은 그 적용일자 전에 체결된 계약에 대해서도 적용됩니다. 다만 개정약관의 적용을 거절하는 뜻을 제주항공에 명시적으로 통지한 이용자에 대해서는 개정전의 약관조항이 적용됩니다.</p><p><br></p><p>⑤ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자거래소비자보호지침, 관계법령 또는 상관례에 따릅니다.</p><p><br></p><p><br></p><p><b>제4조(www.jejuair.net의 업무사항)</b></p><p>제주항공이 www.jejuair.net을 통하여 수행하는 업무는 아래와 같습니다.</p><p><br></p><p>1. 항공권, 여행 등 관련 정보.서비스 제공</p><p><br></p><p>2. 항공권 구매계약 등 계약의 체결</p><p><br></p><p>3. 기타 제주항공이 정하는 업무</p><p><br></p><p><br></p><p><b>제5조(서비스의 중단)</b></p><p>① 제주항공은 컴퓨터 등 정보통신설비의 점검.보수.교체 등의 경우에 www.jejuair.net의 서비스 제공을 일시적으로 중단할 수 있습니다.</p><p><br></p><p>② 제1항에 의한 서비스 중단의 경우 제주항공은 본 약관 제8조에서 정한 방법으로 이용자에게 통지합니다.</p><p><br></p><p>③ 제주항공은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해를 배상합니다. 다만 제주항공에 고의 또는 중대한 과실이 없는 경우에는 그러하지 아니합니다.</p><p><br></p><p><b><br></b></p><p><b>제6조(회원가입)</b></p><p>① 이용자는 www.jejuair.net에 정해진 가입양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 하는 방법으로 회원가입을 신청합니다.</p><p><br></p><p>② 제주항공은 이용자가 다음 각호의 1에 해당하지 않는 한 회원가입신청을 승낙합니다.</p><p><br></p><p>1. 가입신청자가 이 약관 제7조 제4항에 의하여 회원자격을 상실 한 경우. 다만 회원자격 상실 후 3년이 경과한 자로서 제주항공의 회원 재가입 승낙을 얻은 경우는 예외로 합니다.</p><p><br></p><p>2. 등록 내용에 허위, 기재누락, 오기가 있는 경우</p><p><br></p><p>3. 기타 회원으로 등록하는 것이 기술적으로 현저히 지장이 있다고 판단되는 경우</p><p><br></p><p>③ 회원가입계약의 성립시기는 제주항공의 승낙이 회원에게 도달한 시점으로 합니다.</p><p><br></p><p>④ 회원은 제13조 제1항에 열거된 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 이에 준하는 방법으로 www.jejuair.net에 그 변경사항을 알려야 합니다.</p><p><br></p><p><br></p><p><b>제7조(회원탈퇴 및 자격상실 등)</b></p><p>① 회원은 www.jejuair.net에 언제든지 탈퇴신청을 할 수 있으며, 이 경우 제주항공은 즉시 회원탈퇴를 처리합니다.</p><p><br></p><p>② 회원이 다음 각호의 1에 해당하는 경우 제주항공은 서비스이용을 제한 또는 정지시킬 수 있습니다.</p><p><br></p><p>1. 가입 신청 시 허위 내용을 기재하거나 2 이상의 I.D.로 이중등록한 경우</p><p><br></p><p>2. www.jejuair.net에서 구매한 항공권 등의 대금지급채무 기타 www.jejuair.net 이용과 관련 회원이 부담하는 채무를 불이행하는 경우</p><p><br></p><p>3. 타인의 www.jejuair.net 이용을 방해하거나 타인의 개인정보를 도용하는 등 전자거래질서를 침해.위협하는 경우</p><p><br></p><p>4. www.jejuair.net을 이용하여 이 약관이 금지하는 행위 또는 법령, 공서양속 등에 반하는 행위를 하는 경우</p><p><br></p><p>③ 제주항공이 서비스 이용을 제한.정지하고자 할 때에는 미리 그 사유, 일시, 기간을 전자우편, 전화, 서면 등으로 당해 이용자에게 통지합니다. 다만 긴급을 요할 경우에는 조치 후에 통지할 수 있습니다.</p><p><br></p><p>④ 제주항공이 서비스이용을 제한.정지시킨 후 그 제재사유가 된 행위가 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 제주항공은 회원자격을 박탈할 수 있습니다.</p><p><br></p><p>⑤ 제주항공이 회원자격을 박탈하는 경우에는 회원등록을 말소하며, 이 경우 말소 전에 회원에게 이를 통지합니다.</p><p><br></p><p>⑥ 서비스이용의 제한.정지, 회원자격의 박탈로 인한 손해에 대해서 제주항공은 책임을 지지 않습니다.</p><p><br></p><p><br></p><p><b>제8조(회원에 대한 통지)</b></p><p>① 제주항공이 회원에 대한 통지를 하는 경우 회원이 제출한 전자우편주소로 할 수 있습니다.</p><p><br></p><p>② 제주항공은 불특정 다수의 회원에게 통지하는 경우, 1주일 이상 www.jejuair.net에 공시함으로써 개별통지에 갈음할 수 있습니다.</p><p><br></p><p><br></p><p><b>제9조(구매신청)</b></p><p>이용자는 www.jejuair.net에서 아래 방법에 의하여 구매신청을 할 수 있습니다.</p><p><br></p><p>1. 성명, 주소, 전화번호 입력</p><p><br></p><p>2. 재화 또는 용역의 선택</p><p><br></p><p>3. 결제방법의 선택</p><p><br></p><p>4. 이 약관에 동의한다는 표시(예: 마우스 클릭)</p><p><br></p><p><b><br></b></p><p><b>제10조 (계약의 성립)</b></p><p>① 제주항공은 제 9조에 정한 방법에 의한 구매신청에 대하여 다음 각 호의 1에 해당하지 않는 한 승낙합니다.</p><p><br></p><p>1. 신청 내용에 허위, 기재누락, 오기가 있는 경우</p><p><br></p><p>2. 구매신청에 대한 승낙이 영업상 또는 기술상 현저히 지장이 있다고 판단되는 경우</p><p><br></p><p>② 제주항공의 승낙이 제 12조 제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.</p><p><br></p><p><br></p><p><b>제11조(결제방법)</b></p><p>www.jejuair.net에서 구매한 재화.용역에 대한 대금결제는 아래의 방법으로 할 수 있습니다.</p><p><br></p><p>1. 신용카드결제</p><p><br></p><p>2. 실시간 계좌이체</p><p><br></p><p><br></p><p><b>제12조(수신확인통지.구매신청 변경 및 취소)</b></p><p><br></p><p>① 제주항공은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.</p><p><br></p><p>② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있습니다.</p><p><br></p><p><br></p><p><b>제13조(개인정보보호)</b></p><p>① "회사"는 "정보통신망법" 등 관계 법령이 정하는 바에 따라 "회원"의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련법 및 "회사"의 개인정보처리방침이 적용됩니다. 다만, "회사"의 공식 사이트 이외의 링크된 사이트에서는 "회사"의 개인정보처리방침이 적용되지 않습니다.</p><p><br></p><p><br></p><p><b>제14조(제주항공의 의무)</b></p><p>① 제주항공은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고 안정적인 서비스 제공 및 재화.용역의 공급에 노력합니다.</p><p><br></p><p>② 제주항공은 이용자가 안전하게 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추겠습니다.</p><p><br></p><p>③ 제주항공이 상품이나 용역에 관하여 「표시.광고의공정화에관한법률」 제 3조 소정의 부당한 표시.광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.</p><p><br></p><p>④ 제주항공은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.</p><p><br></p><p><b><br></b></p><p><b>제15조(회원의 I.D. 및 비밀번호에 대한 의무)</b></p><p><br></p><p>① 제 13조의 경우를 제외한 I.D.와 비밀번호에 대한 관리책임은 회원에게 있습니다.</p><p><br></p><p>② 회원은 제 3자에게 자신의 I.D. 및 비밀번호를 이용하게 해서는 안됩니다.</p><p><br></p><p>③ 회원이 자신의 I.D. 및 비밀번호를 도용 당하거나 제 3자가 사용하고 있음을 인지한 경우에는 즉시 제주항공에 통보하여 그 안내에 따라야 합니다.</p><p><br></p><p><b><br></b></p><p><b>제16조(이용자의 의무)</b></p><p>이용자는 이 약관 및 관계법령을 준수하여야 하며, 다음의 행위를 해서는 안됩니다.</p><p><br></p><p>1. 신청 또는 변경 시 허위내용의 기재</p><p><br></p><p>2. www.jejuair.net에 게시된 정보의 임의변경</p><p><br></p><p>3. 제주항공이 허용하고 있지 않은 정보나 컴퓨터 프로그램 등을 무단으로 송신 또는 게시하는 행위</p><p><br></p><p>4. 제주항공 기타 제 3자의 저작권 등 지적재산권 침해</p><p><br></p><p>5. 제주항공 기타 제 3자의 프라이버시를 침해하거나 업무를 방해하는 행위</p><p><br></p><p>6. 외설적 또는 폭력적 메시지.화상.음성 기타 공서양속에 반하는 정보를 송신 또는 게시하는 행위</p><p><br></p><p><br></p><p><b>제17조(www.jejuair.net과 하위 웹사이트 간의 관계)</b></p><p>www.jejuair.net이 하위 웹사이트와 하이퍼 링크(하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 포함)방식 등으로 연결된 경우, 제주항공은 하위 웹사이트가 이용자와 독자적으로 체결한 재화.용역 공급계약 등 거래에 관하여 보증책임을 지지 않습니다.</p><p><br></p><p><b><br></b></p><p><b>제18조(저작권의 귀속 및 이용제한)</b></p><p>① 제주항공이 작성한 저작물에 대한 저작권 기타 지적재산권은 제주항공에 귀속합니다.</p><p><br></p><p>② 이용자는 www.jejuair.net을 이용함으로써 얻은 정보를 제주항공의 사전 승낙없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제 3자로 하여금 이용하게 해서는 안됩니다.</p><p><br></p><p><br></p><p><b>제19조(분쟁해결)</b></p><p>① 제주항공은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치.운영합니다.</p><p><br></p><p>② 제주항공은 이용자가 제기하는 불만사항 및 의견을 신속.적정하게 처리합니다. 다만 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 지체 없이 통보해 드립니다.</p><p><br></p><p>③ 제주항공과 이용자간에 분쟁 발생시 전자거래기본법 제 28조 및 동 시행령 제 15조에 근거하여 설치된 전자거래분쟁조정위원회의 조정에 따를 수 있습니다.</p><p><br></p><p><b><br></b></p><p><b>제20조(관할법원 및 준거법)</b></p><p><br></p><p>① 제주항공과 이용자간에 발생한 전자거래 분쟁에 관한 소는 서울지방법원에 제기합니다.</p><p><br></p><p>② 제주항공과 이용자간에 제기된 전자거래 소송에는 한국법을 적용합니다.</p><p><br></p><p><br></p><p><b>제주항공 Refresh Point 회원 일반 규정</b></p><p><b><br></b></p><p><b>제 1 조</b></p><p>제주항공의 Refresh Point 회원은 제주항공 공식 웹사이트 또는 모바일 웹&amp;앱에서 회원으로 가입을 완료하신 분을 말합니다. 가입 자격은 본 프로그램이 제한을 받지 않는 국가에 거주하시면 누구라도 가입 가능합니다. 회원 계정은 개별 회원에게 1인 1계정만 허용 됩니다.</p><p><br></p><p><b>제 2 조</b></p><p>회원님의 주소, 이메일 주소(e-mail address) 및 전화번호 등 개인정보의 변경이 있을 시 해당 정보를 제주항공 공식 웹사이트 또는 모바일 웹&amp;앱을 통해 수정 반영하셔야 합니다. 해당 정보의 변경 및 반영이 되지 않거나 지연 됨으로 인해 가입하신 회원에게 발생한 손해에 대해서는 제주항공은 책임을 지지 않습니다.</p><p><br></p><p><b>제 3 조</b></p><p>회원자격 및 혜택은 Refresh Point 회원 가입 일로부터 회원 본인에게만 제공됩니다. 회원 카드는 이미지 카드 형태로 발급 되며 회원 가입을 완료 하시면 공식 웹사이트 또는 모바일 웹&amp;앱에서 확인하실 수 있습니다. 또한 회원카드번호의 분실, 도난, 누출로 인한 피해는 제주항공이 책임을 지지 않습니다.</p><p><br></p><p><b>제 4 조</b></p><p>Refresh Point 적립은 지불하신 현금 운임에 비례하여 해당 항공편 탑승을 완료하신 Refresh Point 회원에게만 적립됩니다. 즉, 천재지변, 기상조건, 불가항력, 파업, 폭동, 소요, 출입국 금지, 동란, 전쟁, 기재 고장 등의 사유로 항공편 탑승이 완료되지 않은 경우에는 포인트 적립이 되지 않습니다. 포인트는 적립 일로부터 3년간 유효하며, 유효기간 내에 사용되지 않은 포인트는 소멸 처리 됩니다. 항공편 탑승 포인트 적립 이외에 제주항공 공식웹사이트 또는 모바일웹&amp;앱에서 포인트를 구매 하시거나 선물 또는 양도를 통해 받으신 포인트는 해당 시점에서 즉시 적립이 됩니다. 또한, 제주항공에서 인정한 공식 제휴 처를 통해서도 포인트를 적립 받으실 수 있습니다.</p><p><br></p><p><b>제 5 조</b></p><p>회원님이 Refresh Point 혜택을 제공받기 위해 제휴사를 이용할 경우 해당 제휴사의 규정에 따라야 합니다. Refresh Point 회원과 제휴사간의 개별적인 계약 조건은 제주항공과 무관합니다. 제휴사를 통해 적립한 Refresh Point는 제주항공이 제시하는 서비스로만 사용될 수 있습니다. 또한 Refresh Point의 제휴사 프로그램은 제휴사의 사정에 따라 사전 통보 없이 변경되거나 중단 될 수 있습니다.</p><p><br></p><p><b>제 6 조</b></p><p>Refresh Point는 항공권의 운임(클래스)에 따라 포인트가 차등 적립 되거나 회원 등급 혜택이 제한될 수 있습니다.</p><p><br></p><p><b>제 7 조</b></p><p>Refresh Point의 회원 자격은 실버, 실버플러스,골드, VIP 회원 등급으로 구분이 되며 각 회원 등급의 자격 유지 기간은 승급 일로부터 3년간 유효 합니다. 회원 등급의 승급 기준은 각 승급 조건을 충족하는 날이 속한 달의 익월 10일에 자동으로 승급 되며, 3년 간 해당 회원 등급의 자격 유지 조건을 미 충족할 경우에도 매 익월 10일에 등급 별 기준에 재 산정되어 반영 됩니다.</p><p><br></p><p><b>제 8 조</b></p><p>Refresh Point 양도 제도는 본인 외에 제주항공 회원에 한하여 최대 4인까지 양수 회원으로 등록이 가능하며, 등록된 양수 회원은 매년 1월 1일을 기준으로 연간 1회 변경이 가능합니다. 양도 가능한 적립 포인트는 등록된 양수 회원을 제외하고 타인에게 제공/양도할 수 없으며, 양도된 포인트는 재 양도가 불가능 합니다.</p><p><br></p><p><b>제 9 조</b></p><p>Refresh Point 회원님께서 등록하신 국가 및 주소지에 의해 지역별 혜택의 구분이 있을 수 있습니다.</p><p><br></p><p><b>제 10 조</b></p><p>포인트 항공권 사용 시 발생되는 세금, 유류할증료, 수수료(포인트 항공권 직접 발급 수수료 포함) 등의 제반 수수료는 이용하시는 회원님께서 부담하셔야 합니다.</p><p><br></p><p><b>제 11 조</b></p><p>제주항공은 회원 계정을 검색하여 회원의 제반 실적이 잘못된 경우에는 이를 임의로 정정할 수 있습니다.</p><p><br></p><p><b>제 12 조</b></p><p>제주항공은 회원님께서 Refresh Point 규정을 위반하신 경우 회원 자격을 박탈 할 수 있습니다. 또한 제주항공에서 규정한 방법 이외에 본 프로그램의 포인트를 금전적으로 환산하여 교환할 의사를 밝히거나, 실제 유상 판매 또는 교환하는 행위를 엄격히 금지 하며, 해당 행위가 적발 될 경우 모든 적립된 포인트가 말소 됩니다.</p><p><br></p><p><b>제 13 조</b></p><p>제주항공 이용실적 또는 포인트와 관련된 제반 이의는 해당 항공편 탑승일 또는 포인트 발행일로부터 1년 이내에 제기하셔야 합니다.</p><p><br></p><p><b>제 14 조</b></p><p>Refresh Point 회원 혹은 대리인이 각종 증빙서류 위/변조, 서류의 허위기재, 회원 규정 위반 혹은 악용 시에는 회원자격 박탈, 회원계좌 폐쇄, 적립 포인트 삭제 혹은 발급된 보너스를 취소시킬 수 있으며, 해당 회원 및 대리인에 대해 (재)가입을 불허할 수 있습니다. 또한 부당한 방법에 의해 포인트를 발급, 사용한 경우 제주항공은 유상 운임에 상응하는 현금 배상 청구 및 필요한 법적 조치를 취할 수 있습니다.</p><p><br></p><p><b>제 15 조</b></p><p>회원 개인의 신상에 변동이 생기더라도 누적된 포인트는 제 3자에게 이전되지 않으며 사망한 회원의 누적 포인트는 상속될 수 없으며 소멸됩니다.</p><p><b><br></b></p><p><b>제 16 조</b></p><p>Refresh Point의 제반 규정은 관련 법령의 제정, 개정 및 폐지된 경우, 국제적 제휴를 위하여 Global Standard와의 균형을 맞추기 위해 불가피한 경우, 일반 항공권 가격의 상당한 변동으로 인하여 발생한 포인트 제도의 불균형을 시정하기 위하여 필요한 경우, 항공 수요의 급격한 변화, 기타 항공산업의 중대한 위기를 초래할 우려가 있는 불가항력적인 사정이 상당 기간 동안 지속되는 경우, 국가 경제의 심각한 악화, 국가 신용도의 급격한 하락, 기타 이에 준하는 경제 상황의 중대한 변동으로 인하여 불가피한 경우 등 상당한 이유가 있는 경우 3개월 사전 고지 후 변경될 수 있습니다. 다만, 규정 변경 발효일 이전까지 회원님께서 취득한 포인트의 경우에는 포인트 공제로 지급되는 포인트 항공권에 대하여 발효일로부터 12개월까지는 변경전의 공제기준이 적용됩니다.</p><p><br></p><p><b>제 17 조</b></p><p>제주항공은 포인트 적립 기록이 없는 회원님에 대해 전자메일, 포인트 실적 및 각종 프로모션 홍보물 등을 발송하지 않을 수도 있습니다. 또한 특별 보너스 포인트 등의 프로모션 정보를 회원님의 정보 내용, 지리적 위치 등에 따라 선별적으로 회원님께 제공할 수 있습니다. 프로모션 정보 및 Refresh Point 프로그램 변경 등의 정보는 Refresh Point의 회원 데이터베이스에 있는 주소에 한하여 발송합니다.</p><p><br></p><p><b>제 18 조</b></p><p>본 약관과 관련하여 가장 최근에 발행된 회원안내서 또는 ㈜제주항공 홈페이지에 등재된 내용이 이전의 모든 규정과 조건보다 우선합니다.</p><p><br></p></div></div>
					<div class="fixed-wrap fixed-wrap--multi-line border-none ">
						<div class="button-wrap">
						<button type="button" id="confirmBtn01" rel="modal:close" class="button button--primary button--active "><span class="button__text">동의</span></button>
						<button type="button" id="cancelBtn01" rel="modal:close" class="button button--primary button--active2 "><span class="button__text">동의 안함</span></button>
						</div>
					</div>
					<a href="#" rel="modal:close" class="modal__close"><span class="blind">닫기</span></a>
					</div>

					<!-- 풀팝업 -->
					<div id="modalLayer02"
						class="modal modal-full modal-scroll modal--fixed-multi">
						<div class="modal-header">
							<div class="modal-header__title">개인정보 수집, 이용 동의</div>
						</div>
						<div class="modal-content" id="termBox02"><div class="section-title">1. 개인정보의 수집/이용 목적</div>
							<div class="section-sub-txt">
							1) 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금 정산<p>- 콘텐츠 제공, 항공권 예약ㆍ발권, 항공권 등 각종 물품배송 또는 청구서 발송, 구매 및 요금결재, 요금추심</p><p><br></p><p>2) 회원관리</p><p><span style="font-size: 14px;">- 회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 가입 및 가입횟수 제한, 만 14세 미만 아동 개인 정보 수집 시 법정 대리인 동의여부 확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달, 항공기 안전운항을 위한 탑승객 관리 등</span><br></p><p><br></p><p>3) 신규서비스 개발 및 통계 활용</p><p>- 신규 서비스 개발, 이용자의 서비스 이용에 대한 통계</p><p><br></p></div>
							
							<div class="section-title">2. 수집하는 개인정보의 항목</div>
							
							<div class="section-sub-txt">1) 실명확인 회원가입 시</div><div class="section-sub-txt"><span style="font-size: 14px;">- 필수항목 : 아이디, 비밀번호, 성별, 성명, 생년월일, 국적, 거주국가, 이메일주소, 전화번호(휴대폰번호, 자택번호 중 택일), 연계정보(CI), 중복가입확인정보(DI) , 만14세 미만은 법정대리인정보</span><br></div><div class="section-sub-txt"><p><span style="font-size: 14px;">- 선택항목 : 관계사정보(관계사명, 부서, 직책, 팩스번호)</span><br></p><p><br></p><p>2) 외국인, 해외거주자 회원가입 시</p><p>- 필수항목 : 아이디, 비밀번호, 성별, 성명, 생년월일, 국적, 거주국가, 이메일주소, 전화번호(휴대폰 번호, 자택번호 중 택일)</p><p><br></p><p>3) 회원정보 수정 시</p><p>- 선택항목 : 여권번호</p><p><br></p><p>4) 비회원 항공권 예약 시</p><p>- 필수항목 : 연락처(핸드폰 번호, 자택 번호 중 택일), 이메일, 성명</p><p><br></p><p>5) 서비스 이용에 대한 요금결제 시</p><p>- 신용카드 결제: 카드번호 및 카드 인증정보 등</p><p>- 실시간 계좌이체 : 계좌번호 및 결제은행 코드 등</p><p><br></p></div>
							
							<div class="section-title">3. 개인정보의 보유 및 이용기간</div>
							
							<div class="section-sub-txt"><p>이용자의 동의 하에 수집된 개인정보는 이용자가 제주항공 인터넷 웹사이트상의 서비스를 이용하는 동안 보유/이용 됩니다.</p><p>회사는 아래와 같이 개인정보의 수집 및 이용 목적이 달성된 개인정보를 지체 없이 파기하겠습니다.</p><p><br></p><p>1) 회원 가입 정보의 경우: 회원 탈퇴 요청이 있거나 회원 자격을 상실한 때</p><p>2) 설문조사, 이벤트 등 일시적 목적을 위하여 수집한 경우: 당해 설문조사, 이벤트 등 종료한 때</p><p>3) 사업을 폐지하는 경우</p><p><br></p><p>다만, 개인정보의 수집 및 이용 목적이 달성된 경우에도 상법, 전자상거래 등에서의 소비자 보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요성이 있는 경우 및 사전에 보유기간을 이용자에게 고지하거나 명시한 경우 등은 그에 따라 개인정보를 보관할 수 있습니다. 또한, 대통령령으로 정하는 기간동안 이용 하지 아니하는 이용자의 개인정보는 다른 이용자와 분리 하여 별도로 저장/관리 될수 있습니다. 별도로 저장/관리되는 개인정보는 법률에 특별한 규정이 있는 경우를 제외 하고는 이용하거나 제공 하지 않습니다.</p><p><br></p><p>1) 계약 또는 청약철회 등에 관한 기록, 대금 결제 및 재화 등의 공급에 관한 기록</p><p>보존 사유: 전자상거래 등에서의 소비자 보호에 관한 법률</p><p>보존 기간: 5년</p><p><br></p><p>2) 소비자의 불만 또는 분쟁 처리 기록</p><p>보존 사유: 전자상거래 등에서의 소비자 보호에 관한 법률</p><p>보존 기간: 3년</p><p><br></p><p>3) 전자금융 거래에 관한 기록</p><p>보존 사유: 전자금융거래법</p><p>보존 기간: 5년</p><p><br></p><p>4) 홈페이지 방문에 관한 기록</p><p>보존 사유: 통신비밀보호법</p><p>보존 기간: 3개월</p><p><br></p><p>4. 개인정보의 처리 위탁</p><p>회사는 서비스 이행을 위해 아래와 같이 개인정보를 위탁하고 있으며, 관계법령에 따라 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정 하고 있습니다. 회사의 개인정보 취급위탁처리 기관 및 위탁 업무 내용은 아래와 같습니다.</p><p><br></p></div>
							
							<div class="section-sub-txt">
							
							<table>
							
							<caption>회사의 개인정보 취급위탁처리 기관 및 위탁 업무 내용</caption>
							
							<colgroup>
								<col style="width:40%">
								<col style="width:60%">
							  </colgroup>
							
							  <thead class="table-horizontal__thead">
								<tr>
								  <th scope="col" class="table-horizontal__th">수탁자</th>
								  <th scope="col" class="table-horizontal__td">위탁하는 업무의 내용</th>
								</tr>
							  </thead>
							
							  <tbody class="table-horizontal__tbody">
								<tr>
								  <th class="table-horizontal__td">에이케이아이에스</th>
								  <th class="table-horizontal__td">인터넷 홈페이지 및 시스템 관리</th>
							   </tr>
								<tr>
								  <th class="table-horizontal__td">(주)위딘씨앤씨</th>
								  <th class="table-horizontal__td">이벤트 진행 및 경품발송, 광고성 정보 전달</th>
							   </tr>
								<tr>
								  <th class="table-horizontal__td">NICE신용평가정보(주)</th>
								  <th class="table-horizontal__td">실명인증 및 본인확인</th>
							   </tr>
								<tr>
								  <th class="table-horizontal__td">(주)샤프에이비에이션케이, 한국도심공항자산관리(주), 아시아나에어포트(주), (주)제이에이에스, 공항철도(주), 한국철도공사, 한국공항공사</th>
								  <th class="table-horizontal__td">탑승수속 업무</th>
							   </tr>
								<tr>
								  <th class="table-horizontal__td">(주)샤프에이비에이션케이, (주)제이에이에스, 한국공항공사</th>
								  <th class="table-horizontal__td">오프라인 서식(FORM OF INDEMNITY FOR 서약서, 악기 서약서, 애완동물 운송 서약서, 피해구제 청구 신청서, 보상금 계좌입금 양식, 항공권 환불 신청 위임장) 수집</th>
							   </tr>
								<tr>
								  <th class="table-horizontal__td">㈜트랜스코스모스코리아, kt cs</th>
								  <th class="table-horizontal__td" 정산업무="" 고객센터="" 및="" 이용자="" 불만사항="" 처리="" th="">정산업무, 고객센터 및 이용자 불만사항 처리
							   </th></tr>
								
								<tr>
								  <th class="table-horizontal__td">KICC, FDK, 주식회사 엑심베이 , 엘지씨엔에스, 갤럭시아커뮤니케이션즈(주), KG이니시스</th>
								  <th class="table-horizontal__td">항공권 구매에 대한 대금결제 업무</th>
							   </tr>
							
								<tr>
								  <th class="table-horizontal__td">SITA, Navitaire</th>
								  <th class="table-horizontal__td">항공권 예약 등 항공여행에 필요한 서비스 제공</th>
							   </tr> 
							   	<tr>
								  <th class="table-horizontal__td">㈜티몬</th>
								  <th class="table-horizontal__td">티몬 서비스를 통한 회사 항공권 구매이용자 응대</th>
							   </tr>
							   	<tr>
								  <th class="table-horizontal__td">폴렉스존</th>
								  <th class="table-horizontal__td">제휴카드 서비스안내를 위한 TM 업무</th>
							   </tr>
							  	<tr>
								  <th class="table-horizontal__td">엘지씨엔에스</th>
								  <th class="table-horizontal__td">카카오톡 알림톡 발송 및 SMS / LMS / MMS 발송</th>
							   </tr>
							  	<tr>
								  <th class="table-horizontal__td">Amazon Web Service</th>
								  <th class="table-horizontal__td">데이터 보관 및 시스템 운영</th>
							   </tr>
							  	<tr>
								  <th class="table-horizontal__td">해외지점 협력사 </th>
								  <th class="table-horizontal__td">예약, 발권, 탑승수속 업무</th>
							   </tr>
							        <tr>
							<th class="table-horizontal__td">(주)제이케이삼영</th>
								  <th class="table-horizontal__td">AirCafe 구매 물품 배송</th>
							</tr>
							  </tbody> 
							  
							  </table>
							
							</div></div>
						<div class="fixed-wrap fixed-wrap--multi-line border-none">
							<!-- checkbox 없는 경우 border-none class 추가 -->
							<div class="button-wrap">
								<button type="button" id="confirmBtn02" rel="modal:close"
									class="button button--active">
									<span class="button__text">동의</span>
								</button>
								<button type="button" id="cancelBtn02" rel="modal:close"
									class="button button--active2">
									<span class="button__text">동의 안함</span>
								</button>
							</div>
						</div>
						<a href="#" rel="modal:close" class="modal__close"><span
							class="blind">닫기</span></a>
					</div>

					<!-- 풀팝업 -->

					<div id="modalLayer03"
						class="modal modal-full modal-scroll modal--fixed-multi">
						<div class="modal-header">
							<div class="modal-header__title">고유식별정보의 수집, 이용 동의</div>
						</div>
						<div class="modal-content" id="termBox03"><div class="section-sub-txt"><p><b>1. 수집하는 고유식별정보 항목 및 수집방법</b></p><p><br></p><p>1) 수집항목</p><p>- 부가 서비스 및 맞춤식 서비스 이용 과정에서 해당 서비스의 이용자에 한해서만 아래와 같은 정보들이 수집될 수 있습니다.</p><p><span style="font-size: 14px;">- 필수항목 : 여권번호 (국제선 예약 ∙ 발권 시)</span><br></p><p><br></p><p>2) 수집 방법 및 동의</p><p><span style="font-family: sans-serif; font-size: 14px;">-</span><span style="font-family: sans-serif; font-size: 14px;">&nbsp;</span>개인정보 수집방법 : 홈페이지 및 SNS (회원가입, Q&amp;A 게시판), 제휴사로부터의 제공</p><p><span style="font-family: sans-serif; font-size: 14px;">-</span><span style="font-family: sans-serif; font-size: 14px;">&nbsp;</span>고유식별정보 수집 동의 방법 온라인 : 회사는 고객이 개인정보취급방침 또는 이용약관의 내용에 대해 '동의함’ 버튼을 클릭할 수 있는 절차를 마련하고 있으며, '동의함' 버튼을 클릭하면 고유식별정보 수집에 대해 동의한 것으로 봅니다.</p><p><br></p><p><b>2. 고유식별정보의 수집 및 이용목적</b></p><p><br></p><p>1) 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공, 항공권 예약ㆍ발권, 항공권 등 각종 물품배송 또는 청구서 발송, 구매 및 요금결재, 요금추심</p><p><br></p><p>2) 회원관리</p><p>회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 가입 및 가입횟수 제한, 만 14세 미만 아동 개인 정보 수집 시 법정 대리인 동의여부 확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달</p><p><br></p><p>3) 신규서비스 개발</p><p>신규 서비스 개발 및 특화, 서비스의 유효성 확인</p><p><br></p><p><b>3. 고유식별정보의 보유 및 이용기간</b></p><p><b><br></b></p><p>이용자의 동의 하에 수집된 고유식별정보는 이용자가 제주항공 인터넷 웹사이트상의 서비스를 이용하는 동안 보유/이용됩니다.</p><p><br></p><p>당사는 아래와 같이 고유식별정보를 포함한 개인정보의 수집 및 이용 목적이 달성된 때 수집된 개인정보를 지체 없이 파기하겠습니다.</p><p>- 회원 가입 정보의 경우 : 회원 탈퇴 요청이 있거나 회원 자격을 상실한 때</p><p>- 설문조사, 이벤트 등 일시적 목적을 위하여 수집한 경우 : 당해 설문조사, 이벤트 등 종료한 때</p><p>- 사업을 폐지하는 경우</p><p><br></p><p>다만, 개인정보의 수집 및 이용 목적이 달성된 경우에도 상법, 전자상거래 등에서의 소비자 보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요성이 있는 경우 및 사전에 보유기간을 이용자에게 고지하거나 명시한 경우 등은 그에 따라 개인정보를 보관할 수 있습니다. 또한, 대통령령으로 정하는 기간동안 이용 하지 아니하는 이용자의 개인정보는 다른 이용자와 분리 하여 별도로 저장/관리 될수 있습니다. 별도로 저장/관리되는 개인정보는 법률에 특별한 규정이 있는 경우를 제외 하고는 이용하거나 제공 하지 않습니다.</p><p><br></p><p>1) 계약 또는 청약철회 등에 관한 기록, 대금 결제 및 재화 등의 공급에 관한 기록</p><p>보존 사유: 전자상거래 등에서의 소비자 보호에 관한 법률</p><p>보존 기간: 5년</p><p><br></p><p>2) 소비자의 불만 또는 분쟁 처리 기록</p><p>보존 사유: 전자상거래 등에서의 소비자 보호에 관한 법률</p><p>보존 기간: 3년</p><p><br></p><p>3) 전자금융 거래에 관한 기록</p><p>보존 사유: 전자금융 거래에 관한 기록</p><p>보존 기간: 3년</p><p><br></p><p>4) 홈페이지 방문에 관한 기록</p><p>보존 사유: 통신비밀보호법</p><p>보존 기간: 3개월</p><p><br></p><p><b>4. 고유식별정보의 수집 및 이용에 대한 동의 거부 관련</b></p><p><b><br></b></p><p>회사는 고객이 서비스 이용을 위한 회원 가입 시 서비스제공을 위해 최소한의 고객정보를 수집합니다. 다만, 고객에게 보다 양질의 서비스제공을 위해 기본 정보 이외의 추가정보를 수집하고 있으며, 추가 정보는 서비스 제공 시 활용되는 정보로, 제공을 원하지 않을 경우 수집하지 않으며, 미동의로 인해 이용 상의 불이익도 발생하지 않습니다.</p></div></div>
						<div class="fixed-wrap fixed-wrap--multi-line border-none">
							<div class="button-wrap">
								<button type="button" id="confirmBtn03" rel="modal:close"
									class="button button--active">
									<span class="button__text">동의</span>
								</button>
								<button type="button" id="cancelBtn03" rel="modal:close"
									class="button button--active2">
									<span class="button__text">동의 안함</span>
								</button>
							</div>
						</div>
						<a href="#" rel="modal:close" class="modal__close"><span
							class="blind">닫기</span></a>
					</div>



					<!-- 풀팝업 -->
					<div id="modalLayer04"
						class="modal modal-full modal-scroll modal--fixed-multi">
						<div class="modal-header">
							<div class="modal-header__title">개인정보 유효기간 규정</div>
						</div>
						<div class="modal-content" id="termBox04"><div class="section-sub-txt"><p>1. 제주항공은 서비스 최종이용 시점을 기산일로 하여 법령이 정한 보유기간 경과 후 회원의 개인정보를 별도 분리 저장/관리 또는 파기 등의 조치를 통해 개인정보의 오,남용 및 유출을 방지하고 있습니다.</p><p><br></p><p>가) 서비스 이용 기준 : 제주항공 항공권 예매 및 기타 서비스 이용을 위한 조회 및 제반활동</p><p><span style="font-size: 14px;">나) 유효기간 도래 통지 : 유효기간 만료 30일 전까지 전자우편 등으로 안내</span></p><p>다) 유효기간 경과 이후에 회원이 동항 가)호의 서비스를 이용한 경우, 이를 재이용 요청으로 간주하여 정상이용 상태로 원복</p><p><br></p><p><span style="font-size: 14px;">2. 제주항공은 회원의 Refresh Point 안내 및 원활한 서비스 제공을 위해 동의를 받고 개인정보 유효기간을 3년으로 변경하고 있습니다.</span><br></p><p><span style="font-size: 14px;">해당 기간 동안 제주항공 멤버십 이용현황 안내 및 유익한 정보 등을 안내 받으실 수 있습니다.</span><br></p></div></div>
						<div class="fixed-wrap fixed-wrap--multi-line border-none">
							<div class="button-wrap">
								<button type="button" id="confirmBtn04" rel="modal:close"
									class="button button--active">
									<span class="button__text">동의</span>
								</button>
								<button type="button" id="cancelBtn04" rel="modal:close"
									class="button button--active2">
									<span class="button__text">동의 안함</span>
								</button>
							</div>
						</div>
						<a href="#" rel="modal:close" class="modal__close"><span
							class="blind">닫기</span></a>
					</div>


					<!-- 풀팝업 -->
					<div id="modalLayer05"
						class="modal modal-full modal-scroll modal--fixed-multi">
						<div class="modal-header">
							<div class="modal-header__title">마케팅 정보 수신 동의</div>
						</div>
						<div class="modal-content" id="termBox05"><div class="section-sub-txt"><p>제주항공에서 제공하는 이벤트/혜택 등 다양한 정보를 휴대전화 (모바일앱 푸시 알림 또는 문자), 이메일로 받아보실 수 있습니다.</p></div></div>
						<div class="fixed-wrap fixed-wrap--multi-line border-none">
							<div class="button-wrap">
								<button type="button" id="confirmBtn05" rel="modal:close"
									class="button button--active">
									<span class="button__text">동의</span>
								</button>
								<button type="button" id="cancelBtn05" rel="modal:close"
									class="button button--active2">
									<span class="button__text">동의 안함</span>
								</button>
							</div>
						</div>
						<a href="#" rel="modal:close" class="modal__close"><span
							class="blind">닫기</span></a>
					</div>

					<!-- 풀팝업 -->





					<!-- // 공통 얼럿 -->
					<div id="divModalAlert" class="modal modal--simple">
						<div class="modal-content">
							<h2 class="alert-title"></h2>
							<p id="alertText" class="alert-text"></p>
						</div>
						<div class="modal__button-area button-wrap">
							<button type="button"
								class="button button--secondary button--active"
								rel="modal:close">
								<span class="button__text">확인</span>
							</button>
						</div>
						<a href="#" rel="modal:close" class="modal__close"><span
							class="blind">닫기</span></a>
					</div>

					<div id="divModalConfirm" class="modal modal--simple"
						style="display: none;">
						<div class="modal-content">
							<h2 class="alert-title"></h2>
							<p id="confirmText" class="alert-text"></p>
						</div>
						<div class="modal__button-area button-wrap">
							<button type="button" id="confirmNo"
								class="button button--secondary" rel="modal:close">
								<span class="button__text">아니요</span>
							</button>
							<button type="button"
								class="button button--secondary button--active add--ml-10"
								data-element="modal_anchor" data-target="#noMaketing">
								<span class="button__text">예</span>
							</button>
						</div>
						<a href="#" rel="modal:close" class="modal__close"><span
							class="blind">닫기</span></a>
					</div>

					<div id="noMaketing" class="modal modal--simple">
						<div class="modal-content">
							<h2 class="alert-title"></h2>
							<p id="" class="alert-text">
								마케팅 정보 수신 동의가<br>해제되었습니다.
							</p>
						</div>
						<div class="modal__button-area button-wrap">
							<button type="button"
								class="button button--secondary button--active"
								rel="modal:close">
								<span class="button__text">확인</span>
							</button>
						</div>
						<a href="#" rel="modal:close" class="modal__close"><span
							class="blind">닫기</span></a>
					</div>
					
					<!-- 다음 버튼 -->
					<div class="button-wrap section-wrap" data-element="bottomContent">
						<!--20210519 class명 변경-->
						<!-- 버튼 활성화 클래스 button--active -->
						<button type="button" class="button button--primary" id="nextBtn"
							onclick="joinBtn()">
							<span class="button__text">회원가입하기</span>
						</button>
					</div>
				</form>
			</main>
		</div>
	</div>
</div>
<input type="hidden" id="authStatus">

<%@ include file="../../common/include/footer.jsp"%>
</body>
</html>