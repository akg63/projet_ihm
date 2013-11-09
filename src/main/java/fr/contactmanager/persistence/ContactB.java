package fr.contactmanager.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import fr.contactmanager.model.Adresse;
import fr.contactmanager.model.Contact;

public class ContactB extends Contact {
	
	private static Map<Integer, Adresse> Adresses = new HashMap<Integer, Adresse>();
	static {
		Adresses.put(0, new AdresseBB());
		Adresses.put(1, new AdresseBC());
	}
	
	ContactB() {
		setNom("Desnoyers");
		setPrenom("Clémence");
		setEmail("ClemenceDesnoyers@armyspy.com");
		setDateNaissance(new Date());
		setActif(true);
		setAdresseFacturation(new AdresseBA());
		setAdressesLivraison(Adresses);
	}

}