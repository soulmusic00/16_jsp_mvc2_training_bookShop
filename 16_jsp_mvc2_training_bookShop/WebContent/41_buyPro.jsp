<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${contextPath}/css/style.css"/>

<c:if test="${empty sessionScope.id}">
  <meta http-equiv="Refresh" content="0;url=${contextPath}/index.do">
</c:if>

<div id="orderResult">
  <p>${orderStus}
</div>

<div id="buyProcess">
  <form id="buyPro" method="post" action="${contextPath}/buyList.do">
     <input type="hidden" name="buyer" value="${sessionScope.id}">
	 <input type="submit" value="주문확인" >  
  </form>
</div> 