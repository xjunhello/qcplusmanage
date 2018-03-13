package com.qc.service.Impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.persistence.Transient;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.framework.BusinessException;
import com.framework.PageList;
import com.qc.dao.BaseDao;
import com.qc.model.Scorechange;
import com.qc.model.UserLogin;
import com.qc.service.Score;
import com.qc.service.ScoreService;
@Service("scoreService")
public class ScoreServiceImpl implements ScoreService {
	
	@Resource(name="baseDao")
	BaseDao<UserLogin> userDao;
	
	@Resource(name="baseDao")
	BaseDao<Scorechange> scorechangeDao;
	
	@Transactional
	@Override
	public void setScoreToUser(Score type, int userid) throws BusinessException {
		UserLogin user = userDao.findObjectById("UserLogin", userid);
		if(user!=null){
			Scorechange scorelog = new Scorechange(userid, type.getDbtype(), type.getScoreNumber(), new Date(),null);
			scorechangeDao.saveObject(scorelog);
			user.setScore(user.getScore()+type.getScoreNumber());
			userDao.updateObject(user);
		}else{
			throw new BusinessException("500", "参数错误", "传入的用户参数不合法");
		}
	}
	

	@Override
	public void setScoreToUser(Scorechange scorechange, int userid)
			throws BusinessException {
		UserLogin user = userDao.findObjectById("UserLogin", userid);
		if(user!=null){
			scorechangeDao.saveObject(scorechange);
			user.setScore(user.getScore()+scorechange.getValue());
			userDao.updateObject(user);
		}else{
			throw new BusinessException("500", "参数错误", "传入的用户参数不合法");
		}
	}
	
	@Override
	public void save(Scorechange entity)  throws BusinessException{
		try{
			scorechangeDao.saveObject(entity);
		}catch(Exception e){
			throw new BusinessException("保存异常", e.getMessage());
		}
	}

	@Override
	public void update(Scorechange entity) {
		scorechangeDao.updateObject(entity);
	}
	
	@Transient
	@Override
	public void update(Scorechange entity, int id) {
		entity.setId(id);
		scorechangeDao.updateObject(entity);
	}

	@Override
	public int count() {
		return scorechangeDao.coutObjects(" from Scorechange where isdelete=0");
	}

	@Override
	public Scorechange findById(int id) {
		return (Scorechange) scorechangeDao.findObject(Scorechange.class, id);
	}

	@Override
	public PageList<Scorechange> findPageList(int pageNo, int pageSize,Map<String,Object> params ) {
		StringBuffer hql = new StringBuffer("from  Scorechange  order by changeDate desc ");
//		String name=StringUtils.trim((String)params.get("name"));
//		if(!StringUtils.isEmpty(name)){
//			hql.append(" and name like :name");
//			params.put("name", "%"+name+"%");
//		}
//		String desc = StringUtils.trim((String)params.get("descrtion"));
//		if(!StringUtils.isEmpty(desc)){
//			hql.append(" and descrtion like :descrtion");
//			params.put("descrtion", "%"+desc+"%");
//		}
		return scorechangeDao.findPageList(hql.toString(), pageNo, pageSize,params);
	}

	@Override
	public List<Scorechange> find(String hql) {
		return scorechangeDao.findList(hql);
	}

	@Override
	public void delete(int id) {
		scorechangeDao.deleteById("Scorechange",id);
//		scorechangeDao.updateObject(r);
	}



}
