package com.vn.entity;
import java.io.Serializable;
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
@Table(name = "PAYMENT_METHOD")
public class payment_method implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer ID;
	
	@NotBlank(message = "Vui lòng nhập tên")
	String NAME;
	
	@OneToMany(mappedBy = "payment_method")
	@JsonIgnore
	List<order> orders;
}