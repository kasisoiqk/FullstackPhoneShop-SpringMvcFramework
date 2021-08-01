package com.learnspringmvc.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.learnspringmvc.model.ProductModel;

public class ProductMapper implements RowMapper<ProductModel> {

	@Override
	public ProductModel mapRow(ResultSet rs) {
		try {
			ProductModel product = new ProductModel();
			product.setId(rs.getLong("id"));
			product.setProductName(rs.getString("product_name"));
			product.setAmount(rs.getInt("amount"));
			product.setQuantitySold(rs.getInt("quantity_sold"));
			product.setPrice(rs.getLong("price"));
			product.setSale(rs.getInt("sale"));
			product.setShortDescription(rs.getString("short_description"));
			product.setDescription(rs.getString("description"));
			product.setImage(rs.getString("image"));
			product.setBrand(rs.getString("brand"));
			product.setAddress(rs.getString("address"));
			return product;
		}
		catch (SQLException e) {
			return null;
		}
	}

}
