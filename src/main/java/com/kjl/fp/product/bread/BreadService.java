package com.kjl.fp.product.bread;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kjl.fp.product.productService;

@Service
public class BreadService implements productService{
	
	@Autowired
	private BreadMapper breadMapper;
	
	public List<BreadVO> breadSelectAll (BreadVO breadVO) throws Exception {
		return breadMapper.breadSelectAll(breadVO);
	}
	
	public BreadVO selectOne (BreadVO breadVO) throws Exception {
		return breadMapper.selectOne(breadVO);
	}
	
	

}
