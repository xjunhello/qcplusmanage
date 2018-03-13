package com.qc.service;

import java.util.List;
import java.util.Map;

import com.framework.BusinessException;
import com.framework.PageList;
import com.qc.model.Scorechange;

/**
 * 积分服务类
* @ClassName: ScoreService 
* @Description: 
* @author xinjun.zhang
* @date 2016年10月18日 下午2:46:36 
*
 */
public interface ScoreService {

	/**
	 * 
	* @Title: setScoreToUser 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param type
	* @param @param userid
	* @param @throws BusinessException    设定文件 
	* @return void    返回类型 
	* @throws
	 */
	public void setScoreToUser(Score type,int userid)  throws BusinessException;
	
	public void setScoreToUser(Scorechange scorechange,int userid)  throws BusinessException;
	
	
	public void save(Scorechange entity) throws BusinessException;
	public void update(Scorechange entity) throws BusinessException;
	public void update(Scorechange entity,int id) throws BusinessException;
	public int count() throws BusinessException;
	public Scorechange findById(int id) throws BusinessException;
	public PageList<Scorechange> findPageList(int pageNo,int pageSize,Map<String,Object> params) throws BusinessException;
	public List<Scorechange> find(String hql) throws BusinessException;
	public void delete(int id) throws BusinessException;
}
