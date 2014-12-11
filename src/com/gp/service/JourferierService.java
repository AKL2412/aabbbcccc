package com.gp.service;

import com.gp.domain.Tableferier;

public interface JourferierService {
	public Tableferier trouverParId(Integer num);
	public void enregistrer(Tableferier ferier);
	public boolean supprimer(Tableferier ferier);
}
