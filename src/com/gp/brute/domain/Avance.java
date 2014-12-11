package com.gp.brute.domain;

// Generated 11 d�c. 2014 16:25:59 by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Avance generated by hbm2java
 */
@Entity
@Table(name = "avance", catalog = "gp")
public class Avance implements java.io.Serializable {

	private Integer avanceId;
	private Exercice exercice;
	private Salarie salarie;
	private float montant;
	private String motif;
	private int mois;
	private Date date;

	public Avance() {
	}

	public Avance(Exercice exercice, Salarie salarie, float montant,
			String motif, int mois, Date date) {
		this.exercice = exercice;
		this.salarie = salarie;
		this.montant = montant;
		this.motif = motif;
		this.mois = mois;
		this.date = date;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "avanceID", unique = true, nullable = false)
	public Integer getAvanceId() {
		return this.avanceId;
	}

	public void setAvanceId(Integer avanceId) {
		this.avanceId = avanceId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "exercice", nullable = false)
	public Exercice getExercice() {
		return this.exercice;
	}

	public void setExercice(Exercice exercice) {
		this.exercice = exercice;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "salarie", nullable = false)
	public Salarie getSalarie() {
		return this.salarie;
	}

	public void setSalarie(Salarie salarie) {
		this.salarie = salarie;
	}

	@Column(name = "montant", nullable = false, precision = 12, scale = 0)
	public float getMontant() {
		return this.montant;
	}

	public void setMontant(float montant) {
		this.montant = montant;
	}

	@Column(name = "motif", nullable = false, length = 65535)
	public String getMotif() {
		return this.motif;
	}

	public void setMotif(String motif) {
		this.motif = motif;
	}

	@Column(name = "mois", nullable = false)
	public int getMois() {
		return this.mois;
	}

	public void setMois(int mois) {
		this.mois = mois;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "date", nullable = false, length = 10)
	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}