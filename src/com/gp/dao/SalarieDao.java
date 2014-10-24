package com.gp.dao;

import com.gp.domain.Salarie;

public interface SalarieDao {
	public void enregistrer(Salarie s);
	public boolean supprimer(Salarie s);
}
