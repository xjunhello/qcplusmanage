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
	   

	

    $('#updateform').validator({
		timely : 8,
		
		/*rules : {
			check_password : [ /^\w{6,16}$/, '<spring:message code="validator.password"/>' ],
			check_username : [ /^\w{3,20}$/, '<spring:message code="validator.name"/>' ],
			check_email : [ /^([a-zA-Z0-9_-])+\.?([a-zA-Z0-9])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/,'<spring:message code="validator.formaterr"/>' ],
			check_repassword : function (element,param,field){
				return element.value == $("#password").val() || '<spring:message code="validator.repassword"/>' ;
			}
		},*/
		fields : {
			"name" : {
				rule : "required",
				ok : "",
				msg : {
					required : '必需填写'
				}
			},
			"descrtion" : {
				rule : "required",
				ok : "",
				msg : {
					required : '必需填写'
				}
			}
		},
		valid : function(form) {
	        $.ajax({
	        	async: false,
	            type: "POST",
	            url: $("#updateform").attr("action"),//提交的URL
	            data: $('#updateform').serialize(), // 要提交的表单
	            dataType: "json",
	            mimeType: "application/json", 
	            success: function (data,status) {//status 200
	        		if(data.success){
	        		    Lobibox.notify('info', {
	                        	size: 'mini',
	                            position: 'top right',
	                            msg: "修改角色成功"
	                    });
		                 $('#addModal').modal('hide');
		                 setTimeout(function(){window.location='role/list';}, 2000);
	        		}else{
	        		    $('#error').html(data.code);
			            $('#accordion').show();
			            $('#collapseOneContent').html(data.desc);
	        		}
	            },
	            error: function (data,status) {//status not 200
	        			Lobibox.notify('error', {
	                            	size: 'mini',
	                                position: 'top right',
	                                msg: data.desc
	                    });
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
<title>修改角色</title>
</head>
<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h3 class="modal-title" id="myModalLabel">修改角色</h3>
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
			<form method="post" id="updateform" action="role/update"
				enctype="multipart/form-data" class="form-horizontal"  autocomplete="off">
				<input type="hidden" name="id" value="${role.id }">
				<input type="hidden" name="isdelete" value="${role.isdelete }">
				<div class="form-group">
					<label for="name" class="col-sm-4 control-label"> <span
						class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>角色名称
					</label>
					<div class="col-sm-6">
						<input id="name" name="name" placeholder="请输入" value="${role.name }"
							type="text" class="form-control" >
					</div>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="form-group">
					<label for="descrtion" class="col-sm-4 control-label"> <span
						class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>描述
					</label>
					<div class="col-sm-6">
						<input id="descrtion" name="descrtion" placeholder='请输入' value="${role.descrtion }"
							type="text" class="form-control" value="" autocomplete="n">
					</div>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="form-group">
					<div class="col-sm-8 col-sm-offset-4">
						<button id="reset_button" class="btn btn-white" type="reset">重置</button>
						<button id="submit_button" class="btn btn-primary" type="submit">提交</button>
					</div>
				</div>
				
			</form>
		</div>
	</div>
<script src="static/js/validator/zh_CN.js"></script>
</body>
</html>