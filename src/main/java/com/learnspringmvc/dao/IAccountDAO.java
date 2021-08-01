package com.learnspringmvc.dao;

import java.util.List;

import com.learnspringmvc.model.AccountModel;

public interface IAccountDAO extends GenericDAO<AccountModel> {

	List<AccountModel> findAll();
	AccountModel findOne(long id);
	AccountModel findOneByEmail(String email);
	Long save(AccountModel account);
}
