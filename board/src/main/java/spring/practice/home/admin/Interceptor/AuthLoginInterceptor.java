package spring.practice.home.admin.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import spring.practice.home.admin.vo.ManagerVO;

public class AuthLoginInterceptor extends HandlerInterceptorAdapter {
	
//	public Logger logger = Logger.getLogger(getClass()); 
	
    // 요청이 처리되기 전에 실행되는 메소드
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	super.afterConcurrentHandlingStarted(request, response, handler);
    	
    	System.out.println("〓〓〓〓〓〓〓〓〓〓〓〓   AuthLoginInterceptor Start  〓〓〓〓〓〓〓〓〓〓〓〓");

    	HttpSession session = request.getSession();
		ManagerVO managerVO = (ManagerVO) session.getAttribute("managerVO");
		
        String url = request.getRequestURI();  // 현재 URL
        
        if(managerVO != null) {
        	session.setAttribute("managerVO", managerVO);
        
//        	// 추후에 권한체크 필요 
        	if(!url.contains("/mngr/")) {
        		response.setContentType("text/html; charset=UTF-8"); 
        		response.getWriter().write("<html><body><h2> 관리자 권한이 없습니다. </h2></body></html>");
        		response.sendRedirect("/mngr/login");
              return false;
        	} 
        } else {
        	
        }
        return super.preHandle(request, response, handler);
    }
    

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
    	super.postHandle(request, response, handler, modelAndView);
    	System.out.println("〓〓〓〓〓〓〓〓〓〓〓〓   AuthLoginInterceptor End  〓〓〓〓〓〓〓〓〓〓〓〓");
    }
}
