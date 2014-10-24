package com.gp.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gp.domain.Salarie;
@Repository("salarieDao")
public class SalarieDaoImpl implements SalarieDao {

	@Autowired
	private SessionFactory sessionfactory;
	@Override
	public void enregistrer(Salarie s) {
		Session sess=sessionfactory.openSession();
		Transaction tr = sess.beginTransaction();
		sess.saveOrUpdate(s);
		tr.commit();
		sess.close();

	}

	@Override
	public boolean supprimer(Salarie s) {
		try{
			Session sess=sessionfactory.openSession();
			Transaction tr = sess.beginTransaction();
			sess.delete(s);
			tr.commit();
			sess.close();
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	}

}
