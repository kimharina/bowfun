package com.care.bowfun.notice;
 
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
 public interface NoticeMapper {
 
	List<NoticeDTO> NoticeForm (@Param("begin")int begin, @Param("end")int end);

	int totalCount();

	void NoticeWriteProc(NoticeDTO Notice);

	NoticeDTO NoticeContent(int n);

	String NoticeDownload(int n);

	int NoticeModifyProc(NoticeDTO Notice);

	void NoticeDeleteProc(int n);

	void incrementViews(int n);



	
}