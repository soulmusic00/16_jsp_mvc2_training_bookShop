<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${contextPath}/css/style.css"/>
<script src="${contextPath}/js/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("#uRes").click(function(){
			location.href="${contextPath}/register.do";
		});
		
		$("#uLogin").click(function(){
			  var query = {
						id : $("#cid").val(), 
					passwd : $("#cpasswd").val()
			  };
			  
			  $.ajax({
			     type: "POST",
			     url: "${contextPath}/loginPro.do",
			     data: query,
			     success: function(data) {
			    	 var str1 = '<p id="ck">';
			    	 var loc = data.indexOf(str1);
			    	 var len = str1.length;
			    	 var check = data.substr(loc+len,1);
			    	 if (check == "1") {//
			    		location.href="${contextPath}/index.do";
			    	 }
			    	 else if(check == "-1") {
			    	  	alert("비밀번호가 틀렸습니다.");
			    	  	$("#cpasswd").val("");
			    	 }
			    	 else {
			    	    alert("아이디가 틀렸습니다.");
			    	    $("#cid").val("");
			    	    $("#cpasswd").val("");
			        }
			 	}
			  });
		});
		
		$("#uUpdate").click(function() {
			location.href="${contextPath}/modify.do";
		});
		
		$("#uLogout").click(function() {
			$.ajax({
			   type: "POST",
			   url: "${contextPath}/logout.do",
			   success: function() {
				   location.href="${contextPath}/index.do";
			   }
			});
		});
		
		$("#cart").click(function() {
			window.location.href="${contextPath}/cartList.do";
		});
		
		$("#buy").click(function() {
			window.location.href("${contextPath}/buyList.do");
		});
	
	});
</script>

<c:if test="${empty sessionScope.id}">
  <div id="lStatus">
     <ul>
        <li><label for="cid">아이디</label>
            <input id="cid" name="cid" type="email" size="20" maxlength="50" placeholder="example@kings.com">
            <label for="cpasswd">비밀번호</label>
            <input id="cpasswd" name="cpasswd" type="password" size="20" placeholder="6~16자 숫자/문자" maxlength="16">
            <button id="uLogin">로그인</button>
            <button id="uRes">회원가입</button>
     </ul>
  </div>
</c:if>
<c:if test="${!empty sessionScope.id}">
  <div id="lStatus">
     <ul>
        <li>${sessionScope.id}님이 로그인 하셨습니다.
           <div id="info">
             <table>
               <tr height="10">
                 <td><button id="uLogout">로그아웃</button></td>
                 <td><button id="uUpdate">회원 정보 변경</button></td>
                 <td>
                   <form id="cartForm" method="post" action="${contextPath}/cartList.do">
                   	<input type="hidden" name="buyer" value="${sessionScope.id}">
                   	<input type="submit" name="cart" value="장바구니">
                   </form>
                 </td>
                 <td>
                 	<form id="buyForm" method="post" action="${contextPath}/buyList.do">
                    	<input type="hidden" name="buyer" value="${sessionScope.id}">
                    	<input type="submit" name="buy" value="구매내역">
                    </form>
                  </td>
                </tr>
             </table>
        </div>     
            
     </ul>
  </div>
</c:if> 