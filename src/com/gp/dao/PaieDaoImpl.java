package com.gp.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gp.domain.Paie;
@Repository("paieDao")
public class PaieDaoImpl implements PaieDao {

	@Autowired
	private SessionFactory sessionfactory;
	@Override
	public Paie trouverParId(Integer id) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Paie.class);
		crit.add(Restrictions.eq("paieId", id));
		return (Paie) crit.uniqueResult();
	}

	@Override
	public void enregistrer(Paie paie) {
		Session sess=sessionfactory.openSession();
		Transaction tr = sess.beginTransaction();
		sess.saveOrUpdate(paie);
		tr.commit();
		sess.close();

	}

	@Override
	public boolean supprimer(Paie paie) {
		try{
			Session sess=sessionfactory.openSession();
			Transaction tr = sess.beginTransaction();
			sess.delete(paie);
			tr.commit();
			sess.close();
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	}

}
