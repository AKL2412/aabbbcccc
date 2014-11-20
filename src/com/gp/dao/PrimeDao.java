package com.gp.dao;

import com.gp.domain.Prime;

public interface PrimeDao {
	public Prime trouverParId(Integer num);
	public void enregistrer(Prime prime);
	public boolean supprimer(Prime prime);
}
