package pl.coderslab.entity;


import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name = "user",uniqueConstraints = {@UniqueConstraint(columnNames = {"username"})})// name powinien byc np : cl_auth_user zebby zabezpieczyc sie przed onjection
public class User {// jak jest przy stroingu napisane unique to niw trzeba tutaj wpisywac unique constraint
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    @NotEmpty
    @Column(unique = true) // wystarczy to nie trzeba tego w table
    private String username;

    @NotEmpty
    private String password;

    @NotNull
    private boolean enabled = true;

    @Email
    private String email;

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    private List<Tweet> tweets = new ArrayList<>();

    @OneToMany
    private List<Comment> comments =new ArrayList<>();

    @OneToMany(mappedBy = "sender")
    private List<Message> messagesSended = new ArrayList<>();

    @OneToMany(mappedBy = "receiver")
    private List<Message> messagesReceived = new ArrayList<>();


    public User() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<Tweet> getTweets() {
        return tweets;
    }

    public void setTweets(List<Tweet> tweets) {
        this.tweets = tweets;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    @Override
    public String toString() {
        return "";
    }

    public List<Message> getMessagesSended() {
        return messagesSended;
    }

    public void setMessagesSended(List<Message> messagesSended) {
        this.messagesSended = messagesSended;
    }

    public List<Message> getMessagesReceived() {
        return messagesReceived;
    }

    public void setMessagesReceived(List<Message> messagesReceived) {
        this.messagesReceived = messagesReceived;
    }

//    public List<Message> getReceived() {
//        return received;
//    }
//
//    public void setReceived(List<Message> received) {
//        this.received = received;
//    }
//
//    public List<Message> getSent() {
//        return sent;
//    }
//
//    public void setSent(List<Message> sent) {
//        this.sent = sent;
//    }
}
