<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/qcplustaglib" prefix="qc"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
    $(document).ready(function(){
        //add
        $("#addBtn").click(function(){
            $("#addModal").modal({
                backdrop: 'static',
                remote: '${toAddAction}'
            });
        });
        $("#addModal").on("hidden.bs.modal", function() {
            $(this).removeData("bs.modal");
        });
   		//update
        $("#updateModal").on("hidden.bs.modal", function() {
            $(this).removeData("bs.modal");
        });
		$(".updatebtnclass").on("click",function(){
			var id = $(this).attr("value");
			$('#updateModal').modal({
		        remote: '${toUpdateAction}/'+id
			});
		});
	 	//detail
	 	 $("#commonModal").on("hidden.bs.modal", function() {
            $(this).removeData("bs.modal");
        });
        $(".detailbtnclass").click(function(){
            var id = $(this).attr("value");
            $("#commonModal").modal({
                backdrop: 'static',
                remote: '${detailAction}/'+id
            });
        });
        $(".reviewbtnclass").click(function(){
            var id = $(this).attr("value");
            $("#commonModal").modal({
                backdrop: 'static',
                remote: '${reviewAction}/'+id
            });
        });
		//过滤字段设置
		$("#searchBtn").click(function(){
		    $("#filterForm").submit();
		})
    });
    
    var $modalElement = this.$element;
    $(document).on('focusin.modal', function (e) {
		try{
			var $parent = $(e.target.parentNode); 
			if($modalElement!=undefined&&$parent!=undefined){
				if ($modalElement[0] !== e.target && !$modalElement.has(e.target).length  
			            &&!$parent.hasClass('cke_dialog_ui_input_select') && !$parent.hasClass('cke_dialog_ui_input_text')) {  
			            $modalElement.focus()  ;
			    } 	
			}
		}catch(e){
			console.log(e);
		}
        
    })
</script>

 <script type="text/javascript">
  $("#userkey").autocomplete({  
      source:function(request,response){  
          $.ajax({  
              type:"GET",  
              url:"<%=basePath%>user/keywordsearch/"+$( "#userkey" ).val(),  
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
          $("#userid").val(ui.item.id);
      }  
  });  
  
	

</script>

</head>
<body>
<form  id="filterForm" action="${action }" method="post"  >
	<div id="wrapper">
		<jsp:include page="/view/public/menu.jsp">
			<jsp:param name="activeOne" value="moneylist"/>
		</jsp:include>
		<div id="page-wrapper" class="gray-bg">
			<jsp:include page="/view/public/right-top.jsp" />
			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-sm-10">
					<h2>财务管理</h2>
					<ol class="breadcrumb">
						<li><a>财务管理</a></li>
						<li class="active"><strong>财务管理</strong></li>
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
									<h5>财务管理</h5>
								</div>
								<div class="ibox-content">
									<div class="">
										    <a class="btn btn-sm btn-danger" id="deleteBtn" > 删除 </a>
										    <table id="web_conent_block" class="content_table pull-right main">
											<tr>
												<td class="page">
													<div class="content_page">
														<div class="search_formobj">
       															  <div class="form-group">
																    <div class="input-group input-group-sm">
																		      <div class="input-group-addon">操作类型</div>
																		      <qc:configSelect catalog="changetype" name="type" id="type" selected="${page.params['type']}"  classname="form-control"></qc:configSelect>
																		    </div>
																  </div>
       															<div class="form-group">
																    <div class="input-group input-group-sm">
																		      <div class="input-group-addon">状态</div>
																		      <qc:configSelect catalog="changestatus" name="status" id="status" selected="${page.params['status']}" classname="form-control"></qc:configSelect>
																		    </div>
																  </div>
																  <div class="form-group">
																    <div class="input-group input-group-sm">
																		      <div class="input-group-addon">用户</div>
																		      <input type="hidden" id="userid" name="userid" value="${page.params['userid'] }">
																		     <input class="form-control" id="userkey" type="text" />
																		    </div>
																  </div>
																  <div class="form-group">
																    <div class="input-group input-group-sm">
																		      <div class="input-group-addon">订单</div>
																		      <input type="hidden" id="orderid" name="orderid" value="${page.params['orderid'] }">
																		     <input class="form-control" name="orderkey" type="text"  />
																		    </div>
																  </div>
																  <button type="button" class="btn btn-success btn-sm" id="searchBtn"><spring:message code="search"/></button>
           													<button type="submit" style="display:none;">hidden</button>
      													</div>
   												</div>
   												<div class="table">
       												<div class="data loading" ></div>
   												</div>
											</td>
										</tr>
									</table>
									</div>
									<table class="table table-striped table-bordered table-hover tablesorter" id="editable">
										<thead>
											<tr>
												<th class="text-center"><input type="checkbox"
													id="check_all" onclick="checkAll('check_all', 'checked')"></th>
												<th class="text-center">操作类型</th>
												<th class="text-center">发起时间</th>
												<th class="text-center">完成时间</th>
												<th class="text-center">金额</th>
												<th class="text-center">状态</th>
												<th class="text-center">用户</th>
												<th class="text-center">订单</th>
												<th class="text-center">操作</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${page.list}" var="entity">
												<tr class="gradeX">
													<td class="text-center"><input type="checkbox"name="checked" value="${entity.id}"></td>
													<td class="text-center" >${entity.typeName}</td>
													<td class="text-center" >${entity.createDate}</td>
													<td class="text-center" >${entity.changeDate}</td>
													<td class="text-center" >${entity.value}</td>
													<td class="text-center" >${entity.statusName}</td>
													<td class="text-center" >${entity.userLogin.loginname}</td>
													<td class="text-center" >${entity.orderdesc.orderCode}</td>
													<td class="text-center">
														 <c:if test="${entity.status eq 1 }">
														 <a class="btn btn-xs btn-info detailbtnclass" value="${entity.id }"> 确认</a>
														 </c:if>
														 <c:if test="${entity.status eq 2 }">
														 <button class="btn btn-xs btn-info detailbtnclass"  disabled> 确认</button>
														 </c:if>
														 <c:if test="${entity.status eq 3 }">
														 <button class="btn btn-xs btn-info reviewbtnclass"  value="${entity.id }"> 详情</button>
														 </c:if>
														 <c:if test="${entity.status eq 4 }">
														 <button class="btn btn-xs btn-info reviewbtnclass"  value="${entity.id }"> 详情</button>
														 </c:if>
														 <a class="btn btn-xs btn-danger deletebtnclass" value="${entity.id }" > 删除</a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<%@include file="/view/public/page.jsp" %>
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
	<div id="addModal" class="modal fade" tabindex="-1"
		data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<!-- Content will be loaded here from "remote.jsp" file -->
			</div>
		</div>
	</div>
	<!-- Modal HTML -->
	<div id="updateModal" class="modal fade" tabindex="-1"
		data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog  modal-lg">
			<div class="modal-content">
				<!-- Content will be loaded here from "remote.jsp" file -->
			</div>
		</div>
	</div>
	<!-- Modal HTML -->
	<div id="commonModal" class="modal fade" tabindex="-1"
		data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
			</div>
		</div>
	</div>
	<!-- table排序 -->
	<script>
		$(document).ready(function(){
		    $('#editable').tablesorter({headers:{0:{sorter:false},6:{sorter:false}}});
		});
    </script>
    <!-- Delete User -->
	<script>
	$(document).ready(function(){
		 $('.deletebtnclass').click(function(){		
				var row = $(this).closest('tr');
				var cid = $(this).attr('value');
				var tof = Lobibox.confirm({
					title :"确认",
					msg: "你确定要删除这条记录么？",
					callback:function(lobibox,type){
						if(type=='yes'){
							$.ajax({
		                        async: false,
		                        cache: false,
		                        type: "GET",
		                        url: "${deleteAction}/" + cid,
		                        data: null,
		                        dataType: "json",
		                        success: function (xhr,data) {
		                        	Lobibox.notify('success', {
		                        		size: 'mini',
		                                position: 'top right',
		                                sound: false,
		                                msg: '热点资讯删除成功'
									});
		                        	row.remove(); 
		                        },
		                        error: function (xhr, data) {
		                        	Lobibox.notify('error', {
		                            	size: 'mini',
		                                position: 'top right',
		                                msg: "删除失败"
		                            });
		                        }
		                    });
		                    event.preventDefault();
		                    return false;
						}
					}
				});
			}); 	
		 $('#deleteBtn').click(function(){
				var check_arr = $(".gradeX input:checked"); //用于保存 选中的那一条数据的ID 
				var check_array = []; 
				if (check_arr.length>0) { //判断是否选中 
					Lobibox.confirm({
						title :"确认",
						msg: "您确定要删除这条记录么？",
						callback:function(lobibox,type){
							if(type=='yes'){
								$(".gradeX input:checked").each(function() {
								    check_array.push($(this).attr("value"))
								});
								$.ajax({
									async:false,
									cache:false,
									type:"POST",
									url:"${batchDeleteAction}",
									data:{id:check_array.join(",")},
									dataType:"json",
									success: function (data) {
				                        Lobibox.notify('success', {
				                        	size: 'mini',
				                            position: 'top right',
				                            msg: '批量删除成功！'
										});
				                        $(".gradeX input:checked").closest("tr").remove();
				                    },
				                    error: function (xhr, data) {
				                        Lobibox.notify('error', {
				                            size: 'mini',
				                            position: 'top right',
				                            msg: '批量删除失败'
				                        });
				                    }
								});
								event.preventDefault();
								return false;
							}
						}
					});
				} else {
			        Lobibox.notify('error', {
	                	size: 'mini',
	                    position: 'top right',
	                    msg: '系统错误'
	                }); 
				}
			});
		});
	</script>
<%@include file="/view/public/js.model.jsp"%>
</form>
</body>
<!-- Mainly scripts -->
<%@include file="/view/public/foot_js.jsp"%>
</html>