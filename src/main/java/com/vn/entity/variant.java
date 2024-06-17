	package com.vn.entity;
	
	import java.io.Serializable;
	import java.util.List;
	
	import com.fasterxml.jackson.annotation.JsonIgnore;
	
	import jakarta.persistence.CascadeType;
	import jakarta.persistence.Entity;
	import jakarta.persistence.FetchType;
	import jakarta.persistence.GeneratedValue;
	import jakarta.persistence.GenerationType;
	import jakarta.persistence.Id;
	import jakarta.persistence.JoinColumn;
	import jakarta.persistence.ManyToOne;
	import jakarta.persistence.OneToMany;
	import jakarta.persistence.Table;
	import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;
import lombok.Data;
	
	@Data
	@Entity
	@Table(name = "VARIANT")
	public class variant implements Serializable {
		private static final long serialVersionUID = 1L;
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		Integer ID;
		
		@NotNull(message = "Số lượng là bắt buộc")
		@PositiveOrZero(message = "Số lượng phải lớn hơn 0")
		Integer QUANTITY;
		
		@NotNull(message = "Giá là bắt buộc")
		@PositiveOrZero(message = "Giá phải lớn hơn 0")
		Double PRICE;
			
		@ManyToOne(fetch = FetchType.LAZY)
		@JoinColumn(name = "ID_PHONE")
		phone phone;
	
		@ManyToOne(fetch = FetchType.LAZY)
		@JoinColumn(name = "ID_COLOR")
		color color;
	
		@ManyToOne(fetch = FetchType.LAZY)
		@JoinColumn(name = "ID_STORAGE")
		storage storage;
	
		@ManyToOne
		@JoinColumn(name = "ID_DISCOUNT_PRODUCT")
		discount_product discount_product;
	
		@OneToMany(mappedBy = "variant")
		@JsonIgnore
		List<order_item> order_items;
	
		@OneToMany(mappedBy = "variant")
		@JsonIgnore
		List<cart_item> cart_items;
	
	}
