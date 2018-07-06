<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<script>
	function check()
	{
		if(!document.id.member_name.value)
		{
			alert("이름을 입력하세요.");
			document.id.name.focus();
			return false;
		}
		
		if(!document.id.member_email.value)
		{
			alert("이메일을 입력하세요.");
			document.id.email.focus();
			return false;
		}
	}
	function openFindId(){
		window.name="FindIdForm"
		window.open("findIdEx.cat?member_name="+document.id.member_name.value+"&member_email="+document.id.member_email.value,"emailchkForm","width=500,height=400,resizable=no,scrollbars=no");
	}
</script>
</head>
<body>
<div id="all">
	<div id="content">
		<div class="container">
			<div class="col-md-12">
			    <ul class="breadcrumb">
					<li>아이디 찾기</li>
			    </ul>
			</div>
			<div class="col-md-3">
			</div>
			<div class="col-md-6">
				<div class="box">
					<fieldset>
						<form name="id" onsubmit="openFindId()">
							<div class="rTable" width="100%" border=0>  
								<div class="form-group">
									<label for="name"><font size="2">이름:</font></label>
									<input type="text" class="form-control" name="member_name"/>
								</div>
								<div class="form-group">
									<label for="name"><font size="2">이메일:</font></label>
									<input type="text" class="form-control" name="member_email"/>
								</div>
							</div>
							<br>
							<div class="text-center">
							     <button type="submit" class="btn btn-primary" onclick="return check()"><i class="fa fa-user-md"></i>아이디 찾기</button>
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