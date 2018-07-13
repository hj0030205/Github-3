<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<h3 class="text-themecolor">이벤트 목록</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main.cat">관리자 메인</a></li>
					<li class="breadcrumb-item active">이벤트 목록</li>
				</ol>
			</div>
		</div>


		<!-- ////////////////////////////////////////body 내용/////////////////////////////////// -->

		<div class="col-lg-12">
			<div class="card">
				<!-- 사용 방법 도움말 같은거 추가해야겠다.. -->
				<div class="card-block">
					<div class="table-responsive">
						
						<div class="form-group"></div>
						<table class="list-items table table-hover table-striped">
							<thead class="list-header">
								<tr>
									<th>이벤트 번호</th>
									<th>이벤트명</th>
									<th>등록일</th>
									<th>시작일</th>
									<th>종료일</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(eventList) <= 0}">
										<tr align=center>
											<td colspan=8>등록된 이벤트가 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="eventList" items="${eventList}" varStatus="stat">
									<c:url var="viewURL" value="adEventView.cat">
										<c:param name="event_num">${eventList.event_num}</c:param>
										<c:param name="currentPage">${currentPage}</c:param>
									</c:url>
									<tr>
										<c:set var= "count" value="${count+1}"/>
										<td>${count}</td>
										<td><a href="${viewURL}">${eventList.event_name}</a></td>
										<td><fmt:formatDate value="${eventList.reg_date}" pattern="yyyy/MM/dd"/></td>
										<td><fmt:formatDate value="${eventList.start_date}" pattern="yyyy/MM/dd"/></td>
										<td><fmt:formatDate value="${eventList.end_date}" pattern="yyyy/MM/dd"/></td>
									</tr>
									</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<table class="paging">
							<tr align=center>
								<td colspan=5>${pagingHtml}</td>
							</tr>
						</table>
						<div>
							<form>
								<input type="button" value="상품등록" style="float:right" class="btn btn-default"
								onclick="javascript:location.href='adEventWrite.cat'">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>