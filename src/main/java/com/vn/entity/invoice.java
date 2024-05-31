package com.vn.entity;

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
@Table(name = "INVOICE")
public class invoice {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int ID;
	
	@ManyToOne
	@JoinColumn(name= "ID_STATUS")
	status_invoice status_invoice;
	
	@ManyToOne
	@JoinColumn(name = "ID_ORDER")
	order order;
		
	@Temporal(TemporalType.DATE)
	@JoinColumn(name = "CREATE_AT")
	Date CREATE_AT;
	
	@Temporal(TemporalType.DATE)
	@JoinColumn(name = "UPDATE_AT")
	Date UPDATE_AT;
	
	Double TOTAL_AMOUNT;
}
