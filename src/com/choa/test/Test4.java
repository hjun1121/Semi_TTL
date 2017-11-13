package com.choa.test;

import java.util.Random;

public class Test4 {

	public static void main(String[] args) {
		 Random r = new Random();
		 String p = "a1b2c3d4e5f6g7h8i9j";
		 String str = String.valueOf(p.charAt(r.nextInt(19)));
		 str = str + String.valueOf(p.charAt(r.nextInt(19)));
		 str = str + String.valueOf(p.charAt(r.nextInt(19)));
		 str = str + String.valueOf(p.charAt(r.nextInt(19)));
		 str = str + String.valueOf(p.charAt(r.nextInt(19)));
		 str = str + String.valueOf(p.charAt(r.nextInt(19)));
		 str = str + String.valueOf(p.charAt(r.nextInt(19)));
		 str = str + String.valueOf(p.charAt(r.nextInt(19)));
		   
		 String mes = "임시비밀번호 :"+str +"\n로그인 후 꼭 pw 를 바꿔주세요";
		 System.out.println(mes);
	}

}
