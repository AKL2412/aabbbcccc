package com.outils.gp;

import java.io.File;

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
