package com.qc.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.persistence.Transient;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.framework.BusinessException;
import com.framework.PageList;
import com.framework.Pair;
import com.framework.ParameterHelper;
import com.qc.dao.BaseDao;
import com.qc.dao.UserDao;
import com.qc.model.Receiveorder;
import com.qc.model.Receiveordercompany;
import com.qc.model.Sendorder;
import com.qc.model.UserLogin;
import com.qc.service.UserService;
@Service("userService")
public class UserServiceImpl implements UserService {

	private final static Logger logger = Logger.getLogger(UserServiceImpl.class);
	@Resource(name="baseDao")
	BaseDao<UserLogin> userDao;
	@Resource(name="baseDao")
	BaseDao<Sendorder> senderDao;
	@Resource(name="baseDao")
	BaseDao<Receiveorder> receiveorderDao;
	@Resource(name="baseDao")
	BaseDao<Receiveordercompany> receiveordercompanyDao;
	@Override
	public void save(UserLogin entity)  throws BusinessException{
		try{
			userDao.saveObject(entity);
		}catch(Exception e){
			//logger.error("保存角色异常["+entity.getName()+"|"+entity.getDescrtion()+"]", e);
			throw new BusinessException("保存角色异常", e.getMessage());
		}
	}

	@Override
	public void update(UserLogin entity) {
		userDao.updateObject(entity);
	}
	
	@Transient
	@Override
	public void update(UserLogin entity, int id) {
		entity.setId(id);
		userDao.updateObject(entity);
	}

	@Override
	public int count() {
		return userDao.coutObjects(" from UserLogin where isdelete=0");
	}

	@Override
	public UserLogin findById(int id) {
		return (UserLogin) userDao.findObject(UserLogin.class, id);
	}

	@Override
	public PageList<UserLogin> findPageList(int pageNo, int pageSize,Map<String,Object> params ) {
		StringBuffer hql = new StringBuffer("from  UserLogin where 1=1  ");
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
		return userDao.findPageList(hql.toString(), pageNo, pageSize,params);
	}

	@Override
	public void delete(int id) {
		userDao.deleteById("UserLogin",id);
	}

	@Override
	public void save(Sendorder entity) throws BusinessException {
		senderDao.saveObject(entity);
	}

	@Override
	public void save(Receiveorder entity) throws BusinessException {
		receiveorderDao.saveObject(entity);
	}

	@Override
	public void save(Receiveordercompany entity) throws BusinessException {
		receiveordercompanyDao.saveObject(entity);
	}

	@Override
	public void update(Sendorder entity) throws BusinessException {
		senderDao.updateObject(entity);
	}

	@Override
	public void update(Receiveorder entity) throws BusinessException {
		receiveorderDao.updateObject(entity);
	}

	@Override
	public void update(Receiveordercompany entity) throws BusinessException {
		receiveordercompanyDao.updateObject(entity);
	}

	@Override
	public Sendorder findSendorderById(int id) throws BusinessException {
		return senderDao.findObjectById("Sendorder", id);
	}

	@Override
	public Receiveorder findReceiveorderById(int id) throws BusinessException {
		return receiveorderDao.findObjectById("Receiveorder", id);
	}

	@Override
	public Receiveordercompany findReceiveordercompanyById(int id)
			throws BusinessException {
		return receiveordercompanyDao.findObjectById("Receiveordercompany", id);
	}

	@Override
	public Sendorder findSendorderByUserId(int id) throws BusinessException {
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("id", new Integer(id));
		List<Sendorder> list = senderDao.findList("from Sendorder as sender  where sender.userLogin.id = :id", params);
		if(list==null||list.size()==0)
			return null;
		return list.get(0);
	}

	@Override
	public Receiveorder findReceiveorderByUserId(int id)
			throws BusinessException {
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("id", new Integer(id));
		List<Receiveorder> list = receiveorderDao.findList("from Receiveorder as recever where recever.userLogin.id = :id", params);
		if(list==null||list.size()==0)
			return null;
		return list.get(0);
	}

	@Override
	public Receiveordercompany findReceiveordercompanyByUserId(int id)
			throws BusinessException {
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("id", new Integer(id));
		List<Receiveordercompany> list = receiveordercompanyDao.findList("from Receiveordercompany as receComp where receComp.userLogin.id = :id", params);
		if(list==null||list.size()==0)
			return null;
		return list.get(0);
	}

	@Override
	public PageList<Sendorder> findSendorderPageList(int pageNo, int pageSize,
			Map<String, Object> params) throws BusinessException {
		return  senderDao.findPageList("from Sendorder", pageNo, pageSize, params);
	}

	@Override
	public PageList<Receiveorder> findReceiveorderPageList(int pageNo,
			int pageSize, Map<String, Object> params) throws BusinessException {
		return  receiveorderDao.findPageList("from Receiveorder", pageNo, pageSize, params);
	}

	@Override
	public PageList<Receiveordercompany> findReceiveordercompanyPageList(
			int pageNo, int pageSize, Map<String, Object> params)
			throws BusinessException {
		return  receiveordercompanyDao.findPageList("from Receiveordercompany", pageNo, pageSize, params);
	}

	

	@Override
	public void deleteSendorder(int id) throws BusinessException {
		senderDao.deleteById("Sendorder", id);
	}

	@Override
	public void deleteReceiveorder(int id) throws BusinessException {
		receiveorderDao.deleteById("Receiveorder", id);
	}

	@Override
	public void deleteReceiveordercompany(int id) throws BusinessException {
		receiveordercompanyDao.deleteById("Receiveordercompany", id);
	}

	@Override
	public void disable(UserLogin entity) throws BusinessException {
		if(null==entity||entity.getId()==0)
			throw new BusinessException("500","参数错误","请选择需要冻结的用户");
		if(userDao.findObjectById("UserLogin", entity.getId())==null)
			throw new BusinessException("500","参数错误","请选择需要冻结的用户");
		
		//normal
		userDao.executeSql("update UserLogin u set status=1 where id="+entity.getId());
	}

	@Override
	public void setUserStatus(int id, int statusCode) throws BusinessException {
		UserLogin user = userDao.findObjectById("UserLogin", id);
		if(user==null){
			throw new BusinessException("500","参数错误","没有找到对应的用户");
		}else {
			user.setStatus(statusCode);
			userDao.updateObject(user);
		}
	}

	@Override
	public List<Receiveorder> adviceReceiveorders(int orderid) {
		return receiveorderDao.findList("from Receiveorder");
	}

	@Override
	public List<Receiveordercompany> adviceReceiveordercompanys(int orderid) {
		return receiveordercompanyDao.findList(" from Receiveordercompany");
	}

	@Override
	public List<Receiveorder> findReceiveordersByKeyword(String keyword)  throws BusinessException  {
//		Map<String,Object> params = ParameterHelper.generateParameters(new Pair<String,Object>("name","%"+keyword+"%"),
//				new Pair<String,Object>("city","%"+keyword+"%"),new Pair<String,Object>("address","%"+keyword+"%"),
//				new Pair<String,Object>("serviceCity","%"+keyword+"%"),
//				new Pair<String,Object>("serviceType","%"+keyword+"%"),new Pair<String,Object>("productType","%"+keyword+"%"),
//				new Pair<String,Object>("education","%"+keyword+"%"),
//				new Pair<String,Object>("","%"+keyword+"%"),new Pair<String,Object>("","%"+keyword+"%"));
//		return receiveorderDao.findList("from Receiveorder where name like :name or nickname like :nickname or city like :city"
//				+" or address like :address or serviceCity like :serviceCity or serviceAddr like :serviceAddr"
//				+" or servceType like :serviceType or productType like :productType or education like :education"
//				,params);
				return receiveorderDao.findList("from Receiveorder ");	
	}

	@Override
	public List<Receiveordercompany> findReceiveordercompanysByKeyword(
			String keyword)   throws BusinessException {
		//TODO 细化
		return receiveordercompanyDao.findList(" from Receiveordercompany");
	}

	@Override
	public List<Sendorder> adviceSenders (String keyword,
			Map<String, Object> params)   throws BusinessException {
//		senderDao
		String sql=" from Sendorder where name like :name or nikename like :nickname "+
				" or email like :email or telephone like :telephone or contact like :contact";
		return senderDao.findList(sql, 
				ParameterHelper.generateParameters(new Pair<String, Object>("name", "%"+keyword+"%"),
						new Pair<String, Object>("nickname", "%"+keyword+"%"),new Pair<String, Object>("email", "%"+keyword+"%"),
						new Pair<String, Object>("telephone", "%"+keyword+"%"),new Pair<String, Object>("contact", "%"+keyword+"%")));
	}

}
