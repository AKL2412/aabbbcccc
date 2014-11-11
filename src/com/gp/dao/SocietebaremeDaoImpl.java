package com.gp.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gp.domain.Bareme;
import com.gp.domain.Societebareme;
@Repository("societebaremeDao")
public class SocietebaremeDaoImpl implements SocietebaremeDao {
	@Autowired
	private SessionFactory sessionfactory;
	@Override
	public Societebareme trouverParId(Integer id) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Societebareme.class);
		crit.add(Restrictions.eq("societebaremeId", id));
		return (Societebareme) crit.uniqueResult();
	}

	@Override
	public void enregistrer(Societebareme bareme) {
		Session sess=sessionfactory.openSession();
		Transaction tr = sess.beginTransaction();
		sess.saveOrUpdate(bareme);
		tr.commit();
		sess.close();

	}

	@Override
	public boolean supprimer(Societebareme bareme) {
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
