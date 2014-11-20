package com.gp.dao;

import com.gp.domain.Commission;

public interface CommissionDao {
	public Commission trouverParId(Integer num);
	public void enregistrer(Commission commission);
	public boolean supprimer(Commission commission);
}
