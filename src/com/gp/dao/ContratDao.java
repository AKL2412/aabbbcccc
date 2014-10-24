package com.gp.dao;

import com.gp.domain.Contrat;

public interface ContratDao {
	public Contrat trouverParId(Integer num);
	public void enregistrer(Contrat contrat);
	public boolean supprimer(Contrat contrat);
}
