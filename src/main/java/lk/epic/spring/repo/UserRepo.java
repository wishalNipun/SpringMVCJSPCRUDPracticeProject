package lk.epic.spring.repo;

import lk.epic.spring.model.User;
import org.springframework.data.jpa.repository.JpaRepository;


public interface UserRepo extends JpaRepository<User,String> {

}
