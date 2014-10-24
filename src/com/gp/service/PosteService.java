package com.gp.service;

import com.gp.domain.Poste;

public interface PosteService {
	public Poste trouverParId(Integer num);
	public void enregistrer(Poste poste);
	public boolean supprimer(Poste poste);
}
