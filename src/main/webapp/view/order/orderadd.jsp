<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/qcplustaglib" prefix="qc"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<base href="<%=basePath%>">
<title>QCPlus后台管理系统</title>
<%@include file="/view/public/link_css.jsp" %>



<script>
	$.ajaxSetup({
		contentType : "application/x-www-form-urlencoded;charset=utf-8",
		complete : function(XMLHttpRequest, textStatus) {
			//通过XMLHttpRequest取得响应头，sessionstatus
			var sessionstatus = XMLHttpRequest
					.getResponseHeader("sessionstatus");  
			if (sessionstatus == "timeout") {
				Lobibox.alert('warning', {
					msg: '会话已过期，请重新登录！',
					buttons: {
					   yes: {
					        'class': 'btn btn-success',
					        closeOnClick: true
					    },
					    cancel: {
					        'class': 'btn btn-danger',
					        closeOnClick: true
					    }
					},
					callback: function(lobibox, type){
					    if (type === 'yes'){
					    	window.top.location.href="<%=basePath%>";
					    }
					}
				});
			}
		}
	});

    //fix bootstrap modal bug
    var $modalElement = this.$element;
    $(document).on('focusin.modal', function (e) {
		var $parent = $(e.target.parentNode);  
		if($modalElement!=undefined&&$parent!=undefined){
			if ($modalElement[0] !== e.target && !$modalElement.has(e.target).length  
		            &&!$parent.hasClass('cke_dialog_ui_input_select') && !$parent.hasClass('cke_dialog_ui_input_text')) {  
		            $modalElement.focus()  ;
		    } 	
		}
        
    })
</script>
<script>
$(document).ready(function () {

    /**
    $('#addform').validator({
		timely : 8,
		
		fields : {
			"serviceProviderType" : {
				rule : "required",
				ok : "",
				msg : {
					required : '必需填写'
				}
			},
			"receiveId" : {
				rule : "required",
				ok : "",
				msg : {
					required : '必需填写'
				}
			},
			"senderId" : {
				rule : "required",
				ok : "",
				msg : {
					required : '必需填写'
				}
			},
			"serviceType" : {
				rule : "required",
				ok : "",
				msg : {
					required : '必需填写'
				}
			},
			"validateDate" : {
				rule : "required",
				ok : "",
				msg : {
					required : '必需填写'
				}
			},
			"supplyAddr" : {
				rule : "required",
				ok : "",
				msg : {
					required : '必需填写'
				}
			},
			"suppyCity" : {
				rule : "required",
				ok : "",
				msg : {
					required : '必需填写'
				}
			},
			"productType" : {
				rule : "required",
				ok : "",
				msg : {
					required : '必需填写'
				}
			},
			"goodsCity" : {
				rule : "required",
				ok : "",
				msg : {
					required : '必需填写'
				}
			},
			"goodsAddr" : {
				rule : "required",
				ok : "",
				msg : {
					required : '必需填写'
				}
			},
			"suppyContact" : {
				rule : "required",
				ok : "",
				msg : {
					required : '必需填写'
				}
			},
			"suppyTelephone" : {
				rule : "required",
				ok : "",
				msg : {
					required : '必需填写'
				}
			}
			
		},
		valid : function(form) {
		    $("#submit_button").attr("disabled",true);
		    console.log("通过");
		    return;
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
	                            msg: "发送订单成功"
	                    });
		                 //$('#addModal').modal('hide');
		                 setTimeout(function(){window.location=' order/list';}, 2000);
	        		}else{
	        		    Lobibox.notify('error', {
	                            	size: 'mini',
	                                position: 'top right',
	                                msg: data.desc
	                    });
	        		}
	            },
	            error: function (data,status) {//status not 200
	        			$("#submit_button").attr("disabled",false);
	        			var errortext="请求失败";
	        			if(data.desc!=undefined && data.desc!=''){
	        			    errortext=data.desc;
	        			}else{
	        			    errortext=data.statusText;
	        			}
	        			Lobibox.notify('error', {
                           	size: 'mini',
                            position: 'top right',
                            msg: errortext
	                    });
	            }
	        });
		}
	});
    **/
}); 

	$(document).ready(function () {
	    $("#commonModal").on("hidden.bs.modal", function() {
	            $(this).removeData("bs.modal");
	     });
	    
	    $('input').on('input',function(){
		    $(this).trigger("validate");
		});
	//智能推荐发单员
	 $("#senderKeywordSearch").autocomplete({  
	      source:function(request,response){  
	          $.ajax({  
	              type:"GET",  
	              url:"<%=basePath%>user/senderSearch/"+$( "#senderKeywordSearch" ).val(),  
	              dataType : "json",  
	              cache : false,  
	              async : false,  
	              data :'',  
	              success : function(data) {  console.log(data);
	                 // var data = eval(json);//json数组  
	                  response($.map(data,function(item){  
	                      return {  
	                          label:item.adviceStr,//下拉框显示值  
	                          value:item.adviceStr,//选中后，填充到下拉框的值  
	                          id:item.id,  
	                          type:item.typeid
	                      }  
	                  }));  
	              }  
	          });  
	      },  
	      delay: 500,//延迟500ms便于输入  
	      select : function(event, ui) {  
	          $("#senderId").val(ui.item.id);
	      }  
	  }); 
	//智能推荐接单员
	 $("#receiveKeywordSearch").autocomplete({  
	      source:function(request,response){  
	          $.ajax({  
	              type:"GET",  
	              url:"<%=basePath%>user/keywordsearch/"+$( "#receiveKeywordSearch" ).val(),  
	              dataType : "json",  
	              cache : false,  
	              async : false,  
	              data :'',  
	              success : function(data) {  console.log(data);
	                 // var data = eval(json);//json数组  
	                  response($.map(data,function(item){  
	                      return {  
	                          label:item.adviceStr,//下拉框显示值  
	                          value:item.adviceStr,//选中后，填充到下拉框的值  
	                          id:item.id,  
	                          type:item.typeid
	                      }  
	                  }));  
	              }  
	          });  
	      },  
	      delay: 500,//延迟500ms便于输入  
	      select : function(event, ui) {  
	          $("#receiveId").val(ui.item.id);
	          $("#serviceProviderType").find("option[value='"+ui.item.typeid+"']").attr("selected",true);
	      }  
	  }); 
	});
</script>
</head>
<body>

	<div id="wrapper">
		<jsp:include page="/view/public/menu.jsp">
			<jsp:param name="activeOne" value="orderadd"/>
		</jsp:include>
		<div id="page-wrapper" class="gray-bg">
			<jsp:include page="/view/public/right-top.jsp" />
			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-sm-10">
					<h2 >订单管理</h2>
					<ol class="breadcrumb">
						<li><a>订单管理</a></li>
						<li class="active"><strong>订单发送</strong></li>
					</ol>
				</div>
				<div class="col-sm-2"></div>
			</div>
			<div class="wrapper wrapper-content">
				<div class="wrapper wrapper-content animated fadeInRight">
					<div class="row">
						<div class="col-sm-12">
							<div class="ibox float-e-margins">
								<div class="ibox-title">
									<h5>订单发送</h5>
								</div>
								<div class="ibox-content">
									<div class="">
										   <!-- 按钮组 -->
									</div>
									<form method="post" id="addform" action="order/add"
										enctype="multipart/form-data" class="form-horizontal"  autocomplete="off">
										<div class="form-group">
											<label for="senderId" class="col-sm-4 control-label">发单员<span class="red-fonts">*&nbsp;&nbsp;</span></label>
											<div class="col-sm-6">
												<input id="senderId" name="senderId" type="hidden">
												<input id="senderKeywordSearch" name="senderKeywordSearch" placeholder="请输入关键字" type="text" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label for="serviceProviderType" class="col-sm-4 control-label">服务商类型<span class="red-fonts">*&nbsp;&nbsp;</span></label>
											<div class="col-sm-6">
											<qc:serviceProviceTypeSelect name="serviceProviderType" id="serviceProviderType"
											classname="form-control" />
											</div>
										</div>
										<div class="form-group">
											<label for="receiveId" class="col-sm-4 control-label">接单方<span class="red-fonts">*&nbsp;&nbsp;</span></label>
											<div class="col-sm-6">
												<input id="receiveId" name="receiveId" placeholder="" type="hidden" class="form-control">
												<input id="receiveKeywordSearch" name="receiveKeywordSearch" placeholder="" type="text" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label for="serviceType" class="col-sm-4 control-label">服务类型<span class="red-fonts">*&nbsp;&nbsp;</span></label>
											<div class="col-sm-6">
											<qc:serviceTypeSelect id="serviceType" name="serviceType" classname="form-control" > </qc:serviceTypeSelect>
											</div>
										</div>
										<div class="form-group">
											<label for="validateDate" class="col-sm-4 control-label">验货时间<span class="red-fonts">*&nbsp;&nbsp;</span></label>
											<div class="col-sm-6">
												<input id="validateDate" name="validateDate" placeholder="" type="text" class="form-control">
												<span class="add-on"><i class="icon-th"></i></span>
												<script type="text/javascript">
													$('#validateDate').datetimepicker({
													    format: "yyyy/mm/dd",
												        autoclose: true,
												        todayBtn: true
													});
												</script>
											</div>
										</div>
										<div class="form-group">
											<label for="suppyCity" class="col-sm-4 control-label">供应商所在省市<span class="red-fonts">*&nbsp;&nbsp;</span></label>
											<div class="col-sm-6">
												<input id="suppyCity  " name="suppyCity" placeholder="" type="text" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label for="supplyAddr" class="col-sm-4 control-label">供应商所在地<span class="red-fonts">*&nbsp;&nbsp;</span></label>
											<div class="col-sm-6">
												<input id="supplyAddr  " name="supplyAddr" placeholder="" type="text" class="form-control">
											</div>
										</div>
										
										<div class="form-group">
											<label for="productType" class="col-sm-4 control-label">产品类型<span class="red-fonts">*&nbsp;&nbsp;</span></label>
											<div class="col-sm-6">
												<qc:productTypeSelect id="productType" name="productType" classname="form-control" />
											</div>
										</div>
										
										<div class="form-group">
											<label for="productDatum" class="col-sm-4 control-label">产品信息<span class="red-fonts">*&nbsp;&nbsp;</span></label>
											<div class="col-sm-6">
												<input id="productDatum" name="productfile" placeholder="" type="file" class="form-control">
											</div>
										</div>
										
										<div class="form-group">
											<label for="goodsCity" class="col-sm-4 control-label">货物所在省市<span class="red-fonts">*&nbsp;&nbsp;</span></label>
											<div class="col-sm-6">
												<input id="goodsCity" name="goodsCity" placeholder="" type="text" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label for="goodsAddr" class="col-sm-4 control-label">货物所在地<span class="red-fonts">*&nbsp;&nbsp;</span></label>
											<div class="col-sm-6">
												<input id="goodsAddr  " name="goodsAddr" placeholder="" type="text" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label for="suppyContact" class="col-sm-4 control-label">供应商联系人<span class="red-fonts">*&nbsp;&nbsp;</span></label>
											<div class="col-sm-6">
												<input id="suppyContact  " name="suppyContact" placeholder="" type="text" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label for="suppyTelephone" class="col-sm-4 control-label">供应商联系方式<span class="red-fonts">*&nbsp;&nbsp;</span></label>
											<div class="col-sm-6">
												<input id="suppyTelephone  " name="suppyTelephone" placeholder="" type="text" class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label for="remarks" class="col-sm-4 control-label">备注<span class="red-fonts">*&nbsp;&nbsp;</span></label>
											<div class="col-sm-6">
												<input id="remarks" name="remarks" placeholder="" type="text" class="form-control">
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
						</div>
					</div>
				</div>
				<%@include file="/view/public/navbar-foot.jsp"%>
			</div>
		</div>
	</div>
	<!-- Modal HTML -->
	<div id="commonModal" class="modal fade" tabindex="-1"
		data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" id="modalContentId">
				<!-- Content will be loaded here from "remote.jsp" file -->
			</div>
		</div>
	</div>

	<!-- table排序 -->
	<script>
		$(document).ready(function(){
		    $('#editable').tablesorter({headers:{0:{sorter:false},6:{sorter:false}}});
		});
    </script>
   
<%@include file="/view/public/js.model.jsp"%>
</body>
<!-- Mainly scripts -->
<%@include file="/view/public/foot_js.jsp"%>
</html>