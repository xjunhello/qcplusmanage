<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 在<head>部引入的css和js文件 -->
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	String basePath1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<link rel="shortcut icon" href="<%=basePath1 %>static/images/facio.ico"
	type="image/x-icon"> 
<link href="<%=basePath1 %>static/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=basePath1 %>static/font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="<%=basePath1 %>static/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="<%=basePath1 %>static/css/animate.css" rel="stylesheet">
<link href="<%=basePath1 %>static/css/style.css" rel="stylesheet">
<link href="<%=basePath1 %>static/css/colorbox.css" rel="stylesheet">
<link href="<%=basePath1 %>static/css/magnific/magnific-popup.css" rel="stylesheet">
<link href="<%=basePath1 %>static/css/plugins/dropzone/basic.css" rel="stylesheet">
<link href="<%=basePath1 %>static/css/plugins/dropzone/dropzone.css" rel="stylesheet">
<link href="<%=basePath1 %>static/lobibox/css/Lobibox.min.css" rel="stylesheet">
<!-- import js file -->
<script src="<%=basePath1 %>static/lobibox/js/jquery.1.11.min.js"></script>
<script src="<%=basePath1 %>static/lobibox/js/lobibox.min.js"></script>
<script src="<%=basePath1 %>static/js/jquery-2.1.1.min.js"></script>
<script src="<%=basePath1 %>static/js/bootstrap.min.js"></script>
<!-- pop windows -->
<script src="<%=basePath1 %>static/js/jquery.colorbox.js"></script>
<!-- validator js -->
<link href="<%=basePath1 %>static/css/vaildator/jquery.validator.css" rel="stylesheet">
<script src="<%=basePath1 %>static/js/validator/jquery.validator.min.js"></script>
<script src="<%=basePath1 %>static/js/validator/zh_CN.js"></script>
<!-- chosen -->

<link href="<%=basePath1 %>static/css/plugins/chosen/chosen.css" rel="stylesheet">
<script src="<%=basePath1 %>static/js/plugins/chosen/chosen.jquery.js"></script>
<!-- table sort -->
<link rel="<%=basePath1 %>stylesheet" href="<%=basePath1 %>static/tablesorter/css/jquery.tablesorter.css" />
<script src="<%=basePath1 %>static/tablesorter/js/jquery.tablesorter.min.js"></script>
<script src="<%=basePath1 %>static/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
<link rel="stylesheet" href="<%=basePath1 %>static/jquery-ui-1.12.1.custom/jquery-ui.min.css" />
<link rel="stylesheet" href="<%=basePath1 %>static/jquery-ui-1.12.1.custom/jquery-ui.structure.min.css" />
<link rel="stylesheet" href="<%=basePath1 %>static/jquery-ui-1.12.1.custom/jquery-ui.theme.min.css" />
<!-- datepicker -->
<link href="<%=basePath1 %>static/css/plugins/datepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
<script src="<%=basePath1 %>static/js/datapicker/bootstrap-datetimepicker.min.js" ></script>
<script src="<%=basePath1 %>static/js/datapicker/bootstrap-datetimepicker.zh-CN.js" ></script>
<!-- rating
<link href="<%=basePath1 %>static/star-rating/star-rating.min.css" rel="stylesheet">
<script src="<%=basePath1 %>static/star-rating/star-rating.min.js" ></script> -->