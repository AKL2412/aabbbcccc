package com.outils.gp;

import java.util.ArrayList;
import java.util.List;

public class Annee {
	Integer numero;
	String chaine;
	List<Mois> mois;
	
	
	public Annee() {
		mois = new ArrayList<Mois>();
	}
	public Integer getNumero() {
		return numero;
	}
	public void setNumero(Integer numero) {
		this.numero = numero;
	}
	public String getChaine() {
		return chaine;
	}
	public void setChaine(String chaine) {
		this.chaine = chaine;
	}
	public List<Mois> getMois() {
		return mois;
	}
	public void setMois(List<Mois> mois) {
		this.mois = mois;
	}
	
	public boolean addMois(Mois mois){
		/*
		if(this.jours.size() > 0){
			
		}else
			//*/
			this.mois.add(mois);
		return true;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "\nL'année "+this.numero+"\nLes mois :------------\n "+this.mois+"\n";
	}
}
