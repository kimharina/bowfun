package com.care.bowfun.admin;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.care.bowfun.member.MemberDTO;

@Mapper
public interface IAdminMapper {
    ArrayList<MemberDTO> memberInfo(@Param("begin") int begin, @Param("end") int end, @Param("select") String select, @Param("search") String search);
    
    int totalCount(@Param("select") String select, @Param("search") String search);
    
    int adminDeleteProc(MemberDTO member);
}
