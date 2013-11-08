package fr.contactmanager.model;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class Contact {
	private String Nom, Prenom, Email;
	private Date DateNaissance;
	private boolean Actif = false;
	private Adresse AdresseFacturation;
	private Map<Integer, Adresse> AdressesLivraison = new HashMap<Integer, Adresse>();
	
	public String getNom() {
		return Nom;
	}
	
	public void setNom(String nom) {
		Nom = nom;
	}
	
	public String getPrenom() {
		return Prenom;
	}
	
	public void setPrenom(String prenom) {
		Prenom = prenom;
	}
	
	public String getEmail() {
		return Email;
	}
	
	public void setEmail(String email) {
		Email = email;
	}
	
	public Date getDateNaissance() {
		return DateNaissance;
	}
	
	public void setDateNaissance(Date dateNaissance) {
		DateNaissance = dateNaissance;
	}
	
	public boolean isActif() {
		return Actif;
	}
	
	public void setActif(boolean actif) {
		Actif = actif;
	}
	
	public Adresse getAdresseFacturation() {
		return AdresseFacturation;
	}

	public void setAdresseFacturation(Adresse adresseFacturation) {
		AdresseFacturation = adresseFacturation;
	}
	
	public Map<Integer, Adresse> getAdressesLivraison() {
		return AdressesLivraison;
	}

	public void setAdressesLivraison(Map<Integer, Adresse> adressesLivraison) {
		AdressesLivraison = adressesLivraison;
	}
	

}
