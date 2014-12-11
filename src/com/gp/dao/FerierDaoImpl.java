package com.gp.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gp.domain.Avance;
import com.gp.domain.Ferier;
@Repository("ferierDao")
public class FerierDaoImpl implements FerierDao {

	@Autowired
	private SessionFactory sessionfactory;
	@Override
	public Ferier trouverParId(Integer num) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Ferier.class);
		crit.add(Restrictions.eq("ferierId", num));
		return (Ferier) crit.uniqueResult();
	}

	@Override
	public void enregistrer(Ferier ferier) {
		Session sess=sessionfactory.openSession();
		Transaction tr = sess.beginTransaction();
		sess.saveOrUpdate(ferier);
		tr.commit();
		sess.close();

	}

	@Override
	public boolean supprimer(Ferier ferier) {
		try{
			Session sess=sessionfactory.openSession();
			Transaction tr = sess.beginTransaction();
			sess.delete(ferier);
			tr.commit();
			sess.close();
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	}

}
