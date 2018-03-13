package com.qc.service;

import java.util.List;
import java.util.Map;

import com.framework.BusinessException;
import com.framework.MoneyChangeStatus;
import com.framework.MoneyChangeType;
import com.framework.PageList;
import com.qc.model.Moneychange;
import com.qc.model.Orderdesc;
import com.qc.model.UserLogin;
import  com.qc.model.MoneychangeDesc;
public interface MoneyService {
	//public void save(Moneychange entity) throws BusinessException;
	/**
	 * 
	 * @param value 金额
	 * @param orderid 订单ID
	 * @param userid 用户ID
	 * @param type 类型
	 * @param status 状态
	 * @throws BusinessException
	 */
	public void save(int value,Orderdesc order,UserLogin user,MoneyChangeType type,MoneyChangeStatus status) throws BusinessException;
	public void save(int value,Orderdesc order,UserLogin user,MoneyChangeType type,MoneyChangeStatus status,String desc,String attachfile) throws BusinessException;
	/**
	 * 更新状态
	 * @param id
	 * @param MoneyChangeStatus
	 * @throws BusinessException
	 */
	public void update(int id, MoneyChangeStatus status) throws BusinessException;
	/**
	 * 更新状态
	 * @param id ID
	 * @param MoneyChangeStatus 状态
	 * @param desc 描述
	 * @param attachfile 附件
	 * @throws BusinessException
	 */
	public void update(int id, MoneyChangeStatus status,String desc,String attachfile) throws BusinessException;
	//public void update(Moneychange entity) throws BusinessException;
	//public void update(Moneychange entity,int id) throws BusinessException;
	public int count() throws BusinessException;
	public Moneychange findById(int id) throws BusinessException;
	public PageList<Moneychange> findPageList(int pageNo,int pageSize,Map<String,Object> params) throws BusinessException;
	public PageList<Moneychange> findPageList(int pageNo,int pageSize,Map<String,Object> params,String orderby) throws BusinessException;
	public void delete(int id) throws BusinessException;
	
	public void saveDesc(int moneyid,String desc,String attachfile) throws BusinessException;
	public void updateDesc(int id,String desc,String attachfile)  throws BusinessException;
	public List<MoneychangeDesc> findMoneychangeDescList(Map<String,Object> params,String orderby) throws BusinessException;
	public void deleteDesc(int id)   throws BusinessException;
}
