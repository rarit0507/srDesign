package com.sqlrecord.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sqlrecord.dao.ProductDAO;
import com.sqlrecord.dto.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public int getProductCount() {
		return productDAO.getProductCount();
	}

	@Override
	public List<Product> getProducts() {
		return productDAO.getProducts();
	}

	@Override
	public Product getProduct(int pno) {
		return productDAO.getProduct(pno);
	}

	@Override
	public void delProduct(int pno) {
		productDAO.delProduct(pno);
	}
	
}
