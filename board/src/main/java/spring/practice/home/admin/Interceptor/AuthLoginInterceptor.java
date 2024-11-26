package spring.practice.home.admin.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthLoginInterceptor extends HandlerInterceptorAdapter {
	
//	public Logger logger = Logger.getLogger(getClass()); 
	
    // 요청이 처리되기 전에 실행되는 메소드
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	super.afterConcurrentHandlingStarted(request, response, handler);
    	
    	System.out.println("〓〓〓〓〓〓〓〓〓〓〓〓   AuthLoginInterceptor Start  〓〓〓〓〓〓〓〓〓〓〓〓");
    		
//    	HttpSession session = request.getSession();
//        String url = request.getRequestURI();  // 현재 URL

//        if (url.contains("/mngr/")) {
//            Object managerVO = session.getAttribute("managerVO");

//            if (managerVO == null) {
//                // 미로그인
//            	response.sendRedirect("/mngr/login");
//                return false;
//            } else { // 로그인한 경우, 관리자 체크
            	
//            }
//        }
        // admin이 포함되지 않으면 일반 회원 페이지이므로, 정상적으로 처리
        return true;
    }
    

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
    	super.postHandle(request, response, handler, modelAndView);
    	System.out.println("〓〓〓〓〓〓〓〓〓〓〓〓   AuthLoginInterceptor End  〓〓〓〓〓〓〓〓〓〓〓〓");
    }
}
