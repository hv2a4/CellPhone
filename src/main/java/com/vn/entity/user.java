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
	@NotBlank(message = "Không Được để trống !")
	String USERNAME;

	@NotBlank(message = "Không Được để trống !")
	@Size(min = 6, message = "Mật khẩu phải có ít nhất 6 ký tự !")
	String PASSWORD;

	@NotBlank(message = "Không Được để trống !")
	@Email(message = "Không Đúng Định Dạng Email !")
	String EMAIL;
	@NotNull(message = "Vui lòng chọn vai trò !")
	Boolean ROLE;
	Boolean STATUS;
	String AVATAR;
	@NotBlank(message = "Không Được để trống !")
	String FULLNAME;
	@NotNull(message = "Vui lòng chọn giới tính !")
	String GENDER;

	@NotBlank(message = "Không Được để trống !")
	@Pattern(
			regexp = "^0[0-9]{9}$",
			message = "Số điện thoại phải có đúng 10 chữ số và bắt đầu bằng số 0!"
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
	@NotNull(message = "Vui lòng chọn bậc !")
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
