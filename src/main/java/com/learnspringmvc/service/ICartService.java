package com.learnspringmvc.service;

import java.util.List;

import com.learnspringmvc.model.CartModel;

public interface ICartService {

	List<CartModel> findAll();
	CartModel save(CartModel cart);
	void delete(Long id);
	int getTotalItem();
	CartModel findOne(Long id);
	List<CartModel> findByIdCustomer(Long id);
	Long delete(Long idProduct, Long idCustomer);
}
