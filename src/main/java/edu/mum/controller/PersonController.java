package edu.mum.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.domain.Person;
import edu.mum.service.PersonService;
import edu.mum.service.UserCredentialsService;

@Controller
@RequestMapping({ "/persons" })
public class PersonController {

	@Autowired
	private PersonService personService;

	@SuppressWarnings("unused")
	@Autowired
	private UserCredentialsService credentialsService;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String listMembers(Model model) {
		model.addAttribute("persons", personService.findAll());
		return "persons";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String getMemberById(@PathVariable("id") Long id, Model model) {
		Person person = personService.findOne(id);
		model.addAttribute("person", person);

		return "person";
	}

	@RequestMapping(value = "/number/{id}", method = RequestMethod.GET)
	public String getMemberByMemberNumber(@PathVariable("id") Long id, Model model) {
		Person person = personService.findById(id);
		model.addAttribute("person", person);

		return "person";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String getAddNewMemberForm(@ModelAttribute("newPerson") Person newPerson) {
		return "addPerson";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String processAddNewMemberForm(@ModelAttribute("newPerson") @Valid Person memberToBeAdded,
			BindingResult result) {

		if (result.hasErrors()) {
			return "addPerson";
		}

		// Error caught by ControllerAdvice IF no authorization...
		personService.saveFull(memberToBeAdded);

		return "redirect:/persons";

	}

}
