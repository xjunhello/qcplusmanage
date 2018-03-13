<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<base href="<%=basePath%>">
<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="side-menu"> 
					<%--管理员部分 --%>
					<jsp:include page="/view/public/navbar-admin-head.jsp" />
                    <%--会员管理 --%>
					<li id="juser" ><a><i
							class="fa fa-group"></i> <span class="nav-label">会员管理</span><span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li value="tousu"><a href="<%=basePath%>/view/public/buliding.jsp">投诉管理</a></li>
							<li value="userlist"><a href="user/list">会员管理</a></li>
						</ul>
					</li>
					 <%--订单管理 --%>
					<li id="juser" ><a><i
							class="fa fa-files-o"></i> <span class="nav-label">订单管理</span><span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li value="orderlist" ><a href="order/list">订单管理</a></li>
							<li value="orderadd"><a href="order/toadd">订单发送</a></li>
						</ul>
					</li>
					 <%--资讯管理 --%>
					<li id="juser" ><a><i
							class="fa fa-newspaper-o"></i> <span class="nav-label">资讯管理</span><span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li value="hotlist" ><a href="hot/list">热点资讯</a></li>
							<li value="carousellist"><a href="carousel/list">轮播图管理</a></li>
							<li value="hotlist" ><a href="<%=basePath%>/view/public/buliding.jsp">招聘管理</a></li>
							<li value="" ><a href="<%=basePath%>/view/public/buliding.jsp">学堂管理</a></li>
						</ul>
					</li>
					
					 <%--财务管理 --%>
					<li id="juser" ><a><i
							class="fa fa-cny"></i> <span class="nav-label">财务管理</span><span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li value="moneylist" ><a href="money/list">财务管理</a></li>
						</ul>
					</li>
					   <%-- 其他 --%>
					<li id="juser" ><a><i
							class="fa fa-cogs"></i> <span class="nav-label">其他配置</span><span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li value="messagelist" ><a href="message/list">消息后台</a></li>
							<li value="commentlist" ><a href="comment/list">评价后台</a></li>
							<li value="scorelist" ><a href="score/list">积分后台</a></li>
						</ul>
					</li>
					
					<li id="juser" ><a><i
							class="fa fa-group"></i> <span class="nav-label">角色管理</span><span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li value="rolelist" ><a href="role/list">角色管理</a></li>
							<li value=""><a href="<%=basePath%>/view/public/buliding.jsp">管理员管理</a></li>
						</ul>
					</li>
					 
					 <li id="juser" ><a><i
							class="fa fa-group"></i> <span class="nav-label">论坛管理</span><span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li value="" ><a href="<%=basePath%>/view/public/buliding.jsp">论坛管理</a></li>
						</ul>
					</li>
					
				</ul>
			</div>
</nav>
<script type="text/javascript">
	$(document).ready(function(){
	    var activeOne = '<%=request.getParameter("activeOne")%>';
		var activeLi = $("li[value="+activeOne+"]");
		activeLi.addClass("active");
		activeLi.parent().parent().addClass("active");
	});
</script>
