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
	function managerdelete(bno) {
		var isOk = confirm("삭제하시겠습니까?");
		if (isOk == true) {
			location.href = "/purchase_board/delete/" + pno;
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
<jsp:include page="../includes/myheader.jsp" />
		<div class="row text-center">
			<h3>주문 목록</h3>
		</div>
		

		
		<div class="row">
			<table class="table">
				<thead>
					<tr>
						<th class="th-center" hidden>pno</th>
						<th class="th-center">주문일자</th>
						<th class="th-center" width="40%">주문서</th>
						<th class="th-center">상품구매금액</th>
						<th class="th-center">주문처리상태</th>
						<th class="th-center">취소/교환/반품</th>
						<c:if test="${login.grno < 4}">
						<th class="th-center">삭제</th>
						</c:if>
					</tr>
				</thead>
				
				<tbody>
					
					<c:forEach items="${list }" var="dto">
						<tr>
							<td hidden>${dto.pno }</td>
							<td class="td-center">
								${dto.purDate}
							</td>
							<td>
								<a href="#">
								상세보기
								</a>
							</td>
							<td class="td-center">								
								<b style="color: red;"><fmt:formatNumber value="0" type="number"/> 원</b>
							</td>
							<td class="td-center">배송완료<br>
								송장번호<br>
								[${dto.deliveryCode }]<br>
								<button onclick="#">구매후기</button>
							</td>
							<td class="td-center"> - </td>
							<c:if test="${login.grno < 4}">
							<td class="td-center"><button onclick="managerdelete('${dto.pno}')">삭제</button></td>
							</c:if>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div><!-- class = row (table) -->



		<div class="row text-center">
		<nav aria-label="Page navigation">
  		<ul class="pagination">
    		<li>
      		<a href="/order/mylist/${getMemData.id }?curPage=${to.curPage > 1 ? to.curPage-1 : 1 }" aria-label="Previous">
        		<span aria-hidden="true">&laquo;</span>
      		</a>
    		</li>
    		<c:forEach begin="${to.beginPageNum }" end="${to.stopPageNum }" var="page">
    			<li class="${to.curPage == page? 'active' : '' }">
    			<a href="/order/mylist/${getMemData.id }?curPage=${page}">${page }</a>
    			</li>
    		</c:forEach>
			<li>
      		<a href="/order/mylist/${getMemData.id }?curPage=${to.curPage < to.totalPage ? to.curPage+1 : to.curPage }" aria-label="Next">
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