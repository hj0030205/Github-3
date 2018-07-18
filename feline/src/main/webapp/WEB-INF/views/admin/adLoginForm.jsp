<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
	<div class="container-fluid">
		<div class="col-lg-12">
			<ul class="breadcrumb">
				<li>관리자 로그인</li>
			</ul>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-md-12">
					<div class="box">
						<h1>관리자 로그인</h1>
						<form name="adloginForm" id="adloginForm"
							action="/feline/member/adminLogin.cat" method="POST">
							<div class="form-group">
								<label for="member_id">아이디</label> <input type="text"
									class="form-control" id="member_id" name="member_id" />
							</div>
							<div class="form-group">
								<label for="member_pw">비밀번호</label> <input type="password"
									class="form-control" id="member_pw" name="member_pw" />
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">
									<i class="fa fa-check-circle-o" aria-hidden="true"></i>로그인
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>