<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	String cssBasePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
   
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="<%=cssBasePath %>/ace_admin1.3.3/assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=cssBasePath %>/ace_admin1.3.3/assets/css/font-awesome.min.css" />

		<!-- page specific plugin styles -->

		<!-- text fonts -->
		<link rel="stylesheet" href="<%=cssBasePath %>/ace_admin1.3.3/assets/css/ace-fonts.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="<%=cssBasePath %>/ace_admin1.3.3/assets/css/ace.min.css" id="main-ace-style" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="<%=cssBasePath %>/ace_admin1.3.3/assets/css/ace-part2.min.css" />
		<![endif]-->
		<link rel="stylesheet" href="<%=cssBasePath %>/ace_admin1.3.3/assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="<%=cssBasePath %>/ace_admin1.3.3/assets/css/ace-rtl.min.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="<%=cssBasePath %>/ace_admin1.3.3/assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<script src="<%=cssBasePath %>/ace_admin1.3.3/assets/js/ace-extra.min.js"></script>

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="<%=cssBasePath %>/ace_admin1.3.3/assets/js/html5shiv.min.js"></script>
		<script src="<%=cssBasePath %>/ace_admin1.3.3/assets/js/respond.min.js"></script>
		<![endif]-->