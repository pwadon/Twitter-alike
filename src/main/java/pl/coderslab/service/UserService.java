package pl.coderslab.service;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.entity.User;
import pl.coderslab.repository.UserRepository;

import javax.servlet.http.HttpSession;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

     public void registerUser(User user, String repeatedPassword) throws Exception{
        if (user.getPassword().equals(repeatedPassword)){
            user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));

            userRepository.save(user);
        }

        throw new Exception("Password don't match");
    }

    public boolean loginUser(String username, String password, HttpSession sess){

         User user = userRepository.findByUsername(username);

         if(user != null && user.isEnabled() && BCrypt.checkpw(password, user.getPassword()))
        {
             sess.setAttribute("user",user);
             return true;
        }
         else{
             sess.setAttribute("user",null);
             return false;
        }
    }

    public boolean isLoggedIn(HttpSession sess){
         return (sess.getAttribute("user") !=null);
    }
}
