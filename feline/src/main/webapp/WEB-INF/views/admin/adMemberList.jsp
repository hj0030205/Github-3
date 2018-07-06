<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
 <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">

                    <ul class="breadcrumb">
                        <li><a href="/feline/main.cat">메인</a>
                        </li>
                        <li>관리자페이지</li>
                    </ul>

                </div>

                <div class="col-md-12">
                    <!-- *** CUSTOMER MENU ***
 _________________________________________________________ -->
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">관리자 메뉴</h3>
                        </div>

                        <div class="panel-body">
							<div class="col-sm-3">
                            <ul class="nav nav-pills nav-stacked">
								
                                <li class="active">
                                    <a href="adMemberList.cat"><i class="fa fa-user"></i> 회원관리</a>
                                </li>
							</ul>
							</div>
							<div class="col-sm-3">
							<ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="adGoodsList.cat"><i class="fa fa-gift"></i> 상품관리</a>
                                </li>
							</ul>
							</div>
							<div class="col-sm-3">
							<ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="adOrderList.cat"><i class="fa fa-shopping-cart"></i> 주문관리</a>
                                </li>
							</ul>
							</div>
							<div class="col-sm-3">
							<ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="/feline/notice/noticeList.cat"><i class="fa fa-list"></i> 고객센터관리</a>
                                </li>
							</ul>
							</div>
                            
                        </div>

                    </div>
                    <!-- /.col-md-3 -->

                    <!-- *** CUSTOMER MENU END *** -->
                </div>

                <div class="col-md-12" id="customer-orders">
                    <div class="box">
                        <h1>회원관리</h1>

                        
						<form>
						<select name="searchNum">
							<option value="0">이름</option>
							<option value="1">아이디</option>
							<option value="2">주소</option>
							<option value="3">전화번호</option>
							<option value="4">이메일</option>
						</select> 
						<input type="text" value="" name="searchKeyword" style="width:120px" maxlength="20" />
						<button type="submit" class="btn btn-default">
		                              <i class="fa fa-search"></i>
                    	</button>
						</form>
						

                        <hr>

                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>이름</th>
                                        <th>아이디</th>
                                        <th>주소</th>
                                        <th>전화번호</th>
                                        <th>이메일</th>
                                        <th>탈퇴여부</th>
                                    </tr>
                                </thead>
                                <tbody>
								<c:forEach var="memberList" items="${memberList}" varStatus="stat">
									<c:url var="viewURL" value="adMemberView.cat">
										<c:param name="member_id">${memberList.member_id}</c:param>
										<c:param name="currentPage">${currentPage}</c:param>
									</c:url>
									<tr>
										<td>${memberList.member_name}</td>
										<td><a href="${viewURL}">${memberList.member_id}</a></td>
										<td>${memberList.member_addr1}&nbsp;${memberList.member_addr2}</td>
										<td>${memberList.member_phone}</td>
										<td>${memberList.member_email}</td>
										<td>
											<c:if test="${memberList.member_status eq 0}">
												Y
											</c:if>
											<c:if test="${memberList.member_status eq 1}">
												N
											</c:if>
										</td>
									</tr>
								</c:forEach>
								
								<c:if test="${fn:length(memberList) <= 0}">
									<tr>
										<td colspan="5" align="center">등록된 회원이 없습니다.
										</td>
									</tr>
								</c:if>
                                </tbody>
                            </table>
                            <center>
							${pagingHtml}
                        	</center>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->
      </div>
</body>
</html>