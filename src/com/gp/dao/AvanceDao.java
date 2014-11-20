package com.gp.dao;

import com.gp.domain.Avance;

public interface AvanceDao {
	public Avance trouverParId(Integer num);
	public void enregistrer(Avance avance);
	public boolean supprimer(Avance avance);
}
