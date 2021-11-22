package com.kjl.fp.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	
	//login
	public MemberVO getSelectOne(String username) throws Exception;

	//join
	public int setJoin(MemberVO memberVO) throws Exception;
	
	//idCheck
	public MemberVO getUsername(String userName) throws Exception;
	
	
	
	

}
