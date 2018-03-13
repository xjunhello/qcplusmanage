package com.framework.util;



import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("commonTagUtil")
public class CommonTagUtil extends TagSupport {

	private String tagType;
	private String type;
	private String value;
	private String checked;
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1774173851160140485L;

	@Override
	public int doEndTag() throws JspException {
		return super.doEndTag();
	}

	@Override
	public int doStartTag() throws JspException {
		JspWriter out = this.pageContext.getOut();
//		try {	
//			if(type==null){
//				out.print("非法的类型！");
//				return SKIP_BODY;
//			}
//			if(tagType==null||tagType.equals("column")){
//				DicExample example = new DicExample();
//				example.or().andTypeEqualTo(type);
//				example.or().andCodeEqualTo(value);
//				List<Dic> list = dicService.selectByExample(example);
//				if(list==null||list.size()<0){
//					out.println("找不到对应展示！");
//				}
//				out.print(list.get(0).getDisplay());
//			}else if(tagType.equals("select")){
//				DicExample example = new DicExample();
//				example.or().andTypeEqualTo(type);
//				List<Dic> list = dicService.selectByExample(example);
//				out.print("<select>");
//				for(Dic dic : list){
//					out.print("<option value='"+dic.getCode()+"'>"+dic.getDisplay()+"</option>");
//				}
//				out.print("</select>");
//			}else if(tagType.equals("check")){
//				
//			}else if(tagType.equals("radio")){
//				
//			}else if(tagType.equals("input")){
//				
//			}
//			} catch (IOException e) {
//				e.printStackTrace();
//			} 
		return super.doStartTag();
	}

	@Override
	public void release() {
		super.release();
	}

}
