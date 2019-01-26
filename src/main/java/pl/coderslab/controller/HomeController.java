package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.entity.Tweet;
import pl.coderslab.entity.User;
import pl.coderslab.repository.TweetRepository;
import pl.coderslab.repository.UserRepository;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("")
public class HomeController {

    @Autowired
    private TweetRepository tweetRepository;

    @RequestMapping("/home")
    public String home(Model model, HttpSession session){
        User user = (User)session.getAttribute("user");
        model.addAttribute("tweets", tweetRepository.findAll());
        if ( user != null) {
            model.addAttribute("user", user);
            model.addAttribute("tweet", new Tweet());
        }
        return "home/home";
    }
}
