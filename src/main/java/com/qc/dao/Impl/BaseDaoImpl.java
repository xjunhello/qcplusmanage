package com.qc.dao.Impl;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.ScrollableResults;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.framework.PageList;
import com.qc.dao.BaseDao;
 
 
@SuppressWarnings("unchecked")
@Repository("baseDao")
public class BaseDaoImpl<T> implements BaseDao<T> {
	private final static Logger logger = Logger.getLogger(BaseDaoImpl.class);
	
    @Autowired
    private SessionFactory sessionFactory;
    
    private HibernateTemplate sessionTemplate;
    
    @Override
    public int countObjects(String hql, Map<String,Object> params) throws RuntimeException{
        Query query = setParameters(hql,params);
        ScrollableResults sr = query.scroll();
        sr.last();
        return sr.getRowNumber() == -1 ? 0 : sr.getRowNumber() + 1;
    }

	@Override
    public int coutObjects(String hql) throws RuntimeException{
        Query query = getSession().createQuery(hql);
        ScrollableResults sr = query.scroll();
        sr.last();
        return sr.getRowNumber() == -1 ? 0 : sr.getRowNumber() + 1;
    }

	@Override
	public void deleteById(String entity ,int id) throws RuntimeException{
		Query q = getSession().createQuery("delete from "+entity+" where id = ?");
		q.setParameter(0, id);
		q.executeUpdate();
	}
 
    @Override
    public int executeSql(String sql) throws RuntimeException{
        Query query = getSession().createSQLQuery(sql);
        return query.executeUpdate();
    }
 
    @Override
    public int executeSql(String sql, Map<String,Object> params) throws RuntimeException{
        Query query = this.setParameters(sql, params);
        return query.executeUpdate();
    }
 
    //根据条件 返回一个列的集合
	public List<Object> findColumList(String sql, Map<String,Object> params) throws RuntimeException {
		 Query query = setParameters(sql, params);
	        return query.list();
	}
 
    /**
	 * 根据条件返回多个列的集合
	 */
	@Override
	public List<Object[]> findColumsList(String sql, Map<String, Object> params,String orderby)
			throws RuntimeException {
		 Query query = setParameters(sql, params,orderby);
	        return query.list();
	}
 
    @Override
    public  List<T> findList(Class<T> cls) throws RuntimeException{
        String hql = "FROM " + cls.getName();
        return findList(hql);
    }
 
    @Override
    public  List<T> findList(String hql) throws RuntimeException{
        Query query = getSession().createQuery(hql);
        return query.list();
    }
 
    @Override
    public  List<T> findList(String hql, Map<String,Object> params) throws RuntimeException{
        Query query = setParameters(hql, params);
        return query.list();
    }
 
    @Override
	public List<T> findList(String hql, Map<String, Object> params,
			String orderby) throws RuntimeException {
		 Query query = setParameters(hql, params,orderby);
	   return query.list();
	}
 
    @Override
    public  List<T> findListBySql(String sql) throws RuntimeException{
        Query query = getSession().createSQLQuery(sql);
        return query.list();
    }
 
    @Override
    public  List<T> findListBySql(String sql, Map<String,Object> params) throws RuntimeException{
        Query query = this.setParameters(sql, params);
        return query.list();
    }
 
    /*
     * (non-Javadoc)
     * 
     * @see com.school.dao.BaseDao#findObject(java.lang.Class,
     * java.io.Serializable)
     */
    @Override
    public T findObject(Class<T> cls, Serializable id) throws RuntimeException{
        return (T) getSession().get(cls, id);
    }
 
    /*
     * (non-Javadoc)
     * 
     * @see com.school.dao.BaseDao#findObject(java.lang.String)
     */
    @Override
    public  T findObject(String hql) throws RuntimeException{
        List<T> list = findList(hql);
        return (null == list || list.size() == 0) ? null : list.get(0);
    }
 
    /*
     * (non-Javadoc)
     * 
     * @see com.school.dao.BaseDao#findObject(java.lang.String,
     * java.lang.Object[])
     */
    @Override
    public  T findObject(String hql, Map<String,Object> params) throws RuntimeException{
        List<T> list = findList(hql, params);
        return (null == list || list.size() == 0) ? null : list.get(0);
    }
 
    @Override
	public T findObjectById(String className,int id) throws RuntimeException {
		Query q = getSession().createQuery("from "+className+" where id = :id");
		q.setParameter("id", id);
		List<T> list = q.list();
		if(list==null||list.size()==0){
			return null;
		}else{
			return list.get(0);
		}
	}
 
    @Override
    public  T findObjectBySql(String sql) throws RuntimeException{
        List<T> list = findListBySql(sql);
        return (null == list || list.size() == 0) ? null : list.get(0);
    }
 
    @Override
    public  T findObjectBySql(String sql, Map<String,Object> params) throws RuntimeException{
        List<T> list = findListBySql(sql, params);
        return (null == list || list.size() == 0) ? null : list.get(0);
    }
 
    PageList<T> findPageList(Query query, int page, int rows,int count) throws RuntimeException{
        query.setFirstResult((page - 1) * rows);
        query.setMaxResults(rows);
        return new PageList<T>(page, rows,count,query.list() );
    }
 
    @Override
    public  PageList<T> findPageList(String hql, int page, int rows) throws RuntimeException{
        Query query = getSession().createQuery(hql);
        int count = this.countObjects(hql,null);
        return findPageList(query, page, rows,count);
    }
 
    @Override
    public  PageList<T> findPageList(String hql, int page, int rows, Map<String,Object> params) throws RuntimeException{
        int count = this.countObjects(hql, params);
        return findPageList(setParameters(hql,params), page, rows,count);
    }
    Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    public HibernateTemplate getSessionTemplate() {
    	if(this.sessionTemplate==null)
    		this.sessionTemplate = new HibernateTemplate(sessionFactory);
		return sessionTemplate;
	}
    
     @Override
    public  void saveObject(T obj) throws RuntimeException{
    	getSession().save(obj);
    	getSession().flush();
        getSession().clear();
    }
 

    

	@Override
    public  void saveOrUpdateObject(T obj) throws RuntimeException{
        getSession().saveOrUpdate(obj);
        getSession().flush();
        getSession().clear();
    }

	private Query setParameters(String hql,Map<String,Object> params){
    	Query query = getSession().createQuery(hql);
        if(params!=null&&params.size()>0){
        	for(String key : params.keySet()){
        		Object param = params.get(key);
        		if(param==null){
        			continue;
        		}
        		if(params instanceof Collection){
        			query.setParameterList(key, (Object[])param);
        		}else{
        			query.setParameter(key, param);
        		}
        	}
        }
        return query;
    }
	private Query setParameters(String hql,Map<String,Object> params,String orderby){
    	Query query = getSession().createQuery(hql+" order by "+orderby);
        if(params!=null&&params.size()>0){
        	for(String key : params.keySet()){
        		Object param = params.get(key);
        		if(param==null){
        			continue;
        		}
        		if(params instanceof Collection){
        			query.setParameterList(key, (Object[])param);
        		}else{
        			query.setParameter(key, param);
        		}
        	}
        }
        return query;
    }
	public void setSessionTemplate(HibernateTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}

	@Override
    public  void updateObject(T obj) {
        getSession().saveOrUpdate(obj);
        getSession().flush();
        getSession().clear();
    }

	@Override
	public PageList<T> findPageList(String hql, int page, int rows,
			Map<String, Object> params, String orderby) throws RuntimeException {
		int count = this.countObjects(hql, params);
        return findPageList(setParameters(hql,params,orderby), page, rows,count);
	}
}
