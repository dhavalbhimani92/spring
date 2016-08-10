package com.somecompany.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somecompany.dao.ContactDao;
import com.somecompany.pojo.ContactBean;
import com.somecompany.pojo.Login;
import com.somecompany.service.ContactService;

@Service
public class ContactServiceImpl implements ContactService {
	
	@Autowired
	private ContactDao contactDao;

	@Override
	public int insertContact(ContactBean contact) {
		// TODO Auto-generated method stub
		return contactDao.insertContact(contact);
	}

	@Override
	public int updateContact(ContactBean contact) {
		// TODO Auto-generated method stub
		return contactDao.updateContact(contact);
	}

	@Override
	public int deleteContact(String id) {
		// TODO Auto-generated method stub
		return contactDao.deleteContact(id);
	}

	@Override
	public List<ContactBean> allContact(ContactBean contact) {
		// TODO Auto-generated method stub
		return contactDao.allContact(contact);
	}
	
	@Override
	public int login(Login login) {
		// TODO Auto-generated method stub
		return contactDao.login(login);
	}

	@Override
	public ContactBean getContact(String id) {
		// TODO Auto-generated method stub
		return contactDao.getContact(id);
	}

	@Override
	public List<ContactBean> searchContact(ContactBean contact) {
		// TODO Auto-generated method stub
		return contactDao.searchContact(contact);
	}
}
