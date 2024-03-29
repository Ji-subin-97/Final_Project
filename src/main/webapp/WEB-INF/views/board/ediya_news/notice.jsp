<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>EDIYA COFFEE</title>
	<c:import url="../../temp_common/head_common.jsp"></c:import>
	<!-- 이디야 소식 css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board/notice/news.css">
</head>
<body>
<!-- Start -->
	<div id="wrapper">
	
	<c:import url="../../temp_common/header.jsp"></c:import>
	
	<section id="container">
		<div class="notice_banner">
			<h1 class="banner_title">공지사항</h1>
			<p class="banner_subtit">
				<span>이디야는 국내 브랜드의 자부심을 지키며</span>
				대한민국 커피 문화를 이끌어 나갑니다.
			</p>
			
			<!-- lnb : local navigation bar -->
			<ul class="lnb">
				<li class="on"><a href="${pageContext.request.contextPath}/board/notice?board_type=notice">공지사항</a></li>
				<li><a href="${pageContext.request.contextPath}/board/event?board_type=event">이벤트</a></li>
				<li><a href="#">홈카페 레시피</a></li>
				<li><a href="${pageContext.request.contextPath}/board/coupon">대량쿠폰구매</a></li>
			</ul>	
		</div>
		
		<div class="contents">
			<div class="location">
				<span>HOME</span>
				<span>이디야 소식</span>
				<span>공지사항</span>
			</div>
			
			<div class="board_wrap">
			
				<div class="board_top">
					<div class="board_search">
						<form action="in_search" method="GET" name="frm">
							<select name="kind" class="search_kind">
								<option value="title">제목</option>
								<option value="contents">내용</option>
							</select>
							<div class="search_bar">
								<input type="hidden" name="board_type" value="${boardAttribute.board_type}">
								<input type="hidden" name="board_ctg_id" value="${boardAttribute.board_ctg_id}">
								<input type="text" class="search_bar_input" name="searchValue">
								<button type="submit" class="search_bar_btn"></button>
							</div>
						</form>
					</div>
				</div>
				
				<ul class="board_list">
					<!-- event 게시판하고 다른곳 -->
					<c:if test="${empty boardList}">
						<li>
							<div class="empty">
								<p>-&nbsp;&nbsp;검색 결과가 없습니다.&nbsp;&nbsp;-</p>
							</div>
						</li>
					</c:if>
					<c:forEach items="${boardList}" var="list">
						<li>
							<!-- 특별한 공지들은 board_notice 사용해서 아이콘 추가 -->
							<div class="board_num">
								${list.no}
							</div>
							<div class="board_list_con">
								<h5><a href="getSelectOne?board_id=${list.board_id}&board_type=${param.board_type}&pn=${param.pn}">${list.board_title}</a></h5>
								<p><a href="getSelectOne?board_id=${list.board_id}&board_type=${param.board_type}&pn=${param.pn}">${list.board_title}</a></p>
								<p class="board_date">
									<fmt:formatDate value="${list.board_regdate}" pattern="yyyy-MM-dd"/>
								</p>
							</div>
						</li>
					</c:forEach>
					<!-- event 게시판하고 다른곳 -->
				</ul>
				
				<div class="board_pager">
					
					<c:if test="${not empty boardList}">
						<!-- 앞 -->
						<span><a href="notice?board_type=notice&pn=${pager.pn-1}"><img alt="이전" src="${pageContext.request.contextPath}/images/common/page_prev.gif"></a></span>
						
						<!-- 번호 -->
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<c:choose>
								<c:when test="${empty boardList}">
									<a href="#1">1</a>
								</c:when>
								<c:otherwise>
									<a href="notice?board_type=notice&pn=${i}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<!-- 뒤 -->
						<c:choose>
							<c:when test="${pager.lastCheck}">
								<span><a href="notice?board_type=notice&pn=${pager.pn+1}"><img alt="다음" src="${pageContext.request.contextPath}/images/common/page_next.gif"></a></span>
							</c:when>
							<c:otherwise>
								<span><a href="#"><img alt="다음" src="${pageContext.request.contextPath}/images/common/page_next.gif"></a></span>
							</c:otherwise>
						</c:choose>
					</c:if>
					
				</div>
			</div>
		</div>
		
	</section>
	
	<c:import url="../../temp_common/footer.jsp"></c:import>
	
	</div>
<!-- Finish -->

<!-- Script -->
</body>
</html>