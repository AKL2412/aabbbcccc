package com.gp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gp.domain.Bareme;
import com.gp.domain.Compagnie;
import com.gp.domain.Enfant;
import com.gp.domain.Salarie;
import com.gp.domain.Salariebareme;
import com.gp.domain.Utilisateur;
import com.gp.domain.Societebareme;
import com.gp.service.BaremeService;
import com.gp.service.CompagnieService;
import com.gp.service.EnfantService;
import com.gp.service.SalarieService;
import com.gp.service.SalariebaremeService;
import com.gp.service.SocietebaremeService;
import com.gp.service.TrancheService;
import com.gp.service.UtilisateurService;


@Controller
public class UserController {

	@Autowired
	private UtilisateurService utilisateurService;
	@Autowired
	private TrancheService trancheService;
	@Autowired
	SocietebaremeService societebaremeService;
	@Autowired
	SalariebaremeService salariebaremeService;
	@Autowired
	BaremeService baremeService;
	@Autowired
	CompagnieService compagnieService;
	@Autowired
	SalarieService salarieService;

	@Autowired
	private EnfantService enfantService;
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
		try{
			model.addAttribute("id", req.getParameter("id"));
		}catch(Exception e){}
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
				}else if(type.equals("tranche")){
					trancheService.supprimer(trancheService.trouverParId(id));
					out.print("<i class=\"fa fa-check-square-o fa-2x\" style=\"color:#63ce71\" ></i> La tranche : <strong>"+
					"</strong> a été supprimé avec succès");
				}else if(type.equals("societebareme")){
					Societebareme sb = societebaremeService.trouverParId(id);
					societebaremeService.supprimer(sb);
					out.print("<i class=\"fa fa-check-square-o fa-2x\" style=\"color:#63ce71\" ></i> Le barème <u><i>"+sb.getBareme().getNom()+" </i></u> de la compagnie: <strong>"+
					sb.getBareme().getCompagnie().getNom()+"</strong> a été supprimé avec succès ");
				}else if(type.equals("bareme")){
					Bareme sb = baremeService.trouverParId(id);
					baremeService.supprimer(sb);
					out.print("<i class=\"fa fa-check-square-o fa-2x\" style=\"color:#63ce71\" ></i> Le barème <u><i>"+sb.getNom()+" </i></u> de la compagnie: <strong>"+
					sb.getCompagnie().getNom()+"</strong> a été supprimé avec succès ");
				}else if(type.equals("compagnie")){
					Compagnie sb = compagnieService.trouverParId(id);
					compagnieService.supprimer(sb);
					out.print("<i class=\"fa fa-check-square-o fa-2x\" style=\"color:#63ce71\" ></i>  la compagnie: <strong>"+
					sb.getNom()+"</strong> a été supprimé avec succès ");
				}else if(type.equals("salariebareme")){
					Salariebareme sb = salariebaremeService.trouverParId(id);
					if(salariebaremeService.supprimer(sb))
					out.print("<i class=\"fa fa-check-square-o fa-2x\" style=\"color:#63ce71\" ></i>  "
							+ "Le barème <i>"+sb.getSocietebareme().getBareme().getNom()+"</i> de la compagnie <strong>"
						+sb.getSocietebareme().getBareme().getCompagnie().getNom()+"</strong> a été supprimé avec succès ");
					else
						out.print("Suppression échouée !!");
				}else if(type.equals("enfant")){
					Enfant sb = enfantService.trouverParId(id);
					sb.setEtatcivile(null);
					if(enfantService.supprimer(sb))
					out.print("<i class=\"fa fa-check-square-o fa-2x\" style=\"color:#63ce71\" ></i>  "
							+ "L'enfant <strong> <i>"+sb.getNom()+" "+sb.getPrenom()+"</i></strong> a été supprimé avec succès ");
					else
						out.print("Suppression échouée !!");
				}
				
			}else if(action.equals("update")){
				 if(type.equals("salariebareme")){
						Salarie s = salarieService.trouverParId(
								Integer.parseInt(req.getParameter("salarie"))
								);
						Societebareme b = societebaremeService.trouverParId(
								Integer.parseInt(req.getParameter("bareme"))
								);
						String code = req.getParameter("code");
						Salariebareme sb = new Salariebareme();
						sb.setSocietebareme(b);
						sb.setSalarie(s);
						sb.setSalarieId(code);
						salariebaremeService.enregistrer(sb);
						out.print("Le barème <i>"+b.getBareme().getNom()+"</i> de la compagnie <strong>"
						+b.getBareme().getCompagnie().getNom()+"</strong> a été affecté au salarié <u>"+
						s.getEtatcivile().getPrenom()+" "+s.getEtatcivile().getNom() +
						"</u> : Code : <strong><u>"+code+"</u></strong>"
								);
					}
			}
			//out.print("ACTION : "+action+" | TYPE : "+type+" | ID : "+id);
		}catch(Exception e){
			out.print(e.getMessage());
		}
	}
	
	
	/*
	 * Nombre de jour de congé
	 */
	@RequestMapping(value="/nombre-de-jour",method = RequestMethod.POST)
	public void nombredejour(ModelMap model,
			HttpServletRequest req,
			HttpServletResponse res)throws IOException{
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		try{
			DateTime debut = new DateTime(req.getParameter("debut"));
			DateTime fin = new DateTime(req.getParameter("fin"));
			//out.print(debut.getDayOfWeek()+" -- "+fin.getDayOfWeek());
			
			DateTime temp =debut;
			int j = 0;
			while(temp.getMillis() < fin.getMillis()){
				if(temp.getDayOfWeek() != 6 && temp.getDayOfWeek() != 7 ){
					j++;
				}
				temp = new DateTime(temp.plusDays(1).toString("YYYY-MM-dd"));
			}
			out.print(j);
		}catch(Exception e){
			out.print(e.getMessage());
		}
		
	}
}
