package com.smee.e.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.smee.e.DAO.mapMapper;
import com.smee.e.VO.bjdJuso;
import com.smee.e.VO.bjdName;
import com.smee.e.VO.doroCode;
import com.smee.e.VO.kaptCode;
@Repository
public class mapDao {
	@Autowired
	private SqlSession sqlsession;
	
	public ArrayList<String> getDoroCD(bjdName name){
		ArrayList<String> result = new ArrayList<>();
		System.out.println("dao"+name);
		mapMapper mapper = sqlsession.getMapper(mapMapper.class);
		result = mapper.getDoroCD(name);
		System.out.println("dao"+result);
		return result;
		
	}
	public void kaptcode(kaptCode kaptcode){
		mapMapper mapper = sqlsession.getMapper(mapMapper.class);
		mapper.kaptcode(kaptcode);
	}
	
	public ArrayList<String> emdList(){
		ArrayList<String> result = new ArrayList<>();
		mapMapper mapper = sqlsession.getMapper(mapMapper.class);
		result = mapper.emdList();
		return result;
	}
	
	public ArrayList<kaptCode> loadKaptCode(String emd){
		ArrayList<kaptCode> result = new ArrayList<>();
		mapMapper mapper = sqlsession.getMapper(mapMapper.class);
		result = mapper.loadKaptCode(emd);
		return result;
	}
}
