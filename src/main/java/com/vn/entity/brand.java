package com.vn.entity;

import java.io.Serializable;
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
@Table(name = "BRAND")
public class brand implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int ID;
 
	String NAME;
	
	@OneToMany(mappedBy = "brand")
	List<phone> phones;
}
