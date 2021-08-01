package com.learnspringmvc.dao.impl;

import java.util.List;

import com.learnspringmvc.dao.ICustomerDAO;
import com.learnspringmvc.mapper.CustomerMapper;
import com.learnspringmvc.model.CustomerModel;

public class CustomerDAO extends AbstractDAO<CustomerModel> implements ICustomerDAO {

	@Override
	public List<CustomerModel> findAll() {
		String sql = "SELECT * FROM customers";
		return query(sql, new CustomerMapper());
	}

	@Override
	public CustomerModel findOne(long id) {
		String sql = "SELECT * FROM customers WHERE id = ?";
		List<CustomerModel> customer = query(sql, new CustomerMapper(), id);
		return customer.isEmpty() ? null : customer.get(0);
	}

	@Override
	public Long save(CustomerModel customer) {
		if(findOne(customer.getId()) != null) {
			String sql = "UPDATE customers SET id_account = ?, full_name = ?, address = ?, gender = ?, avatar = ? "
					+ "WHERE id = ?";
			long accountId = customer.getIdAccount();
			String fullName = customer.getFullName();
			String address = customer.getAddress();
			long gender = customer.getGender();
			String avatar = customer.getAvatar();
			long id = customer.getId();
			update(sql, accountId, fullName, address, gender, avatar, id);
			return id;
		}
		else {
			String sql = "INSERT INTO customers(id_account, full_name, address, gender, avatar) VALUES(?, ?, ?, ?, ?)";
			long accountId = customer.getIdAccount();
			String fullName = customer.getFullName();
			String address = customer.getAddress();
			long gender = customer.getGender();
			String avatar = customer.getAvatar();
			Long id = insert(sql, accountId, fullName, address, gender, avatar);
			return id;
		}
	}

	@Override
	public CustomerModel findOneByAcccountId(long id) {
		String sql = "SELECT * FROM customers WHERE id_account = ?";
		List<CustomerModel> customer = query(sql, new CustomerMapper(), id);
		return customer.isEmpty() ? null : customer.get(0);
	}

}
