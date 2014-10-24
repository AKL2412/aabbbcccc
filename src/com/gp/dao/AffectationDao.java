package com.gp.dao;

import com.gp.domain.Affectation;

public interface AffectationDao {
	public Affectation trouverParId(Integer num);
	public void enregistrer(Affectation affectation);
	public boolean supprimer(Affectation affectation);
}
