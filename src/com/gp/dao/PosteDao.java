package com.gp.dao;


import com.gp.domain.Poste;

public interface PosteDao {
	public Poste trouverParId(Integer num);
	public void enregistrer(Poste poste);
	public boolean supprimer(Poste poste);
	
}
