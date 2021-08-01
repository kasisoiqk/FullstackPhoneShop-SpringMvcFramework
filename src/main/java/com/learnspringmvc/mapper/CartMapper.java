package com.learnspringmvc.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.learnspringmvc.model.CartModel;

public class CartMapper implements RowMapper<CartModel> {

	@Override
	public CartModel mapRow(ResultSet rs) {
		try {
			CartModel cart = new CartModel();
			cart.setId(rs.getLong("id"));
			cart.setIdCustomer(rs.getLong("id_customer"));
			cart.setIdProduct(rs.getLong("id_product"));
			cart.setQuantity(rs.getInt("quantity"));
			return cart;
		}
		catch (SQLException e) {
			return null;
		}
	}

}
