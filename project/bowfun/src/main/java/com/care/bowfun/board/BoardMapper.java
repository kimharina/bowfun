package com.care.bowfun.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface BoardMapper {

	List<BoardDTO> boardForm(@Param("begin") int begin, @Param("end") int end);
	
	int totalCount();

	int boardWriteProc(BoardDTO board);
	
	BoardDTO boardContent(int n);
	
	void incrementViews(int n);
	
	String boardDownload(int n);
	
	int boardModifyProc(BoardDTO board);

	int boardDeleteProc(String no);

}
