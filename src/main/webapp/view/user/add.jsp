<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
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

	$('#collapseOne').collapse('hide');
	$('#accordion').hide();
	   
    //级联选择账户
	var admins = $.parseJSON('${admins}');
	var users = $.parseJSON('${users}');
	
	function initUser(){
	   $("[name='account']").children().remove();
	   $(users).each(function(index,element){
	       $("[name='account']").append("<option value='"+element.name+"'>"+element.name+"</option>")
	   });
	   ;
	}
    
	function initAdmins(){
	   $("[name='account']").children().remove();
	   $(admins).each(function(index,element){
	       $("[name='account']").append("<option value='"+element.name+"'>"+element.name+"</option>")
	   });
	   ;
	}
	
	$(document).ready(function(){
	    $("#secrole").on("change",function(){
		    if($("#secrole option:selected").val()=='admins'){
				initAdmins();
		    }else{
				initUser();
		    }	
		    $("[name='account']").trigger("validate");
		});
		
		$("#reset_button").on("click",function(){
		    initUser();
		});
		
		initUser();
	});
    $('#userFormadd').validator({
		timely : 8,
		
		rules : {
			check_password : [ /^\w{6,16}$/, '<spring:message code="validator.password"/>' ],
			check_username : [ /^\w{3,20}$/, '<spring:message code="validator.name"/>' ],
			check_email : [ /^([a-zA-Z0-9_-])+\.?([a-zA-Z0-9])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/,'<spring:message code="validator.formaterr"/>' ],
			check_repassword : function (element,param,field){
				return element.value == $("#password").val() || '<spring:message code="validator.repassword"/>' ;
			}
		},
		fields : {
			"username" : {
				rule : "required;check_username",
				ok : "",
				msg : {
					required : '<spring:message code="validator.required"/>'
				}
			},
			"password" : {
				rule : "required;check_password",
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
			},
			 "account" : {
				rule : "required",
				ok : "",
				msg : {
					required : '<spring:message code="validator.required"/>'
				}
			},
			"repassword":{
				rule : "required;check_repassword",
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
	            url: '<%=basePath%>user/add',//提交的URL
	            data: $('#userFormadd').serialize(), // 要提交的表单
	            dataType: "json",
	            mimeType: "application/json", 
	            success: function (data) {
	                window.location='<%=basePath%>user/users';
	                $('#addUserModal').modal('hide');
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
}); 
</script>
<script>
	$(document).ready(function () {
	    $('input').on('input',function(){
		    $(this).trigger("validate");
		});
	});
</script>
<title>新增角色</title>
</head>
<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h3 class="modal-title" id="myModalLabel"><spring:message code="user.add" /></h3>
	</div>
	<span id="error"></span>
	 <div class="panel-group" id="accordion">
	   <div class="panel panel-default">
	      <div class="panel-heading">
	         <h4 class="panel-title">
	            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
	                <spring:message code="view.details"></spring:message>
	            </a>
	         </h4>
	      </div>
	      <div id="collapseOne" class="panel-collapse collapse in">
	         <div id="collapseOneContent" class="panel-body">
	            
	         </div>
	      </div>
	   </div>
	</div>
	<div class="modal-body">
		<div class="ibox-content">
			<form method="post" id="userFormadd" action="user/add"
				enctype="multipart/form-data" class="form-horizontal"  autocomplete="off">
				<!-- <div class="hr-line-dashed"></div> -->
				<div class="form-group">
					<label for="username" class="col-sm-4 control-label"> <span
						class="red-fonts">*&nbsp;&nbsp;&nbsp;</span><spring:message code="username" />
					</label>
					<div class="col-sm-6">
						<input id="username" name="username" placeholder="<spring:message code="user.username.title" />"
							type="text" class="form-control" >
					</div>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="form-group">
					<label for="password" class="col-sm-4 control-label"> <span
						class="red-fonts">*&nbsp;&nbsp;&nbsp;</span><spring:message code="password" />
					</label>
					<div class="col-sm-6">
						<input id="password" name="password" placeholder='<spring:message code="password.title" />'
							type="password" class="form-control" value="" autocomplete="n">
					</div>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="form-group">
					<label for="repassword" class="col-sm-4 control-label"> <span
						class="red-fonts">*&nbsp;&nbsp;&nbsp;</span><spring:message code="confirmpassword" />
					</label>
					<div class="col-sm-6">
						<input id="repassword" name="repassword" placeholder='<spring:message code="confirmpassword.title" />'
							type="password" class="form-control" value="">
					</div>
					<span id="password_info"></span>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="form-group">
					<label for="email" class="col-sm-4 control-label"> <span
						class="red-fonts">*&nbsp;&nbsp;&nbsp;</span><spring:message code="email" />
					</label>
					<div class="col-sm-6">
						<input id="email" name="email" type="email"
							placeholder='<spring:message code="email.title" />'
							class="form-control">
					</div>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="form-group">
					<label for="firstname" class="col-sm-4 control-label"> <span
						class="red-fonts">*&nbsp;&nbsp;&nbsp;</span><spring:message code="lastname" />
					</label>
					<div class="col-sm-6">
						<input id="firstname" name="firstname" type="text"
							placeholder='<spring:message code="lastname.title" />' class="form-control">
					</div>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="form-group">
					<label for="lastname" class="col-sm-4 control-label"> <span
						class="red-fonts">*&nbsp;&nbsp;&nbsp;</span><spring:message code="firstname" />
					</label>
					<div class="col-sm-6">
						<input id="lastname" name="lastname" type="text"
							placeholder='<spring:message code="firstname.title" />' class="form-control">
					</div>
				</div>
				<!-- <div class="hr-line-dashed"></div>
				<div class="form-group">
					<label for="role" class="col-sm-4 control-label"><spring:message code="role" /></label>
					<div class="col-sm-4">
						<select id="accounttype" name="accounttype" class="form-control m-b">
							<option value="1" ><spring:message code="accounttype.1"/></option>
							<option value="0" selected><spring:message code="accounttype.0"/></option>
						</select>
					</div>
				</div> -->
				<div class="hr-line-dashed"></div>
				<div  class="accounttypes">
					<div class="form-group">
						<label for="account" class="col-sm-4 control-label"><span
						class="red-fonts">*&nbsp;&nbsp;&nbsp;</span><spring:message code="user.account" /></label>
						<div class="col-sm-3">
							<select id="secrole" name="secrole" class="form-control m-b" >
								<option value="admins" ><spring:message code="accounttype.1" /></option>
								<option value="users" selected><spring:message code="accounttype.0" /></option>
							</select>
						</div>
						<div class="col-sm-4">
							<select id="accounttypevals" name="account"  class="accounttypesecs form-control m-b">
							</select>
						</div>
					</div>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="form-group">
					<div class="col-sm-8 col-sm-offset-4">
						<button id="reset_button" class="btn btn-white" type="reset"><spring:message code="reset" /></button>
						<button id="submit_button" class="btn btn-primary" type="submit"><spring:message code="save" /></button>
					</div>
				</div>
				
			</form>
		</div>
	</div>
<script src="static/js/echarts/echarts.js"></script>
<script src="static/js/validator/zh_CN.js"></script>
</body>
</html>