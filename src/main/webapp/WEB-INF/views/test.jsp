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
$(function(){
	// input 관련 function
	$('#engFirstName').focus(function(){
		$('#engFirstNameDiv').addClass('label-active');
		$('#engFirstNameDiv div[class="input"]').addClass('is-focus');
		if($('#engFirstName').val() != ""){
			$('#engFirstNameDiv .input__remove-button').removeClass('hide');
			$('#engFirstNameDiv .input__remove-button').addClass('show');
		}
	}); //click event end
	$('#engFirstName').keyup(function(){
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
</script>
	
	


</body>
</html>