package com.care.bowfun.member;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface IMemberMapper {

	int registProc(MemberDTO member);
	
	List<MemberDTO> findEmail(String email);

	MemberDTO login(String id);

	ArrayList<MemberDTO> memberInfo(@Param("begin") int begin, @Param("end") int end, @Param("select") String select, @Param("search") String search);

	int totalCount(@Param("select") String select, @Param("search") String search);

	int updateProc(MemberDTO member);

	int deleteProc(String id);

	MemberDTO getMemberByEmail(String email);

	MemberDTO getMemberByUserName(String userName);
}
