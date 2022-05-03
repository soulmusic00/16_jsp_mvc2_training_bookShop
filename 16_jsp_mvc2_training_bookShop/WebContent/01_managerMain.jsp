<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="${contextPath}/js/jquery-3.5.1.min.js"></script>
<script>

	$(document).ready(function(){
		
		$("#registProduct").click(function(){
			location.href="${contextPath}/mg/bookRegister.do";
		});
		
		$("#updateProduct").click(function(){
			location.href="${contextPath}/mg/bookList.do?book_kind=all";
		});
		
		$("#orderedProduct").click(function(){
			location.href="${contextPath}/mg/orderList.do";
		});
		
		$("#qna").click(function(){
			location.href="${contextPath}/mg/qnaList.do";
		});
		
	});
</script>

<c:if test="${empty sessionScope.id}">
  <div id="mList"><p>로그인 하세요.
  </div>
</c:if>
<c:if test="${!empty sessionScope.id}">
  <div id="mList">
     <ul>
        <li>상품관련 작업</li>
        <li><button id="registProduct">상품등록</button></li>
        <li><button id="updateProduct">상품수정/삭제</button></li>
     </ul>
     <ul>
        <li>구매된 상품관련 작업</li>
        <li><button id="orderedProduct">전체구매목록 확인</button></li>
     </ul>
     <ul>
        <li>상품 QnA 작업</li>
        <li><button id="qna" >상품 QnA답변</button></li>
     </ul>
  </div>
</c:if>    