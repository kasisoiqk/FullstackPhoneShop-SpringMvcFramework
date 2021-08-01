package com.learnspringmvc.dao.impl;

import java.util.List;

import com.learnspringmvc.dao.IProductDAO;
import com.learnspringmvc.mapper.ProductMapper;
import com.learnspringmvc.model.ProductModel;

public class ProductDAO extends AbstractDAO<ProductModel> implements IProductDAO {

	@Override
	public List<ProductModel> findAll() {
		String sql = "SELECT * FROM products";
		return query(sql, new ProductMapper());
	}

	@Override
	public ProductModel findOne(Long id) {
		String sql = "SELECT * FROM products WHERE id = ?";
		List<ProductModel> product = query(sql, new ProductMapper(), id);
		return product.isEmpty() ? null : product.get(0);
	}

	@Override
	public Long save(ProductModel product) {
		if(findOne(product.getId()) != null) {
			String sql = "UPDATE products SET product_name = ?, amount = ?, quantity_sold = ?, price = ?,"
					+ " sale = ?, short_description = ?, description = ?, image = ?, brand = ?, address = ?"
					+ " WHERE id = ?";
			String productName = product.getProductName();
			int amount = product.getAmount();
			int quantitySold = product.getQuantitySold();
			Long price = product.getPrice();
			int sale = product.getSale();
			String shortDescription = product.getShortDescription();
			String description = product.getDescription();
			String image = product.getImage();
			Long id = product.getId();
			String brand = product.getBrand();
			String address = product.getAddress();
			update(sql, productName, amount, quantitySold, price, sale, shortDescription, description, 
					image, brand, address, id);
			return id;
		}
		else {
			String sql = "INSERT INTO products(product_name, amount, quantity_sold, price, sale, short_description, "
					+ "description, image) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
			String productName = product.getProductName();
			int amount = product.getAmount();
			int quantitySold = product.getQuantitySold();
			Long price = product.getPrice();
			int sale = product.getSale();
			String shortDescription = product.getShortDescription();
			String description = product.getDescription();
			String image = product.getImage();
			String brand = product.getBrand();
			String address = product.getAddress();
			Long id = insert(sql, productName, amount, quantitySold, price, sale, shortDescription, 
					description, image, brand, address);
			return id;
		}
	}

	@Override
	public List<ProductModel> findAllProductInCartByIdCustomer(Long idCustomer) {
		String sql = "SELECT p.id, p.product_name, p.amount, p.quantity_sold, p.price, p.sale, "
				+ "p.short_description, p.description, p.image, p.brand, p.address FROM carts c "
				+ "INNER JOIN products p ON c.id_product = p.id WHERE c.id_customer = ?";
		return query(sql, new ProductMapper(), idCustomer);
	}

	@Override
	public List<Integer> findQuantityProductInCartIdCustomer(Long idCustomer) {
		// TODO Auto-generated method stub
		return null;
	}

}
