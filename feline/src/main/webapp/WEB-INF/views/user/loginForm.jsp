<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
 <div id="all">
        <div id="content">
            <div class="container">

                <div class="col-md-12">

                    <ul class="breadcrumb">
                        <li><a href="/feline/main.cat">메인</a>
                        </li>
                        <li>로그인</li>
                    </ul>

                </div>
                
				<div class="row">
				<div class="form-group">
                <div class="col-md-6">
                    <div class="box">
                        <h1>회원 로그인</h1>
						<form name="loginForm" id="loginForm" action="/feline/member/login.cat" method="POST">
                            <div class="form-group">
                                <label for="member_id">아이디</label>
                                <input type="text" class="form-control" id="member_id"name="member_id"/>
                            </div>
                            <div class="form-group">
                                <label for="member_pw">비밀번호</label>
                                <input type="password" class="form-control"id="member_pw" name="member_pw"/>
                            </div>
                            <div class="text-center">
                            	<button type="submit" class="btn btn-primary"><i class="fa fa-check-circle-o" aria-hidden="true"></i>로그인</button>
                                <button type="button" class="btn btn-default"
                                onclick="javascript:location.href='/feline/member/joinMemberCheck.cat'"><i class="fa fa-sign-in"></i>회원가입</button>
							</div>
							<br/>
							<div class="text-center">
								<!-- <a id="kakao-login-btn"></a>
								<a href="http://developers.kakao.com/logout"></a>
								<script type='text/javascript'>
								  //<![CDATA[
								    // 사용할 앱의 JavaScript 키를 설정해 주세요.
								    Kakao.init('3390658995eb6aa79de3ab23bd19e9b0');
								    // 카카오 로그인 버튼을 생성합니다.
								    Kakao.Auth.createLoginButton({
								    	 size:'small',
								    	 container: '#kakao-login-btn',
								         success: function(authObj) {
								        	 Kakao.API.request({

								        	       url: '/v1/user/me',

								        	       success: function(res) {
								        	             alert(JSON.stringify(res)); //kakao.api.request 에서 불러온 결과값 json형태로 출력
								        	             alert(JSON.stringify(authObj)); //Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
								        	             console.log(res.id); //콘솔로 아이디찍기
								        	             console.log(res.properties['nickname']); //닉네임찍기
								        	             console.log(authObj.access_token);
								        	           }
								        	         })
								        	       },
								         fail: function(err) {
								           alert(JSON.stringify(err));
								         }
								       });
								    
								  //]]>
								</script> -->

							</div>
                        </form>
                        <hr/>
                        <center>
                        <button class="btn btn-default"
                        onclick="javascript:location.href='/feline/member/findId.cat'">아이디 찾기</button>
                        <button class="btn btn-default"
                        onclick="javascript:location.href='/feline/member/findPwd.cat'">비밀번호 찾기</button>
                        </center>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="box">
                        <h1>비회원 로그인</h1>
						<form name="loginForm" id="loginForm" action="/feline/member/nMemberLogin.cat" method="POST">
                            <div class="form-group">
                                <label for="member_name">이름</label>
                                <input type="text" class="form-control" id="member_name"name="member_name"/>
                            </div>
                            <div class="form-group">
                                <label for="member_phone">전화번호</label>
                                <input type="text" class="form-control"id="member_phone" name="member_phone"/>
                            </div>
                            <div class="text-center">
                            	<button type="submit" class="btn btn-primary"><i class="fa fa-check-circle-o" aria-hidden="true"></i>비회원 로그인</button>
                            </div>
                        </form>
                        <hr/>
                        <center>
                         <button type="button" class="btn btn-default"
                                onclick="javascript:location.href='/feline/member/joinMemberCheck.cat'"><i class="fa fa-sign-in"></i>회원가입</button>
                        </center>
                    </div>
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