package com.vn.entity;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "WIRELESS_CHARGIN_TECHNOLOGY")
public class wireless_charging_technology {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer ID;
	String NAME;

	@OneToMany(mappedBy = "wireless_charging_technology")
	List<wp> wps;
}