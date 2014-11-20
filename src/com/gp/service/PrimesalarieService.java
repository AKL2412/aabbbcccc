package com.gp.service;

import com.gp.domain.Primesalarie;

public interface PrimesalarieService {
	public Primesalarie trouverParId(Integer num);
	public void enregistrer(Primesalarie primesalarie);
	public boolean supprimer(Primesalarie primesalarie);
}
