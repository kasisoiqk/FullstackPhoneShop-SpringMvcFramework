package com.learnspringmvc.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.learnspringmvc.model.AccountModel;

public class AccountMapper implements RowMapper<AccountModel> {

	@Override
	public AccountModel mapRow(ResultSet rs) {
		try {
			AccountModel account = new AccountModel();
			account.setId(rs.getLong("id"));
			account.setEmail(rs.getString("email"));
			account.setPassword(rs.getString("password"));
			account.setPermission(rs.getInt("permission"));
			return account;
		}
		catch (SQLException e) {
			return null;
		}
	}

	
}
