package com.qc.service.Impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.framework.BusinessException;
import com.framework.PageList;
import com.qc.dao.BaseDao;
import com.qc.model.Hot;
import com.qc.service.HotService;
@Service("hotService")
public class HotServiceImpl implements HotService {
	@Resource(name="baseDao")
	BaseDao<Hot> hotDao;
	@Override
	public void save(Hot entity) throws BusinessException {
		hotDao.saveObject(entity);
	}

	@Override
	public void update(Hot entity) throws BusinessException {
		hotDao.updateObject(entity);
	}

	@Override
	public void update(Hot entity, int id) throws BusinessException {
		entity.setId(id);
		hotDao.updateObject(entity);
	}

	@Override
	public int count() throws BusinessException {
		return hotDao.coutObjects(" from Hot");
	}

	@Override
	public Hot findById(int id) throws BusinessException {
		return hotDao.findObjectById("Hot", id);
	}

	@Override
	public PageList<Hot> findPageList(int pageNo, int pageSize,
			Map<String, Object> params) throws BusinessException {
		return hotDao.findPageList(" from Hot where 1=1 ", pageNo, pageSize, params);
	}

	@Override
	public void delete(int id) throws BusinessException {
		hotDao.deleteById("Hot", id);
	}

}
