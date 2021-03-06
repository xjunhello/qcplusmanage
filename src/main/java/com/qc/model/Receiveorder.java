package com.qc.model;

// Generated 2016-10-18 11:21:58 by Hibernate Tools 4.0.0

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

/**
 * Receiveorder generated by hbm2java
 */
@Entity
@Table(name = "receiveorder", catalog = "qcplus")
public class Receiveorder implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4241348510649058266L;
	private Integer id;
	private UserLogin userLogin;
	private String name;
	private String nickname;
	private Integer gender;
	private Date birth;
	private String idcard;
	private Integer phone;
	private String email;
	private Integer city;
	private String address;
	private String addrLatitude;
	private String serviceCity;
	private String serviceAddr;
	private String serviceAddrLatitude;
	private Integer servceType;
	private Integer productType;
	private Integer education;
	private Integer language;
	private String resume;
	private String photo;
	private String cardPhoto;
	private String emergencyContact;
	private Integer level;
	private Date createDate;
	private String restDate;

	public Receiveorder() {
	}

	public Receiveorder(UserLogin userLogin) {
		this.userLogin = userLogin;
	}

	public Receiveorder(UserLogin userLogin, String name, String nickname,
			Integer gender, Date birth, String idcard, Integer phone,
			String email, Integer city, String address, String addrLatitude,
			String serviceCity, String serviceAddr, String serviceAddrLatitude,
			Integer servceType, Integer productType, Integer education,
			Integer language, String resume, String photo, String cardPhoto,
			String emergencyContact, Integer level, Date createDate,
			String restDate) {
		this.userLogin = userLogin;
		this.name = name;
		this.nickname = nickname;
		this.gender = gender;
		this.birth = birth;
		this.idcard = idcard;
		this.phone = phone;
		this.email = email;
		this.city = city;
		this.address = address;
		this.addrLatitude = addrLatitude;
		this.serviceCity = serviceCity;
		this.serviceAddr = serviceAddr;
		this.serviceAddrLatitude = serviceAddrLatitude;
		this.servceType = servceType;
		this.productType = productType;
		this.education = education;
		this.language = language;
		this.resume = resume;
		this.photo = photo;
		this.cardPhoto = cardPhoto;
		this.emergencyContact = emergencyContact;
		this.level = level;
		this.createDate = createDate;
		this.restDate = restDate;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
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

	@Column(name = "name", length = 32)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "nickname", length = 32)
	public String getNickname() {
		return this.nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Column(name = "gender")
	public Integer getGender() {
		return this.gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "birth", length = 10)
	public Date getBirth() {
		return this.birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	@Column(name = "idcard", length = 32)
	public String getIdcard() {
		return this.idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	@Column(name = "phone")
	public Integer getPhone() {
		return this.phone;
	}

	public void setPhone(Integer phone) {
		this.phone = phone;
	}

	@Column(name = "email", length = 32)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "city")
	public Integer getCity() {
		return this.city;
	}

	public void setCity(Integer city) {
		this.city = city;
	}

	@Column(name = "address", length = 32)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "addrLatitude", length = 32)
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

	@Column(name = "serviceAddr", length = 32)
	public String getServiceAddr() {
		return this.serviceAddr;
	}

	public void setServiceAddr(String serviceAddr) {
		this.serviceAddr = serviceAddr;
	}

	@Column(name = "serviceAddrLatitude", length = 32)
	public String getServiceAddrLatitude() {
		return this.serviceAddrLatitude;
	}

	public void setServiceAddrLatitude(String serviceAddrLatitude) {
		this.serviceAddrLatitude = serviceAddrLatitude;
	}

	@Column(name = "servceType")
	public Integer getServceType() {
		return this.servceType;
	}

	public void setServceType(Integer servceType) {
		this.servceType = servceType;
	}

	@Column(name = "productType")
	public Integer getProductType() {
		return this.productType;
	}

	public void setProductType(Integer productType) {
		this.productType = productType;
	}

	@Column(name = "education")
	public Integer getEducation() {
		return this.education;
	}

	public void setEducation(Integer education) {
		this.education = education;
	}

	@Column(name = "language")
	public Integer getLanguage() {
		return this.language;
	}

	public void setLanguage(Integer language) {
		this.language = language;
	}

	@Column(name = "resume", length = 100)
	public String getResume() {
		return this.resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	@Column(name = "photo", length = 100)
	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Column(name = "cardPhoto", length = 100)
	public String getCardPhoto() {
		return this.cardPhoto;
	}

	public void setCardPhoto(String cardPhoto) {
		this.cardPhoto = cardPhoto;
	}

	@Column(name = "emergencyContact", length = 100)
	public String getEmergencyContact() {
		return this.emergencyContact;
	}

	public void setEmergencyContact(String emergencyContact) {
		this.emergencyContact = emergencyContact;
	}

	@Column(name = "level")
	public Integer getLevel() {
		return this.level;
	}

	public void setLevel(Integer level) {
		this.level = level;
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
