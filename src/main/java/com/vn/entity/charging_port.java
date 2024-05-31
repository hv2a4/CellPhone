package com.vn.entity;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "CHARGING_PORT")
public class charging_port implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int ID;
	String NAME;

	@OneToMany(mappedBy = "charging_port")
	List<phone> phones;
}
