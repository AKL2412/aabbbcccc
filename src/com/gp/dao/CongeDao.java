package com.gp.dao;

import com.gp.domain.Conge;

public interface CongeDao {

	public Conge trouverParId(Integer num);
	public void enregistrer(Conge contrat);
	public boolean supprimer(Conge contrat);
}
