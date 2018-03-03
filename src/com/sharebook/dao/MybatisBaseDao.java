package com.sharebook.dao;

import java.io.IOException;
import java.io.Reader;




import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisBaseDao {
	private MybatisBaseDao(){}
	private static String resource = "mybatis-config.xml";
	private static SqlSession session = null;
	private static SqlSessionFactoryBuilder ssfb= new SqlSessionFactoryBuilder();
	private static Reader reader = null;
	private static SqlSessionFactory ssf = null;
	
	static{
		//获取读取对象
		try {
			reader=Resources.getResourceAsReader(resource);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//得到session工厂
		ssf=ssfb.build(reader);
	}
	public static SqlSession getSqlSession(){
		session = ssf.openSession();
		return session;
	}
}































































