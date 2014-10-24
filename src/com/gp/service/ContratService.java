package com.gp.service;

import com.gp.domain.Contrat;

public interface ContratService {
	public Contrat trouverParId(Integer num);
	public void enregistrer(Contrat contrat);
	public boolean supprimer(Contrat contrat);
}
