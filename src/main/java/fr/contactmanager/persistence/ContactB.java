package fr.contactmanager.persistence;

import java.util.Date;

import fr.contactmanager.model.Contact;

public class ContactB extends Contact {
	
	ContactB() {
		setNom("Desnoyers");
		setPrenom("Paige");
		setEmail("PaigeDesnoyers@armyspy.com");
		setDateNaissance(new Date());
		setActif(true);
	}

}