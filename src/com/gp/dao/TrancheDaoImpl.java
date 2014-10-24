package com.gp.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.gp.domain.Tranche;
@Repository("trancheDao")
public class TrancheDaoImpl implements TrancheDao {

	@Autowired
	private SessionFactory sessionfactory;
	@Override
	public Tranche trouverParId(Integer num) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Tranche.class);
		crit.add(Restrictions.eq("trancheId", num));
		return (Tranche) crit.uniqueResult();
	}

	@Override
	public void enregistrer(Tranche tranche) {
		Session sess=sessionfactory.openSession();
		Transaction tr = sess.beginTransaction();
		sess.saveOrUpdate(tranche);
		tr.commit();
		sess.close();

	}

	@Override
	public boolean supprimer(Tranche tranche) {
		try{
			Session sess=sessionfactory.openSession();
			Transaction tr = sess.beginTransaction();
			sess.delete(tranche);
			tr.commit();
			sess.close();
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	}

}
