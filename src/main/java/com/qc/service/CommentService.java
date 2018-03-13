package com.qc.service;
import java.util.List;
import java.util.Map;

import com.framework.BusinessException;
import com.framework.PageList;
import com.qc.model.Commentinfo;
public interface CommentService {
	public void save(Commentinfo entity) throws BusinessException;
	public void update(Commentinfo entity) throws BusinessException;
	public void update(Commentinfo entity,int id) throws BusinessException;
	public int count() throws BusinessException;
	public Commentinfo findById(int id) throws BusinessException;
	public PageList<Commentinfo> findPageList(int pageNo,int pageSize,Map<String,Object> params) throws BusinessException;
	public List<Commentinfo> find(String hql) throws BusinessException;
	public void delete(int id) throws BusinessException;
}
