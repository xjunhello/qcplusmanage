package com.framework;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
/**
 * 
* @ClassName: JsonMessage 
* @Description:  通用json消息工具类 
* @author xinjun.zhang
* @date 2016年10月18日 上午10:27:13 
*
 */
public class JsonMessage {
	boolean result;
	String code;
	String desc;
	HttpServletResponse response;
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	private void init(){
		response.setCharacterEncoding("utf-8");
		if(!this.result){
			response.addHeader("errorcode", "qcerror");
		}
		response.setContentType("application/json; charset=utf-8");
	}
	public JsonMessage(HttpServletResponse response,boolean result){
		this.result = result;
		this.response=response;
		init();
	}
	public JsonMessage(HttpServletResponse response,boolean result,String code,String desc){
		this.result = result;
		this.code = code;
		this.desc = desc;
		this.response=response;
		init();
	}
	public static String success(HttpServletResponse response){
		return new JsonMessage(response,true).toString();
	}
//	public static String success(HttpServletResponse response,Object obj){
//		//TODO 增加对Object转json的操作
//		return new JsonMessage(response,true).toString();
//	}
	public static String success(HttpServletResponse response,String code){
		return new JsonMessage(response,true,code,"").toString();
	}
	public static String error(HttpServletResponse response,String desc){
		return new JsonMessage(response,false, "错误", desc).toString();
	}
	public static String error(HttpServletResponse response ,String code,String desc){
		return new JsonMessage(response,false, code, desc).toString();
	}
	
	public static  void sendBack(HttpServletResponse response,JsonMessage json){
		PrintWriter out = null;  
	    try {  
	        out = response.getWriter();  
	        out.append(json.toString());  
	    } catch (IOException e) {  
	        e.printStackTrace();  
	    } finally {  
	        if (out != null) {  
	            out.close();  
	        }  
	    }  
	}
	public String toString(){
		return "{\"success\":"+this.result+",\"code\":\""+code+"\",\"desc\":\""+desc+"\"}";
	}
}
