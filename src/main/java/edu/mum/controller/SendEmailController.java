package edu.mum.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@EnableAsync
public class SendEmailController {
	
	@Autowired
    private JavaMailSender mailSender;
     
	@RequestMapping(value="/mail",method = RequestMethod.GET)
    @Async
    public void doSendEmail() {
        // takes input from e-mail form
        String recipientAddress = "elycheikh16@gmail.com";
        String subject = "Test Email";
        String message = "Message successfully recieved...!";
         
        // prints debug info
        System.out.println("To: " + recipientAddress);
        System.out.println("Subject: " + subject);
        System.out.println("Message: " + message);
         
        // creates a simple e-mail object
        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(recipientAddress);
        email.setSubject(subject);
        email.setText(message);
         
        // sends the e-mail
        mailSender.send(email);
         
        // forwards to the view named "Result"
        //        return "Result";
    }

}
