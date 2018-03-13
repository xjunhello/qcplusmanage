<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<form id="search_form" method="get" action="/user"
	class="pull-right mail-search">
	<div class="input-group input-group-sm">
		<input type="text" class="form-control input-sm" id="search_input"
			name="keyword" placeholder="Search" disabled>
		<div class="input-group-btn">
			<button id='search_btn' type="submit" class="btn btn-sm btn-primary"
				disabled><spring:message code="search"/></button>
		</div>
	</div>
</form>