package com.gp.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gp.domain.Etatcivile;
import com.gp.domain.Exercice;
@Repository("etatcivileDao")
public class EtatcivileDaoImpl implements EtatcivileDao {
	@Autowired
	private SessionFactory sessionfactory;
	@Override
	public Etatcivile trouverParId(Integer id) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Etatcivile.class);
		crit.add(Restrictions.eq("etatcivileId", id));
		return (Etatcivile) crit.uniqueResult();
	}

	@Override
	public void enregistrer(Etatcivile etatcivile) {
		// TODO Auto-generated method stub
				Session sess=sessionfactory.openSession();
				Transaction tr = sess.beginTransaction();
				sess.saveOrUpdate(etatcivile);
				tr.commit();
				sess.close();
	}

	@Override
	public boolean supprimer(Etatcivile etatcivile) {
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
