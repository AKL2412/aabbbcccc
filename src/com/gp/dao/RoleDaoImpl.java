package com.gp.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gp.domain.Role;
@Repository("roleDao")
public class RoleDaoImpl implements RoleDao {
	@Autowired
	private SessionFactory sessionfactory;
	@Override
	public Role trouverParNUm(Integer num) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Role.class);
		crit.add(Restrictions.eq("num", num));
		return (Role) crit.uniqueResult();
	}

	@Override
	public void enregistrer(Role role) {
		// TODO Auto-generated method stub
		Session sess=sessionfactory.openSession();
		Transaction tr = sess.beginTransaction();
		sess.saveOrUpdate(role);
		tr.commit();
		sess.close();
	}

	@Override
	public boolean supprimer(Role role) {
		try{
			Session sess=sessionfactory.openSession();
			Transaction tr = sess.beginTransaction();
			sess.delete(role);
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
	public List<Role> trouverTous() {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Role.class);
		crit.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return crit.list();
	}

}
