package java;

import org.apache.log4j.Logger;

import java.util.ResourceBundle;

public class ConfigManagerWeb {
    private static Logger log = Logger.getLogger(ConfigManagerWeb.class);

    private final ResourceBundle resourceBundle = ResourceBundle.getBundle("bundle/configWeb");

    private ConfigManagerWeb() {
    }

    private static ConfigManagerWeb configManagerWeb;

    public static ConfigManagerWeb getConfigManagerWeb() {
        ConfigManagerWeb newConfMan = configManagerWeb;
        if (newConfMan == null) {
            synchronized (ConfigManagerWeb.class) {
                newConfMan = configManagerWeb;
                if (newConfMan == null) {
                    configManagerWeb = newConfMan = new ConfigManagerWeb();
                }
            }
        }
        return newConfMan;
    }

    public String getProperty(String key) {
        log.info("getting property in ConfigManagerWeb in Web layer" + key);
        return resourceBundle.getString(key);
    }
}

