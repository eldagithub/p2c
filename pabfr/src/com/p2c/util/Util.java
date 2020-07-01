package com.p2c.util;

public class Util {

	public String formatString(String s, int maxLen) { 
		  if (s.length() < maxLen) { 
		    return s; 
		  } else { 
		    return s.substring(0, maxLen - 3) + "..."; 
		  } 
		} 
	 
}
