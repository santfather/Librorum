package java;

import org.apache.log4j.Logger;

import java.util.ResourceBundle;

public class MessageDAO  {
    private static Logger log = Logger.getLogger(MessageDAO.class);

    private final static ResourceBundle resourceBundle = ResourceBundle.getBundle("messagesDAO");

    private MessageDAO() {
    }

    public static String getProperty(String key) {
        log.info("gettiong property in MessageDAO" + key);
        return resourceBundle.getString(key);
    }
}
