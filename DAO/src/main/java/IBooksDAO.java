package java;

import java.util.List;


public interface IBooksDAO extends java.IBaseDAO<java.Books> {
    List<java.Books> getBooks() throws java.DAOException;
    public List<java.Books> getBooks(int firstResult, int maxResult) throws java.DAOException;
    public Long getCounter() throws java.DAOException;
}
