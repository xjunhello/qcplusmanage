<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- 仪表盘控制和分<spring:message code="pages"/>样式 -->
<script>
    var url_array = document.location.pathname.split("/");
    s1 = url_array[1];
    s2 = url_array[2];
    if (s1 == ''){
        $('#index').addClass('active')
    } else {
        $("#"+s1).addClass('active');
        $('#'+s1+' .'+s2).addClass('active');
        console.log(s1)
    }
</script>

<script>
     $(document).ready(function(){
         $("#ul a").each(function(){
        $(this).mouseover(function(){
            $(this).css("background","#CCCCCC");
        })
        $(this).mouseout(function(){
            $(this).css("background","none");
        })
        });
    });
</script>


