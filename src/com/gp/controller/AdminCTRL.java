package com.gp.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gp.domain.Bareme;
import com.gp.domain.Compagnie;
import com.gp.domain.Exercice;
import com.gp.domain.Role;
import com.gp.domain.Societe;
import com.gp.domain.Tranche;
import com.gp.domain.Utilisateur;
import com.gp.service.*;
import com.outils.gp.Fichier;
import com.outils.gp.PassWord;
import com.outils.gp.Tool;
@Controller
@RequestMapping(value="/admin")
public class AdminCTRL {

	@Autowired
	private UtilisateurService utilisateurService;
	@Autowired
	private SocieteService societeService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private ExerciceService exerciceService;
	@Autowired
	private BaremeService baremeService;
	@Autowired
	private TrancheService trancheService;
	@Autowired
	private CompagnieService compagnieService;
	
	
	@RequestMapping(value={"/accueil","/"},method = RequestMethod.GET)
	public String loginReussi(ModelMap model){
		model.addAttribute("link", "accueil");
		/*
		Role r = new Role();
		r.setRoleId(2);
		r.setCode("ROLE_USER");
		Utilisateur u = new Utilisateur();
		u.setLogin("user");
		u.setMotdepasse(PassWord.hacher("user"));
		u.setEnabled(true);
		
		u.setRole(r);
		utilisateurService.enregistrer(u);
		//*/
		//System.out.print("pass : " +PassWord.hacher("google"));
		model.addAttribute("societes", societeService.trouverTous());
		model.addAttribute("baremes", baremeService.trouverParCaractere("obligatoire"));
		return "admin/accueil";
		
	}
	/*=================================================================
	 * 	GERER LES SOCIETES
	 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	
	/*--------------------------------------------------------------------
	 * 	ACCUEIL
	 --------------------------------------------------------------------*/
	@RequestMapping(value="/gerer-societes",method = RequestMethod.GET)
	public String gerersociete(ModelMap model){
		model.addAttribute("link", "societe");
		model.addAttribute("action", "menu");
		return "admin/gerersociete";
		
	}
	/*--------------------------------------------------------------------
	 * 	CREER
	 --------------------------------------------------------------------*/
	@RequestMapping(value="/gerer-societes/creer",method = RequestMethod.GET)
	public String creersociete(ModelMap model){
		model.addAttribute("link", "societe");
		model.addAttribute("action", "creer");
		
		return "admin/creersociete";
		
	}
	@RequestMapping(value="/gerer-societes/creer",method = RequestMethod.POST)
	public String creersocieteSauvegarde(ModelMap model,@RequestParam("file") MultipartFile file,
			@ModelAttribute("societe") Societe societe,HttpServletRequest request ){
		model.addAttribute("link", "societe");
		model.addAttribute("action", "creer");
		societe.setDateajout(new Date());
		String [] nom = societe.getIntituleSociete().split(" ");
		String login = "";
		for(String s : nom){
			login +=s.toLowerCase();
		}
		while(utilisateurService.trouverParLogin(login) != null)
			login +=Math.random()*100;
		if(file != null){
			String cheminSauvegarde = request.getServletContext().getInitParameter("documents-societes");
			cheminSauvegarde += login+File.separator+"logos";
			String logo = Fichier.uploder(file, "logo", cheminSauvegarde);
			societe.setLogo(logo);
		}
		societe.setSlug(Tool.creerSlug(societe.getIntituleSociete()).toLowerCase());
		societeService.enregistrer(societe);
		//Creation du compte de la societe
		
		String pass = PassWord.generer();
		Utilisateur u = new Utilisateur();
		u.setEnabled(true);
		u.setLogin(login);
		u.setRole(roleService.trouverParNUm(2));
		u.setMotdepasse(PassWord.hacher(pass));
		u.setSociete(societe);
		utilisateurService.enregistrer(u);
		model.addAttribute("message", true);
		model.addAttribute("compte", u);
		model.addAttribute("pass", pass);
		
		System.out.println(societe);
		return "admin/creersociete";
		
	}
	/*
	 * """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	 */
	//Modifier
	@RequestMapping(value="/gerer-societes/modifier/{slugScte}",method = RequestMethod.GET)
	public String modifiersociete(ModelMap model,@PathVariable("slugScte") String slugScte){
		model.addAttribute("link", "societe");
		model.addAttribute("action", "modifier");
		model.addAttribute("societe", societeService.trouverParSlug(slugScte));
		return "admin/modifiersociete";
		
	}
	@RequestMapping(value="/gerer-societes/modifier/{slugScte}",method = RequestMethod.POST)
	public String modifiersocieteS(ModelMap model,@PathVariable("slugScte") String slugScte,
			@RequestParam("file") MultipartFile file,
			HttpServletRequest request,
			@ModelAttribute("societe") Societe societe){
		Societe ss = societeService.trouverParSlug(slugScte);
		societe.setSocieteId(ss.getSocieteId());
		societe.setDateajout(ss.getDateajout());
		societe.setSlug(Tool.creerSlug(societe.getIntituleSociete()).toLowerCase());
		if(file != null){
			String cheminSauvegarde = request.getServletContext().getInitParameter("documents-societes");
			String login = ss.compteDefaut().getLogin();
			cheminSauvegarde += login+File.separator+"logos";
			String nameL = "logo"+Tool.listFilesForFolder(new File(cheminSauvegarde));
			String logo = Fichier.uploder(file, nameL, cheminSauvegarde);
			societe.setLogo(logo);
		}
		//System.out.println(" id : "+societe.getSocieteId()+" dd "+ss.getSocieteId());
		
		societeService.enregistrer(societe);
		model.addAttribute("link", "societe");
		model.addAttribute("action", "modifier");
		model.addAttribute("societe", ss);
		return "admin/modifiersociete";
		
	}
	/*
	 * ----------------------------------------------------------------------------------------
	 */
	//Lister
		@RequestMapping(value="/gerer-societes/lister",method = RequestMethod.GET)
		public String listersociete(ModelMap model){
			model.addAttribute("link", "societe");
			model.addAttribute("action", "lister");
			model.addAttribute("societes", societeService.trouverTous());
			return "admin/listersociete";
			
		}
	//consulter
		@RequestMapping(value="/gerer-societes/{slugScte}",method = RequestMethod.GET)
		public String Consultersociete(ModelMap model,
				@PathVariable("slugScte") String slugScte){
			Societe s = societeService.trouverParSlug(slugScte);
			model.addAttribute("slug", slugScte);
			if(s!=null){
				model.addAttribute("link", "societe");
				model.addAttribute("action", "consulter");
				model.addAttribute("societe", s);
				return "admin/consultersociete";
			}
			return "redirect:/erreur-lien?slug="+slugScte+"&code="+-2;
			
		}
			
	/*
	 * 		Les exercies d'une societe
	 */
		@RequestMapping(value="/gerer-societes/{slugScte}/exercices",method = RequestMethod.GET)
		public String Exerciesociete(ModelMap model,
				@PathVariable("slugScte") String slugScte){
			Societe s = societeService.trouverParSlug(slugScte);
			model.addAttribute("slug", slugScte);
			if(s!=null){
				model.addAttribute("link", "societe");
				model.addAttribute("action", "excercice");
				model.addAttribute("societe", s);
				return "admin/exercicesociete";
			}
			return "redirect:/erreur-lien?slug="+slugScte+"&code="+-2;	
		}
		@RequestMapping(value="/gerer-societes/{slugScte}/exercices",method = RequestMethod.POST)
		public String ExerciesocieteSubmite(ModelMap model,
				@PathVariable("slugScte") String slugScte,
				@ModelAttribute("societe") Exercice exercice,
				HttpServletRequest req){
			Societe s = societeService.trouverParSlug(slugScte);
			model.addAttribute("slug", slugScte);
			if(s!=null){
				model.addAttribute("link", "societe");
				model.addAttribute("action", "excercice");
				model.addAttribute("societe", s);
				try{
					DateTime dd = new DateTime(req.getParameter("_dateDebut"));
					DateTime df = new DateTime(req.getParameter("_dateFin"));
					exercice.setDateDebut(dd.toDate());
					exercice.setDateFin(df.toDate());
					if(dd.getMillis() > df.getMillis() ){
						model.addAttribute("message", "La date de debut doit être inférieure ou égale à la date de fin ");
					}else{
						exercice.setSociete(s);
						exerciceService.enregistrer(exercice);
						model.addAttribute("message", "Exercice enregistré avec succès ");
						System.out.println(exercice);
					}
				}catch(Exception e){
					model.addAttribute("message","Erreur date : "+ e.getMessage());
					System.out.println(e.getMessage());
				}
				
				return "admin/exercicesociete";
			}
			return "redirect:/erreur-lien?slug="+slugScte+"&code="+-2;	
		}
	/*
	 *********************************************************************
	 *  FIN GERER SOCIETE
	 *****************************************************************
	 */
	/*=================================================================
	 * 	GERER LES UTILISATEURS
	 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	
	/*--------------------------------------------------------------------
	 * 	ACCUEIL
	 --------------------------------------------------------------------*/
	@RequestMapping(value="/gerer-utilisateurs",method = RequestMethod.GET)
	public String gererutilisateur(ModelMap model){
		model.addAttribute("link", "utilisateur");
		return "admin/gererutilisateur";
		
	}
	
	
	
	/*
	 *********************************************************************
	 *  FIN GERER utilisateur
	 *****************************************************************
	 */
	
	
	/*=================================================================
	 * 	GERER LES Bareme
	 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	
	// Les compagnies
	
	@RequestMapping(value="/gerer-baremes/les-compagnies",method = RequestMethod.GET)
	public String lescompagnies(ModelMap model){
		model.addAttribute("link", "bareme");
		model.addAttribute("action", "compagnie");
		model.addAttribute("compagnies", compagnieService.trouverTous());
	
		return "admin/gererbaremecompagnie";
		
	}
	@RequestMapping(value="/gerer-baremes/les-compagnies",method = RequestMethod.POST)
	public String lescompagniesSubmit(ModelMap model,
			@ModelAttribute("compagnie") Compagnie compagnie){
		compagnieService.enregistrer(compagnie);
		return "redirect:/admin/gerer-baremes/les-compagnies";
		
	}
	
	@RequestMapping(value="/gerer-baremes/les-compagnies/voir/{idCompagnie}",method = RequestMethod.GET)
	public String lescompagniesVoir(ModelMap model,
			@PathVariable("idCompagnie") Integer idCompagnie){
		model.addAttribute("link", "bareme");
		model.addAttribute("action", "compagnieVoir");
		model.addAttribute("compagnie", compagnieService.trouverParId(idCompagnie));
	
		return "admin/gererbaremecompagnievoir";
		
	}
	
		/*--------------------------------------------------------------------
		 * 	ACCUEIL
		 --------------------------------------------------------------------*/
	
	@RequestMapping(value="/gerer-baremes",method = RequestMethod.GET)
	public String gererbareme(ModelMap model){
		model.addAttribute("link", "bareme");
		return "admin/gererbareme";
		
	}
	@RequestMapping(value="/gerer-baremes/creer/{idCompagnie}",method = RequestMethod.GET)
	public String creerbaremeCompagnie(ModelMap model,
			@PathVariable("idCompagnie") Integer idCompagnie){
		model.addAttribute("link", "bareme");
		model.addAttribute("action", "creer");
		model.addAttribute("t-act", "ajout-bareme");
		model.addAttribute("baremeAction", "ajout-bareme");
		model.addAttribute("compagnie", compagnieService.trouverParId(idCompagnie));
		return "admin/creerbareme";
		
	}
	@RequestMapping(value="/gerer-baremes/creer/{idCompagnie}",method = RequestMethod.POST)
	public String creerbaremeSubmitCompagnie(ModelMap model,
			@PathVariable("idCompagnie") Integer idCompagnie,
			@ModelAttribute("tranche") Tranche tranche,
			@ModelAttribute("bareme") Bareme bareme,
			HttpServletRequest eq){
		
		String action = eq.getParameter("action");
		model.addAttribute("link", "bareme");
		model.addAttribute("action", "tranche");
		model.addAttribute("baremeAction", "ajout-tranche");
		System.out.println(action);
		if(action.equals("a-b")){
			bareme.setVersion("1.0.0");
			bareme.setCompagnie(compagnieService.trouverParId(idCompagnie));
			bareme.setDate(new Double(new DateTime().getMillis()));
			bareme.setMaj(new Double(new DateTime().getMillis()));
			baremeService.enregistrer(bareme);
			System.out.println(bareme);
			model.addAttribute("bareme", bareme);
		}else{
			Bareme b = baremeService.trouverParId(
					Integer.parseInt(eq.getParameter("idbareme"))
					);
			tranche.setBareme(b);
			System.out.println(tranche);
			trancheService.enregistrer(tranche);
			
			model.addAttribute("bareme",baremeService.trouverParId(b.getBaremeId()) );
		}
		
		return "admin/creerbareme";
		
	}
	@RequestMapping(value="/gerer-baremes/creer",method = RequestMethod.GET)
	public String creerbareme(ModelMap model){
		model.addAttribute("link", "bareme");
		model.addAttribute("action", "creer");
		model.addAttribute("t-act", "ajout-bareme");
		model.addAttribute("baremeAction", "ajout-bareme-obligatoire");
		return "admin/creerbareme";
		
	}
	@RequestMapping(value="/gerer-baremes/creer",method = RequestMethod.POST)
	public String creerbaremeSubmit(ModelMap model,
			@ModelAttribute("bareme") Bareme bareme,
			@ModelAttribute("tranche") Tranche tranche,
			HttpServletRequest eq){
		
		String action = eq.getParameter("action");
		model.addAttribute("link", "bareme");
		model.addAttribute("action", "tranche");
		model.addAttribute("baremeAction", "ajout-tranche");
		System.out.println(action);
		if(action.equals("a-b")){
			bareme.setCompagnie(
					compagnieService.trouverParId(
								Integer.parseInt(
										eq.getParameter("compagnie")
										)
							)
					);
			baremeService.enregistrer(bareme);
			model.addAttribute("bareme", bareme);
		}else{
			Bareme b = baremeService.trouverParId(
					Integer.parseInt(eq.getParameter("idbareme"))
					);
			tranche.setBareme(b);
			trancheService.enregistrer(tranche);
			model.addAttribute("bareme",baremeService.trouverParId(b.getBaremeId()) );
		}
		
		return "admin/creerbareme";
		
	}
	@RequestMapping(value="/gerer-baremes/ajout-tranche/{idBareme}",method = RequestMethod.POST)
	public String Ajouttranche(ModelMap model,
			@ModelAttribute("bareme") Bareme bareme,
			@ModelAttribute("tranche") Tranche tranche,
			HttpServletRequest eq){
		
		String action = eq.getParameter("action");
		model.addAttribute("link", "bareme");
		model.addAttribute("action", "tranche");
		model.addAttribute("baremeAction", "ajout-tranche");
		System.out.println(action);
		if(action.equals("a-b")){
		
			baremeService.enregistrer(bareme);
			model.addAttribute("bareme", bareme);
		}else{
			Bareme b = baremeService.trouverParId(
					Integer.parseInt(eq.getParameter("idbareme"))
					);
			tranche.setBareme(b);
			trancheService.enregistrer(tranche);
			model.addAttribute("bareme",baremeService.trouverParId(b.getBaremeId()) );
		}
		
		return "admin/creerbareme";
		
	}
	@RequestMapping(value="/gerer-baremes/ajout-tranche/{idBareme}",method = RequestMethod.GET)
	public String creerTranchebaremeSubmit(ModelMap model,
			@ModelAttribute("tranche") Tranche tranche,
			@PathVariable("idBareme") Integer idBareme,
			HttpServletRequest eq){
		
		model.addAttribute("link", "bareme");
		model.addAttribute("action", "tranche");
		model.addAttribute("baremeAction", "ajout-tranche");
		model.addAttribute("bareme",baremeService.trouverParId(idBareme) );
		
		return "admin/creerbareme";
	}
	
	@RequestMapping(value="/gerer-baremes/consulter",method = RequestMethod.GET)
	public String listerbareme(ModelMap model,
			HttpServletRequest req){
		model.addAttribute("link", "bareme");
		model.addAttribute("action", "lister");
		try{
			String c = req.getParameter("char");
			model.addAttribute("baremes", baremeService.trouverParCaractere(c));
		}catch(Exception e){
			model.addAttribute("baremes", baremeService.trouverParCaractere("obligatoire"));
		}
		return "admin/listerbareme";
		
	}
	@RequestMapping(value="/gerer-baremes/modifier/{idBareme}",method = RequestMethod.GET)
	public String modifierbareme(ModelMap model,
			@PathVariable("idBareme") Integer idBareme,
			HttpServletRequest req){
		model.addAttribute("link", "bareme");
		model.addAttribute("action", "modifier");
		try{
			model.addAttribute("bareme", baremeService.trouverParId(idBareme));
		}catch(Exception e){
			
		}
		return "admin/modifierbareme";
		
	}
	/*___________________________________________________________
	 * GERER compte
	 */
	@RequestMapping(value={"/gerer-mon-compte"},method = RequestMethod.GET)
	public String visualiserCompte(ModelMap model){
		model.addAttribute("link", "compte");
		
		model.addAttribute("action", "visualiser");
		model.addAttribute("title", "visualisation de compte");
		return "admin/compte-user";
		
	}
	@RequestMapping(value={"/gerer-mon-compte/modifier"},method = RequestMethod.GET)
	public String modifiercompte(ModelMap model){
		model.addAttribute("link", "compte");
		model.addAttribute("action", "modifier");
		return "admin/modif-compte-user";
	}
	/***********************************************************************************/
}
