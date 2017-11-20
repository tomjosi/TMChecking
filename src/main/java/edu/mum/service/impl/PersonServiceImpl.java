package edu.mum.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.domain.Person;
import edu.mum.repository.PersonRepository;
import edu.mum.service.PersonService;
import edu.mum.service.UserCredentialsService;

@Service
@Transactional
public class PersonServiceImpl implements PersonService {

	@Autowired
	private PersonRepository personRepository;

	@Autowired
	UserCredentialsService credentialsService;

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void save(Person person) {
		personRepository.save(person);
	}

	@Override
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void saveFull(Person person) {
		credentialsService.save(person.getUserCredentials());
		personRepository.save(person);
	}

	public List<Person> findAll() {
		return (List<Person>) personRepository.findAll();
	}

	public Person findOne(Long id) {
		return personRepository.findOne(id);
	}

	public Person findByMemberNumber(int id) {
		return personRepository.findByMemberNumber(id);
	}

}
