import java.DAOException;
import java.Books;
import java.IBaseService;

import java.io.Serializable;
import java.util.List;

public interface IBooksService extends IBaseService<Books> {
    List<Books> getBooks() throws DAOException;

    List<Books> getBooksForPagination(Integer page, Integer recordPerPage) throws DAOException;

    Books create(Books books) throws DAOException;

    void deleteBooksById(Serializable id) throws DAOException;

    Books updateBooks(Books books) throws DAOException;

    public Long getCount() throws DAOException;
}

