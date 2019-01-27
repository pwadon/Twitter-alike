package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.entity.User;
import pl.coderslab.repository.MessageRepository;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/message")
public class MessageController {

    @Autowired
    private MessageRepository messageRepository;

    @RequestMapping("/userMessages")
    public String messagesAdd(Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        model.addAttribute("sent", messageRepository.getAllBySender(user));
        model.addAttribute("received", messageRepository.getAllByReceiver(user));
        model.addAttribute("user",user);

        return "/messages/userMessages";
    }
}
