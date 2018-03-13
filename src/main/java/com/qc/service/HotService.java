package com.qc.service;

import java.util.Map;

import com.framework.BusinessException;
import com.framework.PageList;
import com.qc.model.Hot;

public interface HotService {
	public void save(Hot entity) throws BusinessException;
	public void update(Hot entity) throws BusinessException;
	public void update(Hot entity,int id) throws BusinessException;
	public int count() throws BusinessException;
	public Hot findById(int id) throws BusinessException;
	public PageList<Hot> findPageList(int pageNo,int pageSize,Map<String,Object> params) throws BusinessException;
	public void delete(int id) throws BusinessException;
}
