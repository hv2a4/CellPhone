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

@Data
@NoArgsConstructor
@Entity
@Table(name = "[USER]")
public class user implements Serializable{
	 private static final long serialVersionUID = 1L;
	
	@Id
	String USERNAME;
	
	String PASSWORD; 
	String EMAIL;
	Boolean ROLE;
	Boolean STATUS;
	String AVATAR;
	String FULLNAME;
	String GENDER;
	String PHONE_NUMBER;
	int INCORRECT_PASSWORD;
	
	@Temporal(TemporalType.TIMESTAMP)
	@JoinColumn(name="CREATE_AT")
	Date CREATE_AT=new Date();
	
	@Temporal(TemporalType.DATE)
	@JoinColumn(name = "UPDATE_AT")
	Date UPDATE_AT;

	@Temporal(TemporalType.TIMESTAMP)
	@JoinColumn(name = "CLOCKDOWN_PERIOD")
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
	
	@OneToMany(mappedBy = "user")
	List<address> addresses;
}
