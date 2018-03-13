<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.framework.Constants"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
	if (request.getSession() == null || request.getSession().getAttribute(Constants.SESSION_MANAGE_USER_SIGN) == null
) {
		//提交
		//跳转到登录页面
		//response.sendRedirect(basePath + "user/toLogin");
		
		//开发
		response.sendRedirect(basePath + "user/list");
	} else {
		response.sendRedirect(basePath + "user/list");
	}
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QCPlusManage</title>
</head>
<body>

</body>
</html>

