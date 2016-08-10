package com.somecompany.util;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.somecompany.pojo.ContactBean;

public class ContactRowMapper implements RowMapper<ContactBean>{

	@Override
	public ContactBean mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		ContactBean contactBean = new ContactBean();
		contactBean.setId(rs.getString("id"));
		contactBean.setFirstName(rs.getString("firstName"));
		contactBean.setLastName(rs.getString("lastName"));
		contactBean.setMiddleName(rs.getString("middleName"));
		contactBean.setGender(rs.getString("gender"));
		contactBean.setMobileNumber(rs.getString("mobileNumber"));
		contactBean.setEmail(rs.getString("email"));
		contactBean.setCountry(rs.getString("country"));
		contactBean.setAddress(rs.getString("address"));
		contactBean.setPinCode(rs.getString("pinCode"));
		return contactBean;
	}

}
