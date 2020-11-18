package co.grandcircus.lab24;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;



@Controller
public class PartyOptionController {

	@Autowired
	private PartyOptionRepository rep;
	
	@GetMapping("/options")
	public String index(Model model) {
		List<PartyOption> partyOptions = rep.findAll(); 
		model.addAttribute("partyOptions", partyOptions);
		return "options";
	}
	
	@GetMapping("/vote/{id}")
	public String detail(@PathVariable("id") long id, Model model) {
		System.out.println("VOTE");
		System.out.println(id);
		PartyOption partyOption = rep.findById(id).get();
		int voteIncrement = partyOption.getVotes() + 1;
		partyOption.setVotes(voteIncrement);
		rep.save(partyOption);
		return "redirect:/options";
	}
}
