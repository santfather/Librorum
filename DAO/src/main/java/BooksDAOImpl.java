package java;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.ResourceBundle;


@Repository
public class BooksDAOImpl extends java.BaseDAO<java.Books> implements java.IBooksDAO {
    private static Logger log = Logger.getLogger(BooksDAOImpl.class);
    private final static String errorMessage = java.MessageDAO.getProperty("message.dataBase");
    private ResourceBundle rb = ResourceBundle.getBundle("queryHQL");

    @Autowired
    public BooksDAOImpl(SessionFactory sessionFactory) {
        super(sessionFactory);
    }

    public List<java.Books> getBooks() throws java.DAOException {
        try {
            log.info("start getBooks in BooksDAOImpl");
            String hql = rb.getString("SELECT_BOOKS");
            Query query = getSession().createQuery(hql);
            return query.list();
        } catch (Exception e) {
            log.warn("Exception in getTours BooksDAOImpl", e);
            throw new java.DAOException(errorMessage);
        }
    }

    public List<java.Books> getBooks(int firstResult) throws java.DAOException {
        return null;
    }

    public List<java.Books> getBooks(int firstResult, int maxResult) throws java.DAOException {
        try {
            String hql = rb.getString("SELECT_BOOKS");
            Query query = getSession().createQuery(hql);
            query.setFirstResult(firstResult);
            query.setMaxResults(maxResult);
            List<java.Books> books = query.list();
            return books;
        } catch (Exception e) {
            log.warn("Exception in getTours BooksDAOImpl", e);
            throw new java.DAOException(errorMessage);
        }
    }

    public Long getCounter() throws java.DAOException {
        Long counter = null;
        try {
            log.info("start getBooks with firstResult and maxResult in BooksDAOImpl");
            String hqlCounter = rb.getString("GET_COUNTER");
            Query query = getSession().createQuery(hqlCounter);
            counter = (Long) query.uniqueResult();
                } catch (Exception e) {
            log.warn("Exception in getTours BooksDAOImpl", e);
            throw new java.DAOException(errorMessage);
        }
        return counter;

    }
}

