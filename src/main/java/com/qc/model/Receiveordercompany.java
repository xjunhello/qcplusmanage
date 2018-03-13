package com.qc.model;

// Generated 2016-10-18 11:21:58 by Hibernate Tools 4.0.0

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

/**
 * Receiveordercompany generated by hbm2java
 */
@Entity
@Table(name = "receiveordercompany", catalog = "qcplus")
public class Receiveordercompany implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4623204321344236118L;
	private int id;
	private UserLogin userLogin;
	private String name;
	private String nikename;
	private Integer companySize;
	private String telephone;
	private Integer city;
	private String email;
	private String address;
	private String addrLatitude;
	private String serviceCity;
	private String serviceAddr;
	private String serviceAddrLatitude;
	private Integer serviceType;
	private Integer prodoctType;
	private String contact;
	private String cardphoto;
	private String website;
	private String logo;
	private Date createDate;
	private String restDate;

	public Receiveordercompany() {
	}

	public Receiveordercompany(int id, UserLogin userLogin, String name) {
		this.id = id;
		this.userLogin = userLogin;
		this.name = name;
	}

	public Receiveordercompany(int id, UserLogin userLogin, String name,
			String nikename, Integer companySize, String telephone,
			Integer city, String email, String address, String addrLatitude,
			String serviceCity, String serviceAddr, String serviceAddrLatitude,
			Integer serviceType, Integer prodoctType, String contact,
			String cardphoto, String website, String logo, Date createDate,
			String restDate) {
		this.id = id;
		this.userLogin = userLogin;
		this.name = name;
		this.nikename = nikename;
		this.companySize = companySize;
		this.telephone = telephone;
		this.city = city;
		this.email = email;
		this.address = address;
		this.addrLatitude = addrLatitude;
		this.serviceCity = serviceCity;
		this.serviceAddr = serviceAddr;
		this.serviceAddrLatitude = serviceAddrLatitude;
		this.serviceType = serviceType;
		this.prodoctType = prodoctType;
		this.contact = contact;
		this.cardphoto = cardphoto;
		this.website = website;
		this.logo = logo;
		this.createDate = createDate;
		this.restDate = restDate;
	}

	@Id
	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userid", nullable = false)
	public UserLogin getUserLogin() {
		return this.userLogin;
	}

	public void setUserLogin(UserLogin userLogin) {
		this.userLogin = userLogin;
	}

	@Column(name = "name", nullable = false, length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "nikename", length = 50)
	public String getNikename() {
		return this.nikename;
	}

	public void setNikename(String nikename) {
		this.nikename = nikename;
	}

	@Column(name = "companySize")
	public Integer getCompanySize() {
		return this.companySize;
	}

	public void setCompanySize(Integer companySize) {
		this.companySize = companySize;
	}

	@Column(name = "telephone", length = 20)
	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	@Column(name = "city")
	public Integer getCity() {
		return this.city;
	}

	public void setCity(Integer city) {
		this.city = city;
	}

	@Column(name = "email", length = 50)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "address", length = 50)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "addrLatitude", length = 50)
	public String getAddrLatitude() {
		return this.addrLatitude;
	}

	public void setAddrLatitude(String addrLatitude) {
		this.addrLatitude = addrLatitude;
	}

	@Column(name = "ServiceCity", length = 50)
	public String getServiceCity() {
		return this.serviceCity;
	}

	public void setServiceCity(String serviceCity) {
		this.serviceCity = serviceCity;
	}

	@Column(name = "serviceAddr", length = 500)
	public String getServiceAddr() {
		return this.serviceAddr;
	}

	public void setServiceAddr(String serviceAddr) {
		this.serviceAddr = serviceAddr;
	}

	@Column(name = "serviceAddrLatitude", length = 500)
	public String getServiceAddrLatitude() {
		return this.serviceAddrLatitude;
	}

	public void setServiceAddrLatitude(String serviceAddrLatitude) {
		this.serviceAddrLatitude = serviceAddrLatitude;
	}

	@Column(name = "serviceType")
	public Integer getServiceType() {
		return this.serviceType;
	}

	public void setServiceType(Integer serviceType) {
		this.serviceType = serviceType;
	}

	@Column(name = "prodoctType")
	public Integer getProdoctType() {
		return this.prodoctType;
	}

	public void setProdoctType(Integer prodoctType) {
		this.prodoctType = prodoctType;
	}

	@Column(name = "contact", length = 50)
	public String getContact() {
		return this.contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	@Column(name = "cardphoto", length = 50)
	public String getCardphoto() {
		return this.cardphoto;
	}

	public void setCardphoto(String cardphoto) {
		this.cardphoto = cardphoto;
	}

	@Column(name = "website", length = 50)
	public String getWebsite() {
		return this.website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	@Column(name = "logo", length = 50)
	public String getLogo() {
		return this.logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "createDate", length = 10)
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Column(name = "restDate", length = 100)
	public String getRestDate() {
		return this.restDate;
	}

	public void setRestDate(String restDate) {
		this.restDate = restDate;
	}

}
