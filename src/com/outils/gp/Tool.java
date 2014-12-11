package com.outils.gp;

import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.joda.time.DateTime;

import com.gp.domain.Salarie;
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
			  
			  id = (Integer) method.invoke(o);
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
				if(u.getSociete().getSocieteId().equals(s.getSocieteId())){
					//System.out.println(s.exoEncours());
					return 1;
				}else
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
		
		 String r =nom+""+new DateTime().toString("ddMMYYYYHms");
		 
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
	
	public static String mois(int num){
		String [] mois = {"Janvier","Février","Mars","Avril","Mai","Juin","Juillet","Aout","Septembre","Octobre","Novembre","Décembre"};
		try{
			String t = mois[num-1];
			//System.out.println("Le mois est : "+num+" = "+t);
			return t;
		}catch(Exception e){
			return e.getMessage();
		}
	}
	
	public static boolean recherche(String nom,String q){
		String [] qs = q.split(" ");
		for(String s:qs){
			if(!Tool.rechercheInterne(nom,s)) return false;
		}
		return true;
	}
	private static boolean rechercheInterne(String nom,String uq){
		//System.out.println("Nom : "+nom+" -- pq : "+uq+" position : "+nom.toLowerCase().indexOf(uq.toLowerCase()));
		if(nom.toLowerCase().indexOf(uq.toLowerCase()) != -1) return true;
		return false;
	}
	
	public static Anciennete anciennete(DateTime debut,DateTime fin){
		Anciennete anciennete = new Anciennete();
		int jours = 0;
		int mois = 0;
		int annee = 0;
		DateTime temp = debut;
//		int dmois = temp.getMonthOfYear();
//		int dannee = temp.getYear();
		if(temp.getMillis() <= fin.getMillis())
		while(temp.getMillis() <= fin.getMillis()){
			temp = temp.plusDays(1);
			jours++;
			/*
			if(temp.getMonthOfYear() != dmois){
				 dmois = temp.getMonthOfYear();
				mois++;
				jours = 1;
			}
			if(temp.getYear() != dannee){
				
				dannee = temp.getYear();
				dmois = temp.getMonthOfYear();
				annee++;
				mois = 0;
				jours = 1;
			}
			//*/
			//System.out.println(temp.toString("EEEE dd MMMM YYYY"));
		}
		annee = jours / 365;
		mois = (jours - (annee*365)) / 30;
		jours = (jours - (mois *30) -(annee*365) );
		anciennete.setAnnee(annee);
		anciennete.setMois(mois);
		anciennete.setJours(jours);
		return anciennete;
	}
	
	public static List<?> trie(Set<Object> sal,String type){
		 
		if(type.equals("salarie")){
			List<Salarie>list = new ArrayList<Salarie>();
			for(Object o:sal){
				Salarie s  =(Salarie) o;
				list.add(s);
			}
			Collections.sort(list);
			return list;
				
		}
	
		return null;
	}
	
	public static Calendrier calendrierFerier(DateTime debut,DateTime fin){
		Calendrier calen = new Calendrier();
		DateTime temp = debut;
		if(temp.getMillis() <= fin.getMillis()){
			Integer Iannee = temp.getYear();
			Integer Imois = temp.getMonthOfYear();
			Mois mois = new Mois();
			mois.setNumero(Imois);
			mois.setChaine(temp.toString("MMMMMM"));
			Annee annee = new Annee();
			annee.setNumero(Iannee);
			calen.addAnnee(annee);
			while(temp.getMillis() <= fin.getMillis()){
				Jour jour = new Jour();
				jour.setDay(temp.getDayOfMonth());
				jour.setNumero(temp.getDayOfWeek());
				jour.setChaine(temp.toString("EEEE"));
				if(temp.getMonthOfYear() != Imois){
					annee.addMois(mois);
					//System.out.println(annee);
					mois = new Mois();
					Imois = temp.getMonthOfYear();
					mois.setNumero(Imois);
					mois.setChaine(temp.toString("MMMMMM"));
					
				}
				if(temp.getYear() != Iannee){
					
					//System.out.println(annee);
					annee = new Annee();
					calen.addAnnee(annee);
					Iannee = temp.getYear();
					annee.setNumero(Iannee);
				}
				mois.addJour(jour);
				temp = temp.plusDays(1);
			}
			if(mois.jours.size() > 0 )
				annee.addMois(mois);
		}
		return calen;
	}
}
