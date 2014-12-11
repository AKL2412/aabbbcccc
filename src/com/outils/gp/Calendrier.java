package com.outils.gp;

import java.util.ArrayList;
import java.util.List;

public class Calendrier {
	List<Annee> annees;

	public Calendrier() {
		annees = new ArrayList<Annee>();
	}

	public List<Annee> getAnnees() {
		return annees;
	}

	public void setAnnees(List<Annee> annees) {
		this.annees = annees;
	}
	public boolean addAnnee(Annee an){
		this.annees.add(an);
		return true;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "\nLe calendrier:------------\n "+this.annees+"\n";
	}
}
