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
import lombok.Data;

import lombok.NoArgsConstructor;

import org.springframework.format.annotation.DateTimeFormat;

@Data
@NoArgsConstructor
@Entity
@Table(name = "[USER]")
public class user implements Serializable {

	@Temporal(TemporalType.DATE)
	@JoinColumn(name = "CLOCKDOWN_PERIOD")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date CLOCKDOWN_PERIOD;

	@ManyToOne
	@JoinColumn(name = "ID_RANK")
	rank rank;

	@OneToMany(mappedBy = "user")
	List<cart> carts;

	@OneToMany(mappedBy = "user")
	List<order> orders;

	@OneToMany(mappedBy = "user")
	List<rating> ratings;

    String AVATAR;

    String FULLNAME;

    String GENDER;
    String PHONE_NUMBER;

	@Temporal(TemporalType.DATE)
    @JoinColumn(name = "CLOCKDOWN_PERIOD")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    Date CLOCKDOWN_PERIOD;

    Integer INCORRECT_PASSWORD = 0;

    @Temporal(TemporalType.DATE)
    @JoinColumn(name = "CREATE_AT")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    Date CREATE_AT;

    @JoinColumn(name = "UPDATE_AT")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    Date update_at;

    @ManyToOne
    @JoinColumn(name = "ID_RANK")
    rank rank;

    @OneToMany(mappedBy = "user")
    List<cart> carts;

    @OneToMany(mappedBy = "user")
    List<order> orders;

    @OneToMany(mappedBy = "user")
    List<rating> ratings;

    @OneToMany(mappedBy = "user")
    List<address> addresses;
}
