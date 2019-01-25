package pl.coderslab.entity;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.time.LocalDate;

@Entity
@Table(name = "tweeter_tweet")
public class Tweet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Size(min = 5, max = 50)
    @NotEmpty
    private String title;

    @Size(max = 160)
    @NotEmpty
    private String tweetText;

    private LocalDate created;

    @ManyToOne
    private User user;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTweetText() {
        return tweetText;
    }

    public void setTweetText(String tweetText) {
        this.tweetText = tweetText;
    }

    public LocalDate getCreated() {
        return created;
    }

    public void setCreated(LocalDate created) {
        this.created = created;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Tweet() {
    }

    @Override
    public String toString() {
        return "Tweet{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", tweetText='" + tweetText + '\'' +
                ", created=" + created +
                ", userId=" + user.getId() +
                '}';
    }
}
