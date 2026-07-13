package edu.poly.dao;

import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import edu.poly.entity.Account;

public interface AccountDAO extends JpaRepository<Account, Integer> {

    List<Account> findAllByFullnameContaining(String fullname);

    Optional<Account> findByUsername(String username);

    Optional<Account> findByEmail(String email);

    Optional<Account> findByUsernameAndPassword(String username,
                                                String password);
}
