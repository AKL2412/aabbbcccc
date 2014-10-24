package com.gp.dao;

import java.util.List;

import com.gp.domain.Bareme;

public interface BaremeDao {
	public Bareme trouverParId(Integer num);
	public void enregistrer(Bareme bareme);
	public boolean supprimer(Bareme bareme);
	public List<Bareme> trouverParCaractere(Integer caractere);

}
