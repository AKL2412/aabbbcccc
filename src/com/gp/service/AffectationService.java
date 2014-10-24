package com.gp.service;

import com.gp.domain.Affectation;

public interface AffectationService {
	public Affectation trouverParId(Integer num);
	public void enregistrer(Affectation affectation);
	public boolean supprimer(Affectation affectation);
}
