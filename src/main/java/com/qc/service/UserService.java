package com.qc.service;

import java.util.List;
import java.util.Map;


import com.framework.BusinessException;
import com.framework.PageList;
import com.qc.model.Receiveorder;
import com.qc.model.Receiveordercompany;
import com.qc.model.Sendorder;
import com.qc.model.UserLogin;

public interface UserService {
	public void save(UserLogin entity) throws BusinessException;
	public void update(UserLogin entity) throws BusinessException;
	public void update(UserLogin entity,int id) throws BusinessException;
	public int count() throws BusinessException;
	public UserLogin findById(int id) throws BusinessException;
	public PageList<UserLogin> findPageList(int pageNo,int pageSize,Map<String,Object> params) throws BusinessException;
	public void delete(int id) throws BusinessException;
	public void save(Sendorder entity) throws BusinessException;
	public void save(Receiveorder entity) throws BusinessException;
	public void save(Receiveordercompany entity) throws BusinessException;
	public void update(Sendorder entity) throws BusinessException;
	public void update(Receiveorder entity) throws BusinessException;
	public void update(Receiveordercompany entity) throws BusinessException;
	public Sendorder findSendorderById(int id) throws BusinessException;
	public Receiveorder findReceiveorderById(int id) throws BusinessException;
	public Receiveordercompany findReceiveordercompanyById(int id) throws BusinessException;
	public Sendorder findSendorderByUserId(int id) throws BusinessException;
	public Receiveorder findReceiveorderByUserId(int id) throws BusinessException;
	public Receiveordercompany findReceiveordercompanyByUserId(int id) throws BusinessException;
	public PageList<Sendorder> findSendorderPageList(int pageNo,int pageSize,Map<String,Object> params) throws BusinessException;
	public PageList<Receiveorder> findReceiveorderPageList(int pageNo,int pageSize,Map<String,Object> params) throws BusinessException;
	public PageList<Receiveordercompany> findReceiveordercompanyPageList(int pageNo,int pageSize,Map<String,Object> params) throws BusinessException;
	public void deleteSendorder(int id) throws BusinessException;
	public void deleteReceiveorder(int id) throws BusinessException;
	public void deleteReceiveordercompany(int id) throws BusinessException;
	public void disable(UserLogin entity) throws BusinessException;
	public void setUserStatus(int id,int statusCode) throws BusinessException ;
	/**
	 * 推荐验货员
	* @Title: adviceReceiveorders 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param orderid
	* @param @return    设定文件 
	* @return List<Receiveorder>    返回类型 
	* @throws
	 */
	public List<Receiveorder> adviceReceiveorders(int orderid)  throws BusinessException ;
	/**
	 * 推荐验货公司
	* @Title: adviceReceiveordercompanys 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param orderid
	* @param @return    设定文件 
	* @return List<Receiveorder>    返回类型 
	* @throws
	 */
	public List<Receiveordercompany> adviceReceiveordercompanys(int orderid)  throws BusinessException ;
	public List<Receiveorder> findReceiveordersByKeyword(String keyword)  throws BusinessException ;
	public List<Receiveordercompany> findReceiveordercompanysByKeyword(String keyword)  throws BusinessException ;
	/**
	 * 
	* @Title: adviceSenders 
	* @Description: 根据关键字 推荐发单员
	* @param @param keyword 关键字
	* @param @param params 参数
	* @param @return    
	* @return List<Sendorder>    返回 发单员列表
	* @throws
	 */
	public List<Sendorder> adviceSenders(String keyword,Map<String,Object> params)  throws BusinessException ;
}
