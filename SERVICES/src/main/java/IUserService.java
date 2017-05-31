package java;

import javax.security.auth.login.LoginException;
import java.util.List;

public interface IUserService extends java.IBaseService<java.User> {
    java.User getUserByLogin(String Login) throws java.DAOException;
    List<java.User> findAll() throws java.DAOException;
    java.User registerNewUser(String login, String password, String name, String surname, String email) throws LoginException, java.DAOException;
    java.User createNewUser(java.User user) throws LoginException, java.DAOException;
    java.User updateUserState(Integer id, String state) throws java.DAOException;
    String getPrincipal() ;
    void makeAnOrder(Integer id) throws java.DAOException;

}

