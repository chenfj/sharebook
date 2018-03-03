package com.sharebook.util;

import java.util.UUID;

/**
 * 生成随机字符串的工具
 * @author 陈菲菊
 *@version 1.0
 */
public class UUIDUtils {
	/**
	 * 获得随机的字符串
	 * @return
	 */
	public static String getUUID(){
		return UUID.randomUUID().toString().replace("-", "");
	}
}
