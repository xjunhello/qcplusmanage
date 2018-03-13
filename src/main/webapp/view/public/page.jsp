<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script>
    function paging(page) {
		/*if($("#ops").children(":selected").size()>0){
		    pageSize = $("#ops").children(":selected").val();
		}else{
		    pageSize = $("#ops").children().first().val();
		}*/
		$("#hiddenPageNo").val(page);
		$("#myform").submit();
    	//window.location = "${action}?pageNo=" + page + "&pageSize=" + pageSize;
    }
    
    $(document).ready(function(){
		$("#ops").on("change",function(){
		    $("#hiddenPageNo").val(1);
		    $("#filterForm").submit();
		})
    });
</script>
	<input type="hidden" name="pageNo" id="hiddenPageNo" value="${page.pageNo }">
	<div class="row-fluid" align="center">
		<div class="pagination pagination-centered dataTables_paginate paging_simple_page.numbers" id="editable_paginate">
			<ul class="pagination" id="ul" style="margin-top: 0; float: center">
				<li class="paginate_button active" aria-controls="editable" tabindex="0" id="editable_previous"><a class="page" href="javascript:paging(1);"><spring:message code="home.page" /></a></li>
				<li class="paginate_button active" aria-controls="editable" tabindex="0" id="editable_previous"><c:choose>
						<c:when test="${page.pageNo > 1}">
							<a class="page" href="javascript:paging(${page.pageNo - 1});" title="<spring:message code="page.last"/>">&lt;&lt;</a>
						</c:when>
						<c:otherwise>
							<a class="page">&lt;&lt;</a>
						</c:otherwise>
					</c:choose></li>
				<c:forEach items="${page.numbers}" var="page">
					<li class="paginate_button active" aria-controls="editable" tabindex="0"><a class="page" href="javascript:paging(${page});" title="${page}<spring:message code="pages"/>">${page}</a></li>
				</c:forEach>
				<li class="paginate_button active" aria-controls="editable" tabindex="0" id="editable_next"><c:choose>
						<c:when test="${page.pageNo + 1 <= page.totalPage}">
							<a class="page" href="javascript:paging(${page.pageNo + 1});" title="<spring:message code="page.next"/>">&gt;&gt;</a>
						</c:when>
						<c:otherwise>
							<a class="page">&gt;&gt;</a>
						</c:otherwise>
					</c:choose></li>
				<li class="paginate_button active" aria-controls="editable" tabindex="0" id="editable_next"><a class="page" href="javascript:paging(${page.totalPage});"><spring:message code="last.page" /></a></li>
				<li><span><spring:message code="totally" />&nbsp;${page.totalPage}&nbsp;<spring:message code="pages" /></span></li>
				<li class="paginate_button active" aria-controls="editable" tabindex="0" id="editable_next"><c:if test=""></c:if> <span><select id="ops" name="pageSize">
							<c:choose>
								<c:when test="${page.pageSize == 5}">
									<option value="5" selected>5</option>
								</c:when>
								<c:otherwise>
									<option value="5">5</option>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${page.pageSize == 10}">
									<option value="10" selected>10</option>
								</c:when>
								<c:otherwise>
									<option value="10">10</option>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${page.pageSize == 30}">
									<option value="30" selected>30</option>
								</c:when>
								<c:otherwise>
									<option value="30">30</option>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${page.pageSize == 50}">
									<option value="50" selected>50</option>
								</c:when>
								<c:otherwise>
									<option value="50">50</option>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${page.pageSize == 100}">
									<option value="100" selected>100</option>
								</c:when>
								<c:otherwise>
									<option value="100">100</option>
								</c:otherwise>
							</c:choose>
					</select>&nbsp;<spring:message code="PCS/PAGE" /></span></li>
			</ul>
		</div>
	</div>