<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
%>
<!-- 右上条导航菜单，输入搜索，帮助及退出 -->  
<div class="row border-bottom">
	<nav class="navbar navbar-static-top" role="navigation"
		style="margin-bottom: 0">
		<div class="navbar-header">
			<a class="navbar-minimalize minimalize-styl-2 btn btn-primary "><i class="fa fa-bars"></i> </a>
<!-- 			<form role="search" class="navbar-form-custom" method="get"
				action="">
				<div class="form-group">
					<input type="text" placeholder="Search..." class="form-control"
						name="search" id="top-search" disabled>
				</div>
			</form> -->
		</div>
		<ul class="nav navbar-top-links navbar-right">
			<li><span class="m-r-sm text-muted welcome-message"><spring:message code="welcome"/></span></li>
			<li class="dropdown"><a href="user/lang?langType=zh"><span
					class="m-r-sm text-muted welcome-message"><spring:message code="zh"/></span>
			</a></li>
			<li class="dropdown"><a href="user/lang?langType=en"><span
					class="m-r-sm text-muted welcome-message"><spring:message code="en"/></span>
			</a></li>
			<li class="dropdown" id="right-exit"><a><i class="fa fa-sign-out"></i>
					<spring:message code="logout"/>
			</a></li>

			<!-- <li class="purple"><a data-toggle="dropdown"
				class="dropdown-toggle" href="#"> <i
					class="icon-bell-alt icon-animated-bell"></i> <span
					class="badge badge-important">8</span></a>
				<ul
					class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
					<li class="dropdown-header"><i class="icon-warning-sign"></i>Notifications</li>
					<li><a href="#">
							<div class="clearfix">
								<span class="pull-left"> <i
									class="btn btn-xs no-hover btn-pink icon-comment"></i>8
								</span> 
								<span class="pull-right badge badge-info">+12</span>
							</div>
					</a></li>
					<li><a href="#"> <i
							class="btn btn-xs btn-primary icon-user"></i> Bob just signed up
							as an editor ...
					</a></li>

					<li><a href="#">
							<div class="clearfix">
								<span class="pull-left"> <i
									class="btn btn-xs no-hover btn-success icon-shopping-cart"></i>
									New Orders
								</span> <span class="pull-right badge badge-success">+8</span>
							</div>
					</a></li>
					<li><a href="#">
							<div class="clearfix">
								<span class="pull-left"> <i
									class="btn btn-xs no-hover btn-info icon-twitter"></i>
									Followers
								</span> <span class="pull-right badge badge-info">+11</span>
							</div>
					</a></li>
					<li><a href="#"> See all notifications <i
							class="icon-arrow-right"></i>
					</a></li>
				</ul>
			</li> -->
		</ul>
	</nav>
</div>
	<!-- Modal -->
<div class="modal fade" id="right-logoutmodol" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
   <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><spring:message code="logout"/></h4>
      </div>
      <div class="modal-body">
      <spring:message code="confirm"/>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="cancel"/></button>
        <button id="right-logoutbtn" type="button" class="btn btn-primary"> <spring:message code="sure"/></button>
      </div>
    </div>
  </div>
</div>
<script>
$("#right-exit").click(function(){
	$('#right-logoutmodol').modal('show');
	console.log('what?');
});
$("#right-logoutbtn").click(function(){
	$('#right-logoutmodol').modal('hide');
	location.href="<%=basePath%>/user/logout";
});
</script>