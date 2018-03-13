package com.qc.dao.Impl;

import org.springframework.stereotype.Repository;

import com.qc.dao.RoleDao;
@Repository("roleDao")
public class RoleDaoImpl<T> extends BaseDaoImpl<T> implements RoleDao<T>{

}
