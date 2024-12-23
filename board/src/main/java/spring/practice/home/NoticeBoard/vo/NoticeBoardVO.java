package spring.practice.home.NoticeBoard.vo;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import module.paging.vo.PagingVO;
import spring.practice.home.common.vo.AtchFileVO;

public class NoticeBoardVO extends PagingVO {

	private int rnum;
    private int boardId;
    private String memId;
    private String boardTitle;
    private Date boardWritingDt;
    private Date boardUpdtDt;
    private String ntbdAfId;
    private String boardCntnt;
    
    // 첨부파일
    public MultipartFile[] uploadFile;
    
    // 파일 리스트
    public List<AtchFileVO> atchFileVOList;
    
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
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
	public MultipartFile[] getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile[] uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	public List<AtchFileVO> getAtchFileVOList() {
		return atchFileVOList;
	}
	public void setAtchFileVOList(List<AtchFileVO> atchFileVOList) {
		this.atchFileVOList = atchFileVOList;
	}
	
	@Override
	public String toString() {
		return "NoticeBoardVO [rnum=" + rnum + ", boardId=" + boardId + ", memId=" + memId + ", boardTitle="
				+ boardTitle + ", boardWritingDt=" + boardWritingDt + ", boardUpdtDt=" + boardUpdtDt + ", ntbdAfId="
				+ ntbdAfId + ", boardCntnt=" + boardCntnt + ", uploadFile=" + Arrays.toString(uploadFile)
				+ ", atchFileVOList=" + atchFileVOList + "]";
	}
	
}
