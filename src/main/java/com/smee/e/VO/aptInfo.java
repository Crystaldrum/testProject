package com.smee.e.VO;

public class aptInfo {
	private String kaptAddr; // 법정동 주소
	private String doroJuso; // 도로명 주소
	private String codeHallNm; // 계단식 or 복도식
	private String kaptName; // 아파트명
	private String kaptMparea_135; // 41평형 세대수
	private String kaptMparea_60; // 18평형 세대수
	private String kaptMparea_85; // 25평형 세대수
	private String kaptUsedate; // 사용일자
	
	public aptInfo() {
		// TODO Auto-generated constructor stub
	}

	public aptInfo(String kaptAddr, String doroJuso, String codeHallNm, String kaptName, String kaptMparea_135,
			String kaptMparea_60, String kaptMparea_85, String kaptUsedate) {
		super();
		this.kaptAddr = kaptAddr;
		this.doroJuso = doroJuso;
		this.codeHallNm = codeHallNm;
		this.kaptName = kaptName;
		this.kaptMparea_135 = kaptMparea_135;
		this.kaptMparea_60 = kaptMparea_60;
		this.kaptMparea_85 = kaptMparea_85;
		this.kaptUsedate = kaptUsedate;
	}

	public String getKaptAddr() {
		return kaptAddr;
	}

	public void setKaptAddr(String kaptAddr) {
		this.kaptAddr = kaptAddr;
	}

	public String getDoroJuso() {
		return doroJuso;
	}

	public void setDoroJuso(String doroJuso) {
		this.doroJuso = doroJuso;
	}

	public String getCodeHallNm() {
		return codeHallNm;
	}

	public void setCodeHallNm(String codeHallNm) {
		this.codeHallNm = codeHallNm;
	}

	public String getKaptName() {
		return kaptName;
	}

	public void setKaptName(String kaptName) {
		this.kaptName = kaptName;
	}

	public String getKaptMparea_135() {
		return kaptMparea_135;
	}

	public void setKaptMparea_135(String kaptMparea_135) {
		this.kaptMparea_135 = kaptMparea_135;
	}

	public String getKaptMparea_60() {
		return kaptMparea_60;
	}

	public void setKaptMparea_60(String kaptMparea_60) {
		this.kaptMparea_60 = kaptMparea_60;
	}

	public String getKaptMparea_85() {
		return kaptMparea_85;
	}

	public void setKaptMparea_85(String kaptMparea_85) {
		this.kaptMparea_85 = kaptMparea_85;
	}

	public String getKaptUsedate() {
		return kaptUsedate;
	}

	public void setKaptUsedate(String kaptUsedate) {
		this.kaptUsedate = kaptUsedate;
	}

	@Override
	public String toString() {
		return "aptInfo [kaptAddr=" + kaptAddr + ", doroJuso=" + doroJuso + ", codeHallNm=" + codeHallNm + ", kaptName="
				+ kaptName + ", kaptMparea_135=" + kaptMparea_135 + ", kaptMparea_60=" + kaptMparea_60
				+ ", kaptMparea_85=" + kaptMparea_85 + ", kaptUsedate=" + kaptUsedate + "]";
	}
	
	

}
