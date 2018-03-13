<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<!-- 超级管理员个人信息及注销 -->
<script>
    $(document).ready(function(){
        $("#message").click(function(){
            $("#messageModal").modal({
                backdrop: 'static',
                remote: '/user/upmessage'
            });
        }); 
        $("#messageModal").on("hidden.bs.modal", function() {
            $(this).removeData("bs.modal");
        });
    });
</script>
<script>
    $(document).ready(function(){
        $("#userupdate").click(function(){
            $("#userupdateModal").modal({
                remote: '/user/toupdate/' + valupdate,
                backdrop: 'static'
            });
        });
        $("#userupdateModal").on("hidden.bs.modal", function() {
            $(this).removeData("bs.modal");
        });
    });
</script>
<li class="nav-header">
	<div class="dropdown profile-element">
		<span> <img alt="image" class="img-circle" width="48" height="48" src='static/images/${loginUser.accounttype eq "1" ? "admin.jpg" : "user.png" }' />
		</span> <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <span
			class="clear"> <span class="block m-t-xs"> <strong
					class="font-bold">${loginUser.loginname}&nbsp;<span style="color: #8095a8"></span></strong>
			</span> <span class="text-muted text-xs block"><spring:message code="accounttype.${loginUser.logintype }"/><b
					class="caret"></b>
			</span>
		</span>
		</a>
		<ul class="dropdown-menu animated fadeInRight m-t-xs">
			<!-- <li><a id="message"><spring:message code="personal.details"/></a></li>
			<li><a id="userupdate"><spring:message code="change.info"/></a></li>
			<li class="divider"></li> -->
			<li  id="updatepassword"><a ><spring:message code="updatepassword.title"/></a></li>
			<li  id="exit"><a ><spring:message code="logout"/></a></li>
		</ul>
	</div>

	<div class="logo-element">VC+</div>
	
</li>
	<!-- Modal -->
<div class="modal fade" id="logoutmodol" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
        <button id="logoutbtn" type="button" class="btn btn-primary"> <spring:message code="sure"/></button>
      </div>
    </div>
  </div>
</div>
	<!-- Modal -->
<div class="modal fade" id="passwordmodol" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
   <div class="modal-dialog" role="document">
    <div class="modal-content">
    	
    </div>
  </div>
</div>
<script>
$(document).ready(function(){
	$("#exit").click(function(){
		$('#logoutmodol').modal('show');
	});
	$("#logoutbtn").click(function(){
		$('#logoutmodol').modal('hide');
		location.href="<%=basePath%>/user/logout";
	});
	$("#updatepassword").click(function(){
		$('#passwordmodol').modal({
	        remote: '<%=basePath%>/user/toUpdatePassword/${loginUser.id}'
		});
	});
	
    $("#passwordmodol").on("hidden.bs.modal", function() {
        $(this).removeData("bs.modal");
    });
});




$("#addUser").click(function(){
    $("#addUserModal").modal({
        backdrop: 'static',
        remote: '<%=basePath%>user/toadd'
    });
});
$("#addUserModal").on("hidden.bs.modal", function() {
    $(this).removeData("bs.modal");
});
</script>
<script>
	$(".iframe_user").on('click', function() {
		var url = $(this).attr("value");
		layer.open({
			type : 2,
			title : '<spring:message code="personal.details"/>',
			maxmin : true,
			shift : 'top',
			border : [ 2, 0.3, '#1AB394' ],
			shade : [ 0.5, '#000000' ],
			shadeClose : true,
			area : [ '800px', '600px' ],
			content : url
		});
	});
</script>
<div id="messageuserModal" class="modal fade" tabindex="-1"
		data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Content will be loaded here from "remote.jsp" file -->
		</div>
	</div>
</div>
<div id="updateUserModal" class="modal fade" tabindex="-1"
		data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Content will be loaded here from "remote.jsp" file -->
		</div>
	</div>
</div>