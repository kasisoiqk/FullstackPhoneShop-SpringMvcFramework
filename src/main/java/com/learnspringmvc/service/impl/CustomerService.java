package com.learnspringmvc.service.impl;

import java.util.List;

import com.learnspringmvc.dao.impl.CustomerDAO;
import com.learnspringmvc.model.CustomerModel;
import com.learnspringmvc.service.ICustomerService;

public class CustomerService implements ICustomerService {
	
	private CustomerDAO customerDAO = new CustomerDAO();

	@Override
	public CustomerModel findOneByAccountId(Long accountId) {
		return customerDAO.findOneByAcccountId(accountId);
	}

	@Override
	public Long save(CustomerModel customer) {
		Long id = customerDAO.save(customer);
		return id;
	}

	@Override
	public void delete(long id) {
		// TODO 
		
	}

	@Override
	public List<CustomerModel> findAll() {
		return customerDAO.findAll();
	}

	@Override
	public int getTotalItem() {
		// TODO
		return 0;
	}

	@Override
	public CustomerModel findOne(Long id) {
		return customerDAO.findOne(id);
	}

}
