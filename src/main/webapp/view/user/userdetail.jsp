<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
#error {
	text-align: center;
	display: block;
	line-height: 20px;
	font-size: 15px;
	color: #F62217;
}
</style>
<script>
//保存基础信息
function check(reback){
  	//提交
    $.ajax({
		    async : false,
		    type : "POST",
		    url : "user/check/${user.id}/"+reback,//提交的URL
		    data : '', // 要提交的表单
		    dataType : "json",
		    mimeType : "application/json",
		    success : function(data, status) {//status 200
				if (data.success) {
				    Lobibox.notify('info', {
					size : 'mini',
					position : 'top right',
					msg : "审核${user.loginname}成功"
				    });
				    $('#addModal').modal('hide');
			        setTimeout(function(){window.location='user/list';}, 2000);
				} else {
				    $('#error').html(data.code);
				    $('#accordion').show();
				    $('#collapseOneContent').html(data.desc);
				}
		    },
		    error : function(data, status) {
				$("#submit_button").attr("disabled", false);
				Lobibox.notify('error', {
				    size : 'mini',
				    position : 'top right',
				    msg : data.desc
				});
		    }
		});
}

	
$(document).ready(function () {

	$('#collapseOne').collapse('hide');
	$('#accordion').hide();
	
	$('input').on('input',function(){
	//    $(this).trigger("validate");
	});
	
	 $("#checkPassBtn").on("click",function(){
	     check(true);
	 });
	 $("#checkUnPassBtn").on("click",function(){
	     check(false);
	 });
});
</script>

<title>新增角色</title>
</head>
<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h3 class="modal-title" id="myModalLabel">详细信息</h3>
	</div>
	<span id="error"></span>
	<div class="panel-group" id="accordion">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"> <spring:message code="view.details"></spring:message>
					</a>
				</h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse in">
				<div id="collapseOneContent" class="panel-body"></div>
			</div>
		</div>
	</div>
	<div class="modal-body">
		<div class="ibox-content">
			<form class="form-horizontal">
			<div class="form-group">
				<label for="loginname" class="col-sm-4"> 邮箱（全网唯一）
				</label>
				<div class="col-sm-6 ">
					<span id="loginname">${user.loginname }</span>
				</div>
			</div>

			<div class="form-group">
				<label for="logtype" class="col-sm-4"> 用户类型
				</label>
				<div class="col-sm-6">
					<span id="logtype"><c:if test="${user.logtype eq 1 }">发单员</c:if>
					<c:if test="${user.logtype eq 2 }">接单员</c:if>
					<c:if test="${user.logtype eq 3 }">发单员/接单员</c:if>
					<c:if test="${user.logtype eq 4 }">发单员/接单公司</c:if></span>
				</div>
			</div>
			<c:if test="${user.logtype eq 1 or user.logtype eq 3 or user.logtype eq 4 }">
				<div class="hr-line-dashed"></div>
				<div class="form-group">
					<label for="sender_name" class="col-sm-6">
						<h4>发单员详细信息</h4>
					</label>
				</div>
				<div class="form-group">
					<label for="sender_name" class="col-sm-4"> 名称
					</label>
					<div class="col-sm-6 "><span id="sender_name" >${sender.name}</span></div>
				</div>

				<div class="form-group">
					<label for="sender_nikename" class="col-sm-4"> 简称
					</label>
					<div class="col-sm-6 "><span id="sender_nickname">${sender.nikename}</span></div>
				</div>

				<div class="form-group">
					<label for="sender_nature" class="col-sm-4"> 公司性质
					</label>
					<div class="col-sm-6 "><span >${sender.nature}</span></div>
				</div>

				<div class="form-group">
					<label for="sender_email" class="col-sm-4"> 电子邮箱
					</label>
					<div class="col-sm-6 "><span >${sender.email}</span></div>
				</div>

				<div class="form-group">
					<label for="sender_telephone" class="col-sm-4"> 电话号码
					</label>
					<div class="col-sm-6 "><span >${sender.telephone}</span></div>
				</div>

				<div class="form-group">
					<label for="sender_contact" class="col-sm-4"> 联系人
					</label>
					<div class="col-sm-6 "><span >${sender.contact}</span></div>
				</div>

				<div class="form-group">
					<label for="sender_city" class="col-sm-4"> 省市
					</label>
					<div class="col-sm-6 "><span >${sender.city}</span></div>
				</div>

				<div class="form-group">
					<label for="sender_address" class="col-sm-4"> 地址
					</label>
					<div class="col-sm-6 "><span >${sender.address}</span></div>
				</div>

				<div class="form-group">
					<label for="sender_cardphoto" class="col-sm-4"> 营业执照
					</label>
					<div class="col-sm-6 "><span ><img alt="${FileSystem}${sender.cardphoto}" class="form-control" src="${FileSystem}${sender.cardphoto}"></span></div>
				</div>
			</c:if>

			<c:if test="${user.logtype eq 2 or user.logtype eq 3 }">
				<div class="hr-line-dashed"></div>
				<div class="form-group">
					<label for="sender_name" class="col-sm-6">
						<h4>接单员详细信息</h4>
					</label>
				</div>
				<div class="form-group">
					<label for="recever_name" class="col-sm-4"> 名称
					</label>
					<div class="col-sm-6 "><span >${recever.name}</span></div>
				</div>
				<div class="form-group">
					<label for="recever_nickname" class="col-sm-4"> 简称
					</label>
					<div class="col-sm-6 "><span >${recever.nickname}</span></div>
				</div>
				<div class="form-group">
					<label for="recever_gender" class="col-sm-4"> 性别
					</label>
					<div class="col-sm-6 "><span >${recever.gender}</span></div>
				</div>
				<div class="form-group">
					<label for="recever_birth" class="col-sm-4"> 出生日期
					</label>
					<div class="col-sm-6 "><span >${recever.birth}</span></div>
				</div>
				<div class="form-group">
					<label for="recever_idcard" class="col-sm-4"> 身份证号
					</label>
					<div class="col-sm-6 "><span >${recever.idcard}</span></div>
				</div>
				<div class="form-group">
					<label for="recever_phone" class="col-sm-4"> 手机号码
					</label>
					<div class="col-sm-6 "><span >${recever.phone}</span></div>
				</div>
				<div class="form-group">
					<label for="recever_email" class="col-sm-4"> 电子邮箱
					</label>
					<div class="col-sm-6 "><span >${recever.email}</span></div>
				</div>

				<div class="form-group">
					<label for="recever_city" class="col-sm-4"> 省市
					</label>
					<div class="col-sm-6 "><span >${recever.city}</span></div>
				</div>
				<div class="form-group">
					<label for="recever_address" class="col-sm-4"> 所在地区
					</label>
					<div class="col-sm-6 "><span >${recever.address}</span></div>
				</div>
				<div class="form-group">
					<label for="recever_ServiceCity" class="col-sm-4"> 可服务省市
					</label>
					<div class="col-sm-6 "><span >${recever.serviceCity}</span></div>
				</div>
				<div class="form-group">
					<label for="recever_serviceAddr" class="col-sm-4"> 可服务地区
					</label>
					<div class="col-sm-6 "><span >${recever.serviceAddr}</span></div>
				</div>
				<div class="form-group">
					<label for="recever_servceType" class="col-sm-4"> 服务类型
					</label>
					<div class="col-sm-6 "><span >${recever.servceType}</span></div>
				</div>
				<div class="form-group">
					<label for="recever_productType" class="col-sm-4"> 产品类型
					</label>
					<div class="col-sm-6 "><span >${recever.productType}</span></div>
				</div>
				<div class="form-group">
					<label for="recever_education" class="col-sm-4"> 学历
					</label>
					<div class="col-sm-6 "><span >${recever.education}</span></div>
				</div>
				<div class="form-group">
					<label for="recever_language" class="col-sm-4"> 语言技能
					</label>
					<div class="col-sm-6 "><span >${recever.language}</span></div>
				</div>
				<div class="form-group">
					<label for="recever_resume" class="col-sm-4"> 个人简历
					</label>
					<div class="col-sm-6 "><span >${recever.resume}</span></div>
				</div>
				<div class="form-group">
					<label for="recever_photo" class="col-sm-4"> 生活照
					</label>
					<div class="col-sm-6 "><span >${recever.photo}</span></div>
				</div>
				<div class="form-group">
					<label for="recever_cardPhoto" class="col-sm-4"> 证件照
					</label>
					<div class="col-sm-6 "><span >${recever.cardPhoto}</span></div>
				</div>
				<div class="form-group">
					<label for="recever_emergencyContact" class="col-sm-4"> 紧急联系人
					</label>
					<div class="col-sm-6 "><span >${recever.emergencyContact}</span></div>
				</div>
			</c:if>

			<c:if test="${user.logtype eq 4 }">
				<div class="hr-line-dashed"></div>
				<div class="form-group">
					<label for="sender_name" class="col-sm-6">
						<h4>接单公司详细信息</h4>
					</label>
				</div>
				<div class="form-group">
					<label for="rececomp_name" class="col-sm-4"> 名称
					</label>
					<div class="col-sm-6 "><span >${receComp.name}</span></div>
				</div>
				<div class="form-group">
					<label for="rececomp_nickname" class="col-sm-4"> 简称
					</label>
					<div class="col-sm-6 "><span >${receComp.nikename}</span></div>
				</div>
				<div class="form-group">
					<label for="rececomp_companySize" class="col-sm-4"> 公司规模
					</label>
					<div class="col-sm-6 "><span >${receComp.companySize}</span></div>
				</div>

				<div class="form-group">
					<label for="rececomp_telephone" class="col-sm-4"> 联系人
					</label>
					<div class="col-sm-6 "><span >${receComp.contact}</span></div>
				</div>
				<div class="form-group">
					<label for="rececomp_telephone" class="col-sm-4"> 手机号码
					</label>
					<div class="col-sm-6 "><span >${receComp.telephone}</span></div>
				</div>
				<div class="form-group">
					<label for="rececomp_email" class="col-sm-4"> 电子邮箱
					</label>
					<div class="col-sm-6 "><span >${receComp.email}</span></div>
				</div>
				<div class="form-group">
					<label for="rececomp_city" class="col-sm-4"> 省市
					</label>
					<div class="col-sm-6 "><span >${receComp.city}</span></div>
				</div>
				<div class="form-group">
					<label for="rececomp_address" class="col-sm-4"> 所在地区
					</label>
					<div class="col-sm-6 "><span >${receComp.address}</span></div>
				</div>
				<div class="form-group">
					<label for="rececomp_ServiceCity" class="col-sm-4"> 可服务省市
					</label>
					<div class="col-sm-6 "><span >${receComp.serviceCity}</span></div>
				</div>
				<div class="form-group">
					<label for="rececomp_serviceAddr" class="col-sm-4"> 可服务地区
					</label>
					<div class="col-sm-6 "><span >${receComp.serviceAddr}</span></div>
				</div>
				<div class="form-group">
					<label for="rececomp_servceType" class="col-sm-4"> 服务类型
					</label>
					<div class="col-sm-6 "><span >${receComp.serviceType}</span></div>
				</div>
				<div class="form-group">
					<label for="rececomp_productType" class="col-sm-4"> 产品类型
					</label>
					<div class="col-sm-6 "><span >${receComp.prodoctType}</span></div>
				</div>
				<div class="form-group">
					<label for="rececomp_cardphoto" class="col-sm-4"> 营业执照
					</label>
					<div class="col-sm-6 "><span >${receComp.cardphoto}</span></div>
				</div>
				<div class="form-group">
					<label for="rececomp_website" class="col-sm-4"> 公司官网
					</label>
					<div class="col-sm-6 "><span >${receComp.website}</span></div>
				</div>
				<div class="form-group">
					<label for="rececomp_logo" class="col-sm-4"> 公司Logo
					</label>
					<div class="col-sm-6 "><span >${receComp.logo}</span></div>
				</div>
			</c:if>


		</div>
	</div>
	<script src="static/js/validator/zh_CN.js"></script>
</body>
</html>