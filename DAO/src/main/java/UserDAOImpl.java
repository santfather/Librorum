package java;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.ResourceBundle;


@Repository
public class UserDAOImpl extends java.BaseDAO<java.User> implements java.IUserDAO {
    private static Logger log = Logger.getLogger(UserDAOImpl.class);
    private ResourceBundle rb = ResourceBundle.getBundle("queryHQL");
    private final static String errorMessage = java.MessageDAO.getProperty("message.dataBase");
    java.User foundUser = null;

    @Autowired
    public UserDAOImpl(SessionFactory sessionFactory) {
        super(sessionFactory);
    }

    @Override
    public List<java.User> findAll() throws java.DAOException {
        try {
            log.info("start findAll in UserDAOImpl");
            String hql = rb.getString("SELECT_USERS");
            Query query = getSession().createQuery(hql);
            return query.list();
        } catch (Exception e) {
            log.warn("Exception in findAll UserDaoImpl", e);
            throw new java.DAOException(errorMessage);
        }
    }

    @Override
    public java.User getUserByLogin(String login) throws java.DAOException {
        try {
            log.info("start getUserByLogin in UserDAOImpl with login:" + login);
            String hql = rb.getString("SELECT_USER_BY_LOGIN");
            Query query = getSession().createQuery(hql);
            query.setString("login", login);
            foundUser = (java.User) query.uniqueResult();
            System.out.println(foundUser);
            return foundUser;
        } catch (Exception e) {
            log.warn("Exception in getUserByLogin UserDAOImpl", e);
            throw new java.DAOException(errorMessage);
        }
    }

    public java.User getUserBySurname(String surname) throws java.DAOException {
        try {
            log.info("start getUserBySurname in UserDAOImpl with surname:" + surname);
            Criteria criteria = createEntityCriteria();
            criteria.add( Restrictions.eq("surname", surname));
            foundUser = (java.User) criteria.uniqueResult();
            System.out.println(foundUser);
            return foundUser;
        } catch (Exception e) {
            log.warn("Exception in getUserBySurname UserDAOImpl", e);
            throw new java.DAOException(errorMessage);
        }
    }
}

