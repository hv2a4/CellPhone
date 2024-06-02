package com.vn.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;

@Data
@Entity
@Table(name = "PHONE")
public class phone implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int ID;

	@ManyToOne
	@JoinColumn(name = "ID_BRAND")
	brand brand;

	@ManyToOne
	@JoinColumn(name = "ID_SYSTEM")
	system system;

	@ManyToOne
	@JoinColumn(name = "ID_CHARGING_PORT")
	charging_port charging_port;
	
	@ManyToOne
	@JoinColumn(name = "ID_HEADPHONE_JACK")
	headphone_jack headphone_jack;

	@ManyToOne
	@JoinColumn(name = "ID_BATTERY_TYPE")
	battery_type battery_type;

	@ManyToOne
	@JoinColumn(name = "ID_SCREEN")
	screen_resolution screen_resolution;

	@ManyToOne
	@JoinColumn(name = "ID_GRAPHICS")
	graphics_chip graphics_chip;

	@ManyToOne
	@JoinColumn(name = "ID_CATEGORY")
	category category;

	String NAME;
	String CONNECTION;
	String DESCRIPTION;
	Double SCREEN_SIZE;
	String PROCESSOR;
	Double RAM;
	String SELFIE_CAMERA;
	String MAIN_CAMERA;
	int BATTERY_CAPACITY;
	Boolean IS_DELETE;

	@Temporal(TemporalType.DATE)
	@JoinColumn(name = "CREATE_AT")
	Date CREATE_AT;
	
	@Temporal(TemporalType.DATE)
	@JoinColumn(name = "UPDATE_AT")
	Date UPDATE_AT;

	Double LENGTH;
	Double WIDTH;
	Double HEIGHT;
	Double WEIGHT;
	int REFRESH_RATE;
	int MAXIMUM_BRIGHTNESS;
	String VIDEO_RECORDING;
	Double CPU_SPEED;
	

	@OneToMany(mappedBy = "phone")
	List<variant> variants;

	@OneToMany(mappedBy = "phone")
	List<rating> ratings;

	@OneToMany(mappedBy = "phone")
	List<wp> wps;

	@OneToMany(mappedBy = "phone")
	List<image> images;

}
