package com.qc.service;

import java.util.Map;

import com.framework.BusinessException;
import com.framework.PageList;
import com.qc.model.Carousel;

public interface CarouselService {
	public void save(Carousel entity) throws BusinessException;
	public void update(Carousel entity) throws BusinessException;
	public void update(Carousel entity,int id) throws BusinessException;
	public int count() throws BusinessException;
	public Carousel findById(int id) throws BusinessException;
	public PageList<Carousel> findPageList(int pageNo,int pageSize,Map<String,Object> params) throws BusinessException;
	public void delete(int id) throws BusinessException;
}
