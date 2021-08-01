package com.learnspringmvc.service.impl;

import java.util.List;

import com.learnspringmvc.dao.impl.AccountDAO;
import com.learnspringmvc.model.AccountModel;
import com.learnspringmvc.service.IAccountService;

public class AccountService implements IAccountService {
	
	private AccountDAO accountDao = new AccountDAO();

	@Override
	public List<AccountModel> findAll() {
		return accountDao.findAll();
	}

	@Override
	public AccountModel save(AccountModel account) {
		Long id = accountDao.save(account);
		return accountDao.findOne(id);
	}

	@Override
	public void delete(Long id) {
		// Todo
		
	}

	@Override
	public int getTotalItem() {
		// Todo
		
		return 0;
	}

	@Override
	public AccountModel findOne(Long id) {
		return accountDao.findOne(id);
	}

	@Override
	public AccountModel findOneByEmail(String email) {
		return accountDao.findOneByEmail(email);
	}

}
