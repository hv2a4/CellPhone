package com.vn.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;

@Data
@Entity
@Table(name = "DISCOUNT_PRODUCT")
public class discount_product implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer ID;
	Double DISCOUNT_PERCENTAGE;
	
	@Temporal(TemporalType.DATE)
	Date START_DATE;
	
	@Temporal(TemporalType.DATE)
	Date EXPIRY_DATE;
	
	@OneToMany(mappedBy = "discount_product")
	List<variant> variants;
}
