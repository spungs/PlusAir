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
//비밀번호
$(function(){
	// input 관련 function
	$('#userPwd').focus(function(){
		$('#pwAreaForm').addClass('is-active');
		$('#pwAreaForm div[class="input"]').addClass('is-focus');
		if($('#userPwd').val() != ""){
			$('#pwAreaForm .input__remove-button').removeClass('hide');
			$('#pwAreaForm .input__remove-button').addClass('show');
		}
	}); //click event end
	$('#userPwd').keyup(function(){
		if($('#userPwd').val() == ""){
			$('#pwAreaForm .input__remove-button').removeClass('show');
			$('#pwAreaForm .input__remove-button').addClass('hide');
		}
		else if($('#userPwd').val() != ""){
			$('#pwAreaForm div[data-element="form"]').addClass('is-active');
			$('#pwAreaForm .input__remove-button').addClass('show');
			$('#pwAreaForm .input__remove-button').removeClass('hide');
			$('#pwErrorArea').css('display','none');
		}
	}); //keydown event end
	$('#userPwd').blur(function(){
		$('#pwAreaForm div[data-element="form"]').removeClass('is-focus');
		if($('#userPwd').val() == ""){
			$('#pwAreaForm .input__remove-button').removeClass('show');
			$('#pwAreaForm .input__remove-button').addClass('hide');
			$('#pwAreaForm').removeClass('is-active');
			$('#pwErrorArea').css('display','block');
		}
	}); //blur event end
}); // input 관련 function end

$(function(){
	// 취소버튼 관련 function
	$('#pwAreaForm button[data-element="remove"]').on('click', function(){
		$('#userPwd').val('');
		$('#pwAreaForm div[data-element="form"]').removeClass('is-focus');
		$('#pwAreaForm .input__remove-button').removeClass('show');
		$('#pwAreaForm .input__remove-button').addClass('hide');
		if($('#userPwd').val() == ""){
			$('#pwAreaForm').removeClass('is-active');
			$('#pwErrorArea').css('display','block');				
		}
	}); // 취소버튼 클릭 event end
}); // 취소버튼 관련 function end
</script>




</body>
</html>