package jar;

import exceptions.DAOException;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@CrossOrigin
public class UserAdminController {
    private static Logger log = Logger.getLogger(UserAdminController.class);

    @Autowired
    private IUserService userService;
    public static final String ADMINUSERS = "/admin/users";

    @RequestMapping(value = "/admin/users", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView usersCollection() throws DAOException {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("user", new User());
        try {
            modelAndView.addObject("listUsers", this.userService.findAll());
            modelAndView.setViewName(ADMINUSERS);
            return modelAndView;
        } catch (DAOException e) {
            modelAndView.addObject("message", errorDAOException);
            modelAndView.setViewName(ADMINUSERS);
            return modelAndView;
            // return "redirect:" + request.getHeader("referer");
        }
    }

    @RequestMapping(value = "/edituser/{id}", method = {RequestMethod.GET, RequestMethod.POST})
    public String editUser(@PathVariable("id") int id, Model model) throws DAOException {
        try {
            model.addAttribute("user", this.userService.getById(id));
            return "/admin/edituser";
        } catch (DAOException e) {
            model.addAttribute("message", errorDAOException);
            return ADMINUSERS;
            // return "redirect:" + request.getHeader("referer");
        }
    }

    @RequestMapping(value = "/edit/user", method = RequestMethod.POST)
    public String updateUser(@RequestParam("userId") Integer userId, @RequestParam("State") String state, Model model) throws DAOException {
        try {
            this.userService.updateUserState(userId, State);
            return "redirect:/admin/users";
        } catch (DAOException e) {
            model.addAttribute("message", errorDAOException);
            return ADMINUSERS;
            // return "redirect:" + request.getHeader("referer");
        }
    }
    }

