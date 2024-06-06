package com.vn.entity;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="SYSTEM")
public class system implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int ID;
	String SYSTEM;

	@OneToMany(mappedBy = "system")
	@JsonIgnore
	List<phone> phones;
}
