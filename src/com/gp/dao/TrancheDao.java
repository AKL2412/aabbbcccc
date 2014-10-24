package com.gp.dao;

import com.gp.domain.Tranche;

public interface TrancheDao {
	public Tranche trouverParId(Integer num);
	public void enregistrer(Tranche tranche);
	public boolean supprimer(Tranche tranche);

}
