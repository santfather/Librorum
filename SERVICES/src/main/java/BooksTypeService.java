package java;

import java.IBooksTypeDAO;
import java.DAOException;
import java.BaseService;
import java.BooksType;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@NoArgsConstructor
@AllArgsConstructor
@Service
@Transactional
public abstract class BooksTypeService extends java.BaseService<BooksType> implements java.IBooksTypeService {

    @Autowired
    private IBooksTypeDAO booksTypeDAO;

     public BooksType getBooksTypeByBookgenre(String name) throws DAOException {
        return booksTypeDAO.getBooksTypeByBookgenre(name);
    }
   }

