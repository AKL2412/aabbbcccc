package com.gp.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gp.domain.Affectation;
@Repository("affectationDao")
public class AffectationDaoImpl implements AffectationDao {
	@Autowired
	private SessionFactory sessionfactory;
	@Override
	public Affectation trouverParId(Integer id) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Affectation.class);
		crit.add(Restrictions.eq("affectationId", id));
		return (Affectation) crit.uniqueResult();
	}

	@Override
	public void enregistrer(Affectation affectation) {
		// TODO Auto-generated method stub
		Session sess=sessionfactory.openSession();
		Transaction tr = sess.beginTransaction();
		sess.saveOrUpdate(affectation);
		tr.commit();
		sess.close();
	}

	@Override
	public boolean supprimer(Affectation affectation) {
		try{
			Session sess=sessionfactory.openSession();
			Transaction tr = sess.beginTransaction();
			sess.delete(affectation);
			tr.commit();
			sess.close();
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	}

}
