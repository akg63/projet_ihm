package fr.contactmanager.persistence;

import java.util.Date;

import fr.contactmanager.model.Contact;

public class ContactA extends Contact {
	
	ContactA() {
		setNom("Caouette");
		setPrenom("Thomas");
		setEmail("ThomasCaouette@jourrapide.com");
		setDateNaissance(new Date());
		setActif(false);
		setAdresseFacturation(new AdresseAA());
	}

}
