<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>

	<script>
		var chkKor = /[^가-힇]/;
		var num = /[^0-9]/;
		var chkPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@$%^&*~])[A-Za-z\d!@$%^&*~]{8,16}$/;
// 		^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@$%^&*~])[A-Za-z\d!@$%^&*~]{8,16}$
		var chkPw2 = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}/;
// 		사용 가능한 특수문자 : !, @, $, %, ^, &amp,*, ~”
		$(function() {
			$('#test').keyup(function() {
				if (!chkPw.test($('#test').val())) {
					console.log($('#test').val() + 'X')
				}
			})
		})
	</script>

	<input type="text" id="test">

<script>
//korFirstName
$(function(){
	// input 관련 function
	$('#korFirstName').focus(function(){
		$('#korFirstNameDiv').addClass('label-active');
		$('#korFirstNameDiv div[class="input"]').addClass('is-focus');
		if($('#korFirstName').val() != ""){
			$('#korFirstNameDiv .input__remove-button').removeClass('hide');
			$('#korFirstNameDiv .input__remove-button').addClass('show');
		}
		//===============================
		// 유효성검사
		if(!chkKor.test($('#korFirstName').val())){ 
			$('#errorText2').css('display','none'); 
		}
		//===============================
	}); //click event end
	$('#korFirstName').keyup(function(){
		//===============================
		if(kor.test($('#korFirstName').val()) || chkKor.test($('#korFirstName').val()))
			$('#korFirstName').val($('#korFirstName').val().replace(/^[A-Za-z0-9]/,''))
		//===============================
			
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
		//===============================
		$('#korFirstName').val($('#korFirstName').val().replace(/[ㄱ-ㅎ]/g,''))
		//===============================
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
</script>




</body>
</html>