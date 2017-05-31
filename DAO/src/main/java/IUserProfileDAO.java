package java;

public interface IUserProfileDAO extends java.IBaseDAO<java.UserProfile> {
    java.UserProfile getUserProfileByType(String type) throws java.DAOException;
}
