package com.gp.service;

import com.gp.domain.Prime;

public interface PrimeService {
	public Prime trouverParId(Integer num);
	public void enregistrer(Prime prime);
	public boolean supprimer(Prime prime);
}
