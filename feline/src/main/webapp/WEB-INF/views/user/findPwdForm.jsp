<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script>
/* 	function checkPwd() {
		if (!document.pwd.member_name.value) {
			alert("이름을 입력하세요.");
			document.pwd.member_name.focus();
			return false;
		}

		if (!document.pwd.member_id.value) {
			alert("아이디를 입력하세요.");
			document.pwd.member_id.focus();
			return false;
		}

		if (!document.pwd.member_email.value) {
			alert("이메일을 입력하세요.");
			document.pwd.email.focus();
			return false;
		}
	} */
	function openFindPwd(){
		window.name="findPwdwin"
		window.open("findPwdEx.cat?member_name="+document.pwd.member_name.value+"&member_email="+document.pwd.member_email.value+"&member_id="+document.pwd.member_id.value,
				"findpwdwindow","width=500,height=400,resizable=no,scrollbars=no");
	}
	
</script>
</head>
<body>
<spring:hasBindErrors name="memberModel" />
<div id="all">
	<div id="content">
		<div class="container">
			<div class="col-md-12">
			    <ul class="breadcrumb">
					<li>비밀번호 찾기</li>
			    </ul>
			</div>
			<div class="col-md-3">
			</div>
			<div class="col-md-6">
				<div class="box">
					<fieldset>
					<legend>비밀번호 찾기</legend>
						<form name="pwd" onsubmit="openFindPwd()">
							<div class="rTable">  
								<div class="form-group">
									<label for="name"><font size="2">이름:</font></label>
									<input type="text" class="form-control" name="member_name"/>
									<font color="red"><form:errors path="memberModel.member_name" /></font>
								</div>
								<div class="form-group">
									<label for="name"><font size="2">이메일:</font></label>
									<input type="text" class="form-control" name="member_email"/>
									<font color="red"><form:errors path="memberModel.member_email" /></font>
								</div>
								<div class="form-group">
									<label for="name"><font size="2">아이디:</font></label>
									<input type="text" class="form-control" name="member_id"/>
									<font color="red"><form:errors path="memberModel.member_id" /></font>
								</div>
							</div>
							<br>
							<div class="text-center">
							     <button type="submit" class="btn btn-primary"><i class="fa fa-user-md"></i>비밀번호 찾기</button>
							</div>
						</form>
					</fieldset>
				</div>
			</div>
			<div class="col-md-3">
			</div>
		</div>
	</div>
</div>
</body>
</html>