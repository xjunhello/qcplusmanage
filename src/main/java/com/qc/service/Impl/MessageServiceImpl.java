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
import com.qc.model.Messagecenter;
import com.qc.service.MessageService;

@Service("messageService")
public class MessageServiceImpl implements MessageService {
	private final static Logger logger = Logger.getLogger(MessageServiceImpl.class);
	@Resource(name="baseDao")
	BaseDao<Messagecenter> messageDao;
	@Override
	public void save(Messagecenter entity)  throws BusinessException{
		try{
			messageDao.saveObject(entity);
		}catch(Exception e){
			logger.error("系统异常");
			throw new BusinessException("保存角色异常", e.getMessage());
		}
	}

	@Override
	public void update(Messagecenter entity) {
		messageDao.updateObject(entity);
	}
	
	@Transient
	@Override
	public void update(Messagecenter entity, int id) {
		entity.setId(id);
		messageDao.updateObject(entity);
	}

	@Override
	public int count() {
		return messageDao.coutObjects(" from Messagecenter ");
	}

	@Override
	public Messagecenter findById(int id) {
		return (Messagecenter) messageDao.findObject(Messagecenter.class, id);
	}

	@Override
	public PageList<Messagecenter> findPageList(int pageNo, int pageSize,Map<String,Object> params ) {
		StringBuffer hql = new StringBuffer("from  Messagecenter  order by id desc ");
		return messageDao.findPageList(hql.toString(), pageNo, pageSize,params);
	}

	@Override
	public List<Messagecenter> find(String hql) {
		return messageDao.findList(hql);
	}

	@Override
	public void delete(int id) {
		messageDao.deleteById("Messagecenter",id);
//		messageDao.updateObject(r);
	}

}
