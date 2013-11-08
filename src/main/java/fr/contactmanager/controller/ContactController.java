package fr.contactmanager.controller;

import java.util.Date;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import fr.contactmanager.model.Contact;
import fr.contactmanager.persistence.Contacts;

@Controller
@RequestMapping("/")
@SessionAttributes("contacts")
public class ContactController {
	
	enum fieldType { Actif, Nom, Prenom, Email, DateNaissance }
	
	@RequestMapping(value="", method = RequestMethod.GET)
	public String index(ModelMap model) {
		
		model.addAttribute("contacts", Contacts.Contacts);
		return "index";
	}
	
    @RequestMapping(value="new", method = RequestMethod.GET)
    public String newContactForm(Model model) {
    	
        model.addAttribute("contact", new Contact());
        return "new_contact";
    }
    
	@RequestMapping(value="new", method = RequestMethod.POST)
	public String newContactSubmit(@ModelAttribute Contact contact, BindingResult result, Model model) {
		
		/*
		 Integer position = null;
		for(int i=0; i<=Integer.MAX_VALUE; i++) {
			if(!Contacts.Contacts.containsKey(new Integer(i))) {
				position = new Integer(i);
				break;
			}
		}
		 */
		Integer position = new Integer(Contacts.Contacts.size());
		Contacts.Contacts.put(position, contact);
		return "redirect:";
 
	}
	
	@RequestMapping(value="show/{contactId}", method = RequestMethod.GET)
	public String showContact(@PathVariable int contactId, ModelMap model) {
		
		Contact contact = Contacts.Contacts.get(new Integer(contactId));
		model.addAttribute("contact", contact);
		model.addAttribute("contactId", contactId);
		
		return "show_contact";
 
	}
	
	@RequestMapping(value = "edit/{contactId}/{fieldType}", method = RequestMethod.GET)
	public String editContactForm(@PathVariable int contactId, @PathVariable String fieldType, ModelMap model) {
		
		Contact contact = Contacts.Contacts.get(new Integer(contactId));
		model.addAttribute("contact", contact);
		model.addAttribute("contactId", contactId);
		model.addAttribute("fieldType", fieldType);
		
		return "edit_contact";
 
	}
	
	@RequestMapping(value = "edit/{contactId}/{fieldType}", method = RequestMethod.POST)
	public String editContactSubmit(@PathVariable int contactId, @PathVariable String fieldType, @ModelAttribute Contact contact, ModelMap model) {
		
		//Modification en fonction de l'attribut concerné
		switch(ContactController.fieldType.valueOf(fieldType)) {
		case Actif:
			Contacts.Contacts.get(contactId).setActif((Boolean) contact.isActif());
			break;
		case Nom:
			Contacts.Contacts.get(contactId).setNom((String) contact.getNom());
			break;
		case Prenom:
			Contacts.Contacts.get(contactId).setPrenom((String) contact.getPrenom());
			break;
		case Email:
			Contacts.Contacts.get(contactId).setEmail((String) contact.getEmail());
			break;
		case DateNaissance:
			//Contacts.Contacts.get(contactId).setDateNaissance((Date) contact.getDateNaissance());
			break;
		}
		
		return "redirect:/show/" + contactId;
	}
	
	@RequestMapping(value = "delete/{contactId}", method = RequestMethod.GET)
	public String deleteContact(@PathVariable int contactId, Model model) {
		
		Contacts.Contacts.remove(new Integer(contactId));
		
		//Réorganisation des clés de manière successive :
		Set<Entry<Integer, Contact>> couples = Contacts.Contacts.entrySet();
		Iterator<Entry<Integer, Contact>> it = couples.iterator();
		
		while(it.hasNext()) {
			Entry<Integer, Contact> item = it.next();
			int intKey = item.getKey().intValue();
			if(intKey > contactId) {
				it.remove();
				Contacts.Contacts.put(new Integer(intKey - 1), item.getValue());
			}
		}
		
		return "redirect:/";
	}


}
