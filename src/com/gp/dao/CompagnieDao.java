package com.gp.dao;

import java.util.List;

import com.gp.domain.Compagnie;

public interface CompagnieDao {
	public Compagnie trouverParId(Integer id);
	public List<Compagnie> trouverTous();
	public void enregistrer(Compagnie compagnie);
	public boolean supprimer(Compagnie compagnie);
}
