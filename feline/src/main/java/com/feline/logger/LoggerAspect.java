package com.feline.logger;

import java.util.Arrays;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class LoggerAspect {
	
	//private : 외부에서 로그를 가로채지 못하도록 하기 위해
	//static final : 로그 내용이 바뀌지 않으므로
	// 로깅툴을 사용하는 이유 : sysout 명령어는 IO 리소스를 많이 사용하여 시스템이 느려질 수 있다, 로그를 파일로 저장하여 분석할 필요가 있다.
	

	private static final Log log = LogFactory.getLog(LoggerAspect.class);
	static String name = "";
	static String type = "";
	
	//Controller,Service,DAO의 모든 Method를 실행 전후에 LogPrint method가 자동으로 실행된다.
	// .. : 하위의 모든 디렉토리를 의미
	// *(..) : * - 하위의 모든 메서드, (..) - 모든 매개변수
	@Around("execution(* com.feline..*Controller.*(..)) or execution(* com.feline..*Service.*(..))")
	public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable {
		//실행 시간 체크 : 시작 시간
		long start = System.currentTimeMillis();

		
		type = joinPoint.getSignature().getDeclaringTypeName();
		
		//Controller 라면
		if(type.indexOf("Controller") > -1) {
			name = "Controller	\t:		";
		} 
		//Service 라면
		else if(type.indexOf("Service") > -1) {
			name = "Service		\t:		";
		}
		
		//메서드 이름
		log.debug(name+type + "."+ joinPoint.getSignature().getName()+"()");
		
		//파라미터 이름
		log.info(Arrays.toString(joinPoint.getArgs()));
		
		//실행 시간 체크: 종료시간
		long end = System.currentTimeMillis();
		
		long time = end-start;
		
		log.debug("실행 시간:"+time+"(ms)");
		
		return joinPoint.proceed();
		
	}
}
