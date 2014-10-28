package com.gp.domainnews;

// Generated 28 oct. 2014 18:00:34 by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Immatriculation generated by hbm2java
 */
@Entity
@Table(name = "immatriculation", catalog = "gp")
public class Immatriculation implements java.io.Serializable {

	private Integer immatriculationId;
	private String adresse;
	private String cin;
	private String cnss;
	private Date datenaissance;
	private String mail;
	private String nationalite;
	private String pays;
	private String ville;
	private Set<Salarie> salaries = new HashSet<Salarie>(0);

	public Immatriculation() {
	}

	public Immatriculation(String adresse, String cin, String cnss,
			Date datenaissance, String mail, String nationalite, String pays,
			String ville, Set<Salarie> salaries) {
		this.adresse = adresse;
		this.cin = cin;
		this.cnss = cnss;
		this.datenaissance = datenaissance;
		this.mail = mail;
		this.nationalite = nationalite;
		this.pays = pays;
		this.ville = ville;
		this.salaries = salaries;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "immatriculationID", unique = true, nullable = false)
	public Integer getImmatriculationId() {
		return this.immatriculationId;
	}

	public void setImmatriculationId(Integer immatriculationId) {
		this.immatriculationId = immatriculationId;
	}

	@Column(name = "adresse")
	public String getAdresse() {
		return this.adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	@Column(name = "cin")
	public String getCin() {
		return this.cin;
	}

	public void setCin(String cin) {
		this.cin = cin;
	}

	@Column(name = "cnss")
	public String getCnss() {
		return this.cnss;
	}

	public void setCnss(String cnss) {
		this.cnss = cnss;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "datenaissance", length = 10)
	public Date getDatenaissance() {
		return this.datenaissance;
	}

	public void setDatenaissance(Date datenaissance) {
		this.datenaissance = datenaissance;
	}

	@Column(name = "mail")
	public String getMail() {
		return this.mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	@Column(name = "nationalite")
	public String getNationalite() {
		return this.nationalite;
	}

	public void setNationalite(String nationalite) {
		this.nationalite = nationalite;
	}

	@Column(name = "pays")
	public String getPays() {
		return this.pays;
	}

	public void setPays(String pays) {
		this.pays = pays;
	}

	@Column(name = "ville")
	public String getVille() {
		return this.ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "immatriculation")
	public Set<Salarie> getSalaries() {
		return this.salaries;
	}

	public void setSalaries(Set<Salarie> salaries) {
		this.salaries = salaries;
	}

}
