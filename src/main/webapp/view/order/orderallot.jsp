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
<style type="text/css">
    .ui-autocomplete{
        display:block;
        z-index:99999;
    }
</style>
  <script type="text/javascript">
  $("#keywordinput").autocomplete({  
      source:function(request,response){  
          $.ajax({  
              type:"GET",  
              url:"<%=basePath%>user/keywordsearch/"+$( "#keywordinput" ).val(),  
              dataType : "json",  
              cache : false,  
              async : false,  
              data :'',  
              success : function(data) {  
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
          $("#realid").val(ui.item.id);
          $("#realtype").val(ui.item.type); 
      }  
  });  
  
	function allot(type,id){
	    var result =true;
	    if(type==undefined||type==null){
			result = false;	
	    }
	    if(id==undefined||id==null){
			result =false;
	    }
		if(result){
		    $.ajax({
	        	async: false,
	            type: "POST",
	            url: 'order/allot/order_${order.id}/type_'+type+'/rece_'+id,//提交的URL
	            data: '', // 要提交的表单
	            dataType: "json",
	            mimeType: "application/json", 
	            success: function (data,status) {//status 200
	        	$("#submit_button").attr("disabled",false);
	        		if(data.success){
	        		    Lobibox.notify('info', {
	                        	size: 'mini',
	                            position: 'top right',
	                            msg: "指派成功"
	                    });
		                 $('#commonModal').modal('hide');
		                 setTimeout(function(){window.location='order/list';}, 2000);
	        		}else{
	        		    result=false
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
		}else{
		    Lobibox.notify('error', {
                	size: 'mini',
                    position: 'top right',
                    msg: "参数错误服务商类型："+type+"，接单方ID："+id
            });
		}	
	   
	    
	}
	$(document).ready(function () {
	    $(".allotreceverbtnclass").click(function(){
			var id = $(this).attr('value');
			allot(2,id);
	    });
	    $(".allotrececompbtnclass").click(function(){
			var id = $(this).attr('value');
			allot(1,id);
    	});
	    $(".custombtnclass").click(function(){
			var id = $("#realid").val();
			var type = $("#realtype").val();
			if(id!=null&&type!=null){
			    allot(type,id);			    
			}
		});
	    
	});
</script>
<title>订单分配</title>
</head>
<body>
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h3 class="modal-title" id="myModalLabel">订单分配</h3>
	</div>
	<div class="modal-body">
		<div class="container-fluid">
			系统推荐的接单员如下：
			<br/>
			<table class="table table-striped table-bordered table-hover tablesorter" id="editable">
				<thead>
					<tr>
						<th class="text-center">所在省市</th>
						<th class="text-center">所在地区</th>
						<th class="text-center">距离</th>
						<th class="text-center">学历</th>
						<th class="text-center">语言技能</th>
						<th class="text-center">用户等级</th>
						<th class="text-center">已完成订单数</th>
						<th class="text-center">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${recevers}" var="recever">
						<tr class="gradeX" >
							<td class="text-center">${recever.city}</td>
							<td class="text-center">${recever.address}</td>
							<td class="text-center">${recever.addrLatitude}</td>
							<td class="text-center">${recever.education}</td>
							<td class="text-center">${recever.language}</td>
							<td class="text-center">${recever.level}</td>
							<td class="text-center"></td>
							<td class="text-center">
								 <a class="btn  btn-xs btn-primary allotreceverbtnclass" value="${recever.id }" > 指派</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			系统推荐的接单公司如下：<br/>
			<table class="table table-striped table-bordered table-hover tablesorter" id="editable">
				<thead>
					<tr>
						<th class="text-center">公司名称</th>
						<th class="text-center">公司规模</th>
						<th class="text-center">所在省市</th>
						<th class="text-center">可服务地区</th>
						<th class="text-center">服务类型</th>
						<th class="text-center">产品类型</th>
						<th class="text-center">已完成订单数</th>
						<th class="text-center">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${rececomps}" var="rececomp">
						<tr class="gradeX">
							<td class="text-center">${rececomp.name}</td>
							<td class="text-center">${rececomp.companySize}</td>
							<td class="text-center">${rececomp.city}</td>
							<td class="text-center">${rececomp.serviceCity}</td>
							<td class="text-center">${rececomp.serviceAddr}</td>
							<td class="text-center">${rececomp.prodoctType}</td>
							<td class="text-center">100</td>
							<td class="text-center">
								 <a class="btn  btn-xs btn-primary allotrececompbtnclass" value="${rececomp.id }" > 指派</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			手工指派：<br/>
			<div class="row">
				<form class="form-inline" role="form">
			<div class="form-group ">
				<div class="col-sm-12 ">
					<label for="keywordinput" class="sr-only">关键字</label> 
				<input  type="text" name="keywordinput" class="form-control" id="keywordinput" placeholder="请输入">
				<input  type="hidden" name="realid" class="form-control" id="realid" >
				<input  type="hidden" name="realtype" class="form-control" id="realtype" >
				<button type="submit" class="btn btn-xs btn-primary custombtnclass">指派</button>
				</div>
			</div>
		</form>
			</div>
		</div>
	</div>
<script src="static/js/validator/zh_CN.js"></script>
</body>
</html>