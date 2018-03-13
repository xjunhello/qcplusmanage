package com.qc.service;
import java.util.List;
import java.util.Map;

import com.framework.BusinessException;
import com.framework.PageList;
import com.qc.model.Messagecenter;
public interface MessageService {
	public void save(Messagecenter entity) throws BusinessException;
	public void update(Messagecenter entity) throws BusinessException;
	public void update(Messagecenter entity,int id) throws BusinessException;
	public int count() throws BusinessException;
	public Messagecenter findById(int id) throws BusinessException;
	public PageList<Messagecenter> findPageList(int pageNo,int pageSize,Map<String,Object> params) throws BusinessException;
	public List<Messagecenter> find(String hql) throws BusinessException;
	public void delete(int id) throws BusinessException;
}
