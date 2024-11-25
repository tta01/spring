package spring.practice.home.NoticeBoard.vo;

import java.util.Date;

import module.paging.vo.PagingVO;

public class NoticeBoardVO extends PagingVO {

	private int rnum;
    private String boardId;
    private String memId;
    private String boardTitle;
    private Date boardWritingDt;
    private Date boardUpdtDt;
    private String ntbdAfId;
    private String boardCntnt;
    
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public Date getBoardWritingDt() {
		return boardWritingDt;
	}
	public void setBoardWritingDt(Date boardWritingDt) {
		this.boardWritingDt = boardWritingDt;
	}
	public Date getBoardUpdtDt() {
		return boardUpdtDt;
	}
	public void setBoardUpdtDt(Date boardUpdtDt) {
		this.boardUpdtDt = boardUpdtDt;
	}
	public String getNtbdAfId() {
		return ntbdAfId;
	}
	public void setNtbdAfId(String ntbdAfId) {
		this.ntbdAfId = ntbdAfId;
	}
	public String getBoardCntnt() {
		return boardCntnt;
	}
	public void setBoardCntnt(String boardCntnt) {
		this.boardCntnt = boardCntnt;
	}
	@Override
	public String toString() {
		return "NoticeBoardVO [rnum=" + rnum + ", boardId=" + boardId + ", memId=" + memId + ", boardTitle="
				+ boardTitle + ", boardWritingDt=" + boardWritingDt + ", boardUpdtDt=" + boardUpdtDt + ", ntbdAfId="
				+ ntbdAfId + ", boardCntnt=" + boardCntnt + "]";
	}
	
}
