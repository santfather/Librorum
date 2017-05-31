package java;

import java.DAOException;

import java.io.Serializable;

public interface IBaseService<T>  {

    T create(T t) throws DAOException;

    T saveOrUpdate(T t) throws DAOException;

    T getById(Serializable id) throws DAOException;

    T update(T t) throws DAOException;

    public void delete(T t) throws DAOException;
}


