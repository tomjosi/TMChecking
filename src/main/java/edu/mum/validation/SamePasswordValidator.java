package edu.mum.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import edu.mum.domain.Person;

public class SamePasswordValidator implements
ConstraintValidator<SamePassword, Person> {

	@Override
	public void initialize(SamePassword arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean isValid(Person arg0, ConstraintValidatorContext arg1) {
		// TODO Auto-generated method stub
		if(arg0.getPassword().equals(arg0.getVerifyPassword())) return true;
		return false;
	}


	



}
