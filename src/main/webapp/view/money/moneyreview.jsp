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
$(document).ready(function(){
	$(".delbtnclass").click(function(e){
		var row = $(this).closest('tr');
		$.ajax({
			url:'money/deletedesc',
			data:{
				id:$(this).attr("value")
			},
			contentType: "application/json; charset=utf-8",//发送类型
			datatype:'json',//预期返回类型
			success:function(data,textStatus,xhr){
				if(data.success){
        		    Lobibox.notify('info', {
                        	size: 'mini',
                            position: 'top right',
                            msg: "删除成功"
                    });
        		   row.remove();
        		}else{
        			Lobibox.notify('error', {
                    	size: 'mini',
                        position: 'top right',
                        msg: "错误："+data.code+"|"+data.desc
                	});
        		}
			}
		});
	});
})
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
	<div class="modal-body">
		<div class="ibox-content">
			<form method="post" id="form1" name="form1" action="#"  class="form-horizontal"  >
				<div class="form-group">
					<label for=""  > 操作日期
					</label>
					 <p class="form-control-static">
						 	${entity.createDate }
						 </p>
				</div>
				<div class="form-group">
					<label for=""  > 结果
					</label>
					 <p class="form-control-static">
						 	${entity.statusName }
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
					    <table class="table table-striped table-bordered table-hover">
					     <thead>
					     <tr>
					         <th>描述</th>
					        <th>付款凭证</th>
					        </tr>
					     </thead>   
					        <tbody>
					           <c:forEach items="${desc }" var="d">
					            <tr>
					            <td>${d.descrition }</td>
					            <td><a href="${d.httpPath }" class="btn btn-xs btn-primary" target="blank">下载</a>
					            	<a href="javascript:void(0);" class="btn btn-danger btn-xs delbtnclass" value="${d.id }">删除</a>
					            </td>
					            </tr>
					           </c:forEach>
					        </tbody>
					    </table>
				</div>
				<div class="form-group">
					<div class="col-md-8 col-md-offset-4">
						<button id="close_button" class="btn btn-xs btn-white" type="button" >重置</button>
					</div>
				</div>
				
			</form>
		</div>
	</div>
<script src="static/js/validator/zh_CN.js"></script>
</body>
</html>