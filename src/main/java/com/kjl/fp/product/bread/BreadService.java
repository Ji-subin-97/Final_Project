package com.kjl.fp.product.bread;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kjl.fp.cart.CartVO;
import com.kjl.fp.product.Pager;
import com.kjl.fp.product.productService;

@Service
public class BreadService implements productService{
	
	@Autowired
	private BreadMapper breadMapper;
	
	public List<BreadVO> selectAll () throws Exception {
		return breadMapper.selectAll();
	}
	
	public List<StarBreadVO> starbread () throws Exception {
		return breadMapper.starbread();
	}
	
	public int pdcarts(CartVO cartVO) throws Exception {
		return breadMapper.pdcarts(cartVO);
	}
	
	public int selectSeq(CartVO cartVO) throws Exception {
		return breadMapper.selectSeq(cartVO);
	}	

}
