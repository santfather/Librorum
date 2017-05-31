package java;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Data
@NoArgsConstructor
@Entity
@Table(name = "USER")
public class User implements Serializable {
    private static final long serialVersionUID = 100L;


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "USER_ID", unique = true)
    private Integer userId;

    @Column(name = "LOGIN", nullable = false)
    private String login;

    @Column(name = "PASSWORD", nullable = false)
    private String password;

    @Column(name = "NAME", nullable = false)
    private String name;

    @Column(name = "SURNAME")
    private String surname;

    @Column(name = "EMAIL")
    private String email;

    @ManyToMany(mappedBy = "users", cascade = CascadeType.PERSIST)
    private Set<java.Books> books = new HashSet<>();

    @Column(name = "STATE"/*, nullable = false*/)
    private String state = java.State.ACTIVE.getState();

    public User(String login, String password, String name, String surname, String email, String state) {
        this.login = login;
        this.password = password;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.state = state;
    }

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
    @JoinTable(name = "USER_USER_PROFILE",
            joinColumns = {@JoinColumn(name = "USER_ID")},
            inverseJoinColumns = {@JoinColumn(name = "USER_PROFILE_ID")})
    private Set<java.UserProfile> userProfiles = new HashSet<>();


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof User)) return false;

        User user = (User) o;

        if (userId != (user.userId)) return false;
        if (!login.equals(user.login)) return false;
        if (!password.equals(user.password)) return false;
        if (!name.equals(user.name)) return false;
        if (!surname.equals(user.surname)) return false;
        if (!email.equals((user.email))) return false;
        return true;
    }

    @Override
    public int hashCode() {
        int result = userId;
        result = 20 * result + (userId != 0 ? userId : 0);
        result = 20 * result + (login != null ? login.hashCode() : 0);
        result = 20 * result + (password != null ? password.hashCode() : 0);
        result = 20 * result + (name != null ? name.hashCode() : 0);
        result = 20 * result + (surname != null ? surname.hashCode() : 0);
        result = 20 * result + (email != null ? email.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", login='" + login + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", email=" + email +
                ", state='" + state + '\'' +
                ", userProfiles=" + userProfiles +
                '}';
    }
}
