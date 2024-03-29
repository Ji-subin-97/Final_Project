<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>EDIYA COFFEE</title>
	<c:import url="../../temp_common/head_common.jsp"></c:import>
	<!-- 이디야 소식 css -->
	<!-- event.jsp도 같은 css 사용 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board/notice/news.css">
</head>
<body>
<!-- Start -->
	<div id="wrapper">
	
	<c:import url="../../temp_common/header.jsp"></c:import>
	
	<section id="container">
		<div class="notice_banner">
			<h1 class="banner_title">이벤트</h1>
			<p class="banner_subtit">
				<span>국내 커피문화를 선도하는</span>
				이디야에서 준비한 문화 이벤트에 참여하세요.
			</p>
			
			<!-- lnb : local navigation bar -->
			<ul class="lnb">
				<li><a href="${pageContext.request.contextPath}/board/notice?board_type=notice">공지사항</a></li>
				<li class="on"><a href="${pageContext.request.contextPath}/board/event?board_type=event">이벤트</a></li>
				<li><a href="#">홈카페 레시피</a></li>
				<li><a href="${pageContext.request.contextPath}/board/coupon">대량쿠폰구매</a></li>
			</ul>	
		</div>
		
		<div class="contents">
			<div class="location">
				<span>HOME</span>
				<span>이디야 소식</span>
				<span>이벤트</span>
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
					<c:if test="${empty boardList}">
						<li>
							<div class="empty">
								<p>-&nbsp;&nbsp;검색 결과가 없습니다.&nbsp;&nbsp;-</p>
							</div>
						</li>
					</c:if>
					<c:forEach items="${boardList}" var="list">
						<li>
							<!-- event -->
							<div class="board_e_img">
								<a href="getSelectOne?board_id=${list.board_id}&board_type=${param.board_type}">
									<c:set value="${list.boardFilesVO}" var="file"></c:set>
									<img alt="event_img" src="${pageContext.request.contextPath}/upload/boardImage/${file.fileName}" width="500px" height="135px">
								</a>
							</div>
							<dl class="board_e_con">
								<dt><a href="getSelectOne?board_id=${list.board_id}&board_type=${param.board_type}">${list.board_title}</a></dt>
								<dd>
									<span class="blue_txt">기간 : </span>
									<fmt:formatDate value="${list.board_start_date}" pattern="yyyy-MM-dd"/>
									~
									<fmt:formatDate value="${list.board_end_date}" pattern="yyyy-MM-dd"/>
								</dd>
							</dl>
							<div class="board_e_state">
								<!-- go : 진행중 , end : 종료 -->
								<span class="go">
									진행중
								</span>
							</div>
						</li>
					</c:forEach>
				</ul>
				
				<div class="board_pager">
					<c:if test="${not empty boardList}">
						<!-- 앞 -->
						<span><a href="event?board_type=event&pn=${pager.pn-1}"><img alt="이전" src="${pageContext.request.contextPath}/images/common/page_prev.gif"></a></span>
						
						<!-- 번호 -->
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
							<c:choose>
								<c:when test="${empty eventAr}">
									<a href="#1">1</a>
								</c:when>
								<c:otherwise>
									<a href="notice?board_category=notice&pn=${i}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<!-- 뒤 -->
						<c:choose>
							<c:when test="${not pager.lastCheck}">
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