package com.learnspringmvc.dao;

import java.util.List;

import com.learnspringmvc.model.CartModel;
import com.learnspringmvc.model.ProductModel;

public interface ICartDAO extends GenericDAO<CartModel> {

	List<CartModel> findAll();
	Long save(CartModel cart);
	CartModel findOne(Long id);
	List<CartModel> findByIdCustomer(Long idCustomer);
	Long delete(Long idCustomer, Long idProduct);
	void delete(Long id);
}
