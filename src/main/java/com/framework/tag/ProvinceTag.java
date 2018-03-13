package com.framework.tag;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang3.StringUtils;

import com.framework.DicHelper;
import com.qc.model.Diccompanysize;
import com.qc.model.Diccountry;

public class ProvinceTag extends TagSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3243645301880995588L;
	private static   List<Diccountry> provinceList;
	@Override
	public int doAfterBody() throws JspException {
		// TODO Auto-generated method stub
		return super.doAfterBody();
	}

	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}
	private String code;
	private String selected;
	@Override
	public int doStartTag() throws JspException {
		code=StringUtils.trim(code);
		selected=StringUtils.trim(selected);
		try {
            JspWriter out = this.pageContext.getOut();
            provinceList = DicHelper.getProvincesByCountryCode(code);
            if(provinceList == null || provinceList.size()==0) {
                out.println("省份初始化失败");
                return SKIP_BODY;
            }
            for(Diccountry s : provinceList){
            	out.println("<option value='"+s.getCode()+"' >"+s.getName()+"</option>" );
            }
        } catch(Exception e) {
            e.printStackTrace();
        	return SKIP_BODY;
        }
		return EVAL_BODY_INCLUDE;
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

	@Override
	public String getId() {
		// TODO Auto-generated method stub
		return super.getId();
	}

	@Override
	public Object getValue(String k) {
		// TODO Auto-generated method stub
		return super.getValue(k);
	}

	@Override
	public Enumeration<String> getValues() {
		// TODO Auto-generated method stub
		return super.getValues();
	}

	@Override
	public void setId(String id) {
		// TODO Auto-generated method stub
		super.setId(id);
	}

	@Override
	public void setValue(String k, Object o) {
		// TODO Auto-generated method stub
		super.setValue(k, o);
	}
	
}
