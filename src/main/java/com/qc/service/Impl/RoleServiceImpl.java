package com.qc.service.Impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.persistence.Transient;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.framework.BusinessException;
import com.framework.PageList;
import com.qc.dao.BaseDao;
import com.qc.model.Role;
import com.qc.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService {
	private final static Logger logger = Logger.getLogger(RoleServiceImpl.class);
	@Resource(name="baseDao")
	BaseDao<Role> roleDao;
	@Override
	public void save(Role entity)  throws BusinessException{
		try{
			roleDao.saveObject(entity);
		}catch(Exception e){
			logger.error("保存角色异常["+entity.getName()+"|"+entity.getDescrtion()+"]", e);
			throw new BusinessException("保存角色异常", e.getMessage());
		}
	}

	@Override
	public void update(Role entity) {
		roleDao.updateObject(entity);
	}
	
	@Transient
	@Override
	public void update(Role entity, int id) {
		entity.setId(id);
		roleDao.updateObject(entity);
	}

	@Override
	public int count() {
		return roleDao.coutObjects(" from Role where isdelete=0");
	}

	@Override
	public Role findById(int id) {
		return (Role) roleDao.findObject(Role.class, id);
	}

	@Override
	public PageList<Role> findPageList(int pageNo, int pageSize,Map<String,Object> params ) {
		StringBuffer hql = new StringBuffer("from  Role where isdelete = 0 ");
		String name=StringUtils.trim((String)params.get("name"));
		if(!StringUtils.isEmpty(name)){
			hql.append(" and name like :name");
			params.put("name", "%"+name+"%");
		}
		String desc = StringUtils.trim((String)params.get("descrtion"));
		if(!StringUtils.isEmpty(desc)){
			hql.append(" and descrtion like :descrtion");
			params.put("descrtion", "%"+desc+"%");
		}
		return roleDao.findPageList(hql.toString(), pageNo, pageSize,params);
	}

	@Override
	public List<Role> find(String hql) {
		return roleDao.findList(hql);
	}

	@Override
	public void delete(int id) {
		roleDao.deleteById("Role",id);
//		roleDao.updateObject(r);
	}

}
