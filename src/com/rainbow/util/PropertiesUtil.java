package com.rainbow.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesUtil {
	public static Properties getProperty(String filepath){
		Properties prop = new Properties();// 属性集合对象   
		InputStream fis;
		try {
			fis = PropertiesUtil.class.getClassLoader().getResourceAsStream(filepath);
			prop.load(fis);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();
		}
		return prop;
	}
}
