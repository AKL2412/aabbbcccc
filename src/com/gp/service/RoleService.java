package com.gp.service;

import java.util.List;

import com.gp.domain.Role;

public interface RoleService {
	public Role trouverParNUm(Integer num);
	public void enregistrer(Role role);
	public boolean supprimer(Role role);
	public List<Role> trouverTous();
}
