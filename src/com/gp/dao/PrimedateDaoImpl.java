package com.gp.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gp.domain.Prime;
import com.gp.domain.Primedate;
@Repository("primedateDao")
public class PrimedateDaoImpl implements PrimedateDao {
	@Autowired
	private SessionFactory sessionfactory;
	@Override
	public Primedate trouverParId(Integer num) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Primedate.class);
		crit.add(Restrictions.eq("primedateId", num));
		return (Primedate) crit.uniqueResult();
	}

	@Override
	public void enregistrer(Primedate prime) {
		Session sess=sessionfactory.openSession();
		Transaction tr = sess.beginTransaction();
		sess.saveOrUpdate(prime);
		tr.commit();
		sess.close();

	}

	@Override
	public boolean supprimer(Primedate prime) {
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
