package com.gp.domain;

// Generated 24 oct. 2014 14:33:53 by Hibernate Tools 3.4.0.CR1

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

/**
 * Compagnie generated by hbm2java
 */
@Entity
@Table(name = "compagnie", catalog = "gp")
public class Compagnie implements java.io.Serializable {

	private Integer compagnieId;
	private String nom;
	private String description;
	private Set<Bareme> baremes = new HashSet<Bareme>(0);

	public Compagnie() {
	}

	public Compagnie(String nom, String description) {
		this.nom = nom;
		this.description = description;
	}

	public Compagnie(String nom, String description, Set<Bareme> baremes) {
		this.nom = nom;
		this.description = description;
		this.baremes = baremes;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "compagnieID", unique = true, nullable = false)
	public Integer getCompagnieId() {
		return this.compagnieId;
	}

	public void setCompagnieId(Integer compagnieId) {
		this.compagnieId = compagnieId;
	}

	@Column(name = "nom", nullable = false)
	public String getNom() {
		return this.nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	@Column(name = "description", nullable = true, length = 65535)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "compagnie")
	public Set<Bareme> getBaremes() {
		return this.baremes;
	}

	public void setBaremes(Set<Bareme> baremes) {
		this.baremes = baremes;
	}

}
