package com.learnspringmvc.service;

import java.util.List;

import com.learnspringmvc.model.CustomerModel;

public interface ICustomerService {

	CustomerModel findOneByAccountId(Long accountId);
	Long save(CustomerModel customer);
	void delete(long id);
	List<CustomerModel> findAll();
	int getTotalItem();
	CustomerModel findOne(Long id);
}
