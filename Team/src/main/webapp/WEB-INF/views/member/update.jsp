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
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../includes/header.jsp" />
	<div class="container">
<jsp:include page="../includes/myheader.jsp" />

<div class="media">
	<div class="media-left">
  	<img src="/resources/default.png" class="media-object" style="width:60px">
	</div>
	<div class="media-body">
	저희 쇼핑몰을 이용해 주셔서 감사합니다.<br>
	<b>${dto.uname }</b> 회원님은 <b>[${dto.authority }]</b> 회원이십니다.
	</div>
</div>


		<div class="row">
			<h3>기본 정보</h3>
		</div><!-- /.row-text-center -->

		<div class="row">
			<form action="/member/update" method="post">
				<div class="form-group">
					<label for="id">아이디</label>
					<input value="${dto.id}" name="id" id="id" class="form-control" readonly>
				</div>
				<div class="form-group">
					<label for="pw">비밀번호</label>
					<input name="pw" id="pw" type="password" class="form-control" required>
				</div>
				<div class="form-group">
					<label for="phone">휴대전화</label>
					<input value="${dto.phone}" name="phone" id="phone" type="tel" class="form-control" required>
				</div>
				<div class="form-group">
					<label for="uname">이름</label>
					<input value="${dto.uname}" name="uname" id="uname" class="form-control" required>
				</div>
				<div class="form-group">
					<label for="addr">주소</label>
					<input value="${dto.addr}" name="addr" id="addr" class="form-control" required>
				</div>
			</form><!-- /update -->
		</div><!-- /.row -->
			
		<div class="row">
			<div class="form-group">
				<button class="btn btn-primary" id="update_btn">회원정보수정</button>
				<button class="cencle btn btn-primary" >취소</button>
			</div><!-- /button -->			
		</div><!-- /.row -->


	</div><!-- /.container -->
	
	<script>
	$(document).ready(function(){
		$("#update_btn").on("click", function(){
			event.preventDefault();
			$("form").submit();
		});

		var id = '${login.id}';
		// 취소
		$(".cencle").on("click", function(){
			event.preventDefault();
			location.href = "/member/update/"+id;
		});
		
	})
	</script>
	
	
	
</body>
</html>