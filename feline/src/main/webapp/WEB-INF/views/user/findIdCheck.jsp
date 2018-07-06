<%-- 이부분의 설정이 필요합니다. --%>
<%@ page contentType="text/html; charset=utf-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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

    <!-- styles -->
    <link href="/feline/resources/common/css/font-awesome.css" rel="stylesheet">
    <link href="/feline/resources/common/css/bootstrap.min.css" rel="stylesheet">
    <link href="/feline/resources/common/css/animate.min.css" rel="stylesheet">
    <link href="/feline/resources/common/css/owl.carousel.css" rel="stylesheet">
    <link href="/feline/resources/common/css/owl.theme.css" rel="stylesheet">
    <link rel="stylesheet" href="httpc://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- theme stylesheet -->
    <link href="/feline/resources/common/css/style.default.css" rel="stylesheet" id="theme-stylesheet">

    <!-- your stylesheet with modifications -->
    <link href="/feline/resources/common/css/custom.css" rel="stylesheet">

    <script src="/feline/resources/common/js/respond.min.js"></script>
    
</head>
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
<script>
function windowclose(){
	self.close();
}
</script>
<body>
<div id="all">
	<div id="content">
		<div class="container">
			<div class="col-md-12">
				<!-- 만약 checkNumb이 0이면 입력한 정보와 일치하는 ID가 없는 것이기 때문에 다시 실행한다. -->
				
				<c:choose>
				<c:when test="${checkNum == '1'}">
					<div class="box">
						<div class="rTable" width="100%" border=0>
							<div class="form-group" align="center">
								<font size="2">찾으신 아이디는 ${member_id} 입니다.</font>
								<br/><br/>
								<button type="button" class="btn btn-primary" onclick="windowclose()">닫기</button>
							</div>
						</div>
					</div>
				</c:when>
				<%-- 만약 1이라면 찾은 ID를 표시한다. --%>
				<c:otherwise>
					<div class="rTable" width="100%" border=0>
						<div class="form-group" align="center">
							<ul class="breadcrumb">
								<li>일치하는 정보가 없습니다. 다시 입력해주세요.</li>
							</ul>
						</div>
					</div>
					<div class="box">
						<form action="findIdEx.cat" name="checkForm">
							<div class="rTable" width="100%" border="0">
								<div class="form-group" align="left">
									이름 : <input type="text" name="member_name" class="form-control"/>
									<br/>
									이메일 : <input type="text" name="member_email" class="form-control"/>
									<br/>
								</div>
								<div class="form-group" align="center">
									<button type="submit" class="btn btn-primary">아이디 찾기</button>
								</div>
							</div>
						</form>
					</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>
 
   
</body>
</html>