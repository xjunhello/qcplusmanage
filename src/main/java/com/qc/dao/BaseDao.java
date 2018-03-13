package com.qc.dao;

import java.io.Serializable;
import java.util.List;
 




import java.util.Map;

import com.framework.PageList;
 
/**
 * 
 * @author zhangxj
 *
 */
public interface BaseDao<T> {
	 /**
     * 
     * @param hql
     * @return
     */
     T findObjectById(String className,int id) throws RuntimeException;
 
    /**
     * 
     * @param hql
     * @return
     */
     T findObject(String hql) throws RuntimeException;
     
    /**
     * 
     * @param hql
     * @param objects
     * @return
     */
     T findObject(String hql, Map<String,Object> params) throws RuntimeException;
     
    /**
     * 
     * @param cls
     * @param id
     * @return
     */
     T findObject(Class<T> cls, Serializable id) throws RuntimeException;
     
    /**
     * 
     * @param sql
     * @return
     */
     T findObjectBySql(String sql) throws RuntimeException;
     
    /**
     * 
     * @param sql
     * @param objects
     * @return
     */
     T findObjectBySql(String sql, Map<String,Object> params) throws RuntimeException;
     
    /**
     * 
     * @param hql
     * @return
     */
     List<T> findList(String hql) throws RuntimeException;
     
    /**
     * 
     * @param hql
     * @param objects
     * @return
     */
     List<T> findList(String hql, Map<String,Object> params) throws RuntimeException;
     /**
      * 
     * @Title: findList 
     * @Description: 返回对象列表 带排序功能
     * @param @param hql
     * @param @param params 请使用ParameterHelper构造
     * @param @param orderby 如 name asc   or createTime desc,name asc ...
     * @param @return
     * @param @throws RuntimeException    设定文件 
     * @return List<T>    返回类型 
     * @throws
      */
     List<T> findList(String hql, Map<String,Object> params,String orderby) throws RuntimeException;
    /**
     * 
     * @param cls
     * @return
     */
     List<T> findList(Class<T> cls) throws RuntimeException;
     
    /**
     * 
     * @param sql
     * @return
     */
     List<T> findListBySql(String sql) throws RuntimeException;
     
    /**
     * 
     * @param sql
     * @param objects
     * @return
     */
     List<T> findListBySql(String sql, Map<String,Object> params) throws RuntimeException;
     
    /**
     * 
     * @param obj
     */
     void saveObject(T obj) throws RuntimeException;
     
    /**
     * 
     * @param obj
     */
     void updateObject(T obj) throws RuntimeException;
     
    /**
     * 
     * @param obj
     */
     void saveOrUpdateObject(T obj) throws RuntimeException;
     
    /**
     * 
     * @param sql
     * @return
     */
    int executeSql(String sql) throws RuntimeException;
     
    /**
     * 
     * @param sql
     * @param objects
     * @return
     */
    int executeSql(String sql, Map<String,Object> params) throws RuntimeException;
     
    /**
     * 
     * @param hql
     * @return
     */
    int coutObjects(String hql) throws RuntimeException;
     
    /**
     * 
     * @param hql
     * @param objects
     * @return
     */
    int countObjects(String hql, Map<String,Object> params) throws RuntimeException;
     
    /**
     * 
     * @param hql
     * @param page
     * @param rows
     * @return
     */
     PageList<T> findPageList(String hql, int page, int rows) throws RuntimeException;
     
    /**
     * 
     * @param hql
     * @param page
     * @param rows
     * @param objects
     * @return
     */
     PageList<T> findPageList(String hql, int page, int rows,Map<String,Object> params) throws RuntimeException;
     
     PageList<T> findPageList(String hql, int page, int rows,Map<String,Object> params,String orderby) throws RuntimeException;
   
    
    public void deleteById(String entity ,int id ) throws RuntimeException;
    
    public List<?> findColumList(String sql, Map<String,Object> params) throws RuntimeException;
    
    public List<Object[]> findColumsList(String sql, Map<String,Object> params,String orderby) throws RuntimeException;
     
}