package com.gp.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gp.domain.Prime;
@Repository("primeDao")
public class PrimeDaoImpl implements PrimeDao {

	@Autowired
	private SessionFactory sessionfactory;
	@Override
	public Prime trouverParId(Integer num) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Prime.class);
		crit.add(Restrictions.eq("primeId", num));
		return (Prime) crit.uniqueResult();
	}

	@Override
	public void enregistrer(Prime prime) {
		Session sess=sessionfactory.openSession();
		Transaction tr = sess.beginTransaction();
		sess.saveOrUpdate(prime);
		tr.commit();
		sess.close();

	}

	@Override
	public boolean supprimer(Prime prime) {
		try{
			Session sess=sessionfactory.openSession();
			Transaction tr = sess.beginTransaction();
			sess.delete(prime);
			tr.commit();
			sess.close();
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	}

}
