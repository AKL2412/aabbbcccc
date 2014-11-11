package com.gp.controller;

import java.io.File;

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

import com.gp.domain.Affectation;
import com.gp.domain.Conge;
import com.gp.domain.Contrat;
import com.gp.domain.Coordonneebancaire;
import com.gp.domain.Enfant;
import com.gp.domain.Etatcivile;
import com.gp.domain.Exercice;
import com.gp.domain.Immatriculation;
import com.gp.domain.Message;
import com.gp.domain.Paie;
import com.gp.domain.Poste;
import com.gp.domain.Salarie;
import com.gp.domain.Salariebareme;
import com.gp.domain.Societe;
import com.gp.domain.Utilisateur;
import com.gp.service.AffectationService;
import com.gp.service.CongeService;
import com.gp.service.ContratService;
import com.gp.service.CoordonneebancaireService;
import com.gp.service.EnfantService;
import com.gp.service.EtatcivilService;
import com.gp.service.ExerciceService;
import com.gp.service.ImmatriculationService;
import com.gp.service.PaieService;
import com.gp.service.PosteService;
import com.gp.service.RoleService;
import com.gp.service.SalarieService;
import com.gp.service.SalariebaremeService;
import com.gp.service.SocieteService;
import com.gp.service.SocietebaremeService;
import com.gp.service.UtilisateurService;
import com.outils.gp.Fichier;
import com.outils.gp.PassWord;
import com.outils.gp.Tool;

@Controller
@RequestMapping(value="/societe/{slug}")
public class SocieteCTRL {
	@Autowired
	private UtilisateurService utilisateurService;
	@Autowired
	private SocieteService societeService;
	@Autowired
	private PaieService paieService;
	@Autowired
	private ContratService contratService;
	@Autowired
	private AffectationService affectationService;
	@Autowired
	private EtatcivilService etatcivilService;
	@Autowired
	private ImmatriculationService immatriculationService;
	@Autowired
	private CoordonneebancaireService coordonneebancaireService;
	@Autowired
	private PosteService posteService;
	@Autowired
	private SalarieService salarieService;
	@Autowired
	private ExerciceService exerciceService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private EnfantService enfantService;
	@Autowired
	SocietebaremeService societebaremeService;
	@Autowired
	SalariebaremeService salariebaremeService;
	@Autowired
	CongeService congeService;
	
	@RequestMapping(value={"/accueil","/"},method = RequestMethod.GET)
	public String loginReussi(ModelMap model,@PathVariable("slug") String slug){
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Utilisateur u = utilisateurService.trouverParLogin(login);
		Societe s = societeService.trouverParSlug(slug);
		int veri = Tool.verificationLien(u, s);
		
		if(veri == 1){
			model.addAttribute("link", "accueil");
			model.addAttribute("slug", slug);
			model.addAttribute("scte", s);
			return "scte/accueil";
		}
		return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
		
	}
	
	/*================================================================
	 * Gere les salaries
	======================================================== */
	
	
	/*
	 * Ajout
	 */
	
	
	@RequestMapping(value="/gerer-salaries/ajouter",method = RequestMethod.GET)
	public String ajouterSalarie(ModelMap model,@PathVariable("slug") String slug
			){
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Utilisateur u = utilisateurService.trouverParLogin(login);
		Societe s = societeService.trouverParSlug(slug);
		int veri = Tool.verificationLien(u, s);
		
		if(veri == 1){
			model.addAttribute("link", "salarie");
			model.addAttribute("action", "ajouter");
			model.addAttribute("slug", slug);
			model.addAttribute("scte", s);
			
			
			
			return "scte/ajoutersalarier";
		}
		return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
	}
	
	@RequestMapping(value="/gerer-salaries/ajouter",method = RequestMethod.POST)
	public String ajouterSalarieSubmit(ModelMap model,@PathVariable("slug") String slug,
			HttpServletRequest req,
			@ModelAttribute("etatcivil") Etatcivile etatcivil,
			@ModelAttribute("immatriculation") Immatriculation immatriculation,
			@ModelAttribute("coordonneebancaire") Coordonneebancaire coordonneebancaire,
			@ModelAttribute("contrat") Contrat contrat,
			@ModelAttribute("paie") Paie paie,
			@ModelAttribute("affectation") Affectation affectation,
			@ModelAttribute("poste") Poste poste,
			@RequestParam("file") MultipartFile file
			){
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Utilisateur u = utilisateurService.trouverParLogin(login);
		Societe s = societeService.trouverParSlug(slug);
		int veri = Tool.verificationLien(u, s);
		
		if(veri == 1){
			try{
				model.addAttribute("link", "salarie");
				model.addAttribute("action", "ajouter");
				model.addAttribute("slug", slug);
				model.addAttribute("scte", s);
				//Date de naissance
				immatriculation.setDatenaissance(new DateTime(req.getParameter("_datenaissance")).toDate());
				immatriculationService.enregistrer(immatriculation);
				
				//contrat dates
				contrat.setDatedebut(new DateTime(req.getParameter("_datedebut")).toDate());
				contrat.setDatedefin(new DateTime(req.getParameter("_datedefin")).toDate());
				contrat.setDatedefinperiodeessai(new DateTime(req.getParameter("_datedefinperiodeessai")).toDate());
				contratService.enregistrer(contrat);
				
				//Poste 
				poste.setDateembauche(new DateTime(req.getParameter("_dateembauche")).toDate());
				poste.setAffectation(affectation);
				affectationService.enregistrer(affectation);
				posteService.enregistrer(poste);
				
				//coordonnéees bancaires
				coordonneebancaireService.enregistrer(coordonneebancaire);
				
				//etat civil
				etatcivilService.enregistrer(etatcivil);
				
				//Paie
				
				paieService.enregistrer(paie);
				
				
				Salarie salarie = new Salarie();
				salarie.setPaie(paie);
				salarie.setContrat(contrat);
				salarie.setCoordonneebancaire(coordonneebancaire);
				salarie.setEtatcivile(etatcivil);
				salarie.setPoste(poste);
				salarie.setImmatriculation(immatriculation);
				salarie.setSociete(s);
				String folderScte = s.compteDefaut().getLogin();
				String cheminSauvegarde = req.getServletContext().getInitParameter("documents-societes");
				cheminSauvegarde += folderScte+File.separator+"salaries";
				String cheminSalarie = Tool.NomDeDossierSalarie(etatcivil.getNom()+" "+etatcivil.getPrenom());
				cheminSauvegarde += File.separator+cheminSalarie;
				Fichier.creerDossier(cheminSauvegarde);
				salarie.setDossier(cheminSalarie);
				salarie.setImage(null);
				if(! file.isEmpty()){
					String logo = Fichier.uploder(file, "logo", cheminSauvegarde+File.separator+"images");
					salarie.setImage(logo);
					
				}
				salarieService.enregistrer(salarie);
				model.addAttribute("message", "Salarié ajouté");
			}catch(Exception e){
				System.out.println(e.getMessage());
				model.addAttribute("message", e.getMessage());
			}
			return "scte/ajoutersalarier";
		}
		return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
	}
	
	/*===========================================================*/
	@RequestMapping(value="/gerer-salaries/lister",method = RequestMethod.GET)
	public String listerSalarie(ModelMap model,@PathVariable("slug") String slug){
		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Utilisateur u = utilisateurService.trouverParLogin(login);
		Societe s = societeService.trouverParSlug(slug);
		int veri = Tool.verificationLien(u, s);
		
		if(veri == 1){
			model.addAttribute("link", "salarie");
			model.addAttribute("action", "lister");
			model.addAttribute("slug", slug);
			model.addAttribute("scte", s);
			return "scte/listersalarier";
		}
		return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
	}
	/*
	 * Consulter salarie
	 */
	@RequestMapping(value="/gerer-salaries/consulter-salarie/{idSalarie}",method = RequestMethod.GET)
	public String listerSalarieConsulter(ModelMap model,@PathVariable("slug") String slug,
			@PathVariable("idSalarie") Integer idSalarie){
		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Utilisateur u = utilisateurService.trouverParLogin(login);
		Societe s = societeService.trouverParSlug(slug);
		int veri = Tool.verificationLien(u, s);
		
		if(veri == 1){
			model.addAttribute("link", "salarie");
			model.addAttribute("action", "consulter");
			model.addAttribute("slug", slug);
			model.addAttribute("scte", s);
			Salarie r = s.recupererSalarie(idSalarie);
			model.addAttribute("title","Consultation|erreur");
			if(r != null)
				model.addAttribute("title",r.getEtatcivile().getPrenom()+" "+r.getEtatcivile().getNom());
			model.addAttribute("salarie",r);
			return "scte/consultersalarier";
		}
		return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
	}
	/*
	 * Modifier
	 */
	@RequestMapping(value="/gerer-salaries/modifier-salarie/{idSalarie}",method = RequestMethod.GET)
	public String modifiersalarie(ModelMap model,@PathVariable("slug") String slug,
			@PathVariable("idSalarie") Integer idSalarie){
		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Utilisateur u = utilisateurService.trouverParLogin(login);
		Societe s = societeService.trouverParSlug(slug);
		int veri = Tool.verificationLien(u, s);
		
		if(veri == 1){
			model.addAttribute("link", "salarie");
			model.addAttribute("action", "modifier");
			model.addAttribute("slug", slug);
			model.addAttribute("scte", s);
			Salarie r = s.recupererSalarie(idSalarie);
			model.addAttribute("title","Modification|erreur");
			if(r != null){
				model.addAttribute("title",r.getEtatcivile().getPrenom()+" "+r.getEtatcivile().getNom());
				model.addAttribute("etatcivil",r.getEtatcivile());
				model.addAttribute("immatriculation",r.getImmatriculation());
				model.addAttribute("coordonneebancaire",r.getCoordonneebancaire());
				model.addAttribute("paie",r.getPaie());
				model.addAttribute("poste",r.getPoste());
				model.addAttribute("affectation",r.getPoste().getAffectation());
				model.addAttribute("contrat",r.getContrat());
				model.addAttribute("paie",r.getPaie());
			}
			model.addAttribute("salarie",r);
			return "scte/modifiersalarier";
		}
		return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
	}
	
	@RequestMapping(value="/gerer-salaries/modifier-salarie/{idSalarie}",method = RequestMethod.POST)
	public String modifiersalarieSubmit(ModelMap model
			,@PathVariable("slug") String slug,
			@PathVariable("idSalarie") Integer idSalarie,
			HttpServletRequest req,
			@ModelAttribute("etatcivil") Etatcivile etatcivil,
			@ModelAttribute("immatriculation") Immatriculation immatriculation,
			@ModelAttribute("coordonneebancaire") Coordonneebancaire coordonneebancaire,
			@ModelAttribute("contrat") Contrat contrat,
			@ModelAttribute("paie") Paie paie,
			@ModelAttribute("affectation") Affectation affectation,
			@ModelAttribute("poste") Poste poste){
		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Utilisateur u = utilisateurService.trouverParLogin(login);
		Societe s = societeService.trouverParSlug(slug);
		int veri = Tool.verificationLien(u, s);
		
		if(veri == 1){
			model.addAttribute("link", "salarie");
			model.addAttribute("action", "modifier");
			model.addAttribute("slug", slug);
			model.addAttribute("scte", s);
			Salarie r = s.recupererSalarie(idSalarie);
			model.addAttribute("title","Modification|erreur");
			if(r != null){
				
				r.getPaie().setModepayement(paie.getModepayement());
				//Date de naissance
				immatriculation.setDatenaissance(new DateTime(req.getParameter("_datenaissance")).toDate());
				immatriculationService.enregistrer(immatriculation);
				
				//contrat dates
				contrat.setDatedebut(new DateTime(req.getParameter("_datedebut")).toDate());
				contrat.setDatedefin(new DateTime(req.getParameter("_datedefin")).toDate());
				contrat.setDatedefinperiodeessai(new DateTime(req.getParameter("_datedefinperiodeessai")).toDate());
				contratService.enregistrer(contrat);
				
				//Poste 
				poste.setDateembauche(new DateTime(req.getParameter("_dateembauche")).toDate());
				poste.setAffectation(affectation);
				affectationService.enregistrer(affectation);
				posteService.enregistrer(poste);
				
				//coordonnéees bancaires
				coordonneebancaireService.enregistrer(coordonneebancaire);
				
				//etat civil
				etatcivilService.enregistrer(etatcivil);
				
				//Paie
				
				paieService.enregistrer(r.getPaie());
				
				model.addAttribute("title",r.getEtatcivile().getPrenom()+" "+r.getEtatcivile().getNom());
				model.addAttribute("etatcivil",r.getEtatcivile());
				model.addAttribute("immatriculation",r.getImmatriculation());
				model.addAttribute("coordonneebancaire",r.getCoordonneebancaire());
				model.addAttribute("paie",r.getPaie());
				model.addAttribute("poste",r.getPoste());
				model.addAttribute("affectation",r.getPoste().getAffectation());
			}
			model.addAttribute("salarie",r);
			return "redirect:/societe/"+slug+"/gerer-salaries/consulter-salarie/"+idSalarie;
			//return "scte/modifiersalarier";
		}
		return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
	}
	
	
	/*
	 * Modification des informations du salarie par bloc (ajax)
	 */
	@RequestMapping(value="/gerer-salaries/modifier/{bloc}/{idObject}",method = RequestMethod.GET)
	public String modifierBlocsalarie(ModelMap model,
			@PathVariable("slug") String slug,
			@PathVariable("bloc") String bloc,
			@PathVariable("idObject") Integer idSalarie){
		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Utilisateur u = utilisateurService.trouverParLogin(login);
		Societe s = societeService.trouverParSlug(slug);
		int veri = Tool.verificationLien(u, s);
		
		if(veri == 1){
			
			if(bloc.equals("ajoutenfant")){
				model.addAttribute("titre", "Ajout d'un enfant");
				model.addAttribute("type", "ajoutenfant");
				model.addAttribute("ec", etatcivilService.trouverParId(idSalarie));
				
				model.addAttribute("url", "/societe/"+slug+"/gerer-salaries/modifier/"+bloc+"/"+idSalarie);
			}else if(bloc.equals("voirenfant")){
				model.addAttribute("titre", "Les enfants");
				model.addAttribute("ec", etatcivilService.trouverParId(idSalarie));
				model.addAttribute("type", "voirenfant");
			}
			else if(bloc.equals("document")){
				model.addAttribute("titre", "Les documents");
				model.addAttribute("type", "document");
			}
			
			return "scte/modificationbloc";
		}
		return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
	}
	@RequestMapping(value="/gerer-salaries/modifier/{bloc}/{idObject}",method = RequestMethod.POST)
	public String modifierBlocsalarieSubmit(ModelMap model,
			HttpServletRequest req,
			@PathVariable("slug") String slug,
			@PathVariable("bloc") String bloc,
			@PathVariable("idObject") Integer idSalarie,
			@ModelAttribute("enfant") Enfant enfant){
		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Utilisateur u = utilisateurService.trouverParLogin(login);
		Societe s = societeService.trouverParSlug(slug);
		int veri = Tool.verificationLien(u, s);
		
		if(veri == 1){
			
			if(bloc.equals("ajoutenfant")){
				Etatcivile ec = etatcivilService.trouverParId(idSalarie);
				enfant.setDatenaissance(new DateTime(req.getParameter("_datenaissance")).toDate());
				enfant.setEtatcivile(ec);
				Salarie sa = (Salarie) ec.getSalaries().toArray()[0];
				System.out.print(enfant);
				enfantService.enregistrer(enfant);
				 model = null;
				return "redirect:/societe/"+slug+"/gerer-salaries/consulter-salarie/"+sa.getSalarieId();
			}else if(bloc.equals("document")){
				model.addAttribute("titre", "Les documents");
				model.addAttribute("type", "document");
			}
			
			return "scte/modificationbloc";
		}
		return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
	}
	/*
	 * ===================================================================
	 */
	@RequestMapping(value="/gerer-les-salaries",method = RequestMethod.GET)
	public String  gererSalarie(ModelMap model,@PathVariable("slug") String slug){
		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Utilisateur u = utilisateurService.trouverParLogin(login);
		Societe s = societeService.trouverParSlug(slug);
		int veri = Tool.verificationLien(u, s);
		
		if(veri == 1){
			model.addAttribute("link", "salarie");
			model.addAttribute("slug", slug);
			model.addAttribute("scte", s);
			return "scte/geresalaries";
		}
		return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
		
	}
	
	/*--------------------------------------------------------------------------
	 * Affectation de baremes aux salaries
	 */
	@RequestMapping(value="/gerer-salaries/bareme-salarie/{idSalarie}",method = RequestMethod.GET)
	public String baremesalarie(ModelMap model,@PathVariable("slug") String slug,
			@PathVariable("idSalarie") Integer idSalarie){
		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Utilisateur u = utilisateurService.trouverParLogin(login);
		Societe s = societeService.trouverParSlug(slug);
		int veri = Tool.verificationLien(u, s);
		
		if(veri == 1){
			model.addAttribute("link", "salarie");
			model.addAttribute("action", "baremesalarie");
			model.addAttribute("slug", slug);
			model.addAttribute("scte", s);
			Salarie r = s.recupererSalarie(idSalarie);
			if(r == null)
				return "redirect:/erreur-lien?slug="+slug+"&code=1&id="+idSalarie;
			model.addAttribute("salarie",r);
			if(!r.baremeAjour())
				model.addAttribute("baremesO",r.getSociete().baremeObligatoires());
			return "scte/baremesalarier";
		}
		return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
	}
	
	@RequestMapping(value="/gerer-salaries/ajout-bareme-optionnel/{idSalarie}",method = RequestMethod.GET)
	public String baremesalarieOptionnel(ModelMap model,@PathVariable("slug") String slug,
			@PathVariable("idSalarie") Integer idSalarie){
		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Utilisateur u = utilisateurService.trouverParLogin(login);
		Societe s = societeService.trouverParSlug(slug);
		int veri = Tool.verificationLien(u, s);
		
		if(veri == 1){
			model.addAttribute("link", "salarie");
			model.addAttribute("action", "baremesalarie");
			model.addAttribute("slug", slug);
			model.addAttribute("scte", s);
			Salarie r = s.recupererSalarie(idSalarie);
			if(r == null)
				return "redirect:/erreur-lien?slug="+slug+"&code=1&id="+idSalarie;
			model.addAttribute("salarie",r);
			model.addAttribute("baremes",r.getSociete().baremePropres());
			model.addAttribute("type","ajout-bareme");
			model.addAttribute("url", "/societe/"+slug+"/gerer-salaries/ajout-bareme-optionnel/"+idSalarie);
			
			
			return "scte/modificationbloc";
		}
		return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
	}
	@RequestMapping(value="/gerer-salaries/ajout-bareme-optionnel/{idSalarie}",method = RequestMethod.POST)
	public String baremesalarieOptionnelSubmit(ModelMap model,@PathVariable("slug") String slug,
			@PathVariable("idSalarie") Integer idSalarie,
			HttpServletRequest req){
		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Utilisateur u = utilisateurService.trouverParLogin(login);
		Societe s = societeService.trouverParSlug(slug);
		int veri = Tool.verificationLien(u, s);
		
		if(veri == 1){
			Salarie r = s.recupererSalarie(idSalarie);
			if(r == null)
				return "redirect:/erreur-lien?slug="+slug+"&code=1&id="+idSalarie;
			try{
				//System.out.println(req.getParameter("code")+" \n "+req.getParameter("societebaremeId")+"\n "+r);
				Salariebareme sb = new Salariebareme();
				
				sb.setSalarie(r);
				
				sb.setSalarieId(
						req.getParameter("code")
						);
				
				//*
				sb.setSocietebareme(
						societebaremeService.trouverParId(
								Integer.parseInt(req.getParameter("societebaremeId"))
								)
						);
				//*/
				//System.out.print(sb);
				salariebaremeService.enregistrer(sb);
				return "redirect:/societe/"+slug+"/gerer-salaries/bareme-salarie/"+idSalarie;
			}catch(Exception e){
				System.out.println(e.getMessage());
				
			}
			return "scte/modificationbloc";
		}
		return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
	}
	
	/*
	 * ************************************
	 */
	
	/*
	 *  Les congés
	 */

	/*
	 * Modifier
	 */
	@RequestMapping(value="/gerer-salaries/conges-salarie/{idSalarie}",method = RequestMethod.GET)
	public String congessalarie(ModelMap model,@PathVariable("slug") String slug,
			@PathVariable("idSalarie") Integer idSalarie){
		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Utilisateur u = utilisateurService.trouverParLogin(login);
		Societe s = societeService.trouverParSlug(slug);
		int veri = Tool.verificationLien(u, s);
		DateTime today = new DateTime("2014-11-10");
		
		System.out.print("Today : "+today+" \nTomorrow : "+today.plusDays(1));
		if(veri == 1){
			model.addAttribute("link", "salarie");
			model.addAttribute("action", "conges");
			model.addAttribute("slug", slug);
			model.addAttribute("scte", s);
			Salarie r = s.recupererSalarie(idSalarie);
			if(r == null)
				return "redirect:/erreur-lien?slug="+slug+"&code=1&id="+idSalarie;
			model.addAttribute("salarie",r);
			model.addAttribute("date", new DateTime().toString("YYYY-MM-dd"));
			return "scte/congessalarier";
		}
		return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
	}
	@RequestMapping(value="/gerer-salaries/conges-salarie/{idSalarie}",method = RequestMethod.POST)
	public String congessalarieSubmit(ModelMap model,@PathVariable("slug") String slug,
			@PathVariable("idSalarie") Integer idSalarie,
			@ModelAttribute("conge") Conge conge
			){
		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String login = auth.getName();
		Utilisateur u = utilisateurService.trouverParLogin(login);
		Societe s = societeService.trouverParSlug(slug);
		int veri = Tool.verificationLien(u, s);
		
		if(veri == 1){
			Salarie r = s.recupererSalarie(idSalarie);
			if(r == null)
				return "redirect:/erreur-lien?slug="+slug+"&code=1&id="+idSalarie;
			conge.setSalarie(r);
			r.setNbrejour(r.getNbrejour() - conge.getJourtotal());
			congeService.enregistrer(conge);
			salarieService.enregistrer(r);
			System.out.println(conge);
			return "redirect:/societe/"+slug+"/gerer-salaries/conges-salarie/"+idSalarie;
		}
		return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
	}
	
	/*
	 * =============================================================================
	 */
	
	/*===================================================
	 * Gestion de société
	 */
	// VISUALISER SON COMPTE
		@RequestMapping(value={"/gerer-societe"},method = RequestMethod.GET)
		public String visualiserCompte(ModelMap model,@PathVariable("slug") String slug){
			
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String login = auth.getName();
			Utilisateur u = utilisateurService.trouverParLogin(login);
			Societe s = societeService.trouverParSlug(slug);
			int veri = Tool.verificationLien(u, s);
			
			if(veri == 1){
				model.addAttribute("link", "societe");
				model.addAttribute("action", "visualiser");
				model.addAttribute("slug", slug);
				model.addAttribute("scte", s);
				model.addAttribute("societe", s);
				return "scte/gerersociete";
			}
			return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
			
		}
		
		/*
		 * 		Les exercies d'une societe
		 */
			@RequestMapping(value="/gerer-societe/exercices",method = RequestMethod.GET)
			public String Exerciesociete(ModelMap model,
					@PathVariable("slug") String slugScte){
	
				
				Authentication auth = SecurityContextHolder.getContext().getAuthentication();
				String login = auth.getName();
				Utilisateur u = utilisateurService.trouverParLogin(login);
				Societe s = societeService.trouverParSlug(slugScte);
				int veri = Tool.verificationLien(u, s);
				
				if(veri == 1){
					model.addAttribute("link", "societe");
					model.addAttribute("action", "excercice");
					model.addAttribute("slug", slugScte);
					model.addAttribute("scte", s);
					model.addAttribute("societe", s);
					return "scte/exercicesociete";
				}
				return "redirect:/erreur-lien?slug="+slugScte+"&code="+veri;
			}
			@RequestMapping(value="/gerer-societe/exercices",method = RequestMethod.POST)
			public String ExerciesocieteSumit(ModelMap model,
					@PathVariable("slug") String slugScte,
					@ModelAttribute("exercice") Exercice exercice,
					HttpServletRequest req){
	
				
				Authentication auth = SecurityContextHolder.getContext().getAuthentication();
				String login = auth.getName();
				Utilisateur u = utilisateurService.trouverParLogin(login);
				Societe s = societeService.trouverParSlug(slugScte);
				int veri = Tool.verificationLien(u, s);
				
				if(veri == 1){
					
					try{
						DateTime dd = new DateTime(req.getParameter("_dateDebut"));
						DateTime df = new DateTime(req.getParameter("_dateFin"));
						exercice.setDateDebut(dd.toDate());
						exercice.setDateFin(df.toDate());
						exercice.setSociete(s);
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
					
					
					model.addAttribute("link", "societe");
					model.addAttribute("action", "excercice");
					model.addAttribute("slug", slugScte);
					model.addAttribute("scte", s);
					model.addAttribute("societe", s);
					return "scte/exercicesociete";
				}
				return "redirect:/erreur-lien?slug="+slugScte+"&code="+veri;
			}
			
			/*
			 * FIN EXERCICES
			 * =============================================================================
			 */
			/*
			 * modifier information de la societe
			 */
			@RequestMapping(value="/gerer-societe/modifier",method = RequestMethod.GET)
			public String Modifiersociete(ModelMap model,
					@PathVariable("slug") String slugScte){
	
				
				Authentication auth = SecurityContextHolder.getContext().getAuthentication();
				String login = auth.getName();
				Utilisateur u = utilisateurService.trouverParLogin(login);
				Societe s = societeService.trouverParSlug(slugScte);
				int veri = Tool.verificationLien(u, s);
				
				if(veri == 1){
					model.addAttribute("link", "societe");
					model.addAttribute("action", "modifier");
					model.addAttribute("slug", slugScte);
					model.addAttribute("scte", s);
					model.addAttribute("societe", s);
					return "scte/modifiersociete";
				}
				return "redirect:/erreur-lien?slug="+slugScte+"&code="+veri;
			}
			
			@RequestMapping(value="/gerer-societe/modifier",method = RequestMethod.POST)
			public String Modifiersocietesubmit(ModelMap model,
					@PathVariable("slug") String slugScte,
					@RequestParam("file") MultipartFile file,
					HttpServletRequest request,
					@ModelAttribute("societe") Societe societe){
	
				
				Authentication auth = SecurityContextHolder.getContext().getAuthentication();
				String login = auth.getName();
				Utilisateur u = utilisateurService.trouverParLogin(login);
				Societe s = societeService.trouverParSlug(slugScte);
				int veri = Tool.verificationLien(u, s);
				
				if(veri == 1){
					
					societe.setSocieteId(s.getSocieteId());
					societe.setDateajout(s.getDateajout());
					societe.setLogo(s.getLogo());
					societe.setSlug(Tool.creerSlug(societe.getIntituleSociete()).toLowerCase());
					
					if(!file.isEmpty()){
						String cheminSauvegarde = request.getServletContext().getInitParameter("documents-societes");
						String logi = s.compteDefaut().getLogin();
						cheminSauvegarde += logi+File.separator+"logos";
						String nameL = "logo"+Tool.listFilesForFolder(new File(cheminSauvegarde));
						String logo = Fichier.uploder(file, nameL, cheminSauvegarde);
						if(!logo.equals("ERROR"))
						societe.setLogo(logo);
					}
					
					societeService.enregistrer(societe);
					s  = societe;
					model.addAttribute("link", "societe");
					model.addAttribute("action", "modifier");
					model.addAttribute("slug", s.getSlug());
					model.addAttribute("scte", s);
					model.addAttribute("societe", s);
					return "redirect:/societe/"+s.getSlug()+"/gerer-societe/modifier";
					
				}
				return "redirect:/erreur-lien?slug="+slugScte+"&code="+veri;
			}
			
			/*
			 * ======================================================================
			 */
			/*
			 * GERER LES COMPTES
			 */
		@RequestMapping(value="/gerer-societe/comptes",method = RequestMethod.GET)
		public String modifiercompte(ModelMap model,@PathVariable("slug") String slug){
			
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String login = auth.getName();
			Utilisateur u = utilisateurService.trouverParLogin(login);
			Societe s = societeService.trouverParSlug(slug);
			int veri = Tool.verificationLien(u, s);
			
			if(veri == 1){
				model.addAttribute("link", "societe");
				model.addAttribute("action", "compte");
				model.addAttribute("title", "modification de compte");
				model.addAttribute("scte", s);
				model.addAttribute("societe", s);
				model.addAttribute("compte", u);
				return "scte/gerercompte";
			}
			return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
		}
		/*
		 * ajouter un nouvel un compte
		 */
		@RequestMapping(value="/gerer-societe/comptes/ajouter",method = RequestMethod.POST)
		public String Ajoutercompte(ModelMap model,@PathVariable("slug") String slug,
				HttpServletRequest req,
				@ModelAttribute("utilisateur") Utilisateur utilisateur){
			
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String login = auth.getName();
			Utilisateur u = utilisateurService.trouverParLogin(login);
			Societe s = societeService.trouverParSlug(slug);
			int veri = Tool.verificationLien(u, s);
			
			if(veri == 1){
				model.addAttribute("link", "societe");
				model.addAttribute("action", "compte");
				model.addAttribute("scte", s);
				model.addAttribute("societe", s);
				model.addAttribute("compte", u);
				utilisateur.setSociete(s);
				utilisateur.setRole(roleService.trouverParNUm(3));
				try{
					utilisateur.setMotdepasse(PassWord.hacher(utilisateur.getMotdepasse()));
					
					utilisateurService.enregistrer(utilisateur);
					
					model.addAttribute("message", "Compte ajouté");
				}catch(Exception e){
					model.addAttribute("message", "Erreur : "+e.getMessage());
				}
				return "redirect:/societe/"+slug+"/gerer-societe/comptes";
			}
			return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
		}
		/*=============================================================*/
		/*
		 * Gestion des barèmes
		 */
		//Envoyer un bareme a l'administrateur
		@RequestMapping(value="/gerer-baremes/envoyer",method = RequestMethod.GET)
		public String envoyerbareme(ModelMap model,@PathVariable("slug") String slug){
			
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String login = auth.getName();
			Utilisateur u = utilisateurService.trouverParLogin(login);
			Societe s = societeService.trouverParSlug(slug);
			int veri = Tool.verificationLien(u, s);
			
			if(veri == 1){
				model.addAttribute("link", "bareme");
				model.addAttribute("action", "envoyer");
				model.addAttribute("scte", s);
				model.addAttribute("societe", s);
				model.addAttribute("compte", u);
				
				return "scte/envoyerbareme";
			}
			return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
		}
		//Envoyer un bareme a l'administrateur
				@RequestMapping(value="/gerer-baremes/envoyer",method = RequestMethod.POST)
				public String envoyerbaremeSubmit(ModelMap model,@PathVariable("slug") String slug,
						@ModelAttribute("message") Message message){
					
					Authentication auth = SecurityContextHolder.getContext().getAuthentication();
					String login = auth.getName();
					Utilisateur u = utilisateurService.trouverParLogin(login);
					Societe s = societeService.trouverParSlug(slug);
					int veri = Tool.verificationLien(u, s);
					
					if(veri == 1){
						message.setUtilisateurByDestinataire(utilisateurService.trouverParLogin("admin"));
						message.setUtilisateurByEmetteur(u);
						message.setDate(new DateTime().toDate());
						System.out.println(message);
						return "redirect:/societe/"+slug+"/gerer-baremes/envoyer";
					}
					return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
				}
		
		//Envoyer un bareme a l'administrateur
				@RequestMapping(value="/boite-de-reception",method = RequestMethod.GET)
				public String boitereception(ModelMap model,@PathVariable("slug") String slug,HttpServletRequest req){
					
					Authentication auth = SecurityContextHolder.getContext().getAuthentication();
					String login = auth.getName();
					Utilisateur u = utilisateurService.trouverParLogin(login);
					Societe s = societeService.trouverParSlug(slug);
					int veri = Tool.verificationLien(u, s);
					
					if(veri == 1){
						String rubrique = "boite-de-reception";
						model.addAttribute("link", "boitereception");
						model.addAttribute("scte", s);
						model.addAttribute("societe", s);
						model.addAttribute("compte", u);
						try{
							rubrique = req.getParameter("rubrique");
							rubrique = rubrique != null ? rubrique : "boite-de-reception";
							
						}catch(Exception e){
						}
						model.addAttribute("title", rubrique);
						model.addAttribute("rubrique", rubrique);
						
						return "scte/boitereception";
					}
					return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
				}
		//Envoyer un bareme a l'administrateur
				@RequestMapping(value="/gerer-bareme/information",method = RequestMethod.GET)
				public String informationbareme(ModelMap model,@PathVariable("slug") String slug){
					
					Authentication auth = SecurityContextHolder.getContext().getAuthentication();
					String login = auth.getName();
					Utilisateur u = utilisateurService.trouverParLogin(login);
					Societe s = societeService.trouverParSlug(slug);
					int veri = Tool.verificationLien(u, s);
					
					if(veri == 1){
						model.addAttribute("link", "bareme");
						model.addAttribute("action", "information");
						model.addAttribute("scte", s);
						model.addAttribute("societe", s);
						model.addAttribute("compte", u);
						
						return "scte/detailsbareme";
					}
					return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
				}
		
		/*
		 * Fin gestion barèmes
		 * ==================================---------------***************
		 */
		/*
		 * Gestion des cotisation
		 */
		//CNSS
		@RequestMapping(value="/gerer-cotisation/cnss",method = RequestMethod.GET)
		public String gerercotisationcnss(ModelMap model,@PathVariable("slug") String slug){
			
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String login = auth.getName();
			Utilisateur u = utilisateurService.trouverParLogin(login);
			Societe s = societeService.trouverParSlug(slug);
			int veri = Tool.verificationLien(u, s);
			
			if(veri == 1){
				model.addAttribute("link", "cotisation");
				model.addAttribute("action", "cnss");
				model.addAttribute("scte", s);
				model.addAttribute("societe", s);
				model.addAttribute("compte", u);
				
				return "scte/gerercotisationcnss";
			}
			return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
		}
		//Patronale
				@RequestMapping(value="/gerer-cotisation/patronale",method = RequestMethod.GET)
				public String gerercotisationparonale(ModelMap model,@PathVariable("slug") String slug){
					
					Authentication auth = SecurityContextHolder.getContext().getAuthentication();
					String login = auth.getName();
					Utilisateur u = utilisateurService.trouverParLogin(login);
					Societe s = societeService.trouverParSlug(slug);
					int veri = Tool.verificationLien(u, s);
					
					if(veri == 1){
						model.addAttribute("link", "cotisation");
						model.addAttribute("action", "patronale");
						model.addAttribute("scte", s);
						model.addAttribute("societe", s);
						model.addAttribute("compte", u);
						
						return "scte/gerercotisationpatronale";
					}
					return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
				}
				//Autre cotisation
				@RequestMapping(value="/gerer-cotisation/autre-cotisation",method = RequestMethod.GET)
				public String gerercotisationautre(ModelMap model,@PathVariable("slug") String slug){
					
					Authentication auth = SecurityContextHolder.getContext().getAuthentication();
					String login = auth.getName();
					Utilisateur u = utilisateurService.trouverParLogin(login);
					Societe s = societeService.trouverParSlug(slug);
					int veri = Tool.verificationLien(u, s);
					
					if(veri == 1){
						model.addAttribute("link", "cotisation");
						model.addAttribute("action", "autre-cotisation");
						model.addAttribute("scte", s);
						model.addAttribute("societe", s);
						model.addAttribute("compte", u);
						
						return "scte/gerercotisationautrecotisation";
					}
					return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
				}
				//Etat cotisation
				@RequestMapping(value="/gerer-cotisation/etat-cotisation",method = RequestMethod.GET)
				public String gerercotisationetatcotisation(ModelMap model,@PathVariable("slug") String slug){
					
					Authentication auth = SecurityContextHolder.getContext().getAuthentication();
					String login = auth.getName();
					Utilisateur u = utilisateurService.trouverParLogin(login);
					Societe s = societeService.trouverParSlug(slug);
					int veri = Tool.verificationLien(u, s);
					
					if(veri == 1){
						model.addAttribute("link", "cotisation");
						model.addAttribute("action", "etat-cotisation");
						model.addAttribute("scte", s);
						model.addAttribute("societe", s);
						model.addAttribute("compte", u);
						
						return "scte/gerercotisationetatcotisation";
					}
					return "redirect:/erreur-lien?slug="+slug+"&code="+veri;
				}
		/*
		 * =============================================================
		 */
	
	
	
}
