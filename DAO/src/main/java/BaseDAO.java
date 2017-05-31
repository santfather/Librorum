package java;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;

public class BaseDAO<T> implements java.IBaseDAO<T> {
    private static Logger log = Logger.getLogger(BaseDAO.class);
    private SessionFactory sessionFactory;
    private final static String errorMessage = java.MessageDAO.getProperty("message.dataBase");

    @Autowired
    public BaseDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    public T create(T t) throws java.DAOException {
        try {
            log.info("start create in BaseDAO");
            getSession().save(t);
            log.info("create:" + t);
            return t;
        } catch (Exception e) {
            log.warn("Exception in create BaseDAO", e);
            throw new java.DAOException(errorMessage);
        }
    }

    public T loadById(Serializable id) throws java.DAOException {
        try {
            log.info("start loadById in BaseDAO");
            return (T) getSession().load(getPersistentClass(), id);
        } catch (Exception e) {
            log.warn("Exception in loadById BaseDAO", e);
            throw new java.DAOException(errorMessage);
        }
    }

    public T saveOrUpdate(T t) throws java.DAOException {
        try {
            log.info("start saveOrUpdate in BaseDAO");
            getSession().saveOrUpdate(t);
            log.info("saveOrUpdate:" + t);
            return t;
        } catch (Exception e) {
            log.warn("Exception in saveOrUpdate BaseDAO", e);
            throw new java.DAOException(errorMessage);
        }
    }

    public T getById(Serializable id) throws java.DAOException {
        try {
            log.info("start getById in BaseDAO:" + id);
            T t = (T) getSession().get(getPersistentClass(), id);
            return t;
        } catch (Exception e) {
            log.warn("Exception in saveOrUpdate BaseDAO", e);
            throw new java.DAOException(errorMessage);
        }
    }

    public T update(T t) throws java.DAOException {
        try {
            log.info("start update in BaseDAO");
            getSession().update(t);
            log.info("Update:" + t);
            return t;
        } catch (Exception e) {
            log.warn("Exception in update BaseDAO", e);
            throw new java.DAOException(errorMessage);
        }
    }

    public void delete(T t) throws java.DAOException {
        try {
            log.info("start delete T t in BaseDAO");
            getSession().delete(t);
            log.info("Delete:" + t);
        } catch (Exception e) {
            log.warn("Exception in delete BaseDAO", e);
            throw new java.DAOException(errorMessage);
        }
    }

    protected Criteria createEntityCriteria() {
        return getSession().createCriteria(getPersistentClass());
    }

    private Class<T> getPersistentClass() {
        return (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }
}
