package com.gp.service;

import com.gp.domain.Commission;

public interface CommissionService {
	public Commission trouverParId(Integer num);
	public void enregistrer(Commission commission);
	public boolean supprimer(Commission commission);
}
