package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.entity.Tweet;
import pl.coderslab.repository.TweetRepository;
import pl.coderslab.repository.UserRepository;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("")
public class HomeController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    TweetRepository tweetRepository;

    @GetMapping("user/{id}/tweets")
    public String getUserTweers(Model model, @PathVariable Long id) {
        List<Tweet> tweets = new ArrayList<>();
        tweets = tweetRepository.getAllByUserId(id);
        model.addAttribute("tweets", tweets);
        return "tweet/userTweets";
    }

//    @GetMapping("user/search-tweets")
//    public String getUserTweers(Model model, @RequestParam String s) {
//        List<Tweet> tweets = new ArrayList<>();
//        tweets = tweetRepository.getTweetByString(s);
//        model.addAttribute("tweet", tweets);
//        return "tweet/searchTweets";
//    }

    @RequestMapping("/home")
    public String home(){
        return "home/home";
    }
}
