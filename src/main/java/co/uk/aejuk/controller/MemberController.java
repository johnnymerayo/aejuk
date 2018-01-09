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
import co.uk.aejuk.entity.Status;
import co.uk.aejuk.repository.AreaRepository;
import co.uk.aejuk.repository.MemberRepository;
import co.uk.aejuk.repository.PaymentRepository;
import co.uk.aejuk.repository.StatusRepository;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberController {
	
	
	@Autowired
	private MemberRepository memberRepository;

	@Autowired
	private AreaRepository areaRepository;

	@Autowired 
	StatusRepository statusRepository;
	
	 // Get All Members	
	@GetMapping
	public String getAllMembers(ModelMap model){
		model.addAttribute("listMembers", this.memberRepository.findAll());
		return "listMembers";
	}
	
	
	@GetMapping("/new")
	public String newMember(ModelMap model){
		model.addAttribute("member", new Member());
		return "member";
	}
	
	// Create a new Member
	@PostMapping
	public String newMember(@Valid Member member, BindingResult bindingResult){
		 log.debug("Processing Create a new Member member={}, bindingResult={}", member, bindingResult);

		 if (bindingResult.hasErrors()) {
	        // failed validation
	        return "member";
		 }
		
		memberRepository.save(member);
		return "redirect:/member";
	}
	
	// Get a Single Member
	@GetMapping("/{idMember}")
	 public String product(@PathVariable(name="idMember") Long id, Model model){
		Member m = memberRepository.findOne(id);
        model.addAttribute("member", m);
        return "member";
	}


    // Update a Member
	@PutMapping
	public String updateMember(@Valid @RequestBody Member member){
		memberRepository.save(member);
		return "listMembers";
	}


    // Delete a Member	
	@DeleteMapping
	public String disableMember(@Valid @RequestBody Member member){
		memberRepository.save(member);
		return "listMembers";
	}

	
	@ModelAttribute("areas")
	List<Area> listAreas(){
		return areaRepository.findAll();
	}
	
	@ModelAttribute("memberStatus")
	List<Status> listMemberStatus(){
		return statusRepository.findAll();
	}

}
