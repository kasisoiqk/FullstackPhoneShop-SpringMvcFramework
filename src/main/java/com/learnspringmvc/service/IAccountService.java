package com.learnspringmvc.service;

import java.util.List;

import com.learnspringmvc.model.AccountModel;

public interface IAccountService {

	List<AccountModel> findAll();
	AccountModel save(AccountModel account);
	void delete(Long id);
	int getTotalItem();
	AccountModel findOne(Long id);
	AccountModel findOneByEmail(String email);
}
