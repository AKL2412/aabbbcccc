package com.gp.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gp.domain.Salariebareme;
@Repository("salariebaremeDao")
public class SalariebaremeDaoImpl implements SalariebaremeDao {

	@Autowired
	private SessionFactory sessionfactory;
	@Override
	public Salariebareme trouverParId(Integer id) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Salariebareme.class);
		crit.add(Restrictions.eq("salariebaremeId", id));
		return (Salariebareme) crit.uniqueResult();
	}

	@Override
	public void enregistrer(Salariebareme bareme) {
		Session sess=sessionfactory.openSession();
		Transaction tr = sess.beginTransaction();
		sess.saveOrUpdate(bareme);
		tr.commit();
		sess.close();

	}

	@Override
	public boolean supprimer(Salariebareme bareme) {
		try{
			Session sess=sessionfactory.openSession();
			Transaction tr = sess.beginTransaction();
			sess.delete(bareme);
			tr.commit();
			sess.close();
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	}

}
