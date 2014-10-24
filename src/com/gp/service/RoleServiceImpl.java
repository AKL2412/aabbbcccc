package com.gp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.RoleDao;
import com.gp.domain.Role;
@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleDao roleDao;
	@Override
	public Role trouverParNUm(Integer num) {
		// TODO Auto-generated method stub
		return roleDao.trouverParNUm(num);
	}

	@Override
	public void enregistrer(Role role) {
		// TODO Auto-generated method stub
		roleDao.enregistrer(role);
	}

	@Override
	public boolean supprimer(Role role) {
		// TODO Auto-generated method stub
		return roleDao.supprimer(role);
	}

	@Override
	public List<Role> trouverTous() {
		// TODO Auto-generated method stub
		return roleDao.trouverTous();
	}

}
