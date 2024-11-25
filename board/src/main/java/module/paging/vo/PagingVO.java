package module.paging.vo;

public class PagingVO {
	
	private int page = 1;
	private int pageRowCnt = 5;
	private int startRownum;
	private int endRownum;
	private int pagenationCnt = 3;
	private int startPage;
	private int endPage;
	private int totalCnt;
	private int maxPage;
	
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageRowCnt() {
		
		return pageRowCnt;
	}
	public void setPageRowCnt(int pageRowCnt) {
		this.pageRowCnt = pageRowCnt;
	}
	public int getStartRownum() {
		return startRownum;
	}
	public void setStartRownum(int startRownum) {
		this.startRownum = startRownum;
	}
	public int getEndRownum() {
		return endRownum;
	}
	public void setEndRownum(int endRownum) {
		this.endRownum = endRownum;
	}
	public int getPagenationCnt() {
		return pagenationCnt;
	}
	public void setPagenationCnt(int pagenationCnt) {
		this.pagenationCnt = pagenationCnt;
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
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	@Override
	public String toString() {
		return "PagingVO [page=" + page + ", pageRowCnt=" + pageRowCnt + ", startRownum=" + startRownum + ", endRownum="
				+ endRownum + ", pagenationCnt=" + pagenationCnt + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", totalCnt=" + totalCnt + ", maxPage=" + maxPage + "]";
	}
	

}
