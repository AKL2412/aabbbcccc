package com.data.excel;

import java.util.Iterator;

public class Tools {

	
	public static int iteratorLength(Iterator<?> ite){
		int i =0;
		while(ite.hasNext()){
			i++;
			ite.next();
		}
		return i;
	}
}
