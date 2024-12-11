package spring.practice.home.admin.vo;
/**
 * 관리자 메뉴 VO
 * @author 
 */
public class MngrMenuVO {
	
	private String menuCd;
    private String prntMenuCd;
    private String prntMenuNm;
    private String menuNm;
    private String ord;
    private String delYn;
    private String fstmRgstrId;
    private String fstmRegDt;
    private String lastModfrId;
    private String lastMdfcnDt;
    private String url;
    
	public String getMenuCd() {
		return menuCd;
	}
	public void setMenuCd(String menuCd) {
		this.menuCd = menuCd;
	}
	public String getPrntMenuCd() {
		return prntMenuCd;
	}
	public void setPrntMenuCd(String prntMenuCd) {
		this.prntMenuCd = prntMenuCd;
	}
	public String getPrntMenuNm() {
		return prntMenuNm;
	}
	public void setPrntMenuNm(String prntMenuNm) {
		this.prntMenuNm = prntMenuNm;
	}
	public String getMenuNm() {
		return menuNm;
	}
	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm;
	}
	public String getOrd() {
		return ord;
	}
	public void setOrd(String ord) {
		this.ord = ord;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getFstmRgstrId() {
		return fstmRgstrId;
	}
	public void setFstmRgstrId(String fstmRgstrId) {
		this.fstmRgstrId = fstmRgstrId;
	}
	public String getFstmRegDt() {
		return fstmRegDt;
	}
	public void setFstmRegDt(String fstmRegDt) {
		this.fstmRegDt = fstmRegDt;
	}
	public String getLastModfrId() {
		return lastModfrId;
	}
	public void setLastModfrId(String lastModfrId) {
		this.lastModfrId = lastModfrId;
	}
	public String getLastMdfcnDt() {
		return lastMdfcnDt;
	}
	public void setLastMdfcnDt(String lastMdfcnDt) {
		this.lastMdfcnDt = lastMdfcnDt;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	@Override
	public String toString() {
		return "MngrMenuVO [menuCd=" + menuCd + ", prntMenuCd=" + prntMenuCd + ", prntMenuNm=" + prntMenuNm
				+ ", menuNm=" + menuNm + ", ord=" + ord + ", delYn=" + delYn + ", fstmRgstrId=" + fstmRgstrId
				+ ", fstmRegDt=" + fstmRegDt + ", lastModfrId=" + lastModfrId + ", lastMdfcnDt=" + lastMdfcnDt
				+ ", url=" + url + "]";
	}
    
	
}
