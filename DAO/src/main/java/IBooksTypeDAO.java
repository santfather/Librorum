package java;


public interface IBooksTypeDAO extends java.IBaseDAO<java.BooksType> {
    public java.BooksType getBooksTypeByBookgenre(String bookgenre) throws java.DAOException;
}
