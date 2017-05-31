package java;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;

import javax.security.auth.login.LoginException;
import java.util.List;

public abstract class UserService extends java.BaseService<User> implements java.IUserService {
    private static Logger log = Logger.getLogger(UserService.class);


    @Autowired
    private java.IUserDAO userDAO;

    @Autowired
    private java.IBooksDAO booksDAO;

    public UserService(java.IBaseDAO<User> baseDAO) {
        super( baseDAO );
    }

    @Override
    public java.User getUserByLogin(String login) throws java.DAOException {
        log.info("start getUserByLogin in UserService with login:" + login);
        return userDAO.getUserByLogin(login);
    }

    @Override
    public List<java.User> findAll() throws java.DAOException {
        return userDAO.findAll();
    }

    @Override
    public java.User registerNewUser(String login, String password, String name, String surname, String email) throws LoginException, java.DAOException {
        return null;
    }

    public java.User registerNewUser(String login, int password, String name, String surname, String email) throws LoginException, java.DAOException {
        if (userDAO.getUserByLogin(login) == null) {
            User newUser;
            newUser = new User(login, password, name, surname, email, java.State.ACTIVE.getState());
            newUser.getUserProfiles().add(userProfileDAO.getUserProfileByType( java.UserProfileType.USER.getType()));
            return userDAO.create(newUser);
        } else {
            throw new LoginException(errorMessage);
        }
    }

    public User createNewUser(User user) throws LoginException, java.DAOException {
        if (userDao.getUserByLogin(user.getLogin()) == null) {
            user.getUserProfiles().add(userProfileDao.getUserProfileByType( java.UserProfileType.USER.getType()));
            return userDao.create(user);
        } else {
            throw new LoginException(errorMessage);
        }
    }

    public User updateUserState(Integer id, String state) throws java.DAOException {
        java.User updatedUser = userDAO.getById(id);
        updatedUser.setState(state);
        System.out.println(updatedUser);
        return userDao.update(updatedUser);
    }

    @Override
    public String getPrincipal() {
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            userName = ((UserDetails) principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }

    @Override
    public void makeAnOrder(Integer id) throws java.DAOException {
        java.Books books = booksDAO.getById(id);
        java.User user = userDAO.getUserByLogin(getPrincipal());
        user.getBooks().add(books);
        books.getUsers().add(user);
        booksDAO.saveOrUpdate(books);

    }
}

