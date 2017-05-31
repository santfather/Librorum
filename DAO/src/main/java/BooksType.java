package java;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Setter
@Getter
@ToString

@AllArgsConstructor
@Entity
@Table(name = "BOOKS_TYPE")
public class BooksType implements Serializable{
    private static final long serialVersionUID = 200L;
    private final String name;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "BOOKS_TYPE_ID", unique = true)
    int bookstypeId;
    @Column(name = "BOOKS_TYPE", unique = true)
    @NotNull
    String bookstype;


    @OneToMany(mappedBy = "booksType", cascade = CascadeType.ALL)
    private Set<java.Books> books = new HashSet<>();

    public BooksType(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof java.Books)) return false;

        BooksType booksType = (BooksType) o;

        if (bookstypeId != (booksType.bookstypeId)) return false;
        if (!bookstype.equals(booksType.name)) return false;
        return true;
    }

    @Override
    public int hashCode() {
        int result = bookstypeId;
        result = 20 * result + (bookstypeId != 0 ? bookstypeId : 0);
        result = (20 * result) + ((name != null) ? name.hashCode() : 0);
        return result;
    }

}

