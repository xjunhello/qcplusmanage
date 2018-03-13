package com.qc.controller.converter;

import org.apache.commons.lang.StringUtils;
import org.springframework.core.convert.converter.Converter;

public class QCStringToIntConverter implements Converter<String, Integer>{

	@Override
	public Integer convert(String source) {
		if(source==null)
			return null;
		
		if(StringUtils.trim(source).equals(""))
			return null;
		
		return Integer.parseInt(source);
		
	}
	
	
	
}
