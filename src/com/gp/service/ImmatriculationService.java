package com.gp.service;

import com.gp.domain.Immatriculation;

public interface ImmatriculationService {
	public Immatriculation trouverParId(Integer id);
	public void enregistrer(Immatriculation immatriculation);
	public boolean supprimer(Immatriculation immatriculation);
}
