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
<script src="<%=basePath%>/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="<%=basePath%>/ckfinder/ckfinder.js"></script>
<script>
if ( CKEDITOR.env.ie && CKEDITOR.env.version < 9 )
	CKEDITOR.tools.enableHtml5Elements( document );
CKEDITOR.config.height = 300;
CKEDITOR.config.width = "auto";

</script>
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
	   

    $('#form1').validator({
		timely : 8,
		fields : {
			"desc" : "required",
			"attachfile":"required"
		},
		valid : function(form) {
			$("#status").val("4");
		    $("#submit_button").attr("disabled",true);
		    var formData = new FormData($("#form1")[0]);  
		    console.log(formData);
	        $.ajax({
	        	async: false,
	            type: "POST",
	            url: $("#form1").attr("action"),//提交的URL
	            data: formData, // 要提交的表单
	            processData: false,
			    contentType: false,
	            success: function (data,status) {//status 200
	        	$("#submit_button").attr("disabled",false);
	        		if(data.success){
	        		    Lobibox.notify('info', {
	                        	size: 'mini',
	                            position: 'top right',
	                            msg: "审核${entity.typeName}成功，金额：${entity.value}"
	                    });
		                 $('#commonModal').modal('hide');
		                 setTimeout(function(){window.location='money/list?pageSize=100&type=${entity.type}&status=${entity.status}';}, 2000);
	        		}else{
	        		    $('#error').html(data.code);
			            $('#accordion').show();
			            $('#collapseOneContent').html(data.desc);
	        		}
	            },
	            error: function (data,status) {//status not 200
	        			$("#submit_button").attr("disabled",false);
	            		console.log(data);
	            		console.log(status);
	        			Lobibox.notify('error', {
	                            	size: 'mini',
	                                position: 'top right',
	                                msg: '系统错误：'+data.status+"|"+data.statusText
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
<title>收付款确认</title>
</head>
<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h4 class="modal-title" id="myModalLabel">${entity.typeName}</h4>
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
			<form method="post" id="form1" name="form1" action="money/update" enctype="multipart/form-data" class="form-horizontal"  >
			<input type="hidden" name="id" value="${entity.id }"/>
			<input type="hidden" id="type" name="type" value="${entity.type }" >
			<input type="hidden" id="status" name="status"  >
			<input type="hidden" id="userid" name="userid" value="${entity.userLogin.id }" >
			<input type="hidden" id="orderCode" name="orderCode" value="${entity.orderdesc.orderCode }" >
				<div class="form-group">
					<label for=""  > 操作日期
					</label>
					 <p class="form-control-static">
						 	${entity.createDate }
						 </p>
				</div>
				<div class="form-group">
					<label for=""  > 金额
					</label>
					 <p class="form-control-static">
						 	${entity.value }
						 </p>
				</div>
				 <div class="form-group">
					<label for=""  >
						用户名
					</label>
						 <p class="form-control-static">
						 	${entity.userLogin.loginname }
						 </p>
				</div>
				 <div class="form-group">
					<label for=""  >
						收款账号
					</label>
					<p class="form-control-static">
						 	建设银行：622288884444
						 </p>
				</div>
				<div class="form-group">
					<label for=""  >
						关联订单号
					</label>
						<p class="form-control-static">
						 	${entity.orderdesc.orderCode }
						 </p>
				</div>
				
				<div class="form-group">
					<label for="desc"  > 备注
					</label>
						<textarea id="desc" name="desc" placeholder="请输入" 
							 class="form-control" ></textarea>
				</div>
				<div class="form-group">
					<label for="attachfile"  > 付款凭证
					</label>
						<input id="attachfile" name="attachfile" placeholder="请输入"  
							type="file" class="form-control" >
				</div>
				<div class="form-group">
					<div class="col-md-8 col-md-offset-4">
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