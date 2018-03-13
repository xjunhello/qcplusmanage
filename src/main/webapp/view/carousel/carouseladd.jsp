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

var editorElement = CKEDITOR.document.getById( 'editor' );


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
	   

    $('#addform').validator({
		timely : 8,
		fields : {
		    "carouselfile":"required",
			"descInfo":"length(0~100)",
			"orderNo":"integer",
			"url":"url"
		},
		valid : function(form) {
		   // $("#submit_button").button("loading");
		   
		   var formData = new FormData($( "#addform" )[0]); 
	        $.ajax({
	        	async: false,
	            type: "POST",
	            url: $("#addform").attr("action"),//提交的URL
	            data:formData, // 要提交的表单
	            processData: false,
			    contentType: false,
	            success: function (data,status) {//status 200
	            	//$("#submit_button").button("reset");
	        		if(data.success){
	        		    Lobibox.notify('info', {
	                        	size: 'mini',
	                            position: 'top right',
	                            msg: "上传成功"
	                    });
		                 $('#addModal').modal('hide');
		                 setTimeout(function(){window.location='carousel/list';}, 2000);
	        		}else{
	        		    $('#error').html(data.code);
			            $('#accordion').show();
			            $('#collapseOneContent').html(data.desc);
	        		}
	            },
	            error: function (data,status) {//status not 200
	            	   //$("#submit_button").button("reset");
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
<title>上传轮播图</title>
</head>
<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h3 class="modal-title" id="myModalLabel">上传轮播图</h3>
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
			<form method="post" id="addform" action="carousel/add"
				enctype="multipart/form-data" class="form-horizontal"  autocomplete="off">
				  <div class="form-group">
				    <label for="orderNo" class="col-sm-4 control-label">序号
					</label>
					<div class="col-sm-6">
						<input id="orderNo" name="orderNo" placeholder="请输入"
							type="text" class="form-control" >
					</div>
				  </div>
				  <div class="form-group">
				    <label for="url" class="col-sm-4 control-label">超链接
					</label>
					<div class="col-sm-6">
						<input id="url" name="url" placeholder="请输入"
							type="text" class="form-control" >
					</div>
				  </div>
				  
				  <div class="form-group">
				    <label for="carouselfile" class="col-sm-4 control-label">轮播图
					</label>
					<div class="col-sm-6">
						<input id="carouselfile" name="carouselfile" 
							type="file" class="form-control" >
					</div>
				  </div>
				  
				   <div class="form-group">
					    <label for="descInfo" class="col-sm-4 control-label">描述
						</label>
						<div class="col-sm-6">
							<textarea name="descInfo" id="descInfo"  class="form-control"></textarea>
						</div>
				  </div>
				  
				<div class="form-group">
					<div class="col-md-8 col-md-offset-4">
						<button id="reset_button" class="btn btn-white" type="reset">重置</button>
						<button id="submit_button" class="btn btn-primary" data-loading-text="正在上传..." type="submit">提交</button>
					</div>
				</div>
				
			</form>
		</div>
	</div>
<script src="static/js/validator/zh_CN.js"></script>
</body>
</html>