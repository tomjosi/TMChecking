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
import edu.mum.domain.Session;
import edu.mum.service.PersonService;
import edu.mum.service.SessionService;

@Controller
@RequestMapping({ "/sessions" })
public class SessionController {

	@Autowired
	private SessionService sessionService;

	@Autowired
	private PersonService personService;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String listSessions(Model model) {
		model.addAttribute("sessions", sessionService.findAll());
		return "sessions/sessions";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String getSessionById(@PathVariable("id") Long id, Model model) {
		Session session = sessionService.findOne(id);
		model.addAttribute("session", session);

		return "sessions/session";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.POST)
	public String updateSession(@PathVariable("id") Long id, @Valid Session updateSession, BindingResult result) {
		if (result.hasErrors()) {
			return "sessions/session";
		}

		long personID = 3;

		Person person = personService.findOne(personID);

		// Error caught by ControllerAdvice IF no authorization...
		updateSession.setPerson(person);

		sessionService.save(updateSession);
		return "redirect:/sessions";
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String getAddNewSessionForm(@ModelAttribute("session") Session session, Model model) {
		model.addAttribute("session", session);
		return "sessions/create";
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public String deleteSession(@PathVariable("id") Long id) {
		sessionService.deleteById(id);

		return "redirect:/sessions";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String processAddNewSessionForm(@ModelAttribute("session") @Valid Session session, BindingResult result) {

		if (result.hasErrors()) {
			return "sessions/create";
		}

		long id = 3;

		Person person = personService.findOne(id);

		// Error caught by ControllerAdvice IF no authorization...
		session.setPerson(person);
		sessionService.save(session);

		return "redirect:/sessions";

	}

}
