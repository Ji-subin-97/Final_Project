<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/common/common.css">
<link type="text/css" rel="stylesheet" href="../css/admin/admin.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<!-- nav  -->
<c:import url="../temp_common/header.jsp"></c:import>
<!-- /nav  -->

<section id="contentWrap" class="visual_big visual_txt_w">
	
	<div class="sub_visual status_visual">
		<h1 class="con_tt">
			
		</h1>
		<p class="visual_mt">Admin Page</p>
		<p class="visual_txt">어드민 페이지 입니다.</p>
		
		
		<ul class="lnb">
				<li><a href="adminpage">회원관리</a></li>
				<li><a href="boardAdmin">게시판관리</a></li>
				<li class="on"><a href="menuAdmin">메뉴관리</a></li>
				<li><a href="paymentAdmin">결제현황관리</a></li>
			</ul>	
		
	</div>


<h3>admin Page</h3>

</section>



<!-- footer  -->
<c:import url="../temp_common/footer.jsp"></c:import>
<!-- /footer  -->
</body>
</html>