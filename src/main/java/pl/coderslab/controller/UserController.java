package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.Tweet;
import pl.coderslab.entity.User;
import pl.coderslab.repository.TweetRepository;
import pl.coderslab.repository.UserRepository;
import pl.coderslab.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.awt.print.Book;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    TweetRepository tweetRepository;

    @Autowired
    UserService userService;

    @GetMapping("/add")
    public String addUser(Model model, HttpServletRequest request){
        model.addAttribute("user", new User());
        model.addAttribute("formAction", request.getContextPath()+"/user/save");
        return "user/form";
    }



    @PostMapping("/save")
    public String saveUser(@Valid User user, BindingResult errors, HttpServletRequest request, Model model){

        if (errors.hasErrors()){
            return "user/form";
        }

        if(userRepository.findByUsername(user.getUsername()) != null){
            model.addAttribute("usererror", true);
            return "user/form";
        }
        else {
            String repeated = request.getParameter("rp");
            if (user.getPassword().equals(repeated)) {
                try {
                    userService.registerUser(user, repeated);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return "redirect:" + request.getContextPath() + "/home";
            } else {
                model.addAttribute("error", true);
                return "user/form";
            }
        }
    }

    @GetMapping("/login")
    private String logUser(Model model){
        model.addAttribute("user", new User());
        return "login/login";

    }
    @PostMapping("/login")
    private String logUser(@RequestParam String username, @RequestParam String password, HttpSession session, Model model){

        boolean log = userService.loginUser(username,password,session);

        if (log) {
            model.addAttribute("user", userRepository.findByUsername(username));
            model.addAttribute("tweet", new Tweet());
            model.addAttribute("tweets", tweetRepository.findAll());
            return "home/home";
        }

        else{
            model.addAttribute("error", true);
            return "login/login";
        }

    }

    @PostMapping("/usersTweets")
    public String showGivenUserTweets(Model model,@RequestParam Long id, HttpServletRequest request){
        List<Tweet> tweets = tweetRepository.getAllByUserId(id);
        if (tweets.size() > 0  ) {
            model.addAttribute("tweets", tweets);
            return "tweet/searchTweets";
        }
        else {
            model.addAttribute("tweet", new Tweet());
            model.addAttribute("tweets", tweetRepository.findAll());
            model.addAttribute("errorUserTweets", true);
            return "home/home";
        }
    }
    @GetMapping("/tweets")
    public String showThisUserTweets(Model model, HttpSession session){
        User user = (User)session.getAttribute("user");
        List <Tweet> tweets =tweetRepository.getAllByUser(user);
        if (tweets.size() > 0) {
            model.addAttribute("currentUserTweets", tweets);
            return "tweet/userTweets";
        }
        else {
            model.addAttribute("twError",null);
            return "home/home";
        }
    }

//    @GetMapping("/del/{id}")
//    public String delUser(HttpServletRequest request, @PathVariable Long id){
//        User user = userRepository.findOne(id);
//        userRepository.delete(user);
//        return "redirect:"+request.getContextPath()+"/user/all";
//    }
//
//    @GetMapping("/edit/{id}")
//    public String editUser(Model model, HttpServletRequest request, @PathVariable Long id){
//        User user =  userRepository.findOne(id);
//        model.addAttribute("user", user);
//        model.addAttribute("formAction", request.getContextPath()+"/user/save");
//        return "user/form";
//    }



}
