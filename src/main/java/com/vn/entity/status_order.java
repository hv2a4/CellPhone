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
@Table(name = "STATUS_ORDER")
public class status_order implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer ID;
	
	@NotBlank(message = "Vui lòng nhập tên")
	String STATUS;
	@OneToMany(mappedBy = "status_order")
	@JsonIgnore
	List<order> orders;
}