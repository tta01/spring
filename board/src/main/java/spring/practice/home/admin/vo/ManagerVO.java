package spring.practice.home.admin.vo;

/**
 * 관리자 회원 VO
 */
public class ManagerVO {
	
	private String mngrId;
	private String mngrNm;
	private String pswd;
	private String fstmRegDt;
	
	public String getMngrId() {
		return mngrId;
	}
	public void setMngrId(String mngrId) {
		this.mngrId = mngrId;
	}
	public String getMngrNm() {
		return mngrNm;
	}
	public void setMngrNm(String mngrNm) {
		this.mngrNm = mngrNm;
	}
	public String getPswd() {
		return pswd;
	}
	public void setPswd(String pswd) {
		this.pswd = pswd;
	}
	public String getFstmRegDt() {
		return fstmRegDt;
	}
	public void setFstmRegDt(String fstmRegDt) {
		this.fstmRegDt = fstmRegDt;
	}
	
	@Override
	public String toString() {
		return "ManagerVO [mngrId=" + mngrId + ", mngrNm=" + mngrNm + ", pswd=" + pswd + ", fstmRegDt=" + fstmRegDt
				+ "]";
	}
	
	
}
