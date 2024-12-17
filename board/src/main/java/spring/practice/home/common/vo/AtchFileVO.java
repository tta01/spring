package spring.practice.home.common.vo;

import java.util.Date;

/**
 * 첨부파일
 */
public class AtchFileVO {
	
	private int afSeq;				// 순번(시퀀스)
	private String afId;			// 파일 ID
	private String afOriginNm;		// 파일 원본명
	private String afSaveNm;		// 파일 저장명
	private long afFileSize;		// 파일 크기
	private String afSavePath;		// 파일 저장 경로
	private String afExtsn;			// 파일 확장자
	private String fstmRgstrId;		// 등록자ID
	private String lastModfrId;		// 수정자ID
	private Date lastMdfcnDt;		// 마지막 수정일
	
	public int getAfSeq() {
		return afSeq;
	}

	public void setAfSeq(int afSeq) {
		this.afSeq = afSeq;
	}

	public String getAfId() {
		return afId;
	}

	public void setAfId(String afId) {
		this.afId = afId;
	}

	public String getAfOriginNm() {
		return afOriginNm;
	}

	public void setAfOriginNm(String afOriginNm) {
		this.afOriginNm = afOriginNm;
	}

	public String getAfSaveNm() {
		return afSaveNm;
	}

	public void setAfSaveNm(String afSaveNm) {
		this.afSaveNm = afSaveNm;
	}

	public long getAfFileSize() {
		return afFileSize;
	}

	public void setAfFileSize(long afFileSize) {
		this.afFileSize = afFileSize;
	}

	public String getAfSavePath() {
		return afSavePath;
	}

	public void setAfSavePath(String afSavePath) {
		this.afSavePath = afSavePath;
	}

	public String getAfExtsn() {
		return afExtsn;
	}

	public void setAfExtsn(String afExtsn) {
		this.afExtsn = afExtsn;
	}

	public String getFstmRgstrId() {
		return fstmRgstrId;
	}

	public void setFstmRgstrId(String fstmRgstrId) {
		this.fstmRgstrId = fstmRgstrId;
	}

	public String getLastModfrId() {
		return lastModfrId;
	}

	public void setLastModfrId(String lastModfrId) {
		this.lastModfrId = lastModfrId;
	}

	public Date getLastMdfcnDt() {
		return lastMdfcnDt;
	}

	public void setLastMdfcnDt(Date lastMdfcnDt) {
		this.lastMdfcnDt = lastMdfcnDt;
	}

	@Override
	public String toString() {
		return "AtchFileVO [afSeq=" + afSeq + ", afId=" + afId + ", afOriginNm=" + afOriginNm + ", afSaveNm=" + afSaveNm
				+ ", afFileSize=" + afFileSize + ", afSavePath=" + afSavePath + ", afExtsn=" + afExtsn
				+ ", fstmRgstrId=" + fstmRgstrId + ", lastModfrId=" + lastModfrId + ", lastMdfcnDt=" + lastMdfcnDt
				+ "]";
	}
	

}
