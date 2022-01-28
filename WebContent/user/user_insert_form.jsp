<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/css/main.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.0.min.js" ></script>
<style type="text/css">
	#uidLabel{
		position: relative;
	}
	#idCheck {
		position: absolute;
		right: -65px;
	}
	.error{
		border: 2px solid #f00;
	}
</style>
</head>
<body>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>

	<h2>회원등록화면</h2>
	<br><br>
	<form action="<%=request.getContextPath() %>/user/user_insert_action.jsp" method="post" id="userform">
		<label id="uidLabel"><span>아이디 : </span><input type="text" name="u_id" id="u_id">
		<button type="button" id="idCheck">중복검사</button></label>
		<label><span>비밀번호 : </span><input type="password" name="u_pw" ></label>
		<span>권한 : </span>
		<label class="radio"><input type="radio" name="u_level" value="구매자"> 구매자</label>
		<label class="radio"><input type="radio" name="u_level" value="판매자"> 판매자</label>		
		<label><span>이름 : </span><input type="text" name="u_name"></label>
		<label><span>전화번호 : </span><input type="text" name="u_phone"></label>
		<label><span>이메일 : </span><input type="text" name="u_email"></label>
		<button type="button" id="joinBtn">회원가입</button>
	</form>

	<script type="text/javascript">
		var f = document.getElementById('userform');
		var joinBtn = document.getElementById('joinBtn');
		
		var $u_id = $('#u_id');
		$('#idCheck').click(function() {
			if($u_id.hasClass('error')){
				 $u_id.removeClass('error');
			}
			var id = $u_id.val();	
			if(id==''){
				 $u_id.addClass('error');
				 $u_id.focus();
				 return;
			}
			var request = $.ajax({
				url: "idCheck.jsp",		
				method: "POST",			
				data: { userId : id }, 
				dataType: "json"		
			});	
			
			request.done(function(data){
				if(data.result == 0){
					console.log('사용 가능한 아이디 입니다.');
					var result =confirm('사용 가능한 아이디 입니다. 사용하시겠습니까?');
					if(result){
						$u_id.attr('readonly','readonly');
					}
				}else {
					 $u_id.addClass('error');
					 $u_id.val('');
					 $u_id.focus();
					 return;
				}
			});
			
		});
		
			
		
	</script>
<%@ include file="/module/hadan.jsp" %>
</body>
</html>

