package com.gp.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gp.domain.Enfant;
import com.gp.domain.Etatcivile;
@Repository("enfantDao")
public class EnfantDaoImpl implements EnfantDao {
	@Autowired
	private SessionFactory sessionfactory;
	@Override
	public Enfant trouverParId(Integer id) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Enfant.class);
		crit.add(Restrictions.eq("etatcivileId", id));
		return (Enfant) crit.uniqueResult();
	}

	@Override
	public void enregistrer(Enfant etatcivile) {
		Session sess=sessionfactory.openSession();
		Transaction tr = sess.beginTransaction();
		sess.saveOrUpdate(etatcivile);
		tr.commit();
		sess.close();

	}

	@Override
	public boolean supprimer(Enfant etatcivile) {
		try{
			Session sess=sessionfactory.openSession();
			Transaction tr = sess.beginTransaction();
			sess.delete(etatcivile);
			tr.commit();
			sess.close();
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	}

}
