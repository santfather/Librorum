import java.IBooksDAO;
import java.IBooksTypeDAO;
import java.DAOException;
import java.BaseService;
import java.Books;
import java.BooksType;
import java.IBooksTypeService;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;

import javax.transaction.Transactional;
import java.io.Serializable;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Service
@Transactional
public class BooksService extends BaseService<Books> implements IBooksService {

    @Autowired
    private IBooksDAO booksDAO;

    @Autowired
    private IBooksTypeDAO booksTypeDAO;

    @Autowired
    private IBooksTypeService booksTypeService;

    @org.springframework.transaction.annotation.Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    @Override
    @Cacheable(value = "booksCache")
    public List<Books> getBooks() throws DAOException {
        return booksDAO.getBooks();
    }

    public List<Books> getBooksForPagination(Integer offset, Integer maxResults) throws DAOException {
        if (offset == null) {
            offset = 0;
        }
        if (maxResults == null) {
            maxResults = 10;
        }
        return booksDAO.getBooks(offset, maxResults);
    }

    public Long getCount() throws DAOException {
        return booksDAO.getCounter();
    }

    @Override
    public Books create(Books books) throws DAOException {
        BooksType booksType = booksTypeDAO.getBooksTypeByBookgenre(books.getBooksType().getName());
        books.setBooksType(booksType);
        return booksDAO.create(books);
    }

    @Override
    public void deleteBooksById(Serializable id) throws DAOException {
        Books books = booksDAO.getById(id);
        booksDAO.delete(books);
        books.getBooksType().getBooks().remove(books);
    }

    @Override
    public Books updateBooks(Books books) throws DAOException {
        BooksType booksType;
        booksType = booksTypeService.getBooksTypeBYBookgenre(books.getBooksType().getName());
        int id = books.getBooksId();
        Books upBooks = booksDAO.getById(id);
        upBooks.setBooksType(booksType);
        upBooks.setAuthor(books.getAuthor());
        upBooks.setName(books.getName());
        upBooks.setBookgenre(books.getBookgenre());
        return booksDAO.update(upBooks);
    }
}


