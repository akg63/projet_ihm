package fr.contactmanager.controller;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import fr.contactmanager.model.Adresse;
import fr.contactmanager.model.Contact;
import fr.contactmanager.persistence.Contacts;

@Controller
@RequestMapping("show/{contactId}/")
@SessionAttributes("contacts")
public class AdressController {


	@RequestMapping(value="invoicing", method = RequestMethod.GET)
	public String editInvoicingForm(@PathVariable int contactId, ModelMap model) {
		
		Contact contact = Contacts.Contacts.get(new Integer(contactId));
		model.addAttribute("adresse", new Adresse());
		model.addAttribute("contactId", contactId);
		model.addAttribute("contact", contact);
		model.addAttribute("message", "l'adresse de facturation");
		return "edit_adress";
	}
	
	@RequestMapping(value="invoicing", method = RequestMethod.POST)
	public String editInvoicingSubmit(@PathVariable int contactId, @ModelAttribute Adresse adresse, ModelMap model) {

		Contact contact = Contacts.Contacts.get(new Integer(contactId));
		contact.setAdresseFacturation(adresse);
		return "redirect:";
	}
	
	@RequestMapping(value="new_delivery", method = RequestMethod.GET)
	public String newDeliveryForm(@PathVariable int contactId, ModelMap model) {
		
		Contact contact = Contacts.Contacts.get(new Integer(contactId));
		model.addAttribute("adresse", new Adresse());
		model.addAttribute("contactId", contactId);
		model.addAttribute("contact", contact);
		model.addAttribute("message", "une adresse de livraison");
		return "new_adress";
	}
	
	@RequestMapping(value="new_delivery", method = RequestMethod.POST)
	public String newDeliverySubmit(@PathVariable int contactId, @ModelAttribute Adresse adresse, ModelMap model) {
		
		Contact contact = Contacts.Contacts.get(new Integer(contactId));
		Integer position = new Integer(contact.getAdressesLivraison().size());
		Map<Integer, Adresse> adressesLivraison = contact.getAdressesLivraison();
		
		adressesLivraison.put(position, adresse);
		return "redirect:";
	}
	
	@RequestMapping(value="edit_delivery/{adresseId}", method = RequestMethod.GET)
	public String editDeliveryForm(@PathVariable int contactId, @PathVariable int adresseId, ModelMap model) {
		
		Contact contact = Contacts.Contacts.get(new Integer(contactId));
		Adresse adresse = contact.getAdressesLivraison().get(new Integer(adresseId));
		
		model.addAttribute("adresse", adresse);
		model.addAttribute("contactId", contactId);
		model.addAttribute("contact", contact);
		model.addAttribute("message", "une adresse de livraison");
		return "edit_adress";
	}
	
	@RequestMapping(value="edit_delivery/{adresseId}", method = RequestMethod.POST)
	public String editDeliverySubmit(@PathVariable int contactId, @PathVariable int adresseId, @ModelAttribute Adresse adresse, ModelMap model) {
		
		Contact contact = Contacts.Contacts.get(new Integer(contactId));
		Integer position = new Integer(adresseId);
		
		contact.getAdressesLivraison().put(position, adresse);
		return "redirect:/show/{contactId}/";
	}
	
	@RequestMapping(value ="remove_delivery/{adresseId}", method = RequestMethod.GET)
	public String deleteDelivery(@PathVariable int contactId, @PathVariable int adresseId, Model model) {
		
		Contact contact = Contacts.Contacts.get(new Integer(contactId));
		contact.getAdressesLivraison().remove(new Integer(adresseId));
		
		//Réorganisation des clés de manière successive :
		Set<Entry<Integer, Adresse>> couples = contact.getAdressesLivraison().entrySet();
		Iterator<Entry<Integer, Adresse>> it = couples.iterator();
		
		while(it.hasNext()) {
			Entry<Integer, Adresse> item = it.next();
			int intKey = item.getKey().intValue();
			if(intKey > adresseId) {
				it.remove();
				contact.getAdressesLivraison().put(new Integer(intKey - 1), item.getValue());
			}
		}
		
		return "redirect:/show/{contactId}/";
	}
	
}
