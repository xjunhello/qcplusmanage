package com.qc.model;

// Generated 2016-10-18 11:21:58 by Hibernate Tools 4.0.0

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Orderreports generated by hbm2java
 */
@Entity
@Table(name = "orderreports", catalog = "qcplus")
public class Orderreports implements java.io.Serializable {

	private Integer id;

	public Orderreports() {
	}

	public Orderreports(Integer id) {
		this.id = id;
	}

	@Id
	@Column(name = "id")
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

}
