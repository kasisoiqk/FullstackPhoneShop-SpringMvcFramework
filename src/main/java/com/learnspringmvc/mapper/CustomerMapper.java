package com.learnspringmvc.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.learnspringmvc.model.CustomerModel;

public class CustomerMapper implements RowMapper<CustomerModel> {

	@Override
	public CustomerModel mapRow(ResultSet rs) {
		try {
			CustomerModel customer = new CustomerModel();
			customer.setId(rs.getInt("id"));
			customer.setIdAccount(rs.getInt("id_account"));
			customer.setFullName(rs.getString("full_name"));
			customer.setAddress(rs.getString("address"));
			customer.setAvatar(rs.getString("avatar"));
			return customer;
		}
		catch (SQLException e) {
			return null;
		}
	}

}
