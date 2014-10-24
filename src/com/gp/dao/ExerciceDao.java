package com.gp.dao;

import com.gp.domain.Exercice;

public interface ExerciceDao {
	public Exercice trouverParId(Integer id);
	public void enregistrer(Exercice exercice);
	public boolean supprimer(Exercice exercice);
}
