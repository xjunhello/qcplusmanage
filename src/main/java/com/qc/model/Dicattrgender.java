package com.qc.model;

// Generated 2016-10-18 11:21:58 by Hibernate Tools 4.0.0

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Dicattrgender generated by hbm2java
 */
@Entity
@Table(name = "dicattrgender", catalog = "qcplus")
public class Dicattrgender implements java.io.Serializable {

	private int id;
	private String name;
	private Integer orderNo;
	private Integer isDelete;

	public Dicattrgender() {
	}

	public Dicattrgender(int id) {
		this.id = id;
	}

	public Dicattrgender(int id, String name, Integer orderNo, Integer isDelete) {
		this.id = id;
		this.name = name;
		this.orderNo = orderNo;
		this.isDelete = isDelete;
	}

	@Id
	@Column(name = "ID", unique = true, nullable = false)
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

	@Column(name = "isDelete")
	public Integer getIsDelete() {
		return this.isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

}
