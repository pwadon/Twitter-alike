package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.entity.Message;
import pl.coderslab.entity.User;
import pl.coderslab.repository.MessageRepository;

import javax.jws.soap.SOAPBinding;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/message")
public class MessageController {

    @Autowired
    private MessageRepository messageRepository;

    @RequestMapping("/userMessages")
    public String messagesAdd(Model model, HttpSession session){
        User user = (User) session.getAttribute("user");
        List<Message> sent = messageRepository.getAllBySender_Id(user.getId());
        List<Message> received = messageRepository.getAllByReceiver_Id(user.getId());
        try {
            model.addAttribute("sent", sent);
        }
        catch (Exception e){}
        try {
            model.addAttribute("received", received);
        }
        catch (Exception e){}
        model.addAttribute("user",user);

        for (Message m : sent){
            System.out.println(m.getMsg() + "wyslane");
        }
        for (Message x : received){
            System.out.println(x.getMsg() + "otrzymane");
        }
        return "messages/userMessages";
    }

    @GetMapping("/showMsg/{id}")
    public String showMsg(Model model, @PathVariable Long id, HttpSession session) {
        Message message = messageRepository.findOne(id);
        User user = (User) session.getAttribute("user");
        if (user.getId().equals(message.getReceiver().getId())) {
            message.setReaded(true);
        }
        messageRepository.save(message);
        model.addAttribute("msg", message);
        return "messages/message";
    }
}
