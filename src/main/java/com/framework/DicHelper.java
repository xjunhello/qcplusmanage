package com.framework;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;

import com.framework.tag.DicServiceProviderType;
import com.qc.model.Configuration;
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
import com.qc.service.ConfigurationService;
import com.qc.service.DicService;

public class DicHelper {

	private static ApplicationContext ac;

	// 省份对应的市，
	private static Map<String, List<Diccountry>> cityList;
	private static List<Diccompanynature> companynatureList;
	private static List<String> configCatalog;
	private static Map<String, List<Configuration>> configrationList;
	private static ConfigurationService configurationService;
	private static List<Diccountry> countryList;
	private static DicService dicService;
	private static List<Dicattreducation> educationList;
	private static List<Dicattrgender> genderList;
	private static List<Diccompanysize> getDiccompanysizeList;
	private static List<Diclanguages> languageList;
	private final static Logger logger = Logger.getLogger(DicHelper.class);
	// 国外
	private static List<Diccountry> overSeasList;
	private static List<Dicproducttype> producttypeList;
	// 省份
	private static List<Diccountry> provinceList;
	private static List<Dicreceivelevel> receivelevelList;
	private static List<DicServiceProviderType> serviceProviderTypeList;

	private static List<Dicservicetype> servicetypeList;
	private static List<Dicorderstatus> statusList;

	/**
	 * 
	* @Title: getConfigurationsOfCatalog 
	* @Description: 获取某一类配置
	* @param @param catalog
	* @param @return    设定文件 
	* @return List<Configuration>    返回类型 
	* @throws
	 */
	public  static List<Configuration> getConfigurationsOfCatalog(String catalog){
		if(CollectionUtils.isEmpty(configCatalog)){
			initConfiguration();
		}
		return configrationList.get(catalog);
	}
	public static List<Diccompanysize> getGetDiccompanysizeList() {
		return getDiccompanysizeList;
	}
	public static void setGetDiccompanysizeList(
			List<Diccompanysize> getDiccompanysizeList) {
		DicHelper.getDiccompanysizeList = getDiccompanysizeList;
	}
	public static void setCityList(Map<String, List<Diccountry>> cityList) {
		DicHelper.cityList = cityList;
	}
	public static ApplicationContext getAc() {
		return ac;
	}

	/**
	 * 获取中国的省份
	 * 
	 * @param countryCode
	 * @return
	 */
	public static List<Diccountry> getChinaProvincesByCountryCode(
			String countryCode) {
		return provinceList;
	}

	/**
	 * 获得每个省份的地级市
	 * 
	 * @return <provinceCode,List<Diccountry>>
	 */
	public static Map<String, List<Diccountry>> getCityList() {
		if (cityList == null)
			try {
				cityList = new HashMap<String, List<Diccountry>>();
				List<Diccountry> provinces = getProvinceList();
				for (Diccountry dic : provinces) {
					cityList.put(dic.getCode(),
							dicService.getCityList(dic.getCode()));
				}
			} catch (BusinessException e) {
				e.printStackTrace();
				logger.error("初始化性别数据失败！", e);
			}
		return cityList;
	}

	/**
	 * 根据省份code获取城市列表
	 * 
	 * @param provinceCode
	 * @return
	 */
	public static List<Diccountry> getCitysListByProvinceCode(
			String provinceCode) {
		return cityList.get(provinceCode);
	}

	public static List<Diccompanynature> getCompanynatureList() {
		if (companynatureList == null)
			initDiccompanyNatureList();
		return companynatureList;
	}

	public static List<Diccompanysize> getCompanysizeList() {
		if (getDiccompanysizeList == null)
			initDiccompanysizeList();
		return getDiccompanysizeList;
	}

	public static List<String> getConfigCatalog() {
		return configCatalog;
	}

	public static Map<String, List<Configuration>> getConfigrationList() {
		return configrationList;
	}

	public static List<Diccountry> getCountryList() {
		if (countryList == null)
			initDiccountry();
		return countryList;
	}

	public static List<Dicattreducation> getEducationList() {
		if (educationList == null)
			initeducationList();
		return educationList;
	}

	public static List<Dicattrgender> getGenderList() {
		if (genderList == null)
			initGenderList();
		return genderList;
	}

	public static List<Diclanguages> getLanguageList() {
		if (languageList == null)
			initLanguageList();
		return languageList;
	}

	// ovreseas
	public static List<Diccountry> getOverSeasList() {
		if (overSeasList == null)
			try {
				overSeasList = dicService.getOverSeasList();
			} catch (BusinessException e) {
				e.printStackTrace();
				logger.error("初始化性别数据失败！", e);
			}
		return overSeasList;
	}

	public static List<Dicproducttype> getProducttypeList() {
		return producttypeList;
	}

	public static List<Dicproducttype> getProductTypeList() {
		if (producttypeList == null)
			initProductType();
		return producttypeList;
	}

	// privince
	/**
	 * 
	 * @param code
	 *            国家代码
	 * @return
	 */
	public static List<Diccountry> getProvinceList() {
		if (provinceList == null)
			try {
				provinceList = dicService.getProvinceList();
			} catch (BusinessException e) {
				e.printStackTrace();
				logger.error("初始化性别数据失败！", e);
			}
		return provinceList;
	}

	/**
	 * 根据国家的code获取省份
	 * 
	 * @param countryCode
	 * @return
	 */
	public static List<Diccountry> getProvincesByCountryCode(String countryCode) {
		return provinceList;
	}

	public static List<Dicreceivelevel> getReceivelevelList() {
		return receivelevelList;
	}

	public static List<DicServiceProviderType> getServiceProviderTypeList() {
		return serviceProviderTypeList;
	}

	public static List<Dicservicetype> getServicetype() {
		if (servicetypeList == null)
			initServicetype();
		return servicetypeList;
	}

	public static List<Dicservicetype> getServicetypeList() {
		return servicetypeList;
	}

	public static List<Dicorderstatus> getStatusList() {
		if (statusList == null)
			initStatusList();
		return statusList;
	}

	public static void init() {
		if (ac == null) {
			logger.error("初始化字典数据失败！");
			return;
		}
		// 获取字典Service
		dicService = (DicService) ac.getBean("dicService", DicService.class);
		configurationService = (ConfigurationService) ac.getBean(
				"configurationService", ConfigurationService.class);
		initGenderList();
		initeducationList();
		initLanguageList();
		initStatusList();
		initDicServiceProvideTypeList();
		initDiccompanyNatureList();
		initDiccompanysizeList();
		initProductType();
		initServicetype();
		initDiccountry();
		initReceivelevelList();
		getOverSeasList();
		getProvinceList();
		getCityList();
		initConfiguration();
	}

	private static void initDiccompanyNatureList() {
		try {
			companynatureList = dicService.getDiccompanynatureList();
		} catch (BusinessException e) {
			e.printStackTrace();
			logger.error("初始化性别数据失败！", e);
		}
	}

	private static void initDiccompanysizeList() {
		try {
			getDiccompanysizeList = dicService.getDiccompanysizeList();
		} catch (BusinessException e) {
			e.printStackTrace();
			logger.error("初始化性别数据失败！", e);
		}
	}

	private static void initDiccountry() {
		try {
			countryList = dicService.getDiccountryList();
		} catch (BusinessException e) {
			e.printStackTrace();
			logger.error("初始化性别数据失败！", e);
		}
	}

	private static void initDicServiceProvideTypeList() {
		serviceProviderTypeList = new ArrayList<DicServiceProviderType>();
		serviceProviderTypeList.add(new DicServiceProviderType(1,
				Constants.ORDER_SERVICEPROVIDERTYPE_1, 1, 0));
		serviceProviderTypeList.add(new DicServiceProviderType(2,
				Constants.ORDER_SERVICEPROVIDERTYPE_2, 2, 0));
	}

	private static void initeducationList() {
		try {
			educationList = dicService.getEducationList();
		} catch (BusinessException e) {
			logger.error("初始化数据失败！", e);
		}
	}

	private static void initGenderList() {
		try {
			genderList = dicService.getGenderList();
		} catch (BusinessException e) {
			e.printStackTrace();
			logger.error("初始化性别数据失败！", e);
		}
	}

	private static void initLanguageList() {
		try {
			languageList = dicService.getLanguageList();
		} catch (BusinessException e) {
			logger.error("初始化数据失败！", e);
		}
	}

	private static void initProductType() {
		try {
			producttypeList = dicService.getDicproducttypeList();
		} catch (BusinessException e) {
			e.printStackTrace();
			logger.error("初始化性别数据失败！", e);
		}
	}

	private static void initReceivelevelList() {
		try {
			receivelevelList = dicService.getDicreceivelevelList();
		} catch (BusinessException e) {
			e.printStackTrace();
			logger.error("初始化性别数据失败！", e);
		}
	}

	private static void initServicetype() {
		try {
			servicetypeList = dicService.getDicservicetypeList();
		} catch (BusinessException e) {
			e.printStackTrace();
			logger.error("初始化性别数据失败！", e);
		}
	}

	private static void initStatusList() {
		try {
			statusList = dicService.getStatusList();
		} catch (BusinessException e) {
			logger.error("初始化数据失败！", e);
		}
	}

	public static void setAc(ApplicationContext ac) {
		DicHelper.ac = ac;
	}

	public static void setCompanynatureList(
			List<Diccompanynature> companynatureList) {
		DicHelper.companynatureList = companynatureList;
	}

	public static void setConfigCatalog(List<String> configCatalog) {
		DicHelper.configCatalog = configCatalog;
	}

	public static void setConfigrationList(
			Map<String, List<Configuration>> configrationList) {
		DicHelper.configrationList = configrationList;
	}

	public static void setCountryList(List<Diccountry> countryList) {
		DicHelper.countryList = countryList;
	}

	public static void setEducationList(List<Dicattreducation> educationList) {
		DicHelper.educationList = educationList;
	}

	public static void setGenderList(List<Dicattrgender> genderList) {
		DicHelper.genderList = genderList;
	}

	public static void setLanguageList(List<Diclanguages> languageList) {
		DicHelper.languageList = languageList;
	}

	public static void setOverSeasList(List<Diccountry> overSeasList) {
		DicHelper.overSeasList = overSeasList;
	}

	public static void setProducttypeList(List<Dicproducttype> producttypeList) {
		DicHelper.producttypeList = producttypeList;
	}

	public static void setProvinceList(List<Diccountry> provinceList) {
		DicHelper.provinceList = provinceList;
	}

	public static void setReceivelevelList(
			List<Dicreceivelevel> receivelevelList) {
		DicHelper.receivelevelList = receivelevelList;
	}

	public static void setServiceProviderTypeList(
			List<DicServiceProviderType> serviceProviderTypeList) {
		DicHelper.serviceProviderTypeList = serviceProviderTypeList;
	}

	public static void setServicetypeList(List<Dicservicetype> servicetypeList) {
		DicHelper.servicetypeList = servicetypeList;
	}

	public static void setStatusList(List<Dicorderstatus> statusList) {
		DicHelper.statusList = statusList;
	}

	private static void initConfiguration() {
		try {
			configCatalog = configurationService.findCatalogs(null);
			configrationList = configurationService.getConfigurationMap(null);
		} catch (BusinessException e) {
			e.printStackTrace();
			logger.error("初始化配置失败");
		}

	}

}
