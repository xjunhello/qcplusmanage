package com.qc.service;

import java.util.List;

import com.framework.BusinessException;
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

public interface DicService {
	public  List<Dicattrgender> getGenderList()  throws BusinessException;
	public  List<Dicattreducation> getEducationList()  throws BusinessException;
	public  List<Diclanguages> getLanguageList()  throws BusinessException;
	public  List<Dicorderstatus> getStatusList()  throws BusinessException;
	public  List<Dicservicetype> getDicservicetypeList()  throws BusinessException;
	public  List<Dicproducttype> getDicproducttypeList()  throws BusinessException;
	public  List<Diccompanysize> getDiccompanysizeList()  throws BusinessException;
	public  List<Diccompanynature> getDiccompanynatureList()  throws BusinessException;
	public  List<Diccountry> getDiccountryList()  throws BusinessException;
	public  List<Dicreceivelevel> getDicreceivelevelList() throws BusinessException;
	List<Diccountry> getCityList(String code) throws BusinessException;
	List<Diccountry> getProvinceList() throws BusinessException;
	List<Diccountry> getOverSeasList() throws BusinessException;
}
