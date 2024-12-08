package spring.practice.home.member.vo;

import java.util.Date;

public class MemberVO {
	
	private String mngrId;
	private String mngrNm;
	private String lginId;
	private String pswd;
	private Date fdtmRegDt;
	private String fdtmRgstrId;
	
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
	public String getLginId() {
		return lginId;
	}
	public void setLginId(String lginId) {
		this.lginId = lginId;
	}
	public String getPswd() {
		return pswd;
	}
	public void setPswd(String pswd) {
		this.pswd = pswd;
	}
	public Date getFdtmRegDt() {
		return fdtmRegDt;
	}
	public void setFdtmRegDt(Date fdtmRegDt) {
		this.fdtmRegDt = fdtmRegDt;
	}
	public String getFdtmRgstrId() {
		return fdtmRgstrId;
	}
	public void setFdtmRgstrId(String fdtmRgstrId) {
		this.fdtmRgstrId = fdtmRgstrId;
	}
	
	@Override
	public String toString() {
		return "MemberVO [mngrId=" + mngrId + ", mngrNm=" + mngrNm + ", lginId=" + lginId + ", pswd=" + pswd
				+ ", fdtmRegDt=" + fdtmRegDt + ", fdtmRgstrId=" + fdtmRgstrId + "]";
	}
	
}
