package java;

import java.DAOException;
import java.BooksType;
import java.IBaseService;

public interface IBooksTypeService extends IBaseService<BooksType> {
    BooksType getBooksTypeBYBookgenre(String name) throws DAOException;
}
