package com.gp.dao;

import com.gp.domain.Primedate;

public interface PrimedateDao {
	public Primedate trouverParId(Integer num);
	public void enregistrer(Primedate prime);
	public boolean supprimer(Primedate prime);
}
