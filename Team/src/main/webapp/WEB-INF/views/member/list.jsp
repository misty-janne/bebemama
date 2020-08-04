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
			<h1>회원 목록</h1>
		</div><!-- /.row-text-center -->
		
		
		<div class="row">
			<table class="table">
				<thead>
					<tr>
						<th class="th-center">아이디</th>
						<th class="th-center">이름</th>
						<th class="th-center">권한</th>
						<c:if test="${login.authority.equals('admin')|| login.authority.equals('ceo')}">
						<th></th>
						<th></th>						
						</c:if>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td id="id">
								<a href="/member/read/${dto.id }">${dto.id }</a>
							</td>
							<td>${dto.uname }</td>
							<td id="authority_change">
							<select id="authority" name="authority" class="form-control">
							<option value="${dto.authority }" selected>${dto.authority }</option>
							<option value="consumer">consumer</option>
							<option value="marketer">marketer</option>
							<option value="ceo">ceo</option>
							</select>
							</td>
						<c:if test="${login.authority.equals('admin')|| login.authority.equals('ceo')}">
							<td>						
							<button id="change_btn">권한변경</button>
							</td>
							<td><button onclick="location.href='/member/delete/${dto.id}'">탈퇴</button></td>
						</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!-- /.row (table) -->
		
	</div><!-- /.container -->

	<script type="text/javascript">

	$(document).ready(function(){


		
		$("#change_btn").click(function(event){
			event.preventDefault();
			var that = $("this")
			var id = that.parent("td").parent("tr").$("#id");
			
			$.ajax({
				type: 'post',
				url: '/modeajax',
				dataType: 'text,
				data: {
					id : id
				},
				success: function(result){

					alert("ok");
					
				},
				error function(request, status, error){
					console.log(error);

				}

			});

		});

	});

	
	
	</script>

</body>
</html>