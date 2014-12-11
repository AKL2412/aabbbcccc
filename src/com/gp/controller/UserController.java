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
import com.gp.domain.Conge;
import com.gp.domain.Enfant;
import com.gp.domain.Exercice;
import com.gp.domain.Ferier;
import com.gp.domain.Primesalarie;
import com.gp.domain.Salarie;
import com.gp.domain.Salariebareme;
import com.gp.domain.Societe;
import com.gp.domain.Tableferier;
import com.gp.domain.Utilisateur;
import com.gp.domain.Societebareme;
import com.gp.service.*;
import com.outils.gp.Tool;


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
	CongeService congeService;
	@Autowired
	private EnfantService enfantService;
	@Autowired
	private PrimesalarieService primesalarieService;
	@Autowired
	private ExerciceService exerciceService;
	@Autowired
	private FerierService ferierService;
	@Autowired
	private JourferierService jourferierService;
	@Autowired
	private SocieteService societeService;
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
			model.addAttribute("objet", req.getParameter("objet"));
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
				}else if(type.equals("conge")){
					Conge c = congeService.trouverParId(id);
					Salarie s = c.getSalarie();
					
					s.setNbrejour(s.getNbrejour() + c.getJourtotal());
					congeService.supprimer(c);
					salarieService.enregistrer(s);
					out.print("<i class=\"fa fa-check-square-o fa-2x\" style=\"color:#63ce71\" ></i> Le congé a été annuler avec succès ! ");
				}else if(type.equals("primesalarie")){
					Primesalarie ps = primesalarieService.trouverParId(id);
					
					if(primesalarieService.supprimer(ps))
					out.print("<i class=\"fa fa-check-square-o fa-2x\" style=\"color:#63ce71\" ></i> La prime :<strong>"+ps.getPrime().getNom()+
							"</strong> a été rétirée au salarié <strong>"+ps.getSalarie().getEtatcivile().getPrenom()+" "+
							ps.getSalarie().getEtatcivile().getNom()+"</strong> avec succès");
					else
						out.print("<i class=\"fa fa-check-square-o fa-2x\" style=\"color:red\" ></i> ERREUR");
				}else if(type.equals("tableferier")){
					Tableferier c = jourferierService.trouverParId(id);
					if(jourferierService.supprimer(c))
						out.print("<i class=\"fa fa-check-square-o fa-2x\" style=\"color:#63ce71\" ></i>Le date : "+
					c+" a été supprimé avec succès");
					else
						out.print("<i class=\"fa fa-times fa-2x\" style=\"color:red\" ></i> L'opération a échouée ! ");
					
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
					}else if(type.equals("exercice")){
						Exercice exo = exerciceService.trouverParId(id);
						
						if(exo.getFerier() == null){
							Ferier ferier = new Ferier();
							ferier.setDateajout(new DateTime().toDate());
							ferierService.enregistrer(ferier);
							String chaine = req.getParameter("chaine");
							for(String str:chaine.split("##")){
								
								if(str.length() > 3 ){
									Tableferier tabfe =new Tableferier();
									tabfe.setFerier(ferier);
									tabfe.setJour(new DateTime(str).toDate());
									jourferierService.enregistrer(tabfe);
									//System.out.println(str+" "+new DateTime(str).toString("EEEE dd MMMMM yyyy"));
								}
									
							}
							exo.setFerier(ferier);
							exerciceService.enregistrer(exo);
						}
						out.print("<i class=\"fa fa-check-square-o fa-2x\" style=\"color:#63ce71\" ></i>  Jours feriés ajoutés avec succès ");
						
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
		String slug = req.getParameter("slug");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Utilisateur u = utilisateurService.trouverParLogin(login);
		Societe s = societeService.trouverParSlug(slug);
		int veri = Tool.verificationLien(u, s);
		
		if(veri == 1){
			try{
				DateTime debut = new DateTime(req.getParameter("debut"));
				DateTime fin = new DateTime(req.getParameter("fin"));
				//out.print(debut.getDayOfWeek()+" -- "+fin.getDayOfWeek());
				Exercice exo = s.exoEncours();
				DateTime temp =debut;
				int j = 0;
				if(exo != null){
					if(exo.getFerier() != null){
						while(temp.getMillis() < fin.getMillis()){
							if(temp.getDayOfWeek() != 6 && temp.getDayOfWeek() != 7 && !exo.jourferie(temp)){
								j++;
							}
							temp = new DateTime(temp.plusDays(1).toString("YYYY-MM-dd"));
						}
						out.print(j);
					}else
						out.print("Veuillez définir les jours fériés d'abord !");
					
				}else{
					out.print("Veuillez définir l'exercie en cours!");
				}
				
			}catch(Exception e){
				out.print(e.getMessage());
			}
		}else
		out.print("Vous ne pouvez pas continuer cette action");
		
		
		
		
	}
}
