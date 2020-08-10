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
	<script src="/resources/js/uploadfn.js" type="text/javascript"></script>
<title>Insert title here</title>
<style type="text/css">
	.fileDrop{
		width: 80%;
		height: 200px;
		border: 1px solid green;
		margin: autol
	}
	.uploadedList li{
		list-style: none;
		margin: 5px;
	}
	.oriFileName{
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
		
	}
</style>
</head>
<body>
<jsp:include page="../includes/header.jsp" />
	<div class="container">
		<div class="row text-center">
			<h1>장바구니</h1>
		</div>
		
		<form action="/basket/insert" method="post">
		<div class="row">
			<div class="form-group">
				<input readonly class="form-control" name="id" value="${sessionScope.login.id}">
			</div>		
			<div class="form-group" hidden>
				<label for="title">제목</label>
				<input readonly class="form-control" value="${vo.title }">
			</div>		
			<div class="form-group" hidden>
				<label for="cno">카테코드</label>
				<input readonly class="form-control" name="cno" value="${vo.cno }">
			</div>		
			<div class="form-group">
				<label for="cname">카테고리</label>
				<input readonly class="form-control" name="cno" value="${getCateData.cname }">
			</div>		
			<div class="form-group" hidden>
				<label for="gno">상품코드</label>
				<input readonly class="form-control" name="gno" value="${getGoodsData.gno }">
			</div>		
			<div class="form-group">
				<label for="gname">상품명</label>
				<input readonly class="form-control" name="gname" value="${getGoodsData.gname }">
			</div>		
			<div class="form-group">
				<label for="cno">금액</label>
				<input readonly class="form-control" value="${getGoodsData.price }">
			</div>		
			

			
			<div class="form-group">
				<label>상품이미지</label>
				<ul class="uploadedList clearfix">
				
				</ul>
			</div>
			
			
				
		</div><!-- class = row 본문form 그룹 -->
		<div class="row">
			<div class="form-group">
				<button class="btn btn-success" id="basket_btn" >수정</button>
				<button class="btn btn-success" id="order_btn" >주문</button>
				<button class="btn btn-info" id="list_btn">목록</button>
			</div>
		</div><!-- class = row (btn) -->
		</form>
		
		
		
				
	</div><!-- class = container -->
	
	<script type="text/javascript">		
	
		var bno = ${vo.bno};

		$(document).ready(function(){
			
			$("#list_btn").click(function(event){
				event.preventDefault();
				location.assign("/board/list");
			});
			$("#order_btn").click(function(event){
				event.preventDefault();
				location.assign("/order/insert/${vo.bno}");
			});
		});

	</script>
	
</body>
</html>