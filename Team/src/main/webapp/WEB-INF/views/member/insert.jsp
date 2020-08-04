<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../includes/header.jsp" />
	<div class="container">

		<div class="row text-center">
			<h1>회원 가입</h1>
		</div><!-- /.row-text-center -->

		<div class="row">
			<form action="/member/insert" method="post">
				<div class="form-group">
					<label for="id">아이디</label>
					<input name="id" id="id" class="form-control" required>
				</div>
				<div class="form-group">
					<label for="pw">비밀번호</label>
					<input name="pw" id="pw" type="password" class="form-control" required>
				</div>
				<div class="form-group">
					<label for="phone">휴대전화</label>
					<input name="phone" id="phone" type="tel" class="form-control" required
						pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" title="###-####-####">
				</div>
				<div class="form-group">
					<label for="uname">이름</label>
					<input name="uname" id="uname" class="form-control" required>
				</div>
				<div class="form-group">
					<label for="addr">주소</label>
					<input name="addr" id="addr" class="form-control" required>
				</div>
			</form><!-- /insert -->
			
			<div class="form-group">
				<button class="btn btn-primary" id="insert_btn">가입하기</button>
			</div><!-- /button -->			
		</div><!-- /.row -->
	</div><!-- /.container -->

	<script type="text/javascript">
		$(document).ready(function(){
			$("#insert_btn").click(function(event){
				event.preventDefault();
				$("form").submit();
			});
			$("#list_btn").click(function(event){
				event.preventDefault();				
				location.assign("/member/list");
			});
			
		});
	</script>

</body>
</html>