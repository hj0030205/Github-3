package com.feline.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
 
public class AdminInterCeptor extends HandlerInterceptorAdapter {
 
 @Override
 public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

  System.out.println("Interceptor : PreHandle");
  
  // Session userid check
  HttpSession session = request.getSession();   
  String userid = (String) session.getAttribute("adminId");
  
	  // Login false
	  if(userid == null){
		  response.sendRedirect("/feline/member/adminLogin.cat");
	 		return false;
	  }else if(userid.equals("admin")){
	 		return super.preHandle(request, response, handler);
	  }
	  else{
	 		response.sendRedirect("/feline/main.cat");
	   		return false;
	  }
  
 }
}