package com.gp.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gp.domain.Immatriculation;
@Repository("immatriculeDao")
public class ImmatriculationDaoImpl implements ImmatriculationDao {
	@Autowired
	private SessionFactory sessionfactory;
	@Override
	public Immatriculation trouverParId(Integer id) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Immatriculation.class);
		crit.add(Restrictions.eq("exerciceId", id));
		return (Immatriculation) crit.uniqueResult();
	}

	@Override
	public void enregistrer(Immatriculation immatriculation) {
		// TODO Auto-generated method stub
				Session sess=sessionfactory.openSession();
				Transaction tr = sess.beginTransaction();
				sess.saveOrUpdate(immatriculation);
				tr.commit();
				sess.close();

	}

	@Override
	public boolean supprimer(Immatriculation immatriculation) {
		try{
			Session sess=sessionfactory.openSession();
			Transaction tr = sess.beginTransaction();
			sess.delete(immatriculation);
			tr.commit();
			sess.close();
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	}

}
