package com.qc.service.Impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.framework.BusinessException;
import com.framework.PageList;
import com.qc.dao.BaseDao;
import com.qc.model.Carousel;
import com.qc.service.CarouselService;
@Service("carouselService")
public class CarouselServiceImpl implements CarouselService {
	@Resource(name="baseDao")
	BaseDao<Carousel> carouselDao;
	@Override
	public void save(Carousel entity) throws BusinessException {
		carouselDao.saveObject(entity);
	}

	@Override
	public void update(Carousel entity) throws BusinessException {
		carouselDao.updateObject(entity);
	}

	@Override
	public void update(Carousel entity, int id) throws BusinessException {
		entity.setId(id);
		carouselDao.updateObject(entity);
	}

	@Override
	public int count() throws BusinessException {
		return carouselDao.coutObjects(" from Carousel");
	}

	@Override
	public Carousel findById(int id) throws BusinessException {
		return carouselDao.findObjectById("Carousel", id);
	}

	@Override
	public PageList<Carousel> findPageList(int pageNo, int pageSize,
			Map<String, Object> params) throws BusinessException {
		return carouselDao.findPageList(" from Carousel ", pageNo, pageSize, params);
	}

	@Override
	public void delete(int id) throws BusinessException {
		carouselDao.deleteById("Carousel", id);
	}

}
