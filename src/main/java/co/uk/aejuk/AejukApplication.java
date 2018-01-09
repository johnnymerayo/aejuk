package co.uk.aejuk;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@EnableJpaAuditing
@SpringBootApplication
public class AejukApplication {

	public static void main(String[] args) {
		SpringApplication.run(AejukApplication.class, args);
	}
}


@Controller
@RequestMapping("/")
 class ApplicationController {

    @RequestMapping(value = { "/" }, method = RequestMethod.GET)
    public String homePage(ModelMap model) {
        return "home";
    }

    @RequestMapping(value = { "/apachetiles" }, method = RequestMethod.GET)
    public String productsPage(ModelMap model) {
        return "apachetiles";
    }

    @RequestMapping(value = { "/springmvc" }, method = RequestMethod.GET)
    public String contactUsPage(ModelMap model) {
        return "springmvc";
    }
}