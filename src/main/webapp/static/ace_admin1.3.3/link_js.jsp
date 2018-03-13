<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	String jsBasePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
 	<!-- basic scripts -->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='<%=jsBasePath %>/ace_admin1.3.3/assets/js/jquery.min.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='<%=jsBasePath %>/ace_admin1.3.3/assets/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='<%=jsBasePath %>/ace_admin1.3.3/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="<%=jsBasePath %>/ace_admin1.3.3/assets/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->

		<!-- ace scripts -->
		<script src="<%=jsBasePath %>/ace_admin1.3.3/assets/js/ace-elements.min.js"></script>
		<script src="<%=jsBasePath %>/ace_admin1.3.3/assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->

		<!-- the following scripts are used in demo only for onpage help and you don't need them -->
		<link rel="stylesheet" href="<%=jsBasePath %>/ace_admin1.3.3/assets/css/ace.onpage-help.css" />
		<link rel="stylesheet" href="<%=jsBasePath %>/ace_admin1.3.3/docs/assets/js/themes/sunburst.css" />

		<script type="text/javascript"> ace.vars['base'] = '<%=jsBasePath %>/ace_admin1.3.3'; </script>
		<script src="<%=jsBasePath %>/ace_admin1.3.3/assets/js/ace/elements.onpage-help.js"></script>
		<script src="<%=jsBasePath %>/ace_admin1.3.3/assets/js/ace/ace.onpage-help.js"></script>
		<script src="<%=jsBasePath %>/ace_admin1.3.3/docs/assets/js/rainbow.js"></script>
		<script src="<%=jsBasePath %>/ace_admin1.3.3/docs/assets/js/language/generic.js"></script>
		<script src="<%=jsBasePath %>/ace_admin1.3.3/docs/assets/js/language/html.js"></script>
		<script src="<%=jsBasePath %>/ace_admin1.3.3/docs/assets/js/language/css.js"></script>
		<script src="<%=jsBasePath %>/ace_admin1.3.3/docs/assets/js/language/javascript.js"></script>