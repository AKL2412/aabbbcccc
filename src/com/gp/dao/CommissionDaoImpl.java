package com.gp.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gp.domain.Avance;
import com.gp.domain.Commission;
@Repository("commissionDao")
public class CommissionDaoImpl implements CommissionDao {
	@Autowired
	private SessionFactory sessionfactory;
	@Override
	public Commission trouverParId(Integer num) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Commission.class);
		crit.add(Restrictions.eq("commissionId", num));
		return (Commission) crit.uniqueResult();
	}

	@Override
	public void enregistrer(Commission commission) {
		Session sess=sessionfactory.openSession();
		Transaction tr = sess.beginTransaction();
		sess.saveOrUpdate(commission);
		tr.commit();
		sess.close();

	}

	@Override
	public boolean supprimer(Commission commission) {
		try{
			Session sess=sessionfactory.openSession();
			Transaction tr = sess.beginTransaction();
			sess.delete(commission);
			tr.commit();
			sess.close();
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	}

}
