<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style> 
body{ text-align:center} 
.error{ margin:0 auto; width:400px; height:100px; border:1px solid #F00} 
/*css注释：为了观察效果设置宽度 边框 高度等样式 */ 
</style> 
<title>404 page</title>
<%@include file="/view/public/link_css.jsp"%>
</head>
<body class="gray-bg">
    <div class="middle-box text-center animated fadeInDown">
        <h1>404</h1>
        <h3 class="font-bold"><spring:message code="error_404"/></h3>
        <div class="error-desc">
            <spring:message code="error_404_text"/>
            <br>
            <br>
             <a class="btn btn-primary" href="<%=basePath%>user/login"><spring:message code="error_gotologin"/></a>
        </div>
    </div>
</body>
</html>