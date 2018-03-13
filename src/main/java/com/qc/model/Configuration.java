package com.qc.model;

// Generated 2016-10-18 11:21:58 by Hibernate Tools 4.0.0

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Configuraton generated by hbm2java
 */
@Entity
@Table(name = "configuration", catalog = "qcplus",uniqueConstraints = {@UniqueConstraint(columnNames={"catalog", "code"})}	)
public class Configuration implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5809550699061165740L;
	private Integer id;
	private String catalog;
	private Integer code;
	private String name;
	private Integer value;
	
	
	@Column(name="catalog",nullable = false)
	public String getCatalog() {
		return catalog;
	}

	public void setCatalog(String catalog) {
		this.catalog = catalog;
	}
	@Column(name="code",nullable = false)
	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}
	@Column(name="name",nullable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	@Column(name="value",nullable = false)
	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}

	public Configuration() {
	}

	public Configuration(Integer id,String catalog,Integer code,
			String name,Integer value) {
		this.id = id;
		this.catalog = catalog;
		this.code = code;
		this.name = name;
		this.value = value;
	}

	@Id
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

}