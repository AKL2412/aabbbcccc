package com.gp.service;

import java.util.List;

import com.gp.domain.Message;
import com.gp.domain.Utilisateur;

public interface MessageService {
	public Message trouverParId(Integer num);
	public void enregistrer(Message message);
	public boolean supprimer(Message message);
	public List<Message> messageenvoyes(Utilisateur u);
	public List<Message> messagerecus(Utilisateur u);
	public List<Message> messagenonlus(Utilisateur u);
	public List<Message> messageenvoyes(Utilisateur emetteur,Utilisateur receveur);
}
