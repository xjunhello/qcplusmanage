<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--tabs --%>
<style>

#tabs
{
  overflow: auto;
  width: 100%;
  list-style: none;
  margin: 0;
  padding: 0;
}

#tabs li
{
    margin: 0;
    padding: 0;
    float: left;
}

#tabs a
{
    -moz-box-shadow: -4px 0 0 rgba(0, 0, 0, .2);
    -webkit-box-shadow: -4px 0 0 rgba(0, 0, 0, .2);
    box-shadow: -4px 0 0 rgba(0, 0, 0, .2);
    background: #ad1c1c;
    background:    -moz-linear-gradient(220deg, transparent 10px, #ad1c1c 10px);
    background:    -webkit-linear-gradient(220deg, transparent 10px, #ad1c1c 10px);     
    background:     -ms-linear-gradient(220deg, transparent 10px, #ad1c1c 10px); 
    background:      -o-linear-gradient(220deg, transparent 10px, #ad1c1c 10px); 
    background:         linear-gradient(220deg, transparent 10px, #ad1c1c 10px);
    text-shadow: 0 1px 0 rgba(0,0,0,.5);
    color: #fff;
    float: left;
    font: bold 12px/35px 'Lucida sans', Arial, Helvetica;
    height: 35px;
    padding: 0 30px;
    text-decoration: none;
}

#tabs #current a
{
    background: #fff;
    background:    -moz-linear-gradient(220deg, transparent 10px, #fff 10px);
    background:    -webkit-linear-gradient(220deg, transparent 10px, #fff 10px);     
    background:     -ms-linear-gradient(220deg, transparent 10px, #fff 10px); 
    background:      -o-linear-gradient(220deg, transparent 10px, #fff 10px); 
    background:         linear-gradient(220deg, transparent 10px, #fff 10px);
    text-shadow: none;    
    color: #333;
} 

</style>
<%--tabs --%>

<%--tabs选项卡 --%>
<%-- <script src="<%=basePath%>/static/js/jquery-1.6.3.min.js"></script> --%>
<script>
$(document).ready(function() {
    $("#content div").hide(); // Initially hide all content
    $("#tabs li:first").attr("id","current"); // Activate first tab
    $("#content div:first").fadeIn(); // Show first tab content
    
    $('#tabs a').click(function(e) {
        e.preventDefault();        
        $("#content div").hide(); //Hide all content
        $("#tabs li").attr("id",""); //Reset id's
        $(this).parent().attr("id","current"); // Activate this
        $('#' + $(this).attr('title')).fadeIn(); // Show content for current tab
    });
})();
</script>
<%--tabs选项卡 --%>


