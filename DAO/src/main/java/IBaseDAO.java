package java;


import java.io.Serializable;

public interface IBaseDAO <T> {
        T create (T t) throws java.DAOException;
        T loadById(Serializable id) throws java.DAOException;
        T saveOrUpdate(T t) throws java.DAOException;
        T getById(Serializable id) throws java.DAOException;
        T update(T t) throws java.DAOException;
    public void delete(T t) throws java.DAOException;
}
