package com.qc.model;

// Generated 2016-10-18 11:21:58 by Hibernate Tools 4.0.0

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Dicscorelevel generated by hbm2java
 */
@Entity
@Table(name = "dicscorelevel", catalog = "qcplus")
public class Dicscorelevel implements java.io.Serializable {

	private int id;
	private Integer min;
	private Integer max;
	private String name;
	private Integer orderNo;
	private Integer isDelete;

	public Dicscorelevel() {
	}

	public Dicscorelevel(int id) {
		this.id = id;
	}

	public Dicscorelevel(int id, Integer min, Integer max, String name,
			Integer orderNo, Integer isDelete) {
		this.id = id;
		this.min = min;
		this.max = max;
		this.name = name;
		this.orderNo = orderNo;
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

	@Column(name = "min")
	public Integer getMin() {
		return this.min;
	}

	public void setMin(Integer min) {
		this.min = min;
	}

	@Column(name = "max")
	public Integer getMax() {
		return this.max;
	}

	public void setMax(Integer max) {
		this.max = max;
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
