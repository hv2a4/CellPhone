package com.vn.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.validation.constraints.*;
import lombok.Data;

import lombok.NoArgsConstructor;

import org.springframework.format.annotation.DateTimeFormat;

@Data
@NoArgsConstructor
@Entity
@Table(name = "[USER]")
public class user implements Serializable {
	@Id
	@NotBlank(message = "Không Được để trống tài khoản !")
	String USERNAME;

	@NotBlank(message = "Không Được để trống !")
	@Size(min = 6, message = "Mật khẩu phải có ít nhất 6 ký tự !")
	String PASSWORD;

	@NotBlank(message = "Không Được để trống !")
	@Email(message = "Không Đúng Định Dạng Email !")
	String EMAIL;
	@NotNull(message = "Bạn cho chọn vai trò")
	Boolean ROLE;
	Boolean STATUS;
	String AVATAR;
	@NotBlank(message = "Không Được để trống họ và tên !")
	String FULLNAME;
	@NotBlank(message = "Không được bỏ trông giới tính !")
	String GENDER;


	@NotBlank(message = "Không Được để trống số điện thoại !")
	@Pattern(
			regexp = "^(032|033|034|035|036|037|038|039|096|097|098|086|083|084|085|081|082|088|091|094|070|079|077|076|078|090|093|089|056|058|092|059|099)[0-9]{7}$",
			message = "Số điện thoại không hợp lệ"
	)
	String PHONE_NUMBER;
	int INCORRECT_PASSWORD;

	@Temporal(TemporalType.TIMESTAMP)
	@JoinColumn(name="CREATE_AT")
	Date CREATE_AT=new Date();

	@Temporal(TemporalType.TIMESTAMP)
	@JoinColumn(name = "UPDATE_AT")
	Date UPDATE_AT;

	@Temporal(TemporalType.TIMESTAMP)
	@JoinColumn(name = "CLOCKDOWN_PERIOD")
	Date CLOCKDOWN_PERIOD;

	@ManyToOne
	@JoinColumn(name = "ID_RANK")
	rank rank;

    @OneToMany(mappedBy = "user")
    List<address> addresses;

	@OneToMany(mappedBy = "user")
	List<cart> carts;

	@OneToMany(mappedBy = "user")
	List<order> orders;

	@OneToMany(mappedBy = "user")
	List<rating> ratings;
}
