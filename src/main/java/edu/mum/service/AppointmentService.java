package edu.mum.service;

import java.util.List;

import edu.mum.domain.Appointment;

public interface AppointmentService {
	public void save(Appointment appointment);

	public List<Appointment> findAll();

	public Appointment findOne(Long id);

	public void deleteById(Long id);

}
