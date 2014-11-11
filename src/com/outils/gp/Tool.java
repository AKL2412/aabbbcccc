package com.outils.gp;

import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.gp.domain.Societe;
import com.gp.domain.Utilisateur;

public class Tool {
 
	public static String creerSlug(String nom){
		String slug ="";
		for(String s:nom.split(" ")){
			slug += effacerLesPoint(s)+"-";
		}
		if(slug.length() > 0)
			slug = slug.substring(0, slug.length()-1);
		return slug;
	}
	public static List<?> order(List<?> liste,String fonction){
		List<Object> retour = new ArrayList<Object>();
		if(liste.size() > 0){
			Object fObj =  liste.get(0);
			int id = 0;
			while(1 <= liste.size()){
				id  =  maxId(liste,fonction);
				for(Object o:liste){
					int lId = getId(o, fonction);
					
					if(lId <= id ){
						id = lId;
						fObj = o;
						
					}
				}
				liste.remove(fObj);
				retour.add(fObj);
			}
		}
		return retour;
	}
	private static int maxId(List<?> liste,String f){
		int maxid = 0;
		for(Object o :liste){
			int lid = getId(o,f);
			if(maxid < lid)
				maxid = lid;
		}
		
		return maxid;
	}
	private static int maxId(Set<?> liste,String f){
		int maxid = 0;
		for(Object o :liste){
			int lid = getId(o,f);
			if(maxid < lid)
				maxid = lid;
		}
		
		return maxid;
	}
	private static int getId(Object o,String fonction){
		int id = 0;
		java.lang.reflect.Method method = null;
		try {
			  method = o.getClass().getMethod(fonction);
			} catch (SecurityException e) {
				System.out.println("Erreur SecurityException : "+e.getMessage());
			} catch (NoSuchMethodException e) {
				System.out.println("Erreur NoSuchMethodException : "+e.getMessage());
			}
		
		try {
			  
			  id = (int) method.invoke(o);
			} catch (IllegalArgumentException e) {
			} catch (IllegalAccessException e) {
			} catch (InvocationTargetException e) {
				
			}
		return id;
	}
	
	public static Set<?> order(Set<?> liste,String fonction){
		Set<Object> retour =  new HashSet<Object>();
		if(liste.size() > 0){
			Object fObj =  null;
			int id = 0;
			while(1 <= liste.size()){
				id  =  maxId(liste,fonction);
				for(Object o:liste){
					int lId = getId(o, fonction);
					
					if(lId <= id ){
						id = lId;
						fObj = o;
						
					}
				}
				liste.remove(fObj);
				retour.add(fObj);
			}
		}
		return retour;
	}
	public static int verificationLien(Utilisateur u,Societe s){
		if(u != null ){
			if(s != null){
				if(u.getSociete().getSocieteId().equals(s.getSocieteId()))
					return 1;
				else
					return 0;
			}
			return -2;
		}
		return -1;
	}
	
	public static Integer listFilesForFolder(final File folder) {
		 
	Integer nbre = 0;
	    for (final File fileEntry : folder.listFiles()) {
	        if (fileEntry.isDirectory()) {
	           nbre += listFilesForFolder(fileEntry);
	        } else {
	            nbre += 1;
	        }
	    }
	    return nbre;
	}
	public static Integer listFolderForFolder(final File folder) {
		 
		Integer nbre = 0;
		    for (final File fileEntry : folder.listFiles()) {
		        if (fileEntry.isDirectory()) {
		           nbre += 1;
		        } 
		    }
		    return nbre;
		}
	public static String NomDeDossierSalarie(String nom) {
		 String [] t = nom.split(" ");
		 String r ="";
		 for(String s :t) {
			 r+= effacerLesPoint(s)+"-";
		 }
		 if(r.length() > 1)
			 r = r.substring(0, r.length() - 1);
		return r;
		}
	
	public static boolean folderExist(final File folder,String folderName) {
		 
		
		    for (final File fileEntry : folder.listFiles()) {
		        if (fileEntry.isDirectory()) {
		        	if(fileEntry.getName().equals(folderName))
		        		return true;
		        } 
		    }
		    return false;
		}
	private static String effacerLesPoint(String nom){
		String str="";
		char [] t = nom.toCharArray();
		for(int i =0; i<t.length ; i++){
			if(t[i] != '.')
			str += t[i];
		}
		return str;
	}
}
