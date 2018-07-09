<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
							<div class="col-sm-2">
                            <ul class="nav nav-pills nav-stacked">
								
                                <li>
                                    <a href="adMemberList.cat"><i class="fa fa-user"></i> 회원관리</a>
                                </li>
							</ul>
							</div>
							<div class="col-sm-2">
							<ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="adGoodsList.cat"><i class="fa fa-gift"></i> 상품관리</a>
                                </li>
							</ul>
							</div>
							<div class="col-sm-2">
							<ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="adOrderList.cat"><i class="fa fa-shopping-cart"></i> 주문관리</a>
                                </li>
							</ul>
							</div>
							<div class="col-sm-2">
							<ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a href="/feline/notice/noticeList.cat"><i class="fa fa-list"></i> 고객센터관리</a>
                                </li>
							</ul>
							</div>
							<div class="col-sm-2">
							<ul class="nav nav-pills nav-stacked">
                                <li class="active">
                                    <a href="adEventList.cat"><i class="fa fa-percent"></i> 이벤트관리</a>
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
                        <h1>이벤트관리</h1>

                        <hr>

                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>이벤트번호</th>
                                        <th>이벤트명</th>
                                        <th>등록일</th>
                                        <th>시작일</th>
                                        <th>종료일</th>
                                    </tr>
                                </thead>
                                <tbody>
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
								
								<c:if test="${fn:length(eventList) <= 0}">
									<tr>
										<td colspan="5" align="center">등록된 이벤트가 없습니다.
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