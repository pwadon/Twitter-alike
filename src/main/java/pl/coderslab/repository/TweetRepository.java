package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.coderslab.entity.Tweet;

import java.util.List;

public interface TweetRepository extends JpaRepository<Tweet, Long> {
    List<Tweet> getAllByUserId(Long UserId);

//    @Query("Select t from Tweet where t.title like :string% ORDER BY t.created ASC ")
//    List<Tweet> getTweetByString(@Param("string") String s);
}
