package com.learnspringmvc.service.impl;

import java.util.List;

import com.learnspringmvc.dao.impl.ProductDAO;
import com.learnspringmvc.model.ProductModel;
import com.learnspringmvc.service.IProductService;

public class ProductService implements IProductService {
	
	private ProductDAO productDAO = new ProductDAO(); 

	@Override
	public List<ProductModel> findAll() {
		return productDAO.findAll();
	}

	@Override
	public ProductModel save(ProductModel product) {
		Long id = productDAO.save(product);
		return productDAO.findOne(id);
	}

	@Override
	public void delete(Long id) {
		// TODO
		
	}

	@Override
	public int getTotalItem() {
		// TODO
		return 0;
	}

	@Override
	public ProductModel findOne(Long id) {
		return productDAO.findOne(id);
	}

	@Override
	public List<ProductModel> findAllProductInCartByIdCustomer(Long idCustomer) {
		return productDAO.findAllProductInCartByIdCustomer(idCustomer);
	}

}
