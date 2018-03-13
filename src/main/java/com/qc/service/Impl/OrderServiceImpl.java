package com.qc.service.Impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.framework.BusinessException;
import com.framework.Constants;
import com.framework.PageList;
import com.framework.Pair;
import com.framework.ParameterHelper;
import com.mysql.fabric.xmlrpc.base.Param;
import com.qc.dao.BaseDao;
import com.qc.model.Orderdesc;
import com.qc.service.OrderService;
@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Resource(name="baseDao")
	BaseDao<Orderdesc> orderDao;
	@Override
	public void save(Orderdesc entity) throws BusinessException {
		orderDao.saveObject(entity);
	}

	@Override
	public void update(Orderdesc entity) throws BusinessException {
		orderDao.updateObject(entity);

	}

	@Override
	public void update(Orderdesc entity, int id) throws BusinessException {
		entity.setId(id);
		orderDao.updateObject(entity);
	}

	@Override
	public int count() throws BusinessException {
		return orderDao.coutObjects("from Orderdesc");
	}

	@Override
	public Orderdesc findById(int id) throws BusinessException {
		return orderDao.findObjectById("Orderdesc", id);
	}

	@Override
	public PageList<Orderdesc> findPageList(int pageNo, int pageSize,
			Map<String, Object> params) throws BusinessException {
		return orderDao.findPageList("from Orderdesc", pageNo, pageSize, params);
	}

	@Override
	public void delete(int id) throws BusinessException {
		orderDao.deleteById("Orderdesc", id);
	}

	@Override
	public void allotRecever(int orderid, int serviceprovidetype, int receverid)
			throws BusinessException {
		Map<String,Object> params =ParameterHelper.generateParameters(new Pair<String,Object>("receverid",receverid),
				new Pair<String,Object>("serviceprovidetype",serviceprovidetype),
				new Pair<String,Object>("id",orderid));
		orderDao.executeSql(" update Orderdesc set receiveId=:receverid,serviceProviderType=:serviceprovidetype where id=:id", params);
	}



}
