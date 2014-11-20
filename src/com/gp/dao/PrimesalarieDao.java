package com.gp.dao;

import com.gp.domain.Primesalarie;

public interface PrimesalarieDao {
	public Primesalarie trouverParId(Integer num);
	public void enregistrer(Primesalarie primesalarie);
	public boolean supprimer(Primesalarie primesalarie);
}
