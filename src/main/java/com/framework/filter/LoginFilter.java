package com.framework.filter;


import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.framework.Constants;
import com.qc.model.Role;
import com.qc.model.UserLogin;

/**
 * Servlet Filter implementation class LoginFilter
 */
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		 HttpServletRequest req = (HttpServletRequest) request;
		 HttpServletResponse resp = (HttpServletResponse) response;
		 String uri = req.getRequestURI();
		 if(uri.indexOf("/user/login")>=0 ){
			 chain.doFilter(request, response);
		 }else{
			 if(null==req.getSession().getAttribute(Constants.SESSION_MANAGE_USER_SIGN)){
				 String requestType = req.getHeader("X-Requested-With");
				 if(requestType!=null&&req.getHeader("x-requested-with").equals("XMLHttpRequest") ){
					 //ajax请求
					 resp.addHeader("sessionstatus", "timeout");
				 }else{
					 //普通请求 跳转到登录页面
					// req.getRequestDispatcher("/view/login.jsp").forward(request, response);
					 
					 //develop
					 UserLogin user = new UserLogin();
					 user.setId(0);
					 user.setLoginname("测试");
					 Role role = new Role();
					 role.setId(1);
					 role.setName("测试管理员");
					 user.setRole(role);
					 req.getSession().setAttribute(Constants.SESSION_MANAGE_USER_SIGN, user);
					 chain.doFilter(request, response);
				 }
				 
			 }else{
				 chain.doFilter(request, response);
			 }
		 }
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
