package com.gp.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gp.domain.Primesalarie;
@Repository("primesalarieDao")
public class PrimesalarieDaoImpl implements PrimesalarieDao {

	@Autowired
	private SessionFactory sessionfactory;
	@Override
	public Primesalarie trouverParId(Integer num) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Primesalarie.class);
		crit.add(Restrictions.eq("primesalarieId", num));
		return (Primesalarie) crit.uniqueResult();
	}

	@Override
	public void enregistrer(Primesalarie primesalarie) {
		Session sess=sessionfactory.openSession();
		Transaction tr = sess.beginTransaction();
		sess.saveOrUpdate(primesalarie);
		tr.commit();
		sess.close();

	}

	@Override
	public boolean supprimer(Primesalarie primesalarie) {
		try{
			Session sess=sessionfactory.openSession();
			Transaction tr = sess.beginTransaction();
			sess.delete(primesalarie);
			tr.commit();
			sess.close();
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	}

}
