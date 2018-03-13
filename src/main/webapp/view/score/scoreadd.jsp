<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/qcplustaglib" prefix="qc"%>
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
	
    $('#addform').validator({
		timely : 8,
		fields : {
			"userid" : "required,integer(+0)",
			"content":"required,integer",
			"value":"required,integer"
		},
		valid : function(form) {
		    $("#submit_button").attr("disabled",true);
	        $.ajax({
	        	async: false,
	            type: "POST",
	            url: $("#addform").attr("action"),//提交的URL
	            data: $('#addform').serialize(), // 要提交的表单
	            dataType: "json",
	            mimeType: "application/json", 
	            success: function (data,status) {//status 200
	        	$("#submit_button").attr("disabled",false);
	        		if(data.success){
	        		    Lobibox.notify('info', {
	                        	size: 'mini',
	                            position: 'top right',
	                            msg: "新增积分成功"
	                    });
		                 $('#addModal').modal('hide');
		                 setTimeout(function(){window.location='score/list';}, 2000);
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
<title>新增积分</title>
</head>
<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h3 class="modal-title" id="myModalLabel">新增积分</h3>
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
			<form method="post" id="addform" action="score/add"
				enctype="multipart/form-data" class="form-horizontal"  autocomplete="off">
				<div class="form-group">
					<label for="userid" class="col-sm-4 control-label"> <span
						class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>用户
					</label>
					<div class="col-sm-6">
						<input id="userid" name="userid" placeholder="请输入" value="48"
							type="text" class="form-control" >
					</div>
				</div>
				<div class="form-group">
					<label for="content" class="col-sm-4 control-label"> <span
						class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>类型
					</label>
					<div class="col-sm-6">
					   <qc:configSelect catalog="score" id="content1" name="content" classname="form-control"></qc:configSelect>
						<script type="text/javascript">
							$("#content1").on("change",function(){
								var s = $("#content1 :selected");
								if(s==null||s==undefined){
								    s = $("#content1").children().first();
								}
								
								var code = s.val();
								var value = s.attr("codevalue");
								if(code=='-1'){
									$("#value").attr("readOnly",false);
									$("#value").val('');
								}else{
								    $("#value").attr("readOnly",true);
									$("#value").val(value);
								}
								$("#value").trigger("validate");
							})
						</script>
					</div>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="form-group">
					<label for="value" class="col-sm-4 control-label"> <span
						class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>积分值
					</label>
					<div class="col-sm-6">
						<input id="value" name="value" placeholder='请输入'
							type="text" class="form-control" value="" autocomplete="n">
							<span class="help-block">可以是负值</span>
					</div>
				</div>
				<div class="form-group">
					<label for="remark" class="col-sm-4 control-label"> 备注
					</label>
					<div class="col-sm-6">
						<textarea id="remark" name="remark" placeholder='请输入'
							class="form-control" ></textarea>
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