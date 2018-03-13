package com.qc.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.framework.BusinessException;
import com.qc.dao.BaseDao;
import com.qc.model.Dicattreducation;
import com.qc.model.Dicattrgender;
import com.qc.model.Diccompanynature;
import com.qc.model.Diccompanysize;
import com.qc.model.Diccountry;
import com.qc.model.Diclanguages;
import com.qc.model.Dicorderstatus;
import com.qc.model.Dicproducttype;
import com.qc.model.Dicreceivelevel;
import com.qc.model.Dicservicetype;
import com.qc.model.UserLogin;
import com.qc.service.DicService;

@Service("dicService")
public class DicServiceImpl implements DicService {
	@Resource(name="baseDao")
	BaseDao<Dicattrgender> genderDao;
	@Resource(name="baseDao")
	BaseDao<Dicattreducation> educationDao;
	@Resource(name="baseDao")
	BaseDao<Diclanguages> languagesDao;
	@Resource(name="baseDao")
	BaseDao<Dicorderstatus> statusDao;
	@Resource(name="baseDao")
	BaseDao<Dicservicetype> serviceTypeDao;
	@Resource(name="baseDao")
	BaseDao<Dicproducttype> productTypeDao;
	@Resource(name="baseDao")
	BaseDao<Diccompanysize> companySizeDao;
	@Resource(name="baseDao")
	BaseDao<Diccompanynature> companyNatureDao;
	@Resource(name="baseDao")
	BaseDao<Diccountry> conutryDao;
	@Resource(name="baseDao")
	BaseDao<Dicreceivelevel> dicreceivelevelDao;
	
	
	@Transactional
	
	@Override
	public List<Dicattrgender> getGenderList() throws BusinessException {
		return genderDao.findList(" from Dicattrgender");
	}

	@Override
	public List<Dicattreducation> getEducationList() throws BusinessException {
		return educationDao.findList(" from Dicattreducation");
	}

	@Override
	public List<Diclanguages> getLanguageList() throws BusinessException {
		return languagesDao.findList("from Diclanguages");
	}

	public List<Dicorderstatus> getStatusList() throws BusinessException {
		return statusDao.findList(" from Dicorderstatus");
	}

	@Override
	public List<Dicservicetype> getDicservicetypeList()
			throws BusinessException {
		return serviceTypeDao.findList("from Dicservicetype");
	}

	@Override
	public List<Dicproducttype> getDicproducttypeList()
			throws BusinessException {
		return productTypeDao.findList("from Dicproducttype");
	}

	@Override
	public List<Diccompanysize> getDiccompanysizeList()
			throws BusinessException {
		return companySizeDao.findList("from Diccompanysize");
	}

	@Override
	public List<Diccompanynature> getDiccompanynatureList()
			throws BusinessException {
		return companyNatureDao.findList("from Diccompanynature");
	}

	@Override
	public List<Diccountry> getDiccountryList() throws BusinessException {
		return conutryDao.findList("from Diccountry");
	}

	@Override
	public List<Dicreceivelevel> getDicreceivelevelList() throws BusinessException{
		return dicreceivelevelDao.findList("from Dicreceivelevel");
	}
	
	@Override
	public List<Diccountry> getOverSeasList() throws BusinessException {
		return conutryDao.findList("from Diccountry where code like '___0000' and isdelete=1 order by orderNo ");
	}

	@Override
	public List<Diccountry> getProvinceList() throws BusinessException {
		return conutryDao.findList("from Diccountry where code like '000__00' and code not like '0000000' and isdelete=1 order by orderNo ");
	}

	@Override
	public List<Diccountry> getCityList(String code) throws BusinessException {
		code=code.substring(0,code.length()-2);
		return conutryDao.findList("from Diccountry where code like '"+code+"__' and code not like '"+code+"00'  and isdelete=1 order by orderNo ");
	}


}
