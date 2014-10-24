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
@Repository("baremeDao")
public class BaremeDaompl implements BaremeDao {

	@Autowired
	private SessionFactory sessionfactory;
	@Override
	public Bareme trouverParId(Integer num) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Bareme.class);
		crit.add(Restrictions.eq("baremeId", num));
		return (Bareme) crit.uniqueResult();
	}

	@Override
	public void enregistrer(Bareme bareme) {
		// TODO Auto-generated method stub
				Session sess=sessionfactory.openSession();
				Transaction tr = sess.beginTransaction();
				sess.saveOrUpdate(bareme);
				tr.commit();
				sess.close();

	}

	@Override
	public boolean supprimer(Bareme bareme) {
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

	@SuppressWarnings("unchecked")
	@Override
	public List<Bareme> trouverParCaractere(Integer caractere) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Bareme.class);
		crit.add(Restrictions.eq("type", caractere));
		crit.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return crit.list();
	}

}
