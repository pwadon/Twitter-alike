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

import javax.servlet.http.HttpServletRequest;
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

    @GetMapping("/add")
    public String addUser(Model model, HttpServletRequest request){
        model.addAttribute("user", new User());
        model.addAttribute("formAction", request.getContextPath()+"/user/save");
        return "user/form";
    }

//    @GetMapping("/form/{id}")
//    public String addBook(Model model, HttpServletRequest request, @PathVariable Long id){
//        Book book =  bookRepository.findOne(id);//pobranie ksiazki po id
//        model.addAttribute("book", book); // ustawianie atrybutow pobranej ksiazki
//        model.addAttribute("formAction", request.getContextPath()+"/book/save"); // przekierowanie na save
//        return "book/form"; // edytowanie wybranej ksiazki
//    }

    @PostMapping("/save")
    public String saveUser(@Valid User user, BindingResult errors, HttpServletRequest request){
        if (errors.hasErrors()){
            return "user/form";
        }
        userRepository.save(user);
        return "redirect:"+request.getContextPath()+"/user/all";
    }

    @GetMapping("/all")
    public String showAll(Model model){
        List<User> u = new ArrayList<>();
        model.addAttribute("users", userRepository.findAll());
        return "user/list";

    }

    @GetMapping("/del/{id}")
    public String delBook(HttpServletRequest request, @PathVariable Long id){
        User user = userRepository.findOne(id);
        userRepository.delete(user);
        return "redirect:"+request.getContextPath()+"/user/all";
    }

    @GetMapping("/edit/{id}")
    public String editUser(Model model, HttpServletRequest request, @PathVariable Long id){
        User user =  userRepository.findOne(id);
        model.addAttribute("user", user);
        model.addAttribute("formAction", request.getContextPath()+"/user/save");
        return "user/form";
    }



}
