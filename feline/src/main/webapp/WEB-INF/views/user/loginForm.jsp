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
								<img alt="" src="/feline/resources/common/img/kakao_login.png" width="200px" height="50px" 
								onclick="javascript:location.href='/feline/member/kakao.cat'">
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