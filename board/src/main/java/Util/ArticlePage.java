package Util;

import java.util.List;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ArticlePage<T> {
	// 전체글 수
	private int total;
	// 현재 페이지 번호
	private int currentPage;
	// 전체 페이지 수
	private int totalPages;
	// 블록의 시작 페이지 번호
	private int startPage;
	// 블록의 종료 페이지 번호
	private int endPage;
	//요청URL
	private String url;
	// 데이터
	private List<T> content;
	// 한 화면에 보여질 목록의 행 수
	private int size;
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public List<T> getContent() {
		return content;
	}
	public void setContent(List<T> content) {
		this.content = content;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}

	public ArticlePage(int total, int currentPage, int size, List<T> content) {
		// size : 한 화면에 보여질 목록의 행 수
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		this.size = size;

		System.out.println("ArticlePage total"+ total);
		System.out.println("ArticlePage currentPage"+ currentPage);
		System.out.println("ArticlePage content"+ content);
		System.out.println("ArticlePage size"+ size);
		
		// 전체글 수가 0이면?
		if (total == 0) {
			totalPages = 0; // 전체 페이지 수
			startPage = 0; // 블록 시작번호
			endPage = 0; // 블록 종료번호
		} else {// 글이 있다면
			// 전체글 수 / 한 화면에 보여질 목록의 행 수 => 전체 페이지 수
			totalPages = total / size;

			// 전체글 수 % 한 화면에 보여질 목록의 행 수
			// => 0이아니면. 나머지가 있다면, 페이지 1증가
			if (total % size > 0) {
				totalPages++;
			}

			//페이지 블록  시작페이지를 구하는 공식!
			// 시작페이지 = 현재페이지 / 페이지크기 * 페이지크기 + 1
			startPage = currentPage / size * size + 1;

			// 현재페이지 % 페이지크기 => 0일 때 보정
			if (currentPage % size == 0) {
				// 페이지크기를 빼줌
				startPage -= size;
			}

			// 종료페이지번호 = 시작페이지번호 + (페이지크기-1)
			endPage = startPage + (size -1);

			// 종료페이지번호 > 전체페이지수보다 클 때
			if (endPage > totalPages) {
				endPage = totalPages;
			}
		}
	}//end 생성자
	
	public String getPagingArea() {
		String pagingArea = "";
		log.info("startPageg"+startPage);
		log.info("size"+size);
		pagingArea +="<div class='col-sm-12 col-md-7'>";					
		pagingArea +="<div class='pagination dataTables_paginate paging_simple_numbers' id='dataTable_paginate'>";
		pagingArea +="<ul class=''>";
		if(this.startPage<4) {
			pagingArea += "disabled";
		}
		
		for(int pNo=this.startPage;pNo<=this.endPage;pNo++) {
			pagingArea +="<li class='paginate_button page-item ";
				if(this.currentPage==pNo) {
					pagingArea +="is_active";
				}
			pagingArea +="'>";
			pagingArea +="<a href='"+this.url+"?currentPage="+pNo+"' ";
			pagingArea +="aria-controls='dataTable' data-dt-idx='1' tabindex='0' ";
			pagingArea +="class='page-link'>"+pNo+"</a></li>";
		}
		
		return pagingArea;
	}
	
	@Override
	public String toString() {
		return "ArticlePage [total=" + total + ", currentPage=" + currentPage + ", totalPages=" + totalPages
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", url=" + url + ", content=" + content
				+ ", size=" + size + "]";
	}

}

