package edu.mum.controller;

import java.security.Principal;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.mum.domain.Appointment;
import edu.mum.domain.Person;
import edu.mum.domain.Session;
import edu.mum.service.AppointmentService;
import edu.mum.service.PersonService;
import edu.mum.service.SessionService;

@Controller
@RequestMapping({ "/appointments" })
public class AppointmentController {

	@Autowired
	private AppointmentService appointmentService;

	@Autowired
	private SessionService sessionService;

	@Autowired
	private PersonService personService;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String listAppointments(Model model, Principal principal) {
		Person customer = personService.findByUsername(principal.getName());
		model.addAttribute("customer", customer);

		return "appointments/index";
	}

	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public String listAllAppointments(Model model) {
		model.addAttribute("appointments", appointmentService.findAll());

		return "appointments/all";
	}

	@RequestMapping(value = "/cancel/{id}", method = RequestMethod.GET)
	public String cancelAppointment(@PathVariable("id") Long id, HttpServletRequest request) {
		appointmentService.deleteById(id);

		String referer = request.getHeader("Referer");

		return "redirect:" + referer;

		// return "redirect:/appointments";
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String getAddNewAppointmentForm(@ModelAttribute("appointment") Appointment appointment, Model model) {
		model.addAttribute("sessions", sessionService.findAll());

		return "appointments/create";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String processAddNewAppointmentForm(@ModelAttribute("appointment") @Valid Appointment appointment,
			BindingResult result, Principal principal, Model model, RedirectAttributes redirectAttrs) {
		model.addAttribute("sessions", sessionService.findAll());
		if (result.hasErrors()) {
			return "appointments/create";
		}
		
		Session session = sessionService.findOne(appointment.getSession().getId());
		
		
		
		if (session.getDate().before(new Date())) {
			redirectAttrs.addFlashAttribute("message", "You cannot book the past session.");
			return "redirect:/appointments/create";
		}

		Person customer = personService.findByUsername(principal.getName());
		appointment.setCustomer(customer);

		if (appointmentService.checkIfAppointmentExists(customer.getId(), appointment.getSession().getId())) {
			model.addAttribute("message", "You have already booked this session");
			return "appointments/create";
		}

		appointmentService.save(appointment);

		return "redirect:/appointments";

	}

}
