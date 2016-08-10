package com.somecompany.dao.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.somecompany.dao.ContactDao;
import com.somecompany.pojo.ContactBean;
import com.somecompany.pojo.Login;
import com.somecompany.util.ContactRowMapper;

@Repository
public class ContactDaoImpl implements ContactDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public int insertContact(ContactBean contact) {
		String sql = "INSERT INTO CONTACTAPI (firstName,lastName,middleName,gender,mobileNumber,"
				+ "email,country,address,pinCode) VALUES(?,?,?,?,?,?,?,?,?)";
		int result = jdbcTemplate.update(sql, new Object[]{contact.getFirstName(),contact.getLastName(),contact.getMiddleName(),contact.getGender(),contact.getMobileNumber(),contact.getEmail(),contact.getCountry(),contact.getAddress(),contact.getPinCode()});
		
		return result;
	}

	@Override
	public int updateContact(ContactBean contact) {
		System.out.println("update bd before");
		String sql = "UPDATE contactapi SET firstName=?,lastName=?,middleName=?,gender=?,mobileNumber=?,"
				+ "email=?,country=?,address=?,pinCode=? WHERE id=?";
		int result = jdbcTemplate.update(sql, contact.getFirstName(),contact.getLastName(),contact.getMiddleName(),contact.getGender(),contact.getMobileNumber(),contact.getEmail(),contact.getCountry(),contact.getAddress(),contact.getPinCode(),contact.getId());
		System.out.println("update db after return");
		return result;
	}

	@Override
	public int deleteContact(String id) {
		String sql = "DELETE FROM CONTACTAPI WHERE id=?";
		int result = jdbcTemplate.update(sql, new Object[]{id});
		return result;
	}

	@Override
	public List<ContactBean> allContact(ContactBean contact) {
		String sql = "SELECT * FROM contactapi";
		List<ContactBean> contactList = jdbcTemplate.query(sql, new ContactRowMapper());
		return contactList;
	}
	
	@Override
	public int login(Login login) {
			String sql = "SELECT userName , password FROM loginTable WHERE userName=? AND password=?";
			List<Login> loginResult = (List<Login>)jdbcTemplate.query(sql, new Object[] { login.getUserName(),login.getPassword()},new BeanPropertyRowMapper<Login>(Login.class));
			if(loginResult.isEmpty()){
				return -1;
			}
			else{
				return 1;
			}
		}

	@Override
	public ContactBean getContact(String id) {
		System.out.println("get contact db return sql before");
		String sql = "SELECT * FROM contactapi WHERE id=?";
		ContactBean contactBean = jdbcTemplate.queryForObject(sql, new Object[]{id}, new ContactRowMapper());
		System.out.println("get contact db return before");
		return contactBean;
	}

	@Override
	public List<ContactBean> searchContact(ContactBean contact) {
		String sql = "SELECT * FROM CONTACTAPI WHERE firstName=? AND email=?";
		List<ContactBean> contactList = jdbcTemplate.query(sql,new Object[]{contact.getFirstName(),contact.getEmail()} ,new ContactRowMapper());
		return contactList;
	}

}
