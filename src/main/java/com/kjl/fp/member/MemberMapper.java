package com.kjl.fp.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	
	//login
	public MemberVO getSelectOne(String username) throws Exception;

	//join
	public int setJoin(MemberVO memberVO) throws Exception;
	
	//idCheck
	public MemberVO getUsername(MemberVO memberVO) throws Exception;
	
	//role member set
	public int setRoleMember(MemberVO memberVO)throws Exception;
	
	//delete
	public int setDeleteUser(MemberVO memberVO)throws Exception;
	
	//updatePassword
	public int setUpdatePassword(MemberVO memberVO)throws Exception;
	
	//updateNickName
	public int setUpdateNickName(MemberVO memberVO) throws Exception;
	
	//couponCount
	public Long getCountCoupon(MemberVO memberVO)throws Exception;
	
	//Member getCoupons
	public MemberVO getCoupon(MemberVO memberVO) throws Exception;

}
