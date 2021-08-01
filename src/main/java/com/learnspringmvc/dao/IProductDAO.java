package com.learnspringmvc.dao;

import java.util.List;

import com.learnspringmvc.model.ProductModel;

public interface IProductDAO extends GenericDAO<ProductModel> {

	List<ProductModel> findAll();
	ProductModel findOne(Long id);
	Long save(ProductModel product);
	List<ProductModel> findAllProductInCartByIdCustomer(Long idCustomer);
	List<Integer> findQuantityProductInCartIdCustomer(Long idCustomer);
}
