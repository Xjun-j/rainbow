package com.rainbow.service.product;

import java.util.List;

import com.rainbow.model.product.Product;
import com.rainbow.model.product.ProductModel;
import com.rainbow.model.product.SecureNo;
import com.rainbow.model.product.SecureNoFileLog;
import com.rainbow.vo.ProductVo;
import com.rainbow.vo.QueryVo;
import com.rainbow.vo.SecureNoVo;

public interface ProductService {

	List<Product> findAll(QueryVo queryVo);

	List<SecureNo> findAllSecureNo(QueryVo queryVo);

	List<Product> findAllForSelect();

	List<Product> findAllModelByProId(int productId);

	String generateSecureNo(SecureNoVo secureNoVo);

	boolean checkExist(ProductVo productVo);

	String save(ProductVo productVo);

	String delete(int id, String type);

	boolean checkModelExist(ProductVo productVo);

	String saveModel(ProductVo productVo);

	List<ProductModel> findAllModel(QueryVo queryVo);

	List<SecureNoFileLog> findSecureNoFiles(QueryVo queryVo);
	
	String importFWM(String filePath);

}
