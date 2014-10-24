package com.gp.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gp.domain.Exercice;
@Repository("exerciceDao")
public class ExerciceDaoImpl implements ExerciceDao {
	@Autowired
	private SessionFactory sessionfactory;
	@Override
	public Exercice trouverParId(Integer id) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Exercice.class);
		crit.add(Restrictions.eq("exerciceId", id));
		return (Exercice) crit.uniqueResult();
	}

	@Override
	public void enregistrer(Exercice exercice) {
		// TODO Auto-generated method stub
		Session sess=sessionfactory.openSession();
		Transaction tr = sess.beginTransaction();
		sess.saveOrUpdate(exercice);
		tr.commit();
		sess.close();
	}

	@Override
	public boolean supprimer(Exercice exercice) {
		try{
			Session sess=sessionfactory.openSession();
			Transaction tr = sess.beginTransaction();
			sess.delete(exercice);
			tr.commit();
			sess.close();
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	}

}
