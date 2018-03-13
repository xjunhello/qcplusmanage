package com.qc.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.persistence.Transient;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.framework.BusinessException;
import com.framework.PageList;
import com.framework.Pair;
import com.framework.ParameterHelper;
import com.qc.dao.BaseDao;
import com.qc.model.Configuration;
import com.qc.service.ConfigurationService;
/**
 * 
* @ClassName: ConfigurationServiceImpl 
* @Description:  配置service
* @author xinjun.zhang
* @date 2016年11月4日 上午10:50:41 
*
 */
@Service("configurationService")
public class ConfigurationServiceImpl implements ConfigurationService {
	
	
	@Resource(name="baseDao")
	BaseDao<Configuration> configurationDao;
	

	
	
	@Override
	public void save(Configuration entity)  throws BusinessException{
		try{
			configurationDao.saveObject(entity);
		}catch(Exception e){
			throw new BusinessException("保存异常", e.getMessage());
		}
	}

	@Override
	public void update(Configuration entity) {
		configurationDao.updateObject(entity);
	}
	
	@Transient
	@Override
	public void update(Configuration entity, int id) {
		entity.setId(id);
		configurationDao.updateObject(entity);
	}

	@Override
	public int count() {
		return configurationDao.coutObjects(" from Configuration ");
	}

	@Override
	public Configuration findById(int id) {
		return (Configuration) configurationDao.findObject(Configuration.class, id);
	}

	@Override
	public PageList<Configuration> findPageList(int pageNo, int pageSize,Map<String,Object> params ) {
		StringBuffer hql = new StringBuffer("from  Configuration  order by catalog,code asc ");
		return configurationDao.findPageList(hql.toString(), pageNo, pageSize,params);
	}



	@Override
	public void delete(int id) {
		configurationDao.deleteById("Configuration",id);
	}

	@Override
	public List<Configuration> findList(Map<String, Object> params,
			String orderby) throws BusinessException {
		return configurationDao.findList(" from Conifguration ", params);
	}

	

	@Override
	public Map<String, List<Configuration>> getConfigurationMap(Map<String, Object> params)
		 	throws BusinessException {
		Map<String, List<Configuration>> result = new HashMap<String,List<Configuration>>();
		List<String> catalogs = this.findCatalogs(params);
		if(CollectionUtils.isEmpty(catalogs)){
			return null;
		}
		for(String catalog:catalogs){
			result.put(catalog, configurationDao
					.findList(" from Configuration where catalog = :catalog",
									 ParameterHelper.generateParameters(new Pair<String,Object>("catalog",catalog)),
									 "code asc"));
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> findCatalogs(Map<String, Object> params) throws BusinessException {
		return (List<String>)configurationDao.findColumList("select distinct c.catalog from Configuration c", params);
	}



}
