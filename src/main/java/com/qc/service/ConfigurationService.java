package com.qc.service;

import java.util.List;
import java.util.Map;





import com.framework.BusinessException;
import com.framework.PageList;
import com.qc.model.Configuration;

public interface ConfigurationService {
	public void save(Configuration entity) throws BusinessException;
	public void update(Configuration entity) throws BusinessException;
	public void update(Configuration entity,int id) throws BusinessException;
	public int count() throws BusinessException;
	public Configuration findById(int id) throws BusinessException;
	public PageList<Configuration> findPageList(int pageNo,int pageSize,Map<String,Object> params) throws BusinessException;
	public List<Configuration> findList(Map<String,Object> params,String orderby) throws BusinessException;
	public void delete(int id) throws BusinessException;
	public Map<String,List<Configuration>> getConfigurationMap(Map<String, Object> params) throws BusinessException;
	List<String> findCatalogs(Map<String, Object> params) throws BusinessException;
}
