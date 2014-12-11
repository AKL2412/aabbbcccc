package com.gp.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gp.domain.Message;
import com.gp.domain.Utilisateur;
@Repository("messageDao")
public class MessageDaoImpl implements MessageDao {

	@Autowired
	private SessionFactory sessionfactory;
	@Override
	public Message trouverParId(Integer num) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Message.class);
		crit.add(Restrictions.eq("messageId", num));
		return (Message) crit.uniqueResult();
	}

	@Override
	public void enregistrer(Message message) {
		Session sess=sessionfactory.openSession();
		Transaction tr = sess.beginTransaction();
		sess.saveOrUpdate(message);
		tr.commit();
		sess.close();

	}

	@Override
	public boolean supprimer(Message message) {
		try{
			Session sess=sessionfactory.openSession();
			Transaction tr = sess.beginTransaction();
			sess.delete(message);
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
	public List<Message> messageenvoyes(Utilisateur u) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Message.class,"message");
		crit.createAlias("message.utilisateurByEmetteur", "emetteur"); // inner join by default
		//crit.createAlias("message.utilisateurByDestinataire", "receveur");
		crit.add(Restrictions.eq("emetteur.utilisateurId", u.getUtilisateurId()));
		return crit
				.addOrder(Order.desc("dateenvoi"))
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).
				list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Message> messagerecus(Utilisateur u) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Message.class,"message");
		//crit.createAlias("message.utilisateurByEmetteur", "emetteur"); // inner join by default
		crit.createAlias("message.utilisateurByDestinataire", "receveur");
		crit.add(Restrictions.eq("receveur.utilisateurId", u.getUtilisateurId()));
		return crit
				.addOrder(Order.desc("dateenvoi"))
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).
				list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Message> messagenonlus(Utilisateur u) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Message.class,"message");
		//crit.createAlias("message.utilisateurByEmetteur", "emetteur"); // inner join by default
		crit.createAlias("message.utilisateurByDestinataire", "receveur");
		
		crit.add(Restrictions.eq("receveur.utilisateurId", u.getUtilisateurId()));
		crit.add(Restrictions.eq("message.lu", false));
		return crit
				.addOrder(Order.desc("dateenvoi"))
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).
				list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Message> messageenvoyes(Utilisateur emetteur,
			Utilisateur receveur) {
		Criteria crit = sessionfactory.getCurrentSession().createCriteria(Message.class,"message");
		crit.createAlias("message.utilisateurByEmetteur", "emetteur"); // inner join by default
		crit.createAlias("message.utilisateurByDestinataire", "receveur");
		crit.add(Restrictions.eq("receveur.utilisateurId", receveur.getUtilisateurId()));
		crit.add(Restrictions.eq("emetteur.utilisateurId", emetteur.getUtilisateurId()));
		return crit
				.addOrder(Order.desc("dateenvoi"))
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).
				list();
	}

}
