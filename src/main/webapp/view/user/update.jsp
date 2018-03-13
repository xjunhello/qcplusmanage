<%@ page language="java"   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
    request.setCharacterEncoding("UTF-8"); 
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
<base target="_self">
<style>
#error{
text-align:center;
display:block;
line-height:20px;
font-size:15px;
color:#F62217;
}
</style>
<script>
	$(document).ready(function () {
	    $('input').on('input',function(){
		    $(this).trigger("validate");
		});
	});
</script>
<script type="text/javascript">
   $(function () { 
	   $('#collapseOne1').collapse('hide');
	   $('#accordion1').hide();
   });
</script>
<title><spring:message code="user.edit"/></title>
</head>
<body>
    <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h3 class="modal-title" id="myModalLabel"><spring:message code="user.edit"/></h3>
	</div>
	<span id="error"></span>
	 <div class="panel-group" id="accordion1">
	   <div class="panel panel-default">
	      <div class="panel-heading">
	         <h4 class="panel-title">
	            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
	                <spring:message code="view.details"/>
	            </a>
	         </h4>
	      </div>
	      <div id="collapseOne1" class="panel-collapse collapse in">
	         <div id="collapseOneContent" class="panel-body">
	            
	         </div>
	      </div>
	   </div>
	</div>
	<div class="modal-body">
		<div class="ibox-content">
			<form method="post" id="userForm" class="form-horizontal" >
				<div class="form-group">
					<label for="username" class="col-sm-4 control-label"><spring:message code="username" /></label>
					<div class="col-sm-6">
						<input id="username" name="username" type="text"
							class="form-control" value="${updateUser.username}">
					</div>
				</div>
				<div id="userupdate"><input id="userid" name="id" type="hidden" value="${updateUser.id}"></div>
				<div class="hr-line-dashed"></div>
				<div class="form-group">
					<label for="email" class="col-sm-4 control-label"><spring:message code="email" /></label>
					<div class="col-sm-6">
						<input id="email" name="email" type="email"
							class="form-control" value="${updateUser.email}">
					</div>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="form-group">
					<label for="lastname" class="col-sm-4 control-label"><spring:message code="lastname" /></label>
					<div class="col-sm-6">
						<input id="lastname" name="lastname" type="text" class="form-control"
							value="${updateUser.lastname}">
					</div>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="form-group">
					<label for="firstname" class="col-sm-4 control-label"><spring:message code="firstname" /></label>
					<div class="col-sm-6">
						<input id="firstname" name="firstname" type="text" class="form-control"
							value="${updateUser.firstname}">
					</div>
				</div>
				<!-- 
				<div class="hr-line-dashed"></div>
				<div class="form-group">
					<label for="state" class="col-sm-4 control-label">状态</label>
					<div class="col-sm-6">
						<input id="state" name="state" type="text" class="form-control"
							value="${updateUser.state}" disabled>
					</div>
				</div>
	 			-->
				<div class="hr-line-dashed"></div>
				<div class="form-group">
					<label for="account" class="col-sm-4 control-label"><spring:message code="accounts" /></label>
					<div class="col-sm-4">
						<input id="account" name="account" type="text" class="form-control"
							value="${updateUser.account}" disabled>
					</div>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="form-group">
					<div class="col-sm-8 col-sm-offset-4">
						<button class="btn btn-white" type="reset">
							<spring:message code="reset" />
						</button>
						<button id="submit_button" class="btn btn-primary" type="submit">
							<spring:message code="save" />
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
<!-- active menu -->
<script src="static/js/echarts/echarts.js"></script>
<script>
$(document).ready(function () {
	$('#userForm').validator({
		timely : 2,
		
		rules : {
			check_username : [ /^\w{3,20}$/, '<spring:message code="validator.name"/>'],
			check_email : [ /^([a-zA-Z0-9_-])+\.?([a-zA-Z0-9])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/, '<spring:message code="email.title"/>' ],
		},

		fields : {
			"username" : {
				rule : "required,check_username",
				ok : "",
				msg : {
					required : '<spring:message code="validator.required"/>'
				}
			},
			"email" : {
				rule : "required;check_email",
				ok : "",
				msg : {
					required : '<spring:message code="validator.required"/>'
				}
			},
			"firstname" : {
				rule : "required;length[1~20]",
				ok : "",
				msg : {
					required : '<spring:message code="validator.required"/>'
				}
			},
			"lastname" : {
				rule : "required;length[1~20]",
				ok : "",
				msg : {
					required : '<spring:message code="validator.required"/>'
				}
			}
		},
		valid : function(form) {
			$.ajax({
	        	async: false,
	            type: "POST",
	            url: '<%=basePath%>user/update',//提交的URL
	            data: $('#userForm').serialize(),
	            dataType: "json",
	            mimeType: "application/json", 
	            success: function (data) {
	                window.location='<%=basePath%>user/users';
	                $('#updateUserModal').modal('hide');
	            },
	            error: function (xhr, data) {
	                $('#error').html(decodeURI(xhr.getResponseHeader("error_code")));
	                $('#accordion').show();
	                $('#collapseOneContent').html(xhr.getResponseHeader("error_text"));
	                //$.messager.alert('#springMessage("error_530")', jqXHR.responseText);
	            }
	        });
		}
	});
	$("document").ready(function() {
		$("input.role").click(function() {
			if ($("input.role[value=GA]").is(":checked")) {
				$("#admin_groups").css("display", 'block');
			} else {
				$("#admin_groups").css("display", 'none');
			}
		});
	});
});
</script>
</body>
</html>

