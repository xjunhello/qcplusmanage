package com.qc.model;

// Generated 2016-10-18 11:21:58 by Hibernate Tools 4.0.0

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Role generated by hbm2java
 */
@Entity
@Table(name = "role", catalog = "qcplus", uniqueConstraints = @UniqueConstraint(columnNames = "name"))
public class Role implements java.io.Serializable {

	private Integer id;
	private String name;
	private Integer isdelete;
	private String descrtion;
	private Set<UserLogin> userLogins = new HashSet<UserLogin>(0);

	public Role() {
	}

	public Role(String name) {
		this.name = name;
	}

	public Role(String name, Integer isdelete, String descrtion,
			Set<UserLogin> userLogins) {
		this.name = name;
		this.isdelete = isdelete;
		this.descrtion = descrtion;
		this.userLogins = userLogins;
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

	@Column(name = "name", unique = true, nullable = false, length = 32)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "isdelete")
	public Integer getIsdelete() {
		return this.isdelete;
	}

	public void setIsdelete(Integer isdelete) {
		this.isdelete = isdelete;
	}

	@Column(name = "descrtion")
	public String getDescrtion() {
		return this.descrtion;
	}

	public void setDescrtion(String descrtion) {
		this.descrtion = descrtion;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "role")
	public Set<UserLogin> getUserLogins() {
		return this.userLogins;
	}

	public void setUserLogins(Set<UserLogin> userLogins) {
		this.userLogins = userLogins;
	}

}
