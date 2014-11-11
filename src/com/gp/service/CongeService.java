package com.gp.service;

import com.gp.domain.Conge;

public interface CongeService {
	public Conge trouverParId(Integer num);
	public void enregistrer(Conge contrat);
	public boolean supprimer(Conge contrat);
}
