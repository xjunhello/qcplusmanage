<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="footer fixed">
	<div class="pull-right">
		<spring:message code="version"/> <strong><spring:message code="serial.number"/></strong>
	</div>
	<div>
		<strong><spring:message code="copyright"/></strong> <spring:message code="company"/><!-- (www.halsign.com); -->
	</div>
</div>
