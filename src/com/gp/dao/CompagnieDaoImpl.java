package com.gp.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gp.domain.Compagnie;
import com.gp.domain.Contrat;
import com.gp.domain.Societe;
@Repository("compagnieDao")
public class CompagnieDaoImpl implements CompagnieDao {

	@Autowired
	private SessionFactory sessionfactory;
	@Override
	public Compagnie trouverParId(Integer id) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Compagnie.class);
		crit.add(Restrictions.eq("compagnieId", id));
		return (Compagnie) crit.uniqueResult();
	}

	@Override
	public void enregistrer(Compagnie compagnie) {
		Session sess=sessionfactory.openSession();
		Transaction tr = sess.beginTransaction();
		sess.saveOrUpdate(compagnie);
		tr.commit();
		sess.close();

	}

	@Override
	public boolean supprimer(Compagnie compagnie) {
		try{
			Session sess=sessionfactory.openSession();
			Transaction tr = sess.beginTransaction();
			sess.delete(compagnie);
			tr.commit();
			sess.close();
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Compagnie> trouverTous() {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Compagnie.class);
		crit.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return crit.list();
	}

}
