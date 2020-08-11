<%@page import="kr.co.domain.CategoryDTO"%>
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
</head>
<script type="text/javascript">
	function managerdelete(bsno) {
		var isOk = confirm("삭제하시겠습니까?");
		if (isOk == true) {
			location.href = "/basket/delete/" + bsno;
		}
	}




</script>
<style>
	.th-center{
		text-align: center;
	}
	.td-center{
		text-align: center;
	}
</style>
<body>
<jsp:include page="../includes/header.jsp" />
	<div class="container">
		<div class="row text-center">
			<h3>장바구니</h3>
			<p></p>
		</div>
		

		
		<div class="row">
			<table class="table">
				<thead>
					<tr>
						<th class="th-center">bsno</th>
						<th class="th-center">카테고리</th>
						<th class="th-center">사진</th>
						<th class="th-center" width="50%">상품정보</th>
						<th class="th-center">수량</th>
						<th class="th-center">금액</th>
						<th class="th-center">삭제</th>
					</tr>
				</thead>
				
				<tbody>
					
					<c:forEach items="${list }" var="dto">
						<tr>
							<td class="td-center">${dto.bsno }</td>
							<td class="td-center">
								<a href="/board/catePage/${dto.cno }">
								${dto.cname }</a>
							</td>
							<td class="td-center">
								<c:if test="${!empty dto.fullName}">
								<img alt="" src="/displayfile?fileName=${dto.fullName }" width="100" height="100">
								</c:if>
								<c:if test="${empty dto.fullName}">
								<img alt="" src="/resources/default.png" width="100" height="100">
								</c:if>													
							</td>
							<td class="td-center">${dto.gname }</td>
							<td class="td-center">
								1 개
							</td>
							<td class="td-center">							
								<b><fmt:formatNumber value="${dto.price}" type="number"/> 원</b>
							</td>
							<td class="td-center"><button onclick="managerdelete('${dto.bsno}')">삭제</button></td>
						</tr>
					</c:forEach>

				</tbody>
				
			</table>
		</div><!-- class = row (table) -->

		<hr style="background-color: black; height: 2px;">
		<h3 align="right">
		<b>Total　:　
		<fmt:formatNumber value="${totalPrice}" type="number"/> 원</b>
		</h3>

		<div class="row text-center">
		<nav aria-label="Page navigation">
  		<ul class="pagination">
    		<li>
      		<a href="/basket/mylist/${getMemData.id }?curPage=${to.curPage > 1 ? to.curPage-1 : 1 }" aria-label="Previous">
        		<span aria-hidden="true">&laquo;</span>
      		</a>
    		</li>
    		<c:forEach begin="${to.beginPageNum }" end="${to.stopPageNum }" var="page">
    			<li class="${to.curPage == page? 'active' : '' }">
    			<a href="/basket/mylist/${getMemData.id }?curPage=${page}">${page }</a>
    			</li>
    		</c:forEach>
			<li>
      		<a href="/basket/mylist/${getMemData.id }?curPage=${to.curPage < to.totalPage ? to.curPage+1 : to.curPage }" aria-label="Next">
        		<span aria-hidden="true">&raquo;</span>
      		</a>
    		</li>
  		</ul>
		</nav>
		</div><!-- class = row (page) -->

		


		
	</div><!-- class = container -->

	<script type="text/javascript">	

	</script>

</body>
</html>