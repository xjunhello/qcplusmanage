<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="pragma" content="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
<%@include file="/view/public/link_css.jsp"%>
<style>
body {
	text-align: center
}
.error {
	margin: 0 auto;
	width: 400px;
	height: 100px;
	border: 1px solid #F00
}
/* css注释：为了观察效果设置宽度 边框 高度等样式 */
</style>

<title>exception page</title>
</head>
<body>
<body class="gray-bg">
	<div class="middle-box text-center animated fadeInDown">
		<font size="48" style="font-weight: bold;">内部错误</font>
		<h3 class="font-bold">
			
		</h3>
		<div class="error-desc">
			 <pre lang="java">
			 	${message}
			 </pre>
			 <br />
			<br /> <a class="btn btn-primary" href="<%=basePath%>user/toLogin"><spring:message
					code="error_gotologin" /></a>
		</div>
	</div>
</body>
</html>