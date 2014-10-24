package com.gp.service;


import com.gp.domain.Exercice;

public interface ExerciceService {
	public Exercice trouverParId(Integer id);
	public void enregistrer(Exercice exercice);
	public boolean supprimer(Exercice exercice);
}
