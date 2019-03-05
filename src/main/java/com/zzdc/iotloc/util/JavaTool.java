package com.zzdc.iotloc.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class JavaTool {
	
	
	//判断字符串是否为空
	public static boolean isNotNull(String str){
		if(str == null||"".equals(str)||str.length()==0){
			return false;
		}
		return true;
	}
	
	//获取当前的时间
	public static String getDateTime(String str){
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(str);
		String date = simpleDateFormat.format(new Date());
		return date;
	}

}
