package com.vn.entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
@Entity
@Table(name = "WIRELESS_CHARGING_TECHNOLOGY")
public class wireless_charging_technology {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer ID;
	
	@NotBlank(message = "Vui lòng nhập tên")
	String NAME;

	@OneToMany(mappedBy = "wireless_charging_technology")
	@JsonIgnore
	List<wp> wps;
}