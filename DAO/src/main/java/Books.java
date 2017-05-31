package java;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import java.io.Serializable;
import java.time.Year;
import java.util.HashSet;
import java.util.Set;
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    @Entity
    @Table(name = "BOOKS")
    @org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    public class Books implements Serializable {
        private static final long serialVersionUID = 200L;


        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name = "ID", unique = true)
        private Integer Id;

        @Column(name = "AUTHOR", nullable = false)
        private String author;

        @Column(name = "NAME")
        private String name;

        @Column(name = "YEAR")
        private Year year;

        @Column(name = "BOOKGENRE")
        private String bookgenre;

        @Column(name = "QUANTITY")
        private Integer quantuty;

        @Column(name = "AVAILABILITY")
        private Boolean availability;

        @ManyToOne( cascade = CascadeType.PERSIST)
        @JoinColumn(name = "BOOKS_TYPE_ID")
        private java.BooksType booksType;

        //  @ManyToMany(cascade = CascadeType.ALL)
        @ManyToMany(cascade = CascadeType.PERSIST)
        @JoinTable(name = "BOOKS_USER", joinColumns = {@JoinColumn(name = "USER_ID")}, inverseJoinColumns = {@JoinColumn(name = "BOOKS_ID")})
        private Set<java.User> user = new HashSet<>();

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (!(o instanceof Books)) return false;

            Books books = (Books) o;

            if (Id != (books.Id)) return false;
            if (! author.equals(books.author)) return false;
            if (!name.equals(books.name)) return false;
            if (availability != (books.availability)) return false;
            return true;
        }

        @Override
        public int hashCode() {
            int result = Id;
            result = 20 * result + (Id != 0 ? Id : 0);
            result = 20 * result + (author != null ? author.hashCode() : 0);
            result = 20 * result + (name != null ? name.hashCode() : 0);
            result = 20 * result + (availability ? 1 : 0);
            return result;
        }

        @Override
        public String toString() {
            return "Books{" +
                    "Id=" + Id +
                    ", author=" + author +
                    ", name='" + name + '\'' +
                    ", bookgenre=" + bookgenre + '}';


        }
    }

