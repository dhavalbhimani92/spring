package com.somecompany.pojo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class ContactBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3505550138991002980L;

	private String id;

	@NotEmpty
	@Size(min = 2, max = 250,message="{Required..}")
	private String firstName;
	
	private String lastName;
	
	private String middleName;
	
	@NotNull(message="{Required..}")
	private String gender;
	
	@NotEmpty
	@Size(min = 10, max = 10,message="{Required..}")
	@Pattern(regexp = "(^[7-9]{1}[0-9]{9}$)", message="{Enter Valid MobileNumber}")
	private String mobileNumber;
	
	@NotEmpty
	@Email(message="{Required..}")
	private String email;
	
	private String country;
	
	private String address;
	
	private String pinCode;

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String radio) {
		this.gender = radio;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPinCode() {
		return pinCode;
	}

	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
