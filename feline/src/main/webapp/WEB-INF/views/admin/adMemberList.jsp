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
<script>
var page = ${currentPage};

function deleteCheck(member_id) {
	if(confirm("정말 삭제하시겠습니까?")==true){
		document.location.href="adMemberDelete.cat?member_id="+member_id+"&currentPage="+page;
	}else{
		return false;
	}
}

function update(member_id){
	document.location.href="adMemberModify.cat?member_id=" + member_id + "&currentPage=" + page;
}

/* 	$(function() {
		$("#datepicker").datepicker();
		$("#datepicker2").datepicker();
	}); */
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 col-8 align-self-center">
				<h3 class="text-themecolor">회원 목록</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="main.cat">관리자 메인</a></li>
					<li class="breadcrumb-item active">회원 목록</li>
				</ol>
			</div>
		</div>


		<!-- ////////////////////////////////////////body 내용/////////////////////////////////// -->

		<div class="col-lg-12">
			<div class="card">
				<!-- 사용 방법 도움말 같은거 추가해야겠다.. -->
				<div class="card-block">
					<div class="table-responsive">
						<!-- 상세 검색 -->
						<form class="form-inline" method="POST" action="adMemberList.cat">
							<table class="table">
										<%-- <tr>
								<th>기간별 검색 :</th>
									<td style="text-align: left;"><input type="text"
										class="form-control" name="date_min" id="datepicker"
										placeholder="부터"> ~ <input type="text"
										class="form-control" name="date_max" id="datepicker2"
										placeholder="까지"></td>
									<c:if test="${status eq 'all'}">
										<td><label style="float: left;">회원 구분 : </label> <input
											type="radio" name="active" checked="checked" value="0">전체
											&nbsp; <input type="radio" name="active" value="1">활성화
											회원 &nbsp; <input type="radio" name="active" value="2">차단된
											회원</td>
									</c:if> 

								</tr>--%>
								<tr>
							<!-- 		<th>항목별 검색 :</th> -->
									<td><div class="input-group">
											<select name="searchNum" class="form-control col-md-1">
												<option value="0">이름</option>
												<option value="1">아이디</option>
												<option value="2">주소</option>
												<option value="3">전화번호</option>
												<option value="4">이메일</option>
											</select> <input class="form-control col-md-6" type="text"
												name="searchKeyword">
											<button class="fa fa-search" style="padding-left: 10px;"></button>
										</div></td>
									<td></td>
								</tr>
							</table>
						</form>
						<div class="form-group"></div>
						<table class="list-items table table-hover table-striped">
							<thead class="list-header">
								<tr>
									<th>회원 번호</th>
									<th>아이디</th>
									<th>이름</th>
									<th>주소</th>
									<th>전화번호</th>
									<th>이메일</th>
									<th>등록일</th>
									<th>탈퇴여부</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(memberList) <= 0}">
										<tr align=center>
											<td colspan=8>등록된 회원이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="memberList" items="${memberList}"
											varStatus="stat">
											<!-- 아이디와 연결되는 URL -->
											<c:url var="viewURL" value="adMemberView.cat">
												<c:param name="member_id" value="${memberList.member_id}"/>
												<c:param name="currentPage" value="${currentPage}"/>
											</c:url>
											<tr>
												<td>${memberList.member_name}</td>
												<td><a href="${viewURL}">${memberList.member_id}</a></td>
												<td>${memberList.member_addr1}&nbsp;${memberList.member_addr2}</td>
												<td>${memberList.member_phone}</td>
												<td>${memberList.member_email}</td>
												<td><c:if test="${memberList.member_status eq 0}">
												탈퇴한 회원
												</c:if></td>
												<td><fmt:formatDate value="${memberList.member_join_date}" pattern="yyyy.MM.dd"/></td>
												<td><a class="mdi mdi-grease-pencil" title="수정"
													href="javascript:update('${memberList.member_id}')"></a> <a
													class="mdi mdi-delete" title="삭제"
													href="javascript:deleteCheck('${memberList.member_id}')"></a></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<table class="paging">
							<tr align=center>
								<td colspan=8>${pagingHtml}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>