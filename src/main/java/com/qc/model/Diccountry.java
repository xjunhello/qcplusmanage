package com.qc.model;

// Generated 2016-10-18 11:21:58 by Hibernate Tools 4.0.0

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Diccountry generated by hbm2java
 */
@Entity
@Table(name = "diccountry", catalog = "qcplus")
public class Diccountry implements java.io.Serializable {

	private int id;
	private String name;
	private Integer orderNo;
	private Integer country;
	private String code;
	private Integer isDelete;

	public Diccountry() {
	}

	public Diccountry(int id) {
		this.id = id;
	}

	public Diccountry(int id, String name, Integer orderNo, Integer country,
			String code, Integer isDelete) {
		this.id = id;
		this.name = name;
		this.orderNo = orderNo;
		this.country = country;
		this.code = code;
		this.isDelete = isDelete;
	}

	@Id
	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "name", length = 32)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "orderNo")
	public Integer getOrderNo() {
		return this.orderNo;
	}

	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	@Column(name = "country")
	public Integer getCountry() {
		return this.country;
	}

	public void setCountry(Integer country) {
		this.country = country;
	}

	@Column(name = "code", length = 32)
	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "isDelete")
	public Integer getIsDelete() {
		return this.isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

}
