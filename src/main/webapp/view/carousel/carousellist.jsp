<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</head>
<body>

	<div id="wrapper">
		<jsp:include page="/view/public/menu.jsp">
			<jsp:param name="activeOne" value="carousellist"/>
		</jsp:include>
		<div id="page-wrapper" class="gray-bg">
			<jsp:include page="/view/public/right-top.jsp" />
			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-sm-10">
					<h2>热点管理</h2>
					<ol class="breadcrumb">
						<li><a>热点管理</a></li>
						<li class="active"><strong>轮播图管理</strong></li>
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
									<h5>轮播图管理</h5>
								</div>
								<div class="ibox-content">
									<div class="">
										    <a class="btn btn-sm btn-success" id="addBtn"> 新增</a> 
										    <a class="btn btn-sm btn-danger" id="deleteBtn" > 删除 </a>
										    <table id="web_conent_block" class="content_table pull-right main">
											<tr>
												<td class="page">
													<div class="content_page">
														<div class="search_formobj">
       														<form  id="filterForm" action="${action }" method="post" class="form   form-inline" >
       															<input type="hidden" name="pageSize" value="${list.pageSize }" />
           														<div class="form-group">
																    <div class="input-group input-group-sm">
																		      <div class="input-group-addon">关键字</div>
																		      <input class="form-control" type="text" name="keyword"  >
																		    </div>
																  </div>&nbsp;
           													<button type="submit"  class="btn btn-sm  btn-default">搜索</button>
       													</form>
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
												<th class="text-center">序号</th>
												<th class="text-center">描述</th>
												<th class="text-center">链接</th>
												<th class="text-center">上传日期</th>
												<th class="text-center">操作</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${page.list}" var="entity">
												<tr class="gradeX">
													<td class="text-center"><input type="checkbox"name="checked" value="${entity.id}"></td>
													<td class="text-center" >${entity.orderNo}</td>
													<td class="text-center" >${entity.descInfo}</td>
													<td class="text-center" ><a href="${entity.url}" class="link" target="_blank">
													链接地址
													</a></td>
													<td class="text-center" >${entity.createDate}</td>
													<td class="text-center">
													    <a href="${entity.httpPath}" class="btn btn-xs btn-info" target="_blank">预览</a>
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
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Content will be loaded here from "remote.jsp" file -->
			</div>
		</div>
	</div>
	<!-- Modal HTML -->
	<div id="updateModal" class="modal fade" tabindex="-1"
		data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Content will be loaded here from "remote.jsp" file -->
			</div>
		</div>
	</div>
	<!-- Modal HTML -->
	<div id="commonModal" class="modal fade" tabindex="-1"
		data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-dialog ">
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
</body>
<!-- Mainly scripts -->
<%@include file="/view/public/foot_js.jsp"%>
</html>