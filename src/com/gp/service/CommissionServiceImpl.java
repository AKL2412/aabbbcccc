package com.gp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.CommissionDao;
import com.gp.domain.Commission;
@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class CommissionServiceImpl implements CommissionService {
	@Autowired
	private CommissionDao commissionDao;
	@Override
	public Commission trouverParId(Integer num) {
		// TODO Auto-generated method stub
		return commissionDao.trouverParId(num);
	}

	@Override
	public void enregistrer(Commission commission) {
		commissionDao.enregistrer(commission);

	}

	@Override
	public boolean supprimer(Commission commission) {
		// TODO Auto-generated method stub
		return commissionDao.supprimer(commission);
	}

}
