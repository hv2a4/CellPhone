package com.vn.entity;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "HEADPHONE_JACK")
public class headphone_jack implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int ID;
	String NAME;
	
	@OneToMany(mappedBy = "headphone_jack")
	List<phone> phones;

}
