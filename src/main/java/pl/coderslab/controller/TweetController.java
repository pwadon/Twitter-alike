package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.Comment;
import pl.coderslab.entity.Tweet;
import pl.coderslab.entity.User;
import pl.coderslab.repository.CommentRepository;
import pl.coderslab.repository.TweetRepository;
import pl.coderslab.repository.UserRepository;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.awt.print.Book;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/tweet")
public class TweetController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    TweetRepository tweetRepository;

    @Autowired
    CommentRepository commentRepository;

    @PostMapping("/add")
    public String addTweet(@Valid Tweet tweet, BindingResult errors, HttpServletRequest request){
        if (errors.hasErrors()){
            return "home/home";
        }
        tweet.setCreated(LocalDate.now());
        tweetRepository.save(tweet);
        return "redirect:" + request.getContextPath() +"/home";

    }

    @GetMapping("/{id}")
    public String showTweet(Model model, HttpServletRequest request, @PathVariable Long id){
        Tweet tweet =  tweetRepository.findOne(id);
        model.addAttribute("tweet", tweet);
        model.addAttribute("comment",new Comment());
        model.addAttribute("user",request.getParameter("user"));
        return "tweet/tweet";
    }

    @PostMapping("/{id}")
    public String showTweet(@Valid Comment comment, BindingResult errors,Model model, HttpServletRequest request,@PathVariable Long id){
        Tweet tweet =  tweetRepository.findOne(id);
        model.addAttribute("tweet", tweet);
        model.addAttribute("comment",new Comment());
        if(errors.hasErrors()){
            return "tweet/tweet";
        }
        comment.setCreated(LocalDate.now());
        commentRepository.save(comment);

        return "redirect:" + request.getContextPath() +"/tweet/"+id;
    }

    @PostMapping("/save")
    public String saveUser(@Valid Tweet tweet, BindingResult errors, HttpServletRequest request){
        if (errors.hasErrors()){
            return "tweet/form";
        }
        tweetRepository.save(tweet);
        return "redirect:"+request.getContextPath()+"/tweet/list";
    }



    @ModelAttribute("users")
    public List<User> users(){
        return userRepository.findAll();
    }
}
