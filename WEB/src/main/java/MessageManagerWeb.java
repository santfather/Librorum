package java;

import org.apache.log4j.Logger;

import java.util.ResourceBundle;

public class MessageManagerWeb {
    private static Logger log = Logger.getLogger(MessageManagerWeb.class);

    private final static ResourceBundle resourceBundle = ResourceBundle.getBundle("i18n/messages");

    private MessageManagerWeb() {
    }

    public static String getProperty(String key) {
        log.info("gettiong property in MessageManagerWeb in web layer" + key);
        return resourceBundle.getString(key);
    }
}

