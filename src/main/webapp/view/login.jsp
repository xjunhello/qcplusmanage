<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QCPlusManage</title>
    <link rel="shortcut icon" href="<%=basePath%>/static/images/facio.ico" type="image/x-icon">
    <link href="<%=basePath%>/static/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="<%=basePath%>/static/css/animate.css" rel="stylesheet">
    <link href="<%=basePath%>/static/css/style.css" rel="stylesheet">
    <link href="<%=basePath%>/static/css/bootstrap.min.css" rel="stylesheet" >
    <!-- Mainly scripts -->
    <script src="<%=basePath%>/static/js/jquery-2.1.1.min.js"></script>
    <script src="<%=basePath%>/static/js/bootstrap.min.js"></script>
</head>

<body class="gray-bg" style="background-color: white;">
    <div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <div>
                <h1 class="logo-name"><img src="<%=basePath%>/static/images/logo.png"></h1> <h3>后台管理</h3>
            </div>
           
            <span id="span"><font color="#FF0000">${error}</font></span>
            <form class="m-t" role="form" method="post" action="<%=basePath%>/user/login">
                <div class="form-group">
                    <input type="text" id="username" name="username" class="form-control" placeholder="用户名" required="length[6~50]">
                </div>
                <div class="form-group">
                    <input type="password" id="password" name="password" class="form-control" placeholder="密码" required="">
                </div>
                <button type="submit" class="btn block full-width m-b">登录</button>
                <div id="msg" ></div>
                <a href=""><small>忘记密码? </small></a> 
            </form>
             <p class="m-t"> <small><b>版权</b> ******</small> </p> 
        </div>
    </div>
    <script type="text/javascript">
    $(document).ready(function(){
    	$(":submit").css({background:"#0068B7",color:"white"});
    });
    </script>
</body>

</html>