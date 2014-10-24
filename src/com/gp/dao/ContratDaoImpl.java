package com.gp.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gp.domain.Contrat;
@Repository("contratDao")
public class ContratDaoImpl implements ContratDao {

	@Autowired
	private SessionFactory sessionfactory;
	@Override
	public Contrat trouverParId(Integer id) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Contrat.class);
		crit.add(Restrictions.eq("contratId", id));
		return (Contrat) crit.uniqueResult();
	}

	@Override
	public void enregistrer(Contrat contrat) {
		// TODO Auto-generated method stub
		Session sess=sessionfactory.openSession();
		Transaction tr = sess.beginTransaction();
		sess.saveOrUpdate(contrat);
		tr.commit();
		sess.close();
	}

	@Override
	public boolean supprimer(Contrat contrat) {
		try{
			Session sess=sessionfactory.openSession();
			Transaction tr = sess.beginTransaction();
			sess.delete(contrat);
			tr.commit();
			sess.close();
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	}

}
