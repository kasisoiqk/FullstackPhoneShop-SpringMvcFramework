package com.learnspringmvc.service;

import java.util.List;

import com.learnspringmvc.model.ProductModel;

public interface IProductService {

	List<ProductModel> findAll();
	ProductModel save(ProductModel product);
	void delete(Long id);
	int getTotalItem();
	ProductModel findOne(Long id);
	List<ProductModel> findAllProductInCartByIdCustomer(Long idCustomer);
}
