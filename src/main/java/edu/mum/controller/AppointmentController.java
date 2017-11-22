package edu.mum.controller;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.domain.Appointment;
import edu.mum.domain.Person;
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
		model.addAttribute("sessions", sessionService.findAll());
		Person customer = personService.findByUsername(principal.getName());
		model.addAttribute("customer", customer);
		return "appointments/index";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String getAppointmentById(@PathVariable("id") Long id, Model model) {
		Appointment appointment = appointmentService.findOne(id);
		model.addAttribute("appointment", appointment);

		return "appointments/appointment";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.POST)
	public String updateAppointment(@PathVariable("id") Long id, @Valid Appointment updateAppointment,
			BindingResult result) {
		if (result.hasErrors()) {
			return "appointments/appointment";
		}

		// Error caught by ControllerAdvice IF no authorization...

		appointmentService.save(updateAppointment);
		return "redirect:/sessions";
	}

	@RequestMapping(value = "/cancel/{id}", method = RequestMethod.GET)
	public String cancelAppointment(@PathVariable("id") Long id) {
		appointmentService.deleteById(id);

		return "redirect:/appointments";
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String getAddNewAppointmentForm(@ModelAttribute("appointment") Appointment appointment, Model model) {
		model.addAttribute("sessions", sessionService.findAll());

		return "appointments/create";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String processAddNewAppointmentForm(@ModelAttribute("appointment") @Valid Appointment appointment,
			BindingResult result, Principal principal) {

		if (result.hasErrors()) {
			return "appointments/create";
		}

		Person customer = personService.findByUsername(principal.getName());
		appointment.setCustomer(customer);

		// Error caught by ControllerAdvice IF no authorization...
		appointmentService.save(appointment);

		return "redirect:/appointments";

	}

}
