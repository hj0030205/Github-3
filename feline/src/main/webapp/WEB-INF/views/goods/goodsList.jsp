<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
<script type="text/javascript" src="/feline/resources/common/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="/feline/resources/common/js/jquery.doubleSelect.min.js"></script>
<script type="text/javascript">
	function calendar()
	{
		if(document.date.year.value && !document.date.month.value)
		{
			alert("월을 선택해주세요.");
			return false;
		}
		
		else if(!document.date.year.value && document.date.month.value)
		{
			alert("연도를 선택해주세요.");
			return false;
		} 
/* 		alert("hu" +document.date.year.value);

 */
	}
</script>
<script type="text/javascript">
	$(document).ready(function()
	{
	    var selectcategory =
	    {
	    	"": {
	    		"key" : 0,
	    		"defaultvalue" : "",
	    		"values" : {"": ""
	    		}
	    	},
    		"사료": {
    	    	 "key" : 10,
                 "defaultvalue" : 0,
    	         "values" : {
                     "유기농/홀리스틱": 0,
                     "피부/피모건강": 1,
                     "헤어볼케어": 2,
                     "다이어트/비뇨건강": 3
                     }
              },
            "간식": {
            	 "key" : 20,
                 "defaultvalue" : 4,
                 "values" : {
                     "캔/파우치": 4,
                     "저키/소시지": 5,
                     "비스켓/트릿": 6,
                     "캣닢/캣그라스": 7
                     }
              },
             "모래/화장실": {
           	     "key" : 30,
                 "defaultvalue" : 8,
                 "values" : {
                     "응고형 모래": 8,
                     "흡수형 모래": 9,
                     "화장실/패드": 10,
                     "기타": 11
                     }
              },
             "장난감": {
           	     "key" : 40,
                 "defaultvalue" : 12,
                 "values" : {
                     "공/봉제인형": 12,
                     "레이저/낚시": 13,
                     "막대": 14,
                     "캣닢": 15
                     }
              },
             "위생용품": {
           	     "key" : 50,
                 "defaultvalue" : 16,
                 "values" : {
                     "샴푸/린스": 16,
                     "구강관리": 17,
                     "눈/귀/피부&피모건강": 18,
                     "브러쉬/털관리": 19
                     }
              }
	    };

	    $('#bigcat').doubleSelect('category', selectcategory);
 });
</script>
<style>
.ui-datepicker-calendar {
    display: none;
}
li.basic.active {
    background-color: gainsboro;
}
</style>
</head>
<body>
	<div id="all">
		<div id="content">
			<div class="container">
				<div class="col-md-12">
					<ul class="breadcrumb">
						<li><a href="/feline/main.cat">메인</a></li>
						<li>상품목록</li>
					</ul>
				</div>

				<div class="col-md-3">
					<!-- *** MENUS AND FILTERS ***
 _________________________________________________________ -->
					<div class="panel panel-default sidebar-menu">

						<div class="panel-heading">
							<h3 class="panel-title">
								카테고리<span class="badge pull-right"></span>
							</h3>
						</div>

						<div class="panel-body">
							<ul class="nav nav-pills nav-stacked category-menu">
								<c:choose>
								<c:when test="${category >= 0 and category <= 3}">
								<li><a>사료</a>
									<ul>
										<li class="basic <c:if test='${category == 0}'>active</c:if>"><a href="/feline/goods/goodsCategoryList.cat?goods_category=0">유기농/홀리스틱</a></li>
										<li class="basic <c:if test='${category == 1}'>active</c:if>"><a href="/feline/goods/goodsCategoryList.cat?goods_category=1">피부/피모건강</a></li>
										<li class="basic <c:if test='${category == 2}'>active</c:if>"><a href="/feline/goods/goodsCategoryList.cat?goods_category=2">헤어볼케어</a></li>
										<li class="basic <c:if test='${category == 3}'>active</c:if>"><a href="/feline/goods/goodsCategoryList.cat?goods_category=3">다이어트/비뇨건강</a></li>
									</ul></li>
								</c:when>
								<c:when test="${category >= 4 and category <= 7}">
								<li><a>간식</a>
									<ul>
										<li class="basic <c:if test='${category == 4}'>active</c:if>"><a href="/feline/goods/goodsCategoryList.cat?goods_category=4">캔/파우치</a></li>
										<li class="basic <c:if test='${category == 5}'>active</c:if>"><a href="/feline/goods/goodsCategoryList.cat?goods_category=5">저키/소시지</a></li>
										<li class="basic <c:if test='${category == 6}'>active</c:if>"><a href="/feline/goods/goodsCategoryList.cat?goods_category=6">비스켓/트릿</a></li>
										<li class="basic <c:if test='${category == 7}'>active</c:if>"><a href="/feline/goods/goodsCategoryList.cat?goods_category=7">캣닢/캣그라스</a></li>
									</ul></li>
								</c:when>	
								<c:when test="${category >= 8 and category <= 11}">
								<li><a>모래와 화장실</a>
									<ul>
										<li class="basic <c:if test='${category == 8}'>active</c:if>"><a href="/feline/goods/goodsCategoryList.cat?goods_category=8">응고형 모래</a></li>
										<li class="basic <c:if test='${category == 9}'>active</c:if>"><a href="/feline/goods/goodsCategoryList.cat?goods_category=9">흡수형 모래</a></li>
										<li class="basic <c:if test='${category == 10}'>active</c:if>"><a href="/feline/goods/goodsCategoryList.cat?goods_category=10">화장실/패드</a></li>
										<li class="basic <c:if test='${category == 11}'>active</c:if>"><a href="/feline/goods/goodsCategoryList.cat?goods_category=11">기타</a></li>
									</ul></li>
								</c:when>	
								<c:when test="${category >= 12 and category <= 15}">
								<li><a>장난감</a>
									<ul>
										<li class="basic <c:if test='${category == 12}'>active</c:if>"><a href="/feline/goods/goodsCategoryList.cat?goods_category=12">공/봉제인형</a></li>
										<li class="basic <c:if test='${category == 13}'>active</c:if>"><a href="/feline/goods/goodsCategoryList.cat?goods_category=13">레이저/낚시</a></li>
										<li class="basic <c:if test='${category == 14}'>active</c:if>"><a href="/feline/goods/goodsCategoryList.cat?goods_category=14">막대</a></li>
										<li class="basic <c:if test='${category == 15}'>active</c:if>"><a href="/feline/goods/goodsCategoryList.cat?goods_category=15">캣닢</a></li>
									</ul></li>
								</c:when>
								<c:when test="${category >=16 and category <= 19 }">
								<li><a>위생용품</a>
									<ul>
										<li class="basic <c:if test='${category == 16}'>active</c:if>"><a href="/feline/goods/goodsCategoryList.cat?goods_category=16">샴푸/린스</a></li>
										<li class="basic <c:if test='${category == 17}'>active</c:if>"><a href="/feline/goods/goodsCategoryList.cat?goods_category=17">구강관리</a></li>
										<li class="basic <c:if test='${category == 18}'>active</c:if>"><a href="/feline/goods/goodsCategoryList.cat?goods_category=18">눈/귀/피부&피모건강</a></li>
										<li class="basic <c:if test='${category == 19}'>active</c:if>"><a href="/feline/goods/goodsCategoryList.cat?goods_category=19">브러쉬/털관리</a></li>
									</ul></li>
								</c:when>
								</c:choose>	
							</ul>
						</div>
					</div>
				</div>

				<div class="col-md-9">
					<div class="box">
						<h1>
							<c:if test="${category >= 0 and category <=3}">
							<h1>사료</h1>
							</c:if>
							<c:if test="${category >= 4 and category <=7}">
							<h1>간식</h1>
							</c:if>	
							<c:if test="${category >= 8 and category <=11}">
							<h1>모래/화장실</h1>
							</c:if>	
							<c:if test="${category >= 12 and category <=15}">
							<h1>장난감</h1>
							</c:if>
							<c:if test="${category >= 16 and category <=19}">
							<h1>위생용품</h1>
							</c:if>
						</h1>
						<p>
							<c:if test="${category eq 0 }" >유기농/홀리스틱</c:if>
							<c:if test="${category eq 1 }" >피부/피모건강</c:if>
							<c:if test="${category eq 2 }" >헤어볼케어</c:if>
							<c:if test="${category eq 3 }" >다이어트/비뇨건강</c:if>
							<c:if test="${category eq 4 }" >캔/파우치</c:if>
							<c:if test="${category eq 5 }" >저키/소시지</c:if>
							<c:if test="${category eq 6 }" >비스켓/트릿</c:if>
							<c:if test="${category eq 7 }" >캣닢/캣그라스</c:if>
							<c:if test="${category eq 8 }" >응고형 모래</c:if>
							<c:if test="${category eq 9 }" >흡수형 모래</c:if>
							<c:if test="${category eq 10 }" >화장실/패드</c:if>
							<c:if test="${category eq 11 }" >기타</c:if>
							<c:if test="${category eq 12 }" >공/봉제인형</c:if>
							<c:if test="${category eq 13 }" >레이저/낚시</c:if>
							<c:if test="${category eq 14 }" >막대</c:if>
							<c:if test="${category eq 15 }" >캣닢</c:if>
							<c:if test="${category eq 16 }" >샴푸/린스</c:if>
							<c:if test="${category eq 17 }" >구강관리</c:if>
							<c:if test="${category eq 18 }" >눈/귀/피부&피모건강</c:if>
							<c:if test="${category eq 19 }" >브러쉬/털관리</c:if>
							
						</p>
					</div>

					<c:if test="${fn:length(goodsList) le 0}">
						등록된 상품이 없습니다
					</c:if>
					
					<c:if test="${not empty search}">
						<h2>${search }</h2>
						<h4 align="right"><font color="#4E4E4E">검색결과</font>&nbsp;<font size="3" color="#4E4E4E">${fn:length(goodsList)}개</font></h4>
					
						<div class="box">
							<form action="/feline/goods/goodsSearchList.cat" onsubmit="return calendar()" class="navbar-form" role="search" name="date">
								<div>
									<span class="panel-heading">
						            	<font size="4">카테고리</font>
									</span>
									<span>
										&nbsp;
										<select id="bigcat" size="1">
											<option value="">--</option>
										</select>
					
										&nbsp;&nbsp;세부: &nbsp;
										<select id="category" name="category" size="1">
											<option value="">--</option>
										</select>
									</span>
								</div><br/>
								<div>
									<span class="panel-heading">
						            	<font size="4">가격대   </font>
									</span>
									<span>
										최소값: &nbsp;<select name="minprice">
											<option value=""></option>
											<option value="0">0원</option>
											<option value="5000">5,000원</option>
											<option value="10000">10,000원</option>
											<option value="15000">15,000원</option>
											<option value="20000">20,000원</option>
											<option value="30000">30,000원</option>
											<option value="40000">40,000원</option>
											<option value="50000">50,000원</option>
											<option value="100000">100,000원</option>
											<option value="200000">200,000원</option>
											<option value="300000">30,0000원</option>
										</select>
										&nbsp;~&nbsp;최대값: &nbsp;<select name="maxprice">
											<option value=""></option>
											<option value="5000">5,000원</option>
											<option value="10000">10,000원</option>
											<option value="15000">15,000원</option>
											<option value="20000">20,000원</option>
											<option value="30000">30,000원</option>
											<option value="40000">40,000원</option>
											<option value="50000">50,000원</option>
											<option value="100000">100,000원</option>
											<option value="200000">200,000원</option>
											<option value="300000">300,000원</option>
											<option value="500000">500,000원</option>
										</select>
									</span>
								</div><br/>
								<div>
									<span class="panel-heading">
						            	<font size="4">등록기간</font>
									</span>
									<span>
										<select name="year">
											<option value=""></option>
											<option value="116">2016</option>
											<option value="117">2017</option>
											<option value="118">2018</option>
											<option value="119">2019</option>
										</select>&nbsp;년
										&nbsp;&nbsp;<select name="month">
											<option value=""></option>
											<option value="0">01</option>
											<option value="1">02</option>
											<option value="2">03</option>
											<option value="3">04</option>
											<option value="4">05</option>
											<option value="5">06</option>
											<option value="6">07</option>
											<option value="7">08</option>
											<option value="8">09</option>
											<option value="9">10</option>
											<option value="10">11</option>
											<option value="11">12</option>
										</select>&nbsp;월
									</span>
								</div><br/>
								<div align="right">
			                        <input type="text" class="form-control" name="search" value="${search }">
			                        <span><button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button></span>
		                        </div>
			                </form>
			            </div>
					</c:if>

					<div class="row products">
						<c:forEach var="goodsList" items="${goodsList}" varStatus="stat">
							<c:url var="viewURL" value="goodsView.cat">
								<c:param name="goods_num" value="${goodsList.goods_num }"/>
								<c:param name="currentPage" value="${currentPage }"/>
							</c:url>						
					
							<div class="col-md-3 col-sm-6">
								<div class="product">
									<div class="flip-container">
										<div class="flipper" style="height: 130px">
											<div class="front">
												<a href="${viewURL}">
													<img
														src="/feline/resources/upload/images/${goodsList.goods_image_savname}"
														width="100%" height="100%" />
												</a>
											</div>
											<div class="back">
												<a href="${viewURL}">
													<img
														src="/feline/resources/upload/images/${goodsList.goods_image_savname}"
														width="100%" height="100%" />
												</a>
											</div>
										</div>
									</div>
									<br /> <br />
									<div class="text">
										<h3>
											<a href="${viewURL}">
													${goodsList.goods_name}
											</a>
										</h3>
										<p class="price">
											<fmt:formatNumber value="${goodsList.goods_price}" type="number" pattern="#,###"/>&nbsp;원
										</p>
										<p class="buttons">
											<a href="${viewURL}">
												<button class="btn btn-primary">상품 상세보기</button>
											</a>
										</p>
									</div>
									<!-- /.text -->
								</div>
								<!-- /.product -->
							</div>
						</c:forEach>
					</div>
					<!-- /.products -->
					<div class="paging">
						${pagingHtml}
					</div>
				</div>
				<!-- /.col-md-9 -->
			</div>
			<br/>
			<!-- /.container -->
		</div>
	<!-- /#content -->
	</div>
	<!-- /#all -->
</body>
</html>