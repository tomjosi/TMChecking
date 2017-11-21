package edu.mum.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import edu.mum.domain.Person;

@Repository
public interface PersonRepository extends CrudRepository<Person, Long> {
	public Person findById(Long id);
}
