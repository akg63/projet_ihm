package fr.contactmanager.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import fr.contactmanager.model.Adresse;
import fr.contactmanager.model.Contact;

public class ContactA extends Contact {
	
	private static Map<Integer, Adresse> Adresses = new HashMap<Integer, Adresse>();
	static {
		Adresses.put(0, new AdresseAB());
		Adresses.put(1, new AdresseAC());
	}
	
	ContactA() {
		setNom("Caouette");
		setPrenom("Thomas");
		setEmail("ThomasCaouette@jourrapide.com");
		setDateNaissance(new Date());
		setActif(false);
		setAdresseFacturation(new AdresseAA());
		setAdressesLivraison(Adresses);
	}

}
