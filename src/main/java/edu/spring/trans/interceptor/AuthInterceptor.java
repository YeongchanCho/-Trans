package edu.spring.trans.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// 로그인 한 상태인지 아닌지 파악해서, 
// 로그인 한 상태이면 원래 가고자 했던 페이지로 진행
// 로그인 한 상태가 아니면, 로그인 페이지로 이동(redirect)
public class AuthInterceptor extends HandlerInterceptorAdapter {
	private static final Logger log = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("preHandle() 호출");
		
		// 로그인 여부를 확인하기 위해서 Session 객체를 구함
		HttpSession session = request.getSession();
		Object signinId = session.getAttribute("signinId");
		if (signinId != null) { // 로그인 되어 있는 경우
			log.info("로그인 아이디: {}", signinId);
			return true;
		} else { // 로그인이 안된 경우
			log.info("로그인 안됨");
			String url = getRedirectUrl(request);
			response.sendRedirect(url);
			return false;
		}
		
	} // end preHandle()

	private String getRedirectUrl(HttpServletRequest request) {
		String url = request.getRequestURL().toString();
		log.info("url: {}", url);
		
		String queryString = request.getQueryString();		
		if (queryString == null) {
			queryString = "target=" + url;
		} else {
			queryString += "&target=" + url;
		}
		log.info("query string: {}", queryString);
		
		return "/trans/user/signin?" + queryString;
	}

} // end class
