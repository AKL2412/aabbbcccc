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
	
	@RequestMapping(value="/supprimer-update",method = RequestMethod.POST)
	public void Suppresiondesobjets(ModelMap model,
			HttpServletRequest req,
			HttpServletResponse res)throws IOException{
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		try{
			String type= req.getParameter("type");
			Integer id = Integer.parseInt(req.getParameter("id"));
			String action= req.getParameter("action");
			if(action.equals("delete")){
				/*
				 * Supprimer un compte utilisateur
				 */
				if(type.equals("utilisateur")){
				
					Utilisateur u = utilisateurService.trouverParId(id);
					utilisateurService.supprimer(u);
					out.print("<i class=\"fa fa-check-square-o fa-2x\" style=\"color:#63ce71\" ></i> Le compte : <strong>"+u.getLogin()+"</strong> a été supprimé avec succès");
				}
			}else if(action.equals("update")){
				
			}
			//out.print("ACTION : "+action+" | TYPE : "+type+" | ID : "+id);
		}catch(Exception e){
			out.print(e.getMessage());
		}
	}
}
