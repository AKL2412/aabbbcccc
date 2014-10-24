package com.gp.dao;

import com.gp.domain.Coordonneebancaire;

public interface CoordonneebancaireDao {
	public Coordonneebancaire trouverParId(Integer id);
	public void enregistrer(Coordonneebancaire coordonneebancaire);
	public boolean supprimer(Coordonneebancaire coordonneebancaire);
}
