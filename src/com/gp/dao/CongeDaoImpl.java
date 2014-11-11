package com.gp.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gp.domain.Conge;
import com.gp.domain.Contrat;
@Repository("congeDao")
public class CongeDaoImpl implements CongeDao {

	@Autowired
	private SessionFactory sessionfactory;
	@Override
	public Conge trouverParId(Integer num) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Conge.class);
		crit.add(Restrictions.eq("congeId", num));
		return (Conge) crit.uniqueResult();
	}

	@Override
	public void enregistrer(Conge contrat) {
		Session sess=sessionfactory.openSession();
		Transaction tr = sess.beginTransaction();
		sess.saveOrUpdate(contrat);
		tr.commit();
		sess.close();
	}

	@Override
	public boolean supprimer(Conge contrat) {
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
