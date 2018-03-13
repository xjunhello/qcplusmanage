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
		
		/*rules : {
			check_password : [ /^\w{6,16}$/, '<spring:message code="validator.password"/>' ],
			check_username : [ /^\w{3,20}$/, '<spring:message code="validator.name"/>' ],
			check_email : [ /^([a-zA-Z0-9_-])+\.?([a-zA-Z0-9])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/,'<spring:message code="validator.formaterr"/>' ],
			check_repassword : function (element,param,field){
				return element.value == $("#password").val() || '<spring:message code="validator.repassword"/>' ;
			}
		},*/
		fields : {
			"title" : {
				rule : "required",
				ok : "",
				msg : {
					required : '必需填写'
				}
			}
		},
		valid : function(form) {
		    $("#submit_button").attr("disabled",true);
		    $("#editor2").val(hotmessage.getData());
	        $.ajax({
	        	async: false,
	            type: "POST",
	            url: $("#form1").attr("action"),//提交的URL
	            data: $('#form1').serialize(), // 要提交的表单
	            dataType: "json",
	            mimeType: "application/json", 
	            success: function (data,status) {//status 200
	        	$("#submit_button").attr("disabled",false);
	        		if(data.success){
	        		    Lobibox.notify('info', {
	                        	size: 'mini',
	                            position: 'top right',
	                            msg: "更新热点资讯成功"
	                    });
		                 $('#commonModal').modal('hide');
		                 setTimeout(function(){window.location='hot/list?pageSize=100';}, 2000);
	        		}else{
	        		    $('#error').html(data.code);
			            $('#accordion').show();
			            $('#collapseOneContent').html(data.desc);
	        		}
	            },
	            error: function (data,status) {//status not 200
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
</script>
<script>
	$(document).ready(function () {
	    $('input').on('input',function(){
		    $(this).trigger("validate");
		});
	});
</script>
<title>更新热点</title>
</head>
<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h3 class="modal-title" id="myModalLabel">更新热点</h3>
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
			<form method="post" id="form1" action="hot/update" enctype="multipart/form-data" class="form-horizontal"  >
			<input type="hidden" name="id" value="${hot.id }"/>
				<div class="form-group">
					<label for="name"  > <span
						class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>文章标题
					</label>
						<input id="name" name="title" placeholder="请输入"  value="${hot.title }"
							type="text" class="form-control" >
				</div>
				 
				  <div class="form-group">
				    	<span class="red-fonts">*&nbsp;&nbsp;&nbsp;</span><strong>文章内容</strong>
						 <textarea name="contentDesc" id="editor2" >${hot.contentDesc }</textarea>
						 <script>
				                var hotmessage = CKEDITOR.replace( 'editor2' );
				                CKFinder.setupCKEditor( hotmessage, '/qceditor/static/ckfinder/' );
				            </script>
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