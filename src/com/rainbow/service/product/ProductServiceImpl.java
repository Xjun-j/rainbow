package com.rainbow.service.product;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rainbow.dao.product.ProductDao;
import com.rainbow.model.product.Product;
import com.rainbow.model.product.ProductModel;
import com.rainbow.model.product.SecureNo;
import com.rainbow.model.product.SecureNoFileLog;
import com.rainbow.vo.ProductVo;
import com.rainbow.vo.QueryVo;
import com.rainbow.vo.SecureNoVo;

@Service("productService")
@Transactional
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDao productDao;

	@Override
	public List<Product> findAll(QueryVo queryVo) {
		return productDao.findAll(queryVo);
	}

	@Override
	public List<SecureNo> findAllSecureNo(QueryVo queryVo) {
		
		return productDao.findAllSecureNo(queryVo);
	}

	@Override
	public List<Product> findAllForSelect() {
		return productDao.findAllForSelect();
	}

	@Override
	public List<Product> findAllModelByProId(int productId) {
		
		return productDao.findAllModelByProId(productId);
	}

	@Override
	public String generateSecureNo(SecureNoVo secureNoVo) {
		return productDao.generateSecureNo(secureNoVo);
	}

	@Override
	public boolean checkExist(ProductVo productVo) {
		return productDao.checkExist(productVo);
	}

	@Override
	public String save(ProductVo productVo) {
		return productDao.save(productVo);
	}

	@Override
	public String delete(int id, String type) {
		return productDao.delete(id,type);
	}

	@Override
	public boolean checkModelExist(ProductVo productVo) {
		return productDao.checkModelExist( productVo);
	}

	@Override
	public String saveModel(ProductVo productVo) {
		return productDao.saveModel( productVo);
	}

	@Override
	public List<ProductModel> findAllModel(QueryVo queryVo) {
		return productDao.findAllModel( queryVo);
	}

	@Override
	public List<SecureNoFileLog> findSecureNoFiles(QueryVo queryVo) {
		return productDao.findSecureNoFiles(queryVo);
	}
	
	@Override
	public String importFWM(String filePath) {
		return productDao.importFWM(filePath);
	}

	
}
