package com.sqlrecord.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sqlrecord.dto.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getProductCount() {
		return sqlSession.selectOne("product.getProductCount");
	}

	@Override
	public List<Product> getProducts() {
		return sqlSession.selectList("product.getProducts");
	}

	@Override
	public Product getProduct(int pno) {
		return sqlSession.selectOne("product.getProduct" , pno);
	}

	@Override
	public void delProduct(int pno) {
		sqlSession.delete("product.delProduct",pno);
	}
	
}
