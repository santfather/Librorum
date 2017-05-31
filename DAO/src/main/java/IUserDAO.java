package java;

import java.util.List;

public interface IUserDAO extends java.IBaseDAO<java.User> {
    public java.User getUserByLogin (String login) throws java.DAOException;
    List<java.User> findAll() throws java.DAOException;
    java.User getUserBySurname(String surname)throws java.DAOException;
}
