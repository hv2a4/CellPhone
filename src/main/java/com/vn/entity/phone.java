package com.vn.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jakarta.persistence.*;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
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
	@NotNull(message = "Thương hiệu không được để trống")
	brand brand;

	@ManyToOne
	@JoinColumn(name = "ID_SYSTEM")
	@NotNull(message = "Hệ điều hành không được để trống")
	system system;

	@ManyToOne
	@JoinColumn(name = "ID_CHARGING_PORT")
	@NotNull(message = "Cổng sạc không được để trống")
	charging_port charging_port;
	
	@ManyToOne
	@JoinColumn(name = "ID_HEADPHONE_JACK")
	@NotNull(message = "Jack tai nghe không được để trống")
	headphone_jack headphone_jack;

	@ManyToOne
	@JoinColumn(name = "ID_BATTERY_TYPE")
	@NotNull(message = "Loại pin không được để trống")
	battery_type battery_type;

	@ManyToOne
	@JoinColumn(name = "ID_SCREEN")
	@NotNull(message = "Độ phân giải màn hình không được để trống")
	screen_resolution screen_resolution;

	@ManyToOne
	@JoinColumn(name = "ID_GRAPHICS")
	@NotNull(message = "Chip đồ họa không được để trống")
	graphics_chip graphics_chip;

	@ManyToOne
	@JoinColumn(name = "ID_CATEGORY")
	@NotNull(message = "Danh mục không được để trống")
	category category;
	@NotBlank(message = "Tên không được để trống")
	String NAME;
	@NotBlank(message = "Kết nối không được để trống")
	String CONNECTION;
	@NotBlank(message = "Mô tả không được để trống")
	String DESCRIPTION;
	@Column(name = "SCREEN_RESOLUTION")
	@NotBlank(message = "Độ phân giải màn hình không được để trống")
	String SCREEN_RESOLUTIONKT;
	@NotNull(message = "Kích thước màn hình không được để trống")
	Double SCREEN_SIZE;
	@NotBlank(message = "Bộ xử lý không được bỏ trống")
	String PROCESSOR;
	@NotNull(message = "RAM không được bỏ trống")
	@Min(value = 0,message = "RAM phải lớn hơn 0")
	Double RAM;
	@NotNull(message = "Camera trước không được để trống")
	@Min(value = 0, message = "Camera trước phải là số không âm")
	Integer SELFIE_CAMERA;
	@NotNull(message = "Camera sau không được để trống")
	@Min(value = 0, message = "Camera sau phải là số không âm")
	Integer MAIN_CAMERA;
	@NotNull(message = "Dung lượng pin không được để trống")
	@Min(value = 0, message = "Dung lượng pin phải là số không âm")
	Integer BATTERY_CAPACITY;
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
	Integer REFRESH_RATE;
	Integer MAXIMUM_BRIGHTNESS;
	@NotBlank(message = "Vui lòng không bỏ trống ô quay video !")
	String VIDEO_RECORDING;
	Double CPU_SPEED;
	String IMAGE;

	@OneToMany(mappedBy = "phone")
	List<variant> variants;

	@OneToMany(mappedBy = "phone")
	List<rating> ratings;

	@OneToMany(mappedBy = "phone")
	List<wp> wps;

	@OneToMany(mappedBy = "phone", cascade = CascadeType.ALL, orphanRemoval = true)
	List<image> images = new ArrayList<>();
}
