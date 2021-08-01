package com.learnspringmvc.dao;

import java.util.List;

import com.learnspringmvc.model.CustomerModel;

public interface ICustomerDAO extends GenericDAO<CustomerModel> {

	List<CustomerModel> findAll();
	CustomerModel findOne(long id);
	CustomerModel findOneByAcccountId(long id);
	Long save(CustomerModel customer);
}
