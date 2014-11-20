package com.gp.service;

import com.gp.domain.Primedate;

public interface PrimedateService {
	public Primedate trouverParId(Integer num);
	public void enregistrer(Primedate prime);
	public boolean supprimer(Primedate prime);
}
