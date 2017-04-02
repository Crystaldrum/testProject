package com.smee.e.DAO;

import java.util.ArrayList;

import com.smee.e.VO.bjdJuso;
import com.smee.e.VO.bjdName;
import com.smee.e.VO.doroCode;
import com.smee.e.VO.kaptCode;

public interface mapMapper {

	public ArrayList<String> getDoroCD(bjdName name);
	public void kaptcode(kaptCode kaptcode);
	public ArrayList<String> emdList();
	public ArrayList<kaptCode> loadKaptCode(String emd);
}
