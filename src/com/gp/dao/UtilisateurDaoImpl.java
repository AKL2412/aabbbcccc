package com.gp.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gp.domain.Utilisateur;
@Repository("utilisateurDao")
public class UtilisateurDaoImpl implements UtilisateurDao {

	@Autowired
	private SessionFactory sessionfactory;
	
	@Override
	public Utilisateur trouverParLogin(String login) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Utilisateur.class);
		crit.add(Restrictions.eq("login", login));
		Utilisateur compte = (Utilisateur) crit.uniqueResult();
		return compte;
	}

	@Override
	public void enregistrer(Utilisateur utilisateur) {
		// TODO Auto-generated method stub
		Session sess=sessionfactory.openSession();
		Transaction tr = sess.beginTransaction();
		sess.saveOrUpdate(utilisateur);
		tr.commit();
		sess.close();
	}

	@Override
	public boolean supprimer(Utilisateur utilisateur) {
		try{
			Session sess=sessionfactory.openSession();
			Transaction tr = sess.beginTransaction();
			sess.delete(utilisateur);
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
	public List<Utilisateur> obtenirTous() {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Utilisateur.class,"compte");
		//crit.add(Restrictions.eq("compte.enabled", etat));
		
List<Utilisateur> Compteutilisateurs 	= crit
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
		.list();
return Compteutilisateurs;
	}

}
