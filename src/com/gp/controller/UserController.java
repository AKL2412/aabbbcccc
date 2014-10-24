package com.gp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gp.domain.Utilisateur;
import com.gp.service.UtilisateurService;


@Controller
public class UserController {

	@Autowired
	private UtilisateurService utilisateurService;
	/*-------------------------------------------------------------------
	 *	GESTION DE SON PROPRE COMPTE 
	 ------------------------------------------------------------------
	 */
	/*
	// VISUALISER SON COMPTE
	@RequestMapping(value={"/gerer-mon-compte"},method = RequestMethod.GET)
	public String visualiserCompte(ModelMap model){
		model.addAttribute("link", "compte");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Object role =  auth.getAuthorities().toArray()[0].toString();
		System.out.print("login :"+login +"\n role : "+role);
		if(role.equals("ROLE_USER")){
			model.addAttribute("menu", "user");
		}else if(role.equals("ROLE_ADMIN")){
			model.addAttribute("menu", "admin");
		}
		model.addAttribute("action", "visualiser");
		model.addAttribute("title", "visualisation de compte");
		return "compte-user";
		
	}
	//*/
	@RequestMapping(value={"/erreur-lien"},method = RequestMethod.GET)
	public String slugInconnu(ModelMap model,HttpServletRequest req){
		model.addAttribute("slug", req.getParameter("slug"));
		model.addAttribute("code", req.getParameter("code"));
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		model.addAttribute("user", utilisateurService.trouverParLogin(login));
		return "slug-inconnu";
	}

	//*
	@RequestMapping(value="verifier-login",method = RequestMethod.POST)
	public void modifiercompte(ModelMap model,
			HttpServletRequest req,
			HttpServletResponse res)throws IOException{
		PrintWriter out = res.getWriter();
		try{
			if(utilisateurService.trouverParLogin(req.getParameter("login")) != null)
				out.print("exist");
			else
				out.print("ok");
		}catch(Exception e){
			out.print(e.getMessage());
		}
	}
	//*/
}
