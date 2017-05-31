package java;

import exceptions.DAOException;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class BooksAdminController {
    private static Logger log = Logger.getLogger(BooksAdminController.class);
    public static final String ADMINBOOKS = "/admin/books";

    @Autowired
    private IBooksService booksService;

    @RequestMapping(value = "/admin/books", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView booksCollection() throws DAOException {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("books", new java.Books());
        try {
            modelAndView.addObject("listBooks", this.booksService.getBooks());
            modelAndView.setViewName(ADMINBOOKS);
            return modelAndView;
        } catch (DAOException e) {
            modelAndView.addObject("message", errorDAOException);
            modelAndView.setViewName(ADMINBOOKS);
            return modelAndView;
        }
    }

    @RequestMapping(value = "/admin/bookss/add", method = RequestMethod.POST)
    public String addBooks(@ModelAttribute("books") java.Books books, ModelMap model, HttpServletRequest request) throws DAOException {
        try {
            this.booksService.create(books);
            return "redirect:/admin/books";
        } catch (DAOException e) {
            model.put("message", errorDAOException);
            return ADMINBOOKS;
            // return "redirect:" + request.getHeader("referer");
        }
    }

    @RequestMapping(value = "/remove/{id}")
    public String removeBooks(@PathVariable("id") int id, ModelMap model) throws DAOException {
        try {
            this.booksService.deleteBooksById(id);
            return "redirect:/admin/books";
        } catch (DAOException e) {
            model.put("message",  errorDAOException);
            return ADMINBOOKS;
            // return "redirect:" + request.getHeader("referer");
        }
    }

    @RequestMapping(value = "/edit/{id}", method = {RequestMethod.GET, RequestMethod.POST})
    public String editBooks(@PathVariable("id") int id, Model model) throws DAOException {
        try {
            model.addAttribute("books", this.booksService.getById(id));
            return "/admin/editbooks";
        } catch (DAOException e) {
            model.addAttribute("message",  errorDAOException);
            return ADMINBOOKS;
            // return "redirect:" + request.getHeader("referer");
        }
    }

    @RequestMapping(value = "/admin/logout", method = {RequestMethod.GET, RequestMethod.POST})
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
            SecurityContextHolder.getContext().setAuthentication(null);
        }
        return "redirect:/";
    }
}
}
