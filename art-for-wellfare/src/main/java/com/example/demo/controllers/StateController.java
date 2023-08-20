package com.example.demo.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.State;
import com.example.demo.services.StateServ;

@RestController
public class StateController {
	@Autowired
	StateServ Sserv;
	
	@GetMapping("/getallstate")
	public List<State> getallsate()
	{
		return Sserv.getall();
		
	}
	
	
 
}
