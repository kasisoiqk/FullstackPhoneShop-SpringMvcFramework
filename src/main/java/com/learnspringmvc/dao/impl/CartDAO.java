package com.learnspringmvc.dao.impl;

import java.util.List;

import com.learnspringmvc.dao.ICartDAO;
import com.learnspringmvc.mapper.CartMapper;
import com.learnspringmvc.model.CartModel;

public class CartDAO extends AbstractDAO<CartModel> implements ICartDAO {

	@Override
	public List<CartModel> findAll() {
		String sql = "SELECT * FROM carts";
		return query(sql, new CartMapper());
	}

	@Override
	public Long save(CartModel cart) {
		if(findOne(cart.getId()) != null) {
			String sql = "UPDATE carts SET id_customer = ?, id_product = ?, quantity = ? WHERE id = ?";
			Long idCustomer = cart.getIdCustomer();
			Long idProduct = cart.getIdProduct();
			int quantity = cart.getQuantity();
			Long id = cart.getId();
			update(sql, idCustomer, idProduct, quantity, id);
			return id;
		}
		else {
			String sql = "INSERT INTO carts(id_customer, id_product, quantity) VALUES(?, ?, ?)";
			Long idCustomer = cart.getIdCustomer();
			Long idProduct = cart.getIdProduct();
			int quantity = cart.getQuantity();
			Long id = insert(sql, idCustomer, idProduct, quantity);
			return id;
		}
	}

	@Override
	public CartModel findOne(Long id) {
		String sql = "SELECT * FROM carts WHERE id = ?";
		List<CartModel> carts = query(sql, new CartMapper(), id);
		return carts.isEmpty() ? null : carts.get(0);
	}

	@Override
	public List<CartModel> findByIdCustomer(Long idCustomer) {
		String sql = "SELECT * FROM carts WHERE id_customer = ?";
		return query(sql, new CartMapper(), idCustomer);
	}

	@Override
	public Long delete(Long idCustomer, Long idProduct) {
		String sql = "SELECT * FROM carts WHERE id_customer = ? AND id_product = ?";
		List<CartModel> carts = query(sql, new CartMapper(), idCustomer, idProduct);
		Long id =  carts.isEmpty() ? -1 : carts.get(0).getId();
		
		if(id != -1) {
			delete(id);
		}
		return id;
	}

	@Override
	public void delete(Long id) {
		String sql = "DELETE FROM carts WHERE id = ?";
		update(sql, id);
	}

}
