package com.vn.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;

@Data
@Entity
@Table(name = "DISCOUNT_CODE")
public class discount_code implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int ID;
	String CODE;
	
	@Temporal(TemporalType.DATE)
	@JoinColumn(name="EXPIRY_DATE")
	Date EXPIRY_DATE;
	
	@Temporal(TemporalType.DATE)
	@JoinColumn(name = "START_DATE")
	Date START_DATE;
	
	double PERCENTAGE;
	double MINIMUM;
	int QUANTITY;

	@OneToMany(mappedBy = "discount_code")
	List<order> orders;

	@ManyToOne
	@JoinColumn(name = "ID_RANK")
	rank rank;
}
