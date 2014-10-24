package com.gp.service;

import com.gp.domain.Coordonneebancaire;

public interface CoordonneebancaireService {
	public Coordonneebancaire trouverParId(Integer id);
	public void enregistrer(Coordonneebancaire coordonneebancaire);
	public boolean supprimer(Coordonneebancaire coordonneebancaire);
}
