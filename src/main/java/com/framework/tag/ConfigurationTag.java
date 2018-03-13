package com.framework.tag;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang3.StringUtils;

import com.framework.DicHelper;
import com.qc.model.Configuration;
import com.qc.model.Dicattrgender;

public class ConfigurationTag extends TagSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3243645301880995588L;
	private static List<Configuration> configList ;
	@Override
	public int doAfterBody() throws JspException {
		// TODO Auto-generated method stub
		return super.doAfterBody();
	}

	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}
	public String getCatalog() {
		return catalog;
	}

	public void setCatalog(String catalog) {
		this.catalog = catalog;
	}
	private String catalog;
	private String name;
	private String id;
	private String onchange;
	private String style;
	private String classname;
	private String selected;
	@Override
	public int doStartTag() throws JspException {
		catalog=StringUtils.trim(catalog);
		name=StringUtils.trim(name);
		id=StringUtils.trim(id);
		onchange=StringUtils.trim(onchange);
		classname=StringUtils.trim(classname);
		style=StringUtils.trim(style);
		selected=StringUtils.trim(selected);
		try {
			JspWriter out = this.pageContext.getOut();
			if(StringUtils.isEmpty(catalog)){
				out.println("请输入catalog值");
                return SKIP_BODY;
			}
			configList = DicHelper.getConfigurationsOfCatalog(catalog);
            if(configList == null || configList.size()==0) {
                out.println("配置标签初始化失败，"+catalog+"未找到对应的配置");
                return SKIP_BODY;
            }
            out.println("<select ");
            if(id!=null&&!id.equals("")){
            	out.print(" id='"+id+"'");
            }
            if(name!=null&&!name.equals("")){
            	out.print(" name='"+name+"'");
            }
            if(onchange!=null&&!onchange.equals("")){
            	out.print(" onchange="+onchange+"");
            }
            if(classname!=null&&!classname.equals("")){
            	out.print(" class='"+classname+"'");
            }
            if(style!=null&&!style.equals("")){
            	out.print(" style='"+style+"'");
            }
            out.println(">");
            for(Configuration s : configList){
            	out.println("<option codevalue='"+s.getValue()+"' value='"+s.getCode()+"' >"+s.getName()+"</option>" );
            }
            out.println("</select>");
        } catch(Exception e) {
            e.printStackTrace();
        	return SKIP_BODY;
        }
		return EVAL_BODY_INCLUDE;
	}

	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOnchange() {
		return onchange;
	}

	public void setOnchange(String onchange) {
		this.onchange = onchange;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getClassname() {
		return classname;
	}

	public void setClassname(String classname) {
		this.classname = classname;
	}

	public String getSelected() {
		return selected;
	}

	public void setSelected(String selected) {
		this.selected = selected;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
	
}
