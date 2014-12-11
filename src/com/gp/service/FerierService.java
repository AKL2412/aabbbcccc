package com.gp.service;

import com.gp.domain.Ferier;

public interface FerierService {
	public Ferier trouverParId(Integer num);
	public void enregistrer(Ferier ferier);
	public boolean supprimer(Ferier ferier);
}
