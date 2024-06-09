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
@Table(name = "CART")
public class cart implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int ID;

	@ManyToOne
	@JoinColumn(name = "ID_USER")
	user user;

	@OneToMany(mappedBy = "cart")
	List<cart_item> cart_items;
}
