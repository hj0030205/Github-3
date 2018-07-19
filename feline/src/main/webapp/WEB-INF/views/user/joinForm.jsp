<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script language="javascript">
function sample4_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('sample4_roadAddress').value = fullRoadAddr;
					document.getElementById('member_addr2').focus();
				}
			}).open();
	}
	
	function idCheck()
	{	
		if(!document.join.member_id.value)
		{
			alert("아이디를 입력하세요.");
			document.join.member_id.focus();
			return false;
		}else{
			window.name="checkid"
			window.open('idCheck.yolo?member_id='+document.join.member_id.value,"idcheckForm", "scrollbars=no, status=no, resizable=no, width=400, height=150");
		}
	}

	function check()
	{
		if(!document.join.member_id.value)
		{
			alert("아이디를 입력하세요.");
			document.join.member_id.focus();
			return false;
		}
		if(!document.join.member_name.value)
		{
			alert("이름을 입력하세요.");
			document.join.member_name.focus();
			return false;
		}
		if(!document.join.member_pw.value)
		{
			alert("비밀번호를 입력하세요.");
			document.join.member_pw.focus();
			return false;
		}
		
		if(!document.join.member_jumin1.value)
		{
			alert("생년월일을 입력하세요.");
			document.join.member_jumin1.focus();
			return false;
		}
		
		if(!document.join.member_phone.value)
		{
			alert("전화번호를 입력하세요.");
			document.join.member_phone.focus();
			return false;
		}
		
		if(!document.join.member_zipcode.value)
		{
			alert("우편번호를 입력하세요.");
			document.join.member_zipcode.focus();
			return false;
		}
		
		if(!document.join.member_address1.value)
		{
			alert("주소를 입력하세요.");
			document.join.member_address1.focus();
			return false;
		}
		
		if(!document.join.member_address2.value)
		{
			alert("상세주소를 입력하세요.");
			document.join.member_address2.focus();
			return false;
		}
		
		if(!document.join.member_pwchk.value)
		{
			alert("비밀번호 확인을 입력하세요.");
			document.join.member_pwchk.focus();
			return false;
		}
		
		if(document.join.member_pwchk.value != document.join.member_pw.value)
		{
			alert("비밀번호를 다르게 입력했습니다.");
			document.join.member_pw.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div id="all">
		<div id="content">
			<div class="container">
				<div class="col-md-12">
					<ul class="breadcrumb">
						<li>회원가입</li>
					</ul>
				</div>
				<div class="col-md-12">
					<div class="box">
						<fieldset>
							<legend>
								<h2>회원정보 입력</h2>
							</legend>
							<form name="join" method="post" action="joinForm.cat"
								onsubmit="return check()">
								<div class="rTable" width="100%" border=0>
									<div class="form-group">
										<label for="name">이름:</label> <input type="text"
											class="form-control" name="member_name" />
									</div>
									<div class="form-group">
										<label for="id">아이디:</label>
										<!-- 텍스트필드는 긴 문장을 넣을 때 사용. 짧은 문장이나 한 줄짜리는 input이다. -->
										<input type="text" class="form-control" name="member_id"
											id="member_id" />
										<button type="button" class="btn btn-primary"
											onclick="idCheck()">중복확인</button>
									</div>
									<div class="form-group">
										<label for="password">비밀번호:</label> <input type="password"
											class="form-control" name="member_pw" />
									</div>
									<div class="form-group">
										<label for="passwordchk">비밀번호확인:</label> <input
											type="password" class="form-control" name="member_pwchk"
											value="">
									</div>
									<div class="form-group">
										<label for="jumin1">생년월일:</label> <input type="text"
											class="form-control" name="member_jumin1" />
									</div>
									<div class="form-group">
										<label for="phone">전화번호:</label> <input type="text"
											class="form-control" name="member_phone" />
									</div>
									<div class="form-group">
										<label for="email">이메일:</label> <input type="text"
											class="form-control" name="member_email"
											value="${member_email}" readonly="readonly">
									</div>
									<div class="form-group">
										<label for="zipcode">우편번호:</label> <input type="text"
											class="form-control" id="sample4_postcode"
											name="member_zipcode" />
										<button type="button" class="btn btn-primary"
											onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
									</div>
									<div class="form-group">
										<label for="address1">주소:</label> <input type="text"
											class="form-control" id="sample4_roadAddress" name="member_addr1" />
									</div>
									<div class="form-group">
										<label for="address2">상세주소:</label> <input type="text"
											class="form-control" id="member_addr2" name="member_addr2" />
									</div>
								</div>
								<br>
								<div class="text-center">
									<button type="reset" class="btn btn-primary">새로쓰기</button>
									<button type="submit" class="btn btn-primary">
										<i class="fa fa-user-md"></i>회원가입
									</button>
								</div>
							</form>
						</fieldset>
					</div>
				</div>
			</div>
			<!-- /.container -->
		</div>
		<!-- /#content -->
	</div>
	<!-- /#all -->
</body>
</html>