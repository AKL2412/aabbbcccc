package com.gp.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gp.domain.Coordonneebancaire;
@Repository("coordonneebancaireDao")
public class CoordonneebancaireDaoImpl implements CoordonneebancaireDao {

	@Autowired
	private SessionFactory sessionfactory;
	@Override
	public Coordonneebancaire trouverParId(Integer id) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Coordonneebancaire.class);
		crit.add(Restrictions.eq("exerciceId", id));
		return (Coordonneebancaire) crit.uniqueResult();
	}

	@Override
	public void enregistrer(Coordonneebancaire coordonneebancaire) {
		Session sess=sessionfactory.openSession();
		Transaction tr = sess.beginTransaction();
		sess.saveOrUpdate(coordonneebancaire);
		tr.commit();
		sess.close();

	}

	@Override
	public boolean supprimer(Coordonneebancaire coordonneebancaire) {
		try{
			Session sess=sessionfactory.openSession();
			Transaction tr = sess.beginTransaction();
			sess.delete(coordonneebancaire);
			tr.commit();
			sess.close();
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	}

}
