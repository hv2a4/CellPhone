package com.vn.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
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
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

import org.springframework.validation.annotation.Validated;
import lombok.Data;

@Data
@Entity
@Table(name = "DISCOUNT_CODE")
public class discount_code implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer ID;

	@NotBlank(message = "Mã CODE không được để trống")
	@Column(unique = true)
	String CODE;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@NotNull(message = "Ngày kết thúc không được để trống")
	Date EXPIRY_DATE;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@NotNull(message = "Ngày bắt đầu không được để trống")
	Date START_DATE;

	@NotNull(message = "Phần trăm giảm không được để trống")
	Double PERCENTAGE;

	@NotNull(message = "Giá trị tối thiểu không được để trống")
	Double MINIMUM;

	@NotNull(message = "Số lượng không được để trống")
	Integer QUANTITY;

	@OneToMany(mappedBy = "discount_code")
	@JsonIgnore
	List<order> orders;

	@ManyToOne
	@JoinColumn(name = "ID_RANK")
	rank rank;
}