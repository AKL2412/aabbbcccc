package com.outils.gp;

public class Anciennete {

	private Integer annee;
	private Integer mois;
	public Integer getMois() {
		return mois;
	}
	public void setMois(Integer mois) {
		this.mois = mois;
	}
	public Integer getJours() {
		return jours;
	}
	public void setJours(Integer jours) {
		this.jours = jours;
	}
	private Integer jours;
	public Integer getAnnee() {
		return annee;
	}
	public void setAnnee(Integer annee) {
		this.annee = annee;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.annee+" année(s) "+this.mois+" mois "+this.jours+" jour(s)";
	}
}
