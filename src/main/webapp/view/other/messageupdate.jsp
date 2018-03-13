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
		
		fields : {
			'fromUser':'required,digits',
			'toUser':'required,digits',
			'content':'required,length(1~500)',
			'infoType':'required'
		},
		valid : function(form) {
		    $("#submit_button").attr("disabled",true);
	        $.ajax({
	        	async: false,
	            type: "POST",
	            url: $("#updateform").attr("action"),//提交的URL
	            data: $('#updateform').serialize(), // 要提交的表单
	            dataType: "json",
	            mimeType: "application/json", 
	            success: function (data,status) {//status 200
	        	$("#submit_button").attr("disabled",false);
	        		if(data.success){
	        		    Lobibox.notify('info', {
	                        	size: 'mini',
	                            position: 'top right',
	                            msg: "发送成功"
	                    });
		                 $('#addModal').modal('hide');
		                 setTimeout(function(){window.location='message/list';}, 2000);
	        		}else{
	        		    $('#error').html(data.code);
			            $('#accordion').show();
			            $('#collapseOneContent').html(data.desc);
	        		}
	            },
	            error: function (data,status) {//status not 200
	        			console.log("statustext:"+status);
	            		console.log(data);
	        			$("#submit_button").attr("disabled",false);
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

	$(document).ready(function () {
	    $('input').on('input',function(){
		    $(this).trigger("validate");
		});
	});
</script>
<title>发送消息</title>
</head>
<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h3 class="modal-title" id="myModalLabel">发送消息</h3>
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
			<form method="post" id="updateform" action="message/update"
				enctype="multipart/form-data" class="form-horizontal"  autocomplete="off">
				<input type="hidden" name="id" value="${message.id }">
				<div class="form-group">
					<label for="fromUser" class="col-sm-4 control-label"> <span
						class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>发送者
					</label>
					<div class="col-sm-6">
						<input class="form-control" id="fromUser" value="${message.fromUser }" 
						name="fromUser" placeholder='请输入' readOnly>
					</div>
				</div>
				<div class="form-group">
					<label for="toUser" class="col-sm-4 control-label"> <span
						class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>接收者
					</label>
					<div class="col-sm-6">
						<input class="form-control" id="toUser" value="${message.toUser }"
						name="toUser" placeholder='请输入' readOnly>
					</div>
				</div>
				<div class="form-group">
					<label for="name" class="col-sm-4 control-label"> <span
						class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>消息类型
					</label>
					<div class="col-sm-6">
						<select id="infoType" name="infoType" class="form-control">
							<option value="1" <c:if test="${message.infoType eq 1 }">selected</c:if>>交易提醒</option>
							<option value="2" <c:if test="${message.infoType eq 2 }">selected</c:if>>系统通知</option>
						</select>
					</div>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="form-group">
					<label for="descrtion" class="col-sm-4 control-label"> <span
						class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>内容
					</label>
					<div class="col-sm-6">
						<textarea rows="10" cols="50" class="form-control" id="content" 
						name="content" >${message.content }</textarea>
					</div>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="form-group">
					<div class="col-sm-8 col-sm-offset-4">
						<button id="submit_button" class="btn btn-primary" type="submit">重新发送</button>
					</div>
				</div>
				
			</form>
		</div>
	</div>
<script src="static/js/validator/zh_CN.js"></script>
</body>
</html>