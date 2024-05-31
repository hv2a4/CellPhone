package com.vn.entity;

import java.io.Serializable;
import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;

@Data
@Entity
@Table(name = "RATING")
public class rating implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int ID;

	@ManyToOne
	@JoinColumn(name = "ID_PHONE")
	phone phone;

	@ManyToOne
	@JoinColumn(name = "USER")
	user user;
	
	String CONTENT;
	Integer STARS;
	
	@Temporal(TemporalType.DATE)
	@JoinColumn(name = "CREATE_AT")
	Date createDate;

}
