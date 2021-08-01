package com.learnspringmvc.service.impl;

import java.util.List;

import com.learnspringmvc.dao.impl.CartDAO;
import com.learnspringmvc.model.CartModel;
import com.learnspringmvc.service.ICartService;

public class CartService implements ICartService {
	
	CartDAO cartDAO = new CartDAO();

	@Override
	public List<CartModel> findAll() {
		return cartDAO.findAll();
	}

	@Override
	public CartModel save(CartModel cart) {
		Long id = cartDAO.save(cart);
		return findOne(id);
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
	public CartModel findOne(Long id) {
		return cartDAO.findOne(id);
	}

	@Override
	public List<CartModel> findByIdCustomer(Long id) {
		return cartDAO.findByIdCustomer(id);
	}

	@Override
	public Long delete(Long idCustomer, Long idProduct) {
		return cartDAO.delete(idCustomer, idProduct);
	}

}
