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

	@Autowired
	private UserCredentialsService credentialsService;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String listMembers(Model model) {
		model.addAttribute("members", personService.findAll());
		return "members";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String getMemberById(@PathVariable("id") Long id, Model model) {
		Person member = personService.findOne(id);
		model.addAttribute("member", member);

		return "member";
	}

	@RequestMapping(value = "/number/{id}", method = RequestMethod.GET)
	public String getMemberByMemberNumber(@PathVariable("id") Long id, Model model) {
		Person member = personService.findById(id);
		model.addAttribute("member", member);

		return "member";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String getAddNewMemberForm(@ModelAttribute("newMember") Person newMember) {
		return "addMember";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String processAddNewMemberForm(@ModelAttribute("newMember") @Valid Person memberToBeAdded,
			BindingResult result) {

		if (result.hasErrors()) {
			return "addMember";
		}

		// Error caught by ControllerAdvice IF no authorization...
		personService.saveFull(memberToBeAdded);

		return "redirect:/persons";

	}

}
