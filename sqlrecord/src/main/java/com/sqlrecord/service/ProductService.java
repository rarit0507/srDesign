package com.sqlrecord.service;

import java.util.List;

import com.sqlrecord.dto.Product;

public interface ProductService {
	public int getProductCount();
	public List<Product> getProducts();
	public Product getProduct(int pno);
	public void delProduct(int pno);
}
