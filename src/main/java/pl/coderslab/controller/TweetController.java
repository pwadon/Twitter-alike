package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.entity.Tweet;
import pl.coderslab.entity.User;
import pl.coderslab.repository.TweetRepository;
import pl.coderslab.repository.UserRepository;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/tweet")
public class TweetController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    TweetRepository tweetRepository;

    @GetMapping("/add")
    public String addUser(Model model, HttpServletRequest request){
        model.addAttribute("tweet", new Tweet());
        model.addAttribute("formAction", request.getContextPath()+"/tweet/save");
        return "tweet/form";
    }

//    @GetMapping("/form/{id}")
//    public String addBook(Model model, HttpServletRequest request, @PathVariable Long id){
//        Book book =  bookRepository.findOne(id);//pobranie ksiazki po id
//        model.addAttribute("book", book); // ustawianie atrybutow pobranej ksiazki
//        model.addAttribute("formAction", request.getContextPath()+"/book/save"); // przekierowanie na save
//        return "book/form"; // edytowanie wybranej ksiazki
//    }

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
