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


		<div class="row text-center">
			<h1>기본 정보</h1>
		</div><!-- /.row-text-center -->

		<div class="row">

				<div class="form-group">
					<label for="id">아이디</label>
					<input value="${dto.id}" name="id" id="id" class="form-control" readonly>
				</div>
				<div class="form-group" hidden>
					<label for="pw">비밀번호</label>
					<input name="pw" id="pw" type="password" class="form-control">
				</div>
				<div class="form-group">
					<label for="phone">휴대전화</label>
					<input value="${dto.phone}" name="phone" id="phone" type="tel" class="form-control" readonly>
				</div>
				<div class="form-group">
					<label for="uname">이름</label>
					<input value="${dto.uname}" name="uname" id="uname" class="form-control" readonly>
				</div>
				<div class="form-group">
					<label for="addr">주소</label>
					<input value="${dto.addr}" name="addr" id="addr" class="form-control" readonly>
				</div>

		</div><!-- /.row -->
			
		<div class="row">
			<div class="form-group">
				<button class="btn btn-info" id="listbtn" onclick="location.href='/member/list'">목록</button>
			</div><!-- /button -->			
		</div><!-- /.row -->


	</div><!-- /.container -->
	
	<script>
	
	</script>
	
	
	
</body>
</html>