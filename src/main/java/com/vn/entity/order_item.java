package com.vn.entity;

import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "ORDER_ITEM")
public class order_item implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer ID;

	Double PRICE;
	Integer QUANTITY;

	@ManyToOne
	@JoinColumn(name = "ID_VARIANT")
	variant variant;

	@ManyToOne
	@JoinColumn(name = "ID_ORDER")
	order order;
}