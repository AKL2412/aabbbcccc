package com.outils.gp;

import java.util.ArrayList;
import java.util.List;

public class Mois {

	Integer numero;
	String chaine;
	List<Jour> jours;
	
	public List<Jour> getJours() {
		return jours;
	}
	public void setJours(List<Jour> jours) {
		this.jours = jours;
	}
	public Mois() {
		jours = new ArrayList<Jour>();
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
	
	public boolean addJour(Jour jour){
		/*
		if(this.jours.size() > 0){
			
		}else
			//*/
			this.jours.add(jour);
		return true;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "\nLe mois "+this.chaine+" : "+this.jours.size()+" jour(s)\n";
	}
	
}
