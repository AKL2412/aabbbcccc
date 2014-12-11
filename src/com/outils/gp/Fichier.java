package com.outils.gp;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.springframework.web.multipart.MultipartFile;

public class Fichier {

	public static boolean creerDossier(String cheminSauvegarde){
		File dir = new File(cheminSauvegarde);
        if (!dir.exists()) dir.mkdirs();
		return true;
	}
	public static String uploder(MultipartFile file,String nomFichierSurServeur,String cheminSauvegarde){
		
		if (!file.isEmpty()) {
			String nomFichier = file.getOriginalFilename();
			nomFichierSurServeur += "."+extension(nomFichier);
			try {
                byte[] bytes = file.getBytes();
                File dir = new File(cheminSauvegarde);
                if (!dir.exists()) dir.mkdirs();
                File serverFile = new File(dir.getAbsolutePath()+ File.separator + nomFichierSurServeur);
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
                return nomFichierSurServeur;
            } catch (Exception e) {
            	System.out.println(e.getMessage());
              
            }
		}
		return "ERROR";
	}
	
public static String uploderFichier(MultipartFile file,String nomFichierSurServeur,String cheminSauvegarde){
		
		if (!file.isEmpty()) {
			nomFichierSurServeur = file.getOriginalFilename();
			 
			try {
                byte[] bytes = file.getBytes();
                File dir = new File(cheminSauvegarde);
                if (!dir.exists()) dir.mkdirs();
                File serverFile = new File(dir.getAbsolutePath()+ File.separator + nomFichierSurServeur);
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
                return nomFichierSurServeur;
            } catch (Exception e) {
            	System.out.println(e.getMessage());
              
            }
		}
		return "ERROR";
	}
	

	private static String extension(String name){
		String r = "";
		for(int i = name.length() -1 ; i >= 0 ; i--){
			if(name.charAt(i) != '.'){
				r = name.charAt(i)+r;
			}else{
				return r;
			}
		}
		return r;
	}
}
