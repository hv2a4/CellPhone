package com.vn.entity;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "ADDRESS")
public class address implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer ID;

	String ADDRESS;
	Integer PROVINCE;
	Integer DISTRICT;
	String WARD;
	Double SHIPPING_FEE;

	@ManyToOne
	@JoinColumn(name = "ID_USER")
	user user;

}