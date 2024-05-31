package com.vn.entity;
import java.util.List;



import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "PAYMENT_METHOD")
public class payment_method {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer ID;
	String NAME;
	
	@OneToMany(mappedBy = "payment_method")
	List<order> orders;
}