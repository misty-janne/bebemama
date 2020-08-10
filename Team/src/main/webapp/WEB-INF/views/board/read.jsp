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
	tr td {
		padding: 2px;
	}
	
	.block {
		display: block;
		width: 100%;
		border: 1px solid;
		background-color: white;
		color: hotpink;
		padding: 14px 28px;
		cursor: pointer;
		text-align: center;
	}
	.block:hover {
		background: pink;
		color: hotpink;
	}
	.fileDrop{
		width: 80%;
		height: 200px;
		border: 1px solid green;
		margin: auto;
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
			<h2 style="color: hotpink;">상품 자세히 보기</h2>
		</div>
		
		<div class="row">
			<div class="row">
			<div class="col-sm-6" id="mainImg">
						<c:if test="${!empty getAttData.fullName}">
						<img alt="" src="/displayfile?fileName=${getAttData.fullName }" width="450" height="450">
						</c:if>
						<c:if test="${empty getAttData.fullName}">
						<img alt="" src="/resources/default.png" width="450" height="450">
						</c:if>
			</div>
			<div class="col-sm-6">
				<table width="450" height="200" >
					<tr>
						<th colspan="4">${vo.title }</th>
					</tr>
					<tr>
						<td>상품명</td>
						<td>${getGoodsData.gname }</td>
					</tr>
					<tr>
						<td>옵션</td>
						<td>[▼------------]</td>
					</tr>
					<tr>
						<td><b>금액</b></td>
						<td><b><fmt:formatNumber value="${getGoodsData.price}" type="number"/></b></td>
					</tr>
					
				</table>
			<form action="/basket/insert" method="post">
			<div class="form-group">
			<input type="number" name="cno" value="${vo.cno }" hidden>
			<input type="number" name="gno" value="${vo.gno }" hidden>
			<input name="id" value="${sessionScope.login.id}" hidden>
			</div>
			</form>
				<table width="450" height="100" >
					<tr>
						<td colspan="4">
						<button type="button" class="block" id="order_btn">BUY IT NOW</button>
						</td>
					</tr>
					<tr>
						<td width="50%">
						<button type="submit" class="block" id="basket_btn">ADD TO CART</button>
						</td>
						<td width="50%">
						<button type="button" class="block" id="#">WISH LIST</button>
						</td>
					</tr>
				</table>
					
			</div>
			</div>

			
			<div class="form-group">
				<label>본문이미지</label>
				<ul class="uploadedList clearfix">
				
				</ul>
			</div>
			
			
				
		</div>
		
		<div class="row">
			<div class="form-group">

				<c:if test="${login.grno == 3}">
				<button class="btn btn-primary" id="update_btn">수정</button>
				<button class="btn btn-danger" id="delete_btn">삭제</button>
				</c:if>
				<c:if test="${login.grno == 2 || login.grno == 1}">
				<button class="btn btn-danger" id="delete_btn">삭제</button>
				</c:if>
				
			</div>
		</div><!-- class = row (btn) -->
		
		
		
	</div><!-- class = container -->
	
	<script type="text/javascript">		

		var bno = ${vo.bno};
		
		$(document).ready(function(){

			$.getJSON("/getAttach/"+bno, function(arr){

				for(var i=1; i<arr.length; i++){
					//a 링크 클릭시 파일 열기
					var str = '<li class="col-xs-4">';
					str += '<a href="/displayfile?fileName=' + getImgLink(arr[i]) + '">';
					//썸네일이미지 삽입
					if(checkImage(arr[i])){
						//이미지파일이면: result = 썸네일이미지 (원본의 50*50)
						str += '<img src = "/displayfile?fileName=' + arr[i] + '"/>';							
					}else{
						//이미지파일이 아니면
						str += '<img src = "/resources/et.png"/>';
					}						
					str += '</a>'; //a링크 태그 종료
					str += '<p class="oriFileName">';
					str += getOriginalName(arr[i]);
					str += '</p>';
					str += '</li>';
				
					//업로드된 파일 uploadList로 쌓이도록
					$(".uploadedList").append(str);

				}

			});
			
						
			$("#order_btn").click(function(){
				event.preventDefault();
				location.assign("/order/insert/${vo.bno}");
			});
			$("#basket_btn").click(function(){
				$("form").submit();
			});

			
			$("#update_btn").click(function(){
				event.preventDefault();
				location.assign("/board/update/${vo.bno}");
			});
			$("#delete_btn").click(function(){
				event.preventDefault();
				location.assign("/board/delete/${vo.bno}");
			});
			$("#list_btn").click(function(){
				event.preventDefault();
				location.assign("/board/list");
				//history.back();
			});
		});

	</script>
	
</body>
</html>