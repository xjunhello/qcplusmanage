<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	String basePath2 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<link href="plugins/bootstrap-wizard/css/bootstrap-wizard.css" rel="stylesheet" />
<link href="plugins/bootstrap-wizard/css/chosen.css" rel="stylesheet" />
<script src="plugins/bootstrap-wizard/js/chosen.jquery.js"></script>
<script src="plugins/bootstrap-wizard/js/prettify.js" type="text/javascript"></script>
<script src="plugins/bootstrap-wizard/js/bootstrap-wizard.js" type="text/javascript"></script>

<style type="text/css">
    .wizard-modal p {
        margin: 0 0 10px;
        padding: 0;
    }

    #wizard-ns-detail-servers, .wizard-additional-servers {
        font-size: 12px;
        margin-top: 10px;
        margin-left: 15px;
    }
    #wizard-ns-detail-servers > li, .wizard-additional-servers li {
        line-height: 20px;
        list-style-type: none;
    }
    #wizard-ns-detail-servers > li > img {
        padding-right: 5px;
    }

    .wizard-modal .chzn-container .chzn-results {
        max-height: 150px;
    }
    .wizard-addl-subsection {
        margin-bottom: 40px;
    }
    .create-server-agent-key {
        margin-left: 15px; 
        width: 90%;
    }
</style>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="js/html5shiv-3.7.0.js"></script>
<script src="js/respond-1.3.0.min.js"></script>
<![endif]-->
<!-- 向导表单插件 -->
    <!-- <script type="text/javascript">
    </script> -->
    <!-- 向导表单插件 -->

