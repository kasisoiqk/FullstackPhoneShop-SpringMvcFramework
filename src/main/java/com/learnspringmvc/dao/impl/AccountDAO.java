package com.learnspringmvc.dao.impl;

import java.util.List;

import com.learnspringmvc.dao.IAccountDAO;
import com.learnspringmvc.mapper.AccountMapper;
import com.learnspringmvc.model.AccountModel;

public class AccountDAO extends AbstractDAO<AccountModel> implements IAccountDAO {

	@Override
	public List<AccountModel> findAll() {
		String sql = "SELECT * FROM accounts";
		return query(sql, new AccountMapper());
	}

	@Override
	public AccountModel findOne(long id) {
		String sql = "SELECT * FROM accounts WHERE id = ?";
		List<AccountModel> account = query(sql, new AccountMapper(), id);
		return account.isEmpty() ? null : account.get(0);
	}

	@Override
	public AccountModel findOneByEmail(String email) {
		String sql = "SELECT * FROM accounts WHERE email = ?";
		List<AccountModel> account = query(sql, new AccountMapper(), email);
		return account.isEmpty() ? null : account.get(0);
	}

	@Override
	public Long save(AccountModel account) {
		if(findOne(account.getId()) != null) {
			String sql = "UPDATE accounts SET email = ?, password = ?, permission = ? WHERE id = ?";
			String email = account.getEmail();
			String password = account.getPassword();
			int permission = account.getPermission();
			long id = account.getId();
			update(sql, email, password, permission, id);
			return id;
		}
		else {
			String sql = "INSERT INTO accounts(email, password, permission) VALUES(?, ?, ?)";
			String email = account.getEmail();
			String password = account.getPassword();
			int permission = account.getPermission();
			Long id = insert(sql, email, password, permission);
			return id;
		}
	}

}
