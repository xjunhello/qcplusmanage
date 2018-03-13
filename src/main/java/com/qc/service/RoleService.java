package com.qc.service;
import java.util.List;
import java.util.Map;

import com.framework.BusinessException;
import com.framework.PageList;
import com.qc.model.Role;
public interface RoleService {
	public void save(Role entity) throws BusinessException;
	public void update(Role entity) throws BusinessException;
	public void update(Role entity,int id) throws BusinessException;
	public int count() throws BusinessException;
	public Role findById(int id) throws BusinessException;
	public PageList<Role> findPageList(int pageNo,int pageSize,Map<String,Object> params) throws BusinessException;
	public List<Role> find(String hql) throws BusinessException;
	public void delete(int id) throws BusinessException;
}
