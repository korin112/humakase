package com.human.outback;

public class CovidDTO {
	private String creatdt;
	private String deathcnt;
	private String gubun;
	private String incdec;
	private String defcnt; 
	private String localocccnt;
	public CovidDTO() {
	}
	public CovidDTO(String creatdt, String deathcnt, String gubun, String incdec, String defcnt, String localocccnt) {
		this.creatdt = creatdt;
		this.deathcnt = deathcnt;
		this.gubun = gubun;
		this.incdec = incdec;
		this.defcnt = defcnt;
		this.localocccnt = localocccnt;
	}
	public String getCreatdt() {
		return creatdt;
	}
	public void setCreatdt(String creatdt) {
		this.creatdt = creatdt;
	}
	public String getDeathcnt() {
		return deathcnt;
	}
	public void setDeathcnt(String deathcnt) {
		this.deathcnt = deathcnt;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getIncdec() {
		return incdec;
	}
	public void setIncdec(String incdec) {
		this.incdec = incdec;
	}
	public String getDefcnt() {
		return defcnt;
	}
	public void setDefcnt(String defcnt) {
		this.defcnt = defcnt;
	}
	public String getLocalocccnt() {
		return localocccnt;
	}
	public void setLocalocccnt(String localocccnt) {
		this.localocccnt = localocccnt;
	}
	
}
