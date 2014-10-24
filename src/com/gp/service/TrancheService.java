package com.gp.service;

import com.gp.domain.Tranche;

public interface TrancheService {

	public Tranche trouverParId(Integer num);
	public void enregistrer(Tranche tranche);
	public boolean supprimer(Tranche tranche);
}
