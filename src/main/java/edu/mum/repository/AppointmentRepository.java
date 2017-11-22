package edu.mum.repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.mum.domain.Appointment;

@Repository
public interface AppointmentRepository extends CrudRepository<Appointment, Long> {
	
	@Modifying
	@Query("delete from Appointment a where a.id = ?1")
	public void deleteAppointment(Long id);
	
}
