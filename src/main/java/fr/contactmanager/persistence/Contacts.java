package fr.contactmanager.persistence;

import java.util.HashMap;
import java.util.Map;

import fr.contactmanager.model.Contact;

public class Contacts {

	public static Map<Integer, Contact> Contacts = new HashMap<Integer, Contact>();
	static {
		Contacts.put(0, new ContactA());
		Contacts.put(1, new ContactB());
	}
	
	private Contacts() {}
	
	

}
