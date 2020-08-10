<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<style>
	.td-myheader{
		text-align: center;
		width: 16%;
		background-color: #FFFFB0;
		
	}
</style>

<header>

<table class="table">
	<tr>
		<td class="td-myheader">
		<a href="/order/mylist/${login.id }">주문내역 조회</a>
		</td>
		<td class="td-myheader">
		<a href="/member/update/${login.id }">회원 정보</a>
		</td>
		<td class="td-myheader">
		<a href="#">관심 상품</a>
		</td>
		<td class="td-myheader">
		<a href="#">적립금</a>
		</td>
		<td class="td-myheader">
		<a href="#">게시물 관리</a>
		</td>
		<td class="td-myheader">
		<a href="#">배송 주소록 관리</a>
		</td>
	</tr>
</table>





</header>