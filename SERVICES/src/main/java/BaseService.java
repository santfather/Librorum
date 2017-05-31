package java;

import java.IBaseDAO;
import java.DAOException;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;

import javax.transaction.Transactional;
import java.io.Serializable;

@NoArgsConstructor
@Service
@Transactional
public class BaseService<T> implements java.IBaseService<T> {

    @Autowired
    private IBaseDAO<T> baseDAO;

    @Autowired
    public BaseService(IBaseDAO<T> baseDAO) {
        this.baseDAO = baseDAO;
    }

    public T create(T t) throws DAOException {
        return baseDAO.create(t);
    }

    public T saveOrUpdate(T t) throws DAOException {
        return baseDAO.saveOrUpdate(t);
    }

    @org.springframework.transaction.annotation.Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public T getById(Serializable id) throws DAOException {
        return baseDAO.getById(id);
    }

    public T update(T t) throws DAOException {
        return baseDAO.update(t);
    }

    public void delete(T t) throws DAOException {
        baseDAO.delete(t);
    }
}

