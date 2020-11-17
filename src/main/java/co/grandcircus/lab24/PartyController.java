package co.grandcircus.lab24;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class PartyController {

	@Autowired
	private PartyRepository rep;
	
	@GetMapping("/")
	public String index(Model model) {
		List<Party> parties = rep.findAll();   
		model.addAttribute("parties", parties);
		return "index";
	}
	
	
}
