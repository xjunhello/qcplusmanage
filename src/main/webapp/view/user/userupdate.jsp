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
//保存基础信息
function saveUser(){
    console.log("save user...");
    var result = false;
  //提交
    $.ajax({
		    async : false,
		    type : "POST",
		    url : "user/addUser",//提交的URL
		    data : $('#addUserForm').serialize(), // 要提交的表单
		    dataType : "json",
		    mimeType : "application/json",
		    success : function(data, status) {//status 200
				if (data.success) {
				    Lobibox.notify('info', {
					size : 'mini',
					position : 'top right',
					msg : "保存基础信息成功"
				    });
				    $("#userSaveSuccess").val("true");
				    $("input[name='userid']").val(data.code);
				    result = data;
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
  return result;
}
//保存发单员信息
function saveSender(){
    	var result = {success:false};
    	console.log("test------------");
    	console.log(result);
    	console.log("test------------");
	  //提交
	    $.ajax({
			    async : false,
			    type : "POST",
			    url : "user/addSender",//提交的URL
			    data : $('#addSenderForm').serialize(), // 要提交的表单
			    dataType : "json",
			    mimeType : "application/json",
			    success : function(data, status) {//status 200
					if (data.success) {
					    Lobibox.notify('info', {
						size : 'mini',
						position : 'top right',
						msg : "保存发单员信息成功"
					    });
					    result = data;
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
	  return result;
	}
//保存接单员详细信息
function saveRecever(){
    var result = {success:false};
	  //提交
	    $.ajax({
			    async : false,
			    type : "POST",
			    url : "user/addRecever",//提交的URL
			    data : $('#addReceverForm').serialize(), // 要提交的表单
			    dataType : "json",
			    mimeType : "application/json",
			    success : function(data, status) {//status 200
				$("#submit_button").attr("disabled", false);
					if (data.success) {
					    Lobibox.notify('info', {
						size : 'mini',
						position : 'top right',
						msg : "保存接单员信息成功"
					    });
					    result = data;
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
	    return result;
	}

//保存接单公司详细信息
function saveReceComp(){
	  //提交
	  	var result = {success:false};
	    $.ajax({
			    async : false,
			    type : "POST",
			    url : "user/addReceComp",//提交的URL
			    data : $('#addReceCompForm').serialize(), // 要提交的表单
			    dataType : "json",
			    mimeType : "application/json",
			    success : function(data, status) {//status 200
				$("#submit_button").attr("disabled", false);
					if (data.success) {
					    Lobibox.notify('info', {
						size : 'mini',
						position : 'top right',
						msg : "保存接单公司详细信息成功"
					    });
					    result = data;
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
	    return result;
	}
	
	function allSuccessToDo(){
	    $('#addModal').modal('hide');
	    setTimeout(function() {
		window.location = 'user/list';
	    }, 2000);
	}
	
	function errorHappenToDo(){
	    $("#submit_button").attr("disabled", false);
	}
	
$(document).ready(function () {

	$('#collapseOne').collapse('hide');
	$('#accordion').hide();
	
	$('input').on('input',function(){
	//    $(this).trigger("validate");
	});
	
	 $("#submitBtn").on("click",function(){
	    var result =false;
	    //判断是否已经保存过基本信息，已经保存过的话，忽略此步骤
	    if($("#userSaveSuccess").val()!="true"){
			result = saveUser().success;
		}
		if(result){
		    if($("#logtype :selected").val()==1){
				if(saveSender().success==true){
					allSuccessToDo();
			    }
		    }else if($("#logtype :selected").val()==2){
				if(saveRecever().success==true){
					allSuccessToDo();
			    }
		    }else if($("#logtype :selected").val()==3){
				if($("#senderSaveSuccess").val()!="true"){//先保存发单员 再保存接单员
				    if(saveSender().success==true){
					    if(saveRecever().success==true){
							allSuccessToDo();
					    }
					}
				}else{
				    if(saveRecever().success==true){
						allSuccessToDo();
			    	}
				}
		    }else if($("#logtype :selected").val()==4){
				if($("#senderSaveSuccess").val()!="true"){
				    if(saveSender().success==true){
					    if(saveReceComp().success==true){
							allSuccessToDo();
					    }
					}
				}else{
				    if(saveReceComp().success==true){
						allSuccessToDo();
			    	}
				}
		    }else{
				allSuccessToDo();
		    }
		}
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
		<h3 class="modal-title" id="myModalLabel">新增用户</h3>
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
			<form method="post" id="addUserForm" action="user/add" 
				enctype="multipart/form-data" class="form-horizontal" >
				<input type="text" id="userSaveSuccess" >
				<div class="form-group">
					<label for="loginname" class="col-sm-4 control-label"> <span
						class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>邮箱（全网唯一）
					</label>
					<div class="col-sm-6">
						<input id="loginname" name="loginname" placeholder=""
							type="text" class="form-control" >
					</div>
				</div>
				
				<div class="form-group">
					<label for="qq" class="col-sm-4 control-label"> qq
					</label>
					<div class="col-sm-6">
						<input id="qq" name="qq" placeholder=""
							type="text" class="form-control" >
					</div>
				</div>
				<div class="form-group">
					<label for="weixin" class="col-sm-4 control-label"> 微信
					</label>
					<div class="col-sm-6">
						<input id="weixin" name="weixin" placeholder=""
							type="text" class="form-control" >
					</div>
				</div>
				<div class="form-group">
					<label for="inInfo" class="col-sm-4 control-label"> In
					</label>
					<div class="col-sm-6">
						<input id="inInfo" name="inInfo" placeholder=""
							type="text" class="form-control" >
					</div>
				</div>
				<div class="form-group">
					<label for="facebook" class="col-sm-4 control-label"> Facebook
					</label>
					<div class="col-sm-6">
						<input id="facebook" name="facebook" placeholder=""
							type="text" class="form-control" >
					</div>
				</div>
				<div class="form-group">
					<label for="twitter" class="col-sm-4 control-label"> Twitter
					</label>
					<div class="col-sm-6">
						<input id="twitter" name="twitter" placeholder=""
							type="text" class="form-control" >
					</div>
				</div>
				
				<div class="form-group">
					<label for="twitter" class="col-sm-4 control-label"> Skype
					</label>
					<div class="col-sm-6">
						<input id="skype" name="skype" placeholder=""
							type="text" class="form-control" >
					</div>
				</div>
				
				<div class="form-group">
					<label for="logtype" class="col-sm-4 control-label"> <span
						class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>用户类型
					</label>
					<div class="col-sm-6">
						<select  id="logtype" name="logtype" class="form-control m-b" >
								<option value="" >请选择</option>
								<option value="1" >发单员</option>
								<option value="2" >接单员</option>
								<option value="3" >发单员和接单员</option>
								<option value="4" >发单员和接单公司</option>
						</select>
						<script type="text/javascript">
							$(document).ready(function(){
							    $("#logtype").on("change",function(){
									var logtypeid = $("#logtype :selected").val();
									$(".logtype_class").removeClass("show").addClass("hidden");
									if(logtypeid==1){
									    $("#logtype_1").removeClass("hidden").addClass("show");
									}else if(logtypeid==2){
									    $("#logtype_2").removeClass("hidden").addClass("show");
									}else if(logtypeid==3){
									    $("#logtype_1").removeClass("hidden").addClass("show");
									    $("#logtype_2").removeClass("hidden").addClass("show");
									}else if(logtypeid==4){
									    $("#logtype_1").removeClass("hidden").addClass("show");
									    $("#logtype_3").removeClass("hidden").addClass("show");
									}
							    })
							})
						</script>
					</div>
				</div> 
				</form>
				<div id="logtype_1" class="hidden logtype_class">
				<form method="post" id="addSenderForm" 
				enctype="multipart/form-data" class="form-horizontal" >
					userid:<input type="text" name="userid" />
					<input type="text" id="senderSaveSuccess" >
					<div class="hr-line-dashed"></div>
					<div class="form-group">
						<label for="sender_name" class="col-sm-6 control-label"> 
						<h4>发单员详细信息</h4>
						</label>
					</div>
					<div class="form-group">
						<label for="sender_name" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>名称
						</label>
						<div class="col-sm-6">
							<input id="sender_name" name="name" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					
					<div class="form-group">
						<label for="sender_nikename" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>简称
						</label>
						<div class="col-sm-6">
							<input id="sender_nikename" name="nikename" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					
					<div class="form-group">
						<label for="sender_nature" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>公司性质
						</label>
						<div class="col-sm-6">
							<input id="sender_nature" name="nature" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					
					<div class="form-group">
						<label for="sender_email" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>电子邮箱
						</label>
						<div class="col-sm-6">
							<input id="sender_email" name="email" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					
					<div class="form-group">
						<label for="sender_telephone" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>电话号码
						</label>
						<div class="col-sm-6">
							<input id="sender_telephone" name="telephone" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					
					<div class="form-group">
						<label for="sender_contact" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>联系人
						</label>
						<div class="col-sm-6">
							<input id="sender_contact" name="sender_contact" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					
					<div class="form-group">
						<label for="sender_city" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>省市
						</label>
						<div class="col-sm-6">
							<input id="sender_city" name="city" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					
					<div class="form-group">
						<label for="sender_address" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>地址
						</label>
						<div class="col-sm-6">
							<input id="sender_address" name="address" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					
					<div class="form-group">
						<label for="sender_cardphoto" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>企业证件照
						</label>
						<div class="col-sm-6">
							<input id="sender_cardphoto" name="cardphoto" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					</form>
				</div>
				<div id="logtype_2" class="hidden logtype_class">
				<form method="post" id="addReceverForm" 
				enctype="multipart/form-data" class="form-horizontal" >
				userid:<input type="text" name="userid" />
				<input type="text" id="receverSaveSuccess" >
					<div class="hr-line-dashed"></div>
					<div class="form-group">
						<label for="sender_name" class="col-sm-6 control-label"> 
						<h4>接单员详细信息</h4>
						</label>
					</div>
					<div class="form-group">
						<label for="recever_name" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>名称
						</label>
						<div class="col-sm-6">
							<input id="recever_name" name="name" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="recever_nickname" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>简称
						</label>
						<div class="col-sm-6">
							<input id="recever_nickname" name="nickname" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="recever_gender" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>性别
						</label>
						<div class="col-sm-6">
							<input id="recever_gender" name="gender" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="recever_birth" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>出生日期
						</label>
						<div class="col-sm-6">
							<input id="recever_birth" name="birth" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="recever_idcard" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>身份证号
						</label>
						<div class="col-sm-6">
							<input id="recever_idcard" name="idcard" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="recever_phone" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>手机号码
						</label>
						<div class="col-sm-6">
							<input id="recever_phone" name="phone" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="recever_email" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>电子邮箱
						</label>
						<div class="col-sm-6">
							<input id="recever_email" name="email" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="recever_city" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>省市
						</label>
						<div class="col-sm-6">
							<input id="recever_city" name="city" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="recever_address" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>所在地区
						</label>
						<div class="col-sm-6">
							<input id="recever_address" name="address" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="recever_ServiceCity" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>可服务省市
						</label>
						<div class="col-sm-6">
							<input id="recever_ServiceCity" name="ServiceCity" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="recever_serviceAddr" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>可服务地区
						</label>
						<div class="col-sm-6">
							<input id="recever_serviceAddr" name="serviceAddr" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="recever_servceType" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>服务类型
						</label>
						<div class="col-sm-6">
							<input id="recever_servceType" name="servceType" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="recever_productType" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>产品类型
						</label>
						<div class="col-sm-6">
							<input id="recever_productType" name="productType" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="recever_education" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>学历
						</label>
						<div class="col-sm-6">
							<input id="recever_education" name="education" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="recever_language" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>语言技能
						</label>
						<div class="col-sm-6">
							<input id="recever_language" name="language" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="recever_resume" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>个人简历
						</label>
						<div class="col-sm-6">
							<input id="recever_resume" name="recever。resume" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="recever_photo" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>生活照
						</label>
						<div class="col-sm-6">
							<input id="recever_photo" name="photo" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="recever_cardPhoto" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>证件照
						</label>
						<div class="col-sm-6">
							<input id="recever_cardPhoto" name="cardPhoto" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="recever_emergencyContact" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>紧急联系人
						</label>
						<div class="col-sm-6">
							<input id="recever_emergencyContact" name="emergencyContact" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="recever_level" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>用户等级
						</label>
						<div class="col-sm-6">
							<input id="recever_level" name="level" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="recever_restDate" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>不可服务时间
						</label>
						<div class="col-sm-6">
							<input id="recever_restDate" name="restDate" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					</form>
				</div>
				<div id="logtype_3" class="hidden logtype_class">
				<form method="post" id="addReceCompForm" 
				enctype="multipart/form-data" class="form-horizontal" >
				userid:<input type="text" name="userid" />
				<input type="text" id="receCompSaveSuccess" >
					<div class="hr-line-dashed"></div>
					<div class="form-group">
						<label for="sender_name" class="col-sm-6 control-label"> 
						<h4>接单公司详细信息</h4>
						</label>
					</div>
					<div class="form-group">
						<label for="rececomp_name" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>名称
						</label>
						<div class="col-sm-6">
							<input id="rececomp_name" name="name" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="rececomp_nickname" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>简称
						</label>
						<div class="col-sm-6">
							<input id="rececomp_nickname" name="nickname" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="rececomp_companySize" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>公司规模
						</label>
						<div class="col-sm-6">
							<input id="rececomp_companySize" name="companySize" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="rececomp_telephone" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>手机号码
						</label>
						<div class="col-sm-6">
							<input id="rececomp_telephone" name="telephone" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="rececomp_email" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>电子邮箱
						</label>
						<div class="col-sm-6">
							<input id="rececomp_email" name="email" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="rececomp_city" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>省市
						</label>
						<div class="col-sm-6">
							<input id="rececomp_city" name="city" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="rececomp_address" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>所在地区
						</label>
						<div class="col-sm-6">
							<input id="rececomp_address" name="address" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="rececomp_ServiceCity" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>可服务省市
						</label>
						<div class="col-sm-6">
							<input id="rececomp_ServiceCity" name="ServiceCity" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="rececomp_serviceAddr" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>可服务地区
						</label>
						<div class="col-sm-6">
							<input id="rececomp_serviceAddr" name="serviceAddr" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="rececomp_servceType" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>服务类型
						</label>
						<div class="col-sm-6">
							<input id="rececomp_servceType" name="servceType" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="rececomp_productType" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>产品类型
						</label>
						<div class="col-sm-6">
							<input id="rececomp_productType" name="productType" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="rececomp_cardphoto" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>营业执照
						</label>
						<div class="col-sm-6">
							<input id="rececomp_cardphoto" name="cardphoto" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="rececomp_website" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>公司官网
						</label>
						<div class="col-sm-6">
							<input id="rececomp_website" name="website" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="rececomp_logo" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>公司Logo
						</label>
						<div class="col-sm-6">
							<input id="rececomp_logo" name="logo" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label for="rececomp_restDate" class="col-sm-4 control-label"> <span
							class="red-fonts">*&nbsp;&nbsp;&nbsp;</span>不可服务时间
						</label>
						<div class="col-sm-6">
							<input id="rececomp_restDate" name="restDate" placeholder=''
								type="text" class="form-control" value="">
						</div>
					</div>
					</form>
				</div>
				
				
				<div class="form-group">
					<div class="col-sm-8 col-sm-offset-4">
						<button id="resetBtn" class="btn btn-white" type="reset">重置</button>
						<button id="submitBtn" class="btn btn-primary" type="button">提交</button>
					</div>
				</div>
				
		</div>
	</div>
<script src="static/js/validator/zh_CN.js"></script>
</body>
</html>