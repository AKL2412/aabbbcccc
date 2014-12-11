package com.gp.dao;

import com.gp.domain.Ferier;

public interface FerierDao {
	public Ferier trouverParId(Integer num);
	public void enregistrer(Ferier ferier);
	public boolean supprimer(Ferier ferier);
}
