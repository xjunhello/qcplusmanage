package com.qc.service;

import java.util.Map;

import com.framework.BusinessException;
import com.framework.PageList;
import com.qc.model.Orderdesc;
/**
 * 
* @ClassName: OrderService 
* @Description: 订单服务类
* @author xinjun.zhang
* @date 2016年10月19日 上午9:56:09 
*
 */
public interface OrderService {
	public void save(Orderdesc entity) throws BusinessException;
	public void update(Orderdesc entity) throws BusinessException;
	public void update(Orderdesc entity,int id) throws BusinessException;
	public int count() throws BusinessException;
	public Orderdesc findById(int id) throws BusinessException;
	public PageList<Orderdesc> findPageList(int pageNo,int pageSize,Map<String,Object> params) throws BusinessException;
	public void delete(int id) throws BusinessException;
	/**
	 * 分配接单员
	* @Title: allotRecever 
	* @Description:  
	* @param @param orderid
	* @param @param receverid
	* @param @throws BusinessException    设定文件 
	* @return void    返回类型 
	* @throws
	 */
	public void allotRecever(int orderid,int serviceprovidetype,int receverid) throws BusinessException; 
}
