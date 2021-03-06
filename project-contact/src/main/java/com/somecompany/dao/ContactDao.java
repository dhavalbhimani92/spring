package com.somecompany.dao;

import java.util.List;

import com.somecompany.pojo.ContactBean;
import com.somecompany.pojo.Login;

public interface ContactDao {
	int insertContact(ContactBean contact);

	int updateContact(ContactBean contact);

	int deleteContact(String id);

	List<ContactBean> allContact(ContactBean contact);
	
	int login(Login login);

	ContactBean getContact(String id);
	
	List<ContactBean> searchContact(ContactBean contact);
}
