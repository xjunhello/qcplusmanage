package com.qc.service.Impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.framework.BusinessException;
import com.framework.MoneyChangeStatus;
import com.framework.MoneyChangeType;
import com.framework.PageList;
import com.qc.dao.BaseDao;
import com.qc.model.Moneychange;
import com.qc.model.MoneychangeDesc;
import com.qc.model.Orderdesc;
import com.qc.model.UserLogin;
import com.qc.service.MoneyService;
@Service("moneyService")
public class MoneyServiceImpl implements MoneyService {
	@Resource(name="baseDao")
	BaseDao<Moneychange> moneyDao;
	
	@Resource(name="baseDao")
	BaseDao<MoneychangeDesc> moneyDescDao;
	
	
	

	@Override
	public int count() throws BusinessException {
		return moneyDao.coutObjects(" from Moneychange where isdelete = 0 ");
	}

	@Override
	public Moneychange findById(int id) throws BusinessException {
		return moneyDao.findObjectById("Moneychange", id);
	}

	@Override
	public PageList<Moneychange> findPageList(int pageNo, int pageSize,
			Map<String, Object> params) throws BusinessException {
		return moneyDao.findPageList(" from Moneychange where isdelete = 0", pageNo, pageSize, params);
	}

	@Override
	public void delete(int id) throws BusinessException {
		Moneychange entity = moneyDao.findObjectById("Moneychange", id);
		if(entity==null){
			throw new BusinessException("系统错误", "删除:没有找到对应的对象！");
		}
		entity.setIsdelete(1);
		moneyDao.updateObject(entity);
	}

	@Override
	public void save(int value, Orderdesc order, UserLogin user,
			MoneyChangeType type, MoneyChangeStatus status)
			throws BusinessException {
		Moneychange money = new Moneychange();
		money.setValue(value);
		money.setOrderdesc(order);
		money.setUserLogin(user);
		money.setCreateDate(new Date());
		money.setType(type.type);
		money.setStatus(status.type);
		moneyDao.saveObject(money);
	}

	@Override
	public void update(int id, MoneyChangeStatus status) throws BusinessException {
		Moneychange money = moneyDao.findObjectById("Moneychange", id);
		if(money==null)
			throw new BusinessException("系统错误", "更新：没有找到对应的对象！");
		money.setStatus(status.type);
		money.setChangeDate(new Date());
		moneyDao.updateObject(money);
	}

	@Override
	public void update(int id,  MoneyChangeStatus status, String desc,
			String attachfile) throws BusinessException {
		this.update(id, status);
		this.saveDesc(id, desc, attachfile);
	}

	@Override
	public void saveDesc(int moneyid, String desc, String attachfile)
			throws BusinessException {
		MoneychangeDesc entity = new MoneychangeDesc();
		entity.setMoneychangeid(moneyid);
		entity.setDescrition(desc);
		entity.setAttachfile(attachfile);
		moneyDescDao.saveObject(entity);
	}

	@Override
	public void save(int value, Orderdesc order, UserLogin user,
			MoneyChangeType type, MoneyChangeStatus status, String desc,
			String attachfile) throws BusinessException {
		Moneychange money = new Moneychange();
		money.setValue(value);
		money.setOrderdesc(order);
		money.setUserLogin(user);
		money.setCreateDate(new Date());
		money.setType(type.type);
		money.setStatus(status.type);
		moneyDao.saveObject(money);
		this.saveDesc(money.getId(), desc, attachfile);
	}

	@Override
	public void updateDesc(int id, String desc, String attachfile)
			throws BusinessException {
		MoneychangeDesc entity = moneyDescDao.findObjectById("MoneychangeDesc", id);
		if(entity==null)
			throw new BusinessException("系统错误", "更新：没有找到对应的MoneychangeDesc对象！");
		entity.setDescrition(desc);
		entity.setAttachfile(attachfile);
		moneyDescDao.updateObject(entity);
	}

	@Override
	public List<MoneychangeDesc> findMoneychangeDescList(
			Map<String, Object> params, String orderby)
			throws BusinessException {
		return moneyDescDao.findList(" from MoneychangeDesc where moneychangeid = :moneychangeid", params, orderby);
	}

	@Override
	public void deleteDesc(int id) throws BusinessException {
		moneyDescDao.deleteById("MoneychangeDesc", id);
	}

	@Override
	public PageList<Moneychange> findPageList(int pageNo, int pageSize,
			Map<String, Object> params, String orderby)
			throws BusinessException {
		moneyDao.findPageList(" from Moneychange where isdelete=0 and userid=:userid and orderid=:orderid and type=:type and status=:status ", pageNo, pageSize, params, orderby);
		return null;
	}

	

}
