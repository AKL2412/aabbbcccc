package com.gp.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gp.domain.Poste;
@Repository("PosteDao")
public class PosteDaoImpl implements PosteDao {
	@Autowired
	private SessionFactory sessionfactory;
	@Override
	public Poste trouverParId(Integer id) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Poste.class);
		crit.add(Restrictions.eq("PosteId", id));
		return (Poste) crit.uniqueResult();
	}

	@Override
	public void enregistrer(Poste poste) {
		// TODO Auto-generated method stub
		Session sess=sessionfactory.openSession();
		Transaction tr = sess.beginTransaction();
		sess.saveOrUpdate(poste);
		tr.commit();
		sess.close();
	}

	@Override
	public boolean supprimer(Poste poste) {
		try{
			Session sess=sessionfactory.openSession();
			Transaction tr = sess.beginTransaction();
			sess.delete(poste);
			tr.commit();
			sess.close();
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	}

}
