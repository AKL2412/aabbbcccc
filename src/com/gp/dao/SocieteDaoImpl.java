package com.gp.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gp.domain.Societe;
@Repository("societeDao")
public class SocieteDaoImpl implements SocieteDao {

	@Autowired
	private SessionFactory sessionfactory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Societe> trouverParIntitule(String intitule) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Societe.class);
		crit.add(Restrictions.like("intituleSociete", "%"+intitule+"%"));
		crit.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return crit.list();
	}

	@Override
	public void enregistrer(Societe societe) {
		// TODO Auto-generated method stub
		Session sess=sessionfactory.openSession();
		Transaction tr = sess.beginTransaction();
		sess.saveOrUpdate(societe);
		tr.commit();
		sess.close();
	}

	@Override
	public boolean supprimer(Societe societe) {
		try{
			Session sess=sessionfactory.openSession();
			Transaction tr = sess.beginTransaction();
			sess.delete(societe);
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
	public List<Societe> trouverTous() {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Societe.class);
		crit.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return crit.list();
	}

	@Override
	public Societe trouverParSlug(String slug) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Societe.class);
		crit.add(Restrictions.eq("slug", slug));
	
		return (Societe) crit.uniqueResult();
	}

}
