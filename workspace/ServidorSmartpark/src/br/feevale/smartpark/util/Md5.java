package br.feevale.smartpark.util;

import java.math.BigInteger;
import java.security.MessageDigest;

public class Md5 {
	
	public static String converter( String senha ){
		MessageDigest md = null;
		
		try{
			md = MessageDigest.getInstance("MD5");
		} catch(Exception e ){
			e.printStackTrace();
		}
		BigInteger hash = new BigInteger(1, md.digest(senha.getBytes()));
		return hash.toString(16);
	}
	
}