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
import com.qc.model.Commentinfo;
import com.qc.service.CommentService;
import com.qc.service.MessageService;

@Service("commentService")
public class CommentServiceImpl implements CommentService {
	private final static Logger logger = Logger.getLogger(CommentServiceImpl.class);
	@Resource(name="baseDao")
	BaseDao<Commentinfo> commentDao;
	@Override
	public void save(Commentinfo entity)  throws BusinessException{
		try{
			commentDao.saveObject(entity);
		}catch(Exception e){
			logger.error("系统异常");
			throw new BusinessException("保存异常", e.getMessage());
		}
	}

	@Override
	public void update(Commentinfo entity) {
		commentDao.updateObject(entity);
	}
	
	@Transient
	@Override
	public void update(Commentinfo entity, int id) {
		entity.setId(id);
		commentDao.updateObject(entity);
	}

	@Override
	public int count() {
		return commentDao.coutObjects(" from Commentinfo ");
	}

	@Override
	public Commentinfo findById(int id) {
		return (Commentinfo) commentDao.findObject(Commentinfo.class, id);
	}

	@Override
	public PageList<Commentinfo> findPageList(int pageNo, int pageSize,Map<String,Object> params ) {
		StringBuffer hql = new StringBuffer("from  Commentinfo  order by id desc ");
		return commentDao.findPageList(hql.toString(), pageNo, pageSize,params);
	}

	@Override
	public List<Commentinfo> find(String hql) {
		return commentDao.findList(hql);
	}

	@Override
	public void delete(int id) {
		commentDao.deleteById("Commentinfo",id);
//		commentDao.updateObject(r);
	}

}
