package co.uk.aejuk.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import co.uk.aejuk.entity.Area;
import co.uk.aejuk.entity.Member;
import co.uk.aejuk.entity.Payment;
import co.uk.aejuk.entity.Status;
import co.uk.aejuk.repository.AreaRepository;
import co.uk.aejuk.repository.MemberRepository;
import co.uk.aejuk.repository.PaymentRepository;
import co.uk.aejuk.repository.StatusRepository;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member/{idMember}/payment")
public class PaymentController {
	
	
	@Autowired
	private MemberRepository memberRepository;

	@Autowired 
	private PaymentRepository paymentRepository;

	
	
	@GetMapping("/new")
	public String newMember(@PathVariable(name="idMember") Long id, ModelMap model){
		Member m = memberRepository.findOne(id);
	      
		model.addAttribute("payment", new Payment(m));
		return "payment";
	}
	
	// Create a new Member payment
	@PostMapping
	public String newMember(@PathVariable(name="idMember") Long id, @Valid Payment payment, BindingResult bindingResult){
		 log.debug("Processing Create a new payment payment={}, bindingResult={}", payment, bindingResult);

		 if (bindingResult.hasErrors()) {
	        // failed validation
	        return "payment";
		 }
		
		 paymentRepository.save(payment);
		return "redirect:/member/" + id;
	}
	
	
	// Get a Single Payment
	@GetMapping("/{idPayment}")
	 public String product(@PathVariable(name="idPayment") Long id, Model model){
		Payment p = paymentRepository.findOne(id);
        model.addAttribute("payment", p);
        return "payment";
	}

}
