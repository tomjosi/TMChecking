package edu.mum.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.mum.domain.Appointment;

@Repository
public interface AppointmentRepository extends CrudRepository<Appointment, Long> {
	
}
