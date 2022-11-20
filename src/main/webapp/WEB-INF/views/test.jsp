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


</body>
</html>