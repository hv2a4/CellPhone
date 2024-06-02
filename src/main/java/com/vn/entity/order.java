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
@Table(name = "[ORDER]")
public class order implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int ID;
	
	@ManyToOne
	@JoinColumn(name = "ID_USER")
	user user;
	
	@ManyToOne
	@JoinColumn(name = "ID_STATUS_ORDER")
	status_order status_order;
	
	@ManyToOne	
	@JoinColumn(name = "ID_ADDRESS")
	address address;
	
	@ManyToOne
	@JoinColumn(name = "ID_PAYMENT_METHOD")
	payment_method payment_method;

	@ManyToOne
	@JoinColumn(name = "ID_DISCOUNT_CODE")
	discount_code discount_code;

	Double TOTAL_DISCOUNT;
	Double TOTAL_AMOUNT;
	String NOTE;
	
	@Temporal(TemporalType.DATE)
	@JoinColumn(name="CREATE_AT")
	Date CREATE_AT;
	
	@Temporal(TemporalType.DATE)
	@JoinColumn(name = "UPDATE_AT")
	Date UPDATE_AT;
	
	@OneToMany(mappedBy = "order")
	List<order_item> order_items;

	@OneToMany(mappedBy = "order")
	List<invoice> invoices;
}
