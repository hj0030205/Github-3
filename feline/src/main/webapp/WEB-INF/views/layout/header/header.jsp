<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Obaju e-commerce template">
    <meta name="author" content="Ondrej Svestka | ondrejsvestka.cz">
    <meta name="keywords" content="">

    <title>
        FELINE
    </title>

    <meta name="keywords" content="">

    <link href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100' rel='stylesheet' type='text/css'>

    <link href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- styles -->
    <link href="/feline/resources/common/css/font-awesome.css" rel="stylesheet">
    <link href="/feline/resources/common/css/bootstrap.min.css" rel="stylesheet">
    <link href="/feline/resources/common/css/animate.min.css" rel="stylesheet">
    <link href="/feline/resources/common/css/owl.carousel.css" rel="stylesheet">
    <link href="/feline/resources/common/css/owl.theme.css" rel="stylesheet">

    <!-- theme stylesheet -->
    <link href="/feline/resources/common/css/style.default.css" rel="stylesheet" id="theme-stylesheet">

    <!-- your stylesheet with modifications -->
    <link href="/feline/resources/common/css/custom.css" rel="stylesheet">

    <script src="/feline/resources/common/js/respond.min.js"></script>
    
</head>

<body>
 <!-- *** TOPBAR ***
 _________________________________________________________ -->
    <div id="top">
        <div class="container">
            <div class="col-md-6 offer">
                
            </div> 
            <div class="col-md-6">
            <c:choose>
            	<c:when test="${sessionScope.id == null and sessionScope.n_id == null and sessionScope.adminId == null}">
            		<ul class="menu">
                    <li><a href="/feline/member/login.cat">로그인</a>
                    </li>
                    <li><a href="/feline/member/joinMemberCheck.cat">회원가입</a>
                    </li>
                    <li><a href="/feline/member/findId.cat">아이디 찾기</a>
                    </li>
                    <li><a href="/feline/member/findPwd.cat">비밀번호 찾기</a>
                    </li>
                    <li><a href="/feline/member/b_orderSelectForm.cat">주문조회</a></li>
            	</c:when>
            	<c:otherwise>
            		<c:choose>            	
            		<c:when test="${sessionScope.n_id ne null}">
            			<ul class="menu">
	                    	<li><a class="cell">${sessionScope.n_id} 님 환영합니다.</a>
	                    	</li>
	                    	<li><a href="/feline/member/logout.cat">로그아웃</a>
	            			</li>
	            			<li><a href="/feline/member/b_orderSelectForm.cat">주문조회</a></li> 				
            		</c:when>
            		<c:when test="${sessionScope.adminId ne null }">
            			<ul class="menu">
            				<li><a class="cell">${sessionScope.adminId }님 환영합니다.</a>
            				</li>
            				<li><a href="/feline/admin/main.cat">관리자페이지</a></li>
            				<li><a href="/feline/member/logout.cat">로그아웃</a>
	            			</li>
            		</c:when>
            		<c:otherwise>
            			<ul class="menu">
            				<li><a class="cell">${sessionScope.id} 회원님 환영합니다.</a>
            				</li>
            				<li><a href="/feline/member/mypage.cat">마이페이지</a>
            				</li>
            				<li><a href="/feline/member/logout.cat">로그아웃</a>
	            			</li>
	            			<li><a href="/feline/member/orderList.cat">주문조회</a>
            		</c:otherwise>
            	</c:choose>                  
            	</c:otherwise>
            </c:choose>
            <li><a href="/feline/notice/noticeList.cat">고객센터</a>
            </li>
           </ul>
           </div>
        </div>
    </div>

    <!-- *** TOP BAR END *** -->

    <!-- *** NAVBAR ***
 _________________________________________________________ -->

    <div class="navbar navbar-default yamm" role="navigation" id="navbar">
        <div class="container">
            <div class="navbar-header">

                <a class="navbar-brand home" href="/feline/main.cat">
                    <img src="/feline/resources/common/img/log.png" width="100%" height="100%" alt="feline logo" class="hidden-xs">
                </a>
                <div class="navbar-buttons">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <i class="fa fa-align-justify"></i>
                    </button>
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#search">
                        <span class="sr-only">Toggle search</span>
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </div>
            <!--/.navbar-header -->

            <div class="navbar-collapse collapse" id="navigation">

                <ul class="nav navbar-nav navbar-left">
                    <li class="active"><a href="/feline/main.cat">Home</a>
                    </li>
                    <li class="dropdown yamm-fw">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">사료 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <div class="yamm-content">
                                    	<div class="col-sm-3">
                                            <a href="/feline/goods/goodsCategoryList.cat?goods_category=0"><h5>유기농/홀리스틱</h5></a>
                                        </div>
                                        <div class="col-sm-3">
                                            <a href="/feline/goods/goodsCategoryList.cat?goods_category=1"><h5>피부/피모건강</h5></a>
                                        </div>
                                        <div class="col-sm-3">
                                            <a href="/feline/goods/goodsCategoryList.cat?goods_category=2"><h5>헤어볼케어</h5></a>
                                        </div>
                                          <div class="col-sm-3">
                                            <a href="/feline/goods/goodsCategoryList.cat?goods_category=3"><h5>다이어트/비뇨건강</h5></a>
                                        </div>
                                </div>
                                <!-- /.yamm-content -->
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown yamm-fw">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">간식 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <div class="yamm-content">
                                    	<div class="col-sm-3">
                                            <a href="/feline/goods/goodsCategoryList.cat?goods_category=4"><h5>캔/파우치</h5></a>
                                        </div>
                                        <div class="col-sm-3">
                                            <a href="/feline/goods/goodsCategoryList.cat?goods_category=5"><h5>저키/소시지</h5></a>
                                           
                                        </div>
                                        <div class="col-sm-3">
                                            <a href="/feline/goods/goodsCategoryList.cat?goods_category=6"><h5>비스켓/트릿</h5></a>
                                        </div>
                                          <div class="col-sm-3">
                                            <a href="/feline/goods/goodsCategoryList.cat?goods_category=7"><h5>캣닢/캣그라스</h5></a>
                                        </div>
                                </div>
                                <!-- /.yamm-content -->
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown yamm-fw">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">모래와 화장실 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <div class="yamm-content">
                                    	<div class="col-sm-3">
                                            <a href="/feline/goods/goodsCategoryList.cat?goods_category=8"><h5>응고형 모래</h5></a>
                                        </div>
                                        <div class="col-sm-3">
                                            <a href="/feline/goods/goodsCategoryList.cat?goods_category=9"><h5>흡수형 모래</h5></a>
                                           
                                        </div>
                                        <div class="col-sm-3">
                                            <a href="/feline/goods/goodsCategoryList.cat?goods_category=10"><h5>화장실/패드</h5></a>
                                        </div>
                                          <div class="col-sm-3">
                                            <a href="/feline/goods/goodsCategoryList.cat?goods_category=11"><h5>기타</h5></a>
                                        </div>
                                </div>
                                <!-- /.yamm-content -->
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown yamm-fw">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">장난감 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <div class="yamm-content">
                                    	<div class="col-sm-3">
                                            <a href="/feline/goods/goodsCategoryList.cat?goods_category=12"><h5>공/봉제인형</h5></a>
                                        </div>
                                        <div class="col-sm-3">
                                            <a href="/feline/goods/goodsCategoryList.cat?goods_category=13"><h5>레이저/낚시</h5></a>
                                        </div>
                                        <div class="col-sm-3">
                                            <a href="/feline/goods/goodsCategoryList.cat?goods_category=14"><h5>막대</h5></a>
                                        </div>
                                          <div class="col-sm-3">
                                            <a href="/feline/goods/goodsCategoryList.cat?goods_category=15"><h5>캣닢</h5></a>
                                        </div>
                                </div>
                                <!-- /.yamm-content -->
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown yamm-fw">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">위생용품 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <div class="yamm-content">
                                    	<div class="col-sm-3">
                                            <a href="/feline/goods/goodsCategoryList.cat?goods_category=16"><h5>샴푸/린스</h5></a>
                                        </div>
                                        <div class="col-sm-3">
                                            <a href="/feline/goods/goodsCategoryList.cat?goods_category=17"><h5>구강관리</h5></a>
                                        </div>
                                        <div class="col-sm-3">
                                            <a href="/feline/goods/goodsCategoryList.cat?goods_category=18"><h5>눈/귀/피부&피모건강</h5></a>
                                        </div>
                                          <div class="col-sm-3">
                                            <a href="/feline/goods/goodsCategoryList.cat?goods_category=19"><h5>브러쉬/털관리</h5></a>
                                        </div>
                                </div>
                                <!-- /.yamm-content -->
                            </li>
                        </ul>
                    </li>

                </ul>

            </div>
            <!--/.nav-collapse -->

            <div class="navbar-buttons">
				<c:if test="${sessionScope.id!=null || sessionScope.n_id!=null}">
                <div class="navbar-collapse collapse right" id="basket-overview">
                    <a onclick="javascript:location.href='/feline/basket/basketList.cat'" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span class="hidden-sm"></span></a>
                </div>
                </c:if>
                <!--/.nav-collapse -->
                <div class="navbar-collapse collapse right" id="search-not-mobile">
           	        <button type="button" class="btn navbar-btn btn-primary" data-toggle="collapse" data-target="#search">
           	            <span class="sr-only">Toggle search</span>
           	            <i class="fa fa-search"></i>
           	        </button>
           	    </div>
            </div>

            <div class="collapse clearfix" id="search">

                <form action="/feline/goods/goodsSearchList.cat" class="navbar-form" role="search">
                    <div class="input-group">
                        <input type="text" class="form-control" name="search" placeholder="Search">
                        <input type="hidden" name="category" value="">
                        <input type="hidden" name="minprice" value="">
                        <input type="hidden" name="maxprice" value="">
                        <input type="hidden" name="fromyear" value="">
                        <input type="hidden" name="frommonth" value="">
                        <input type="hidden" name="toyear" value="">
                        <input type="hidden" name="tomonth" value="">
                        <span class="input-group-btn" style="margin-left:20px">
                        	<button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button>
                        </span>
                    </div>
                </form>

            </div>
            <!--/.nav-collapse -->

        </div>
        <!-- /.container -->
    </div>
    <!-- /#navbar -->

    <!-- *** NAVBAR END *** -->
    
    <!-- *** SCRIPTS TO INCLUDE ***
 _________________________________________________________ -->
    <script src="/feline/resources/common/js/jquery-1.11.0.min.js"></script>
    <script src="/feline/resources/common/js/bootstrap.min.js"></script>
    <script src="/feline/resources/common/js/jquery.cookie.js"></script>
    <script src="/feline/resources/common/js/waypoints.min.js"></script>
    <script src="/feline/resources/common/js/modernizr.js"></script>
    <script src="/feline/resources/common/js/bootstrap-hover-dropdown.js"></script>
    <script src="/feline/resources/common/js/owl.carousel.min.js"></script>
    <script src="/feline/resources/common/js/front.js"></script>
    
    </body>
</html>