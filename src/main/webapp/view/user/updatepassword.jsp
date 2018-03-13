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
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT"> 
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
	   $('#collapseOne').collapse('hide');
	   $('#accordion').hide();
   });
</script>
<title><spring:message code="updatepassword.title"></spring:message></title>
</head>
<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h3 class="modal-title" id="myModalLabel"><spring:message code="updatepassword.title"/></h3>
	</div>
	<span id="error"></span>
	 <div class="panel-group" id="accordion">
	   <div class="panel panel-default">
	      <div class="panel-heading">
	         <h4 class="panel-title">
	            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
	                                       <spring:message code="view.details"/>
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
			<form method="post" id="updatePasswordForm" action="user/updatePassword/${id}"
				enctype="multipart/form-data" class="form-horizontal">
				<div class="form-group">
					<label for="password" class="col-sm-4 control-label"> <span
						class="red-fonts">*&nbsp;&nbsp;&nbsp;</span><spring:message code="updatepassword.newpass"/>
					</label>
					<div class="col-sm-6">
						<input id="password" name="password" placeholder='<spring:message code="updatepassword.passlabel"/>'
							type="password" class="form-control" >
					</div>
				</div>
				<div class="form-group">
					<label for="repassword" class="col-sm-4 control-label"> <span
						class="red-fonts">*&nbsp;&nbsp;&nbsp;</span><spring:message code="updatepassword.confirmpass"/>
					</label>
					<div class="col-sm-6">
						<input id="repassword" name="repassword" placeholder='<spring:message code="updatepassword.confirmpasslabel"/>'
							type="password" class="form-control" >
					</div>
					<span id="password_info"></span>
				</div>
				<div class="form-group">
					<div class="col-sm-8 col-sm-offset-4">
						<button id="submit_cancel" class="btn btn-white" type="reset"><spring:message code="cancel"/></button>
						<button id="submit_button" class="btn btn-primary" type="submit"><spring:message code="sure"/></button>
					</div>
				</div>
			</form>
		</div>
	</div>
<script>
	$(document).ready(function(){
		$("#submit_cancel").click(function(){
			$('#passwordmodol').modal('hide');
		});
	})
</script>
<script src="static/js/echarts/echarts.js"></script>
<script src="static/js/validator/zh_CN.js"></script>
<script>
		$(document).ready(function(){
			$('#updatePasswordForm').validator({
				timely : 2,
				
				rules : {
					check_password : [ /^\w{6,16}$/, '<spring:message code="validator.password"/>' ],
					check_repassword : function (element,param,field){
						return element.value == $("#password").val() || '<spring:message code="validator.repassword"/>' ;
					}
				},

				fields : {
					"password" : {
						rule : "required;check_password",
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
					console.log("submit");
			        $.ajax({
			        	async: false,
			            type: "POST",
			            url: '<%=basePath%>user/updatePassword/${id}',//提交的URL
			            data: $('#updatePasswordForm').serialize(), // 要提交的表单
			            dataType: "json",
			            mimeType: "application/json", 
			            success: function (data) {
			                $('#passwordmodol').modal('hide');
			                Lobibox.notify('success', {
			            		size: 'mini',
			                    position: 'top right',
			                    msg: '<spring:message code="updatepassword.success"/>'
							});
			            },
			            error: function (xhr, data) {
			                $('#error').html(decodeURI(xhr.getResponseHeader("error_code")));
			                $('#accordion').show();
			                $('#collapseOneContent').html(xhr.getResponseHeader("error_text"));
			            }
			        });
				}
			});
		});
</script>
</body>
</html>