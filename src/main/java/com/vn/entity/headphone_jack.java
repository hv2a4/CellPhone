package com.vn.entity;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
@Entity
@Table(name = "HEADPHONE_JACK")
public class headphone_jack implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer ID;
	
	@NotBlank(message = "Vui lòng nhập tên")
	String NAME;
	
	@OneToMany(mappedBy = "headphone_jack")
	@JsonIgnore
	List<phone> phones;

}
