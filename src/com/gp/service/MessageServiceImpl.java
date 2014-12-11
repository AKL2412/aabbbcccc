package com.gp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.gp.dao.MessageDao;
import com.gp.domain.Message;
import com.gp.domain.Utilisateur;
@Service
@Transactional(propagation =Propagation.SUPPORTS, readOnly = true)
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageDao messageDao;
	@Override
	public Message trouverParId(Integer num) {
		// TODO Auto-generated method stub
		return messageDao.trouverParId(num);
	}

	@Override
	public void enregistrer(Message message) {
		// TODO Auto-generated method stub
		messageDao.enregistrer(message);
	}

	@Override
	public boolean supprimer(Message message) {
		// TODO Auto-generated method stub
		return messageDao.supprimer(message);
	}

	@Override
	public List<Message> messageenvoyes(Utilisateur u) {
		// TODO Auto-generated method stub
		return messageDao.messageenvoyes(u);
	}

	@Override
	public List<Message> messagerecus(Utilisateur u) {
		// TODO Auto-generated method stub
		return messageDao.messagerecus(u);
	}

	@Override
	public List<Message> messagenonlus(Utilisateur u) {
		// TODO Auto-generated method stub
		return messageDao.messagenonlus(u);
	}

	@Override
	public List<Message> messageenvoyes(Utilisateur emetteur,
			Utilisateur receveur) {
		// TODO Auto-generated method stub
		return messageDao.messageenvoyes(emetteur, receveur);
	}

}
