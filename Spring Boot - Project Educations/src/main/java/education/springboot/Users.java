package education.springboot;

import javax.persistence.*;

import java.util.Date;

import static javax.persistence.GenerationType.SEQUENCE;


    @Entity
    @Table(name = "users")
    public class Users {

        private int id;
        private String username;
        private String password;
        private String email;
        private int age;
        private Date date;



        public Users() {
        }

        public Users(String username, String password, String email, int age, Date date) {
            this.username = username;
            this.password = password;
            this.email = email;
            this.age = age;
            this.date = date;
        }


        @Id
        @GeneratedValue(strategy = SEQUENCE)
        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }


        @Column(name = "username", nullable = false, unique = true, updatable = false)
        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        @Column(name = "password", nullable = false)
        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        @Column(name = "email")
        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        @Column(name = "age")
        public int getAge() {
            return age;
        }

        public void setAge(int age) {
            this.age = age;
        }

        @Column(name = "date")
        public Date getDate() {
            return date;
        }

        public void setDate(Date date) {
            this.date = date;
        }

        @Override
        public String toString() {
            return "Users{" +
                    "id=" + id +
                    ", username='" + username + '\'' +
                    ", password='" + password + '\'' +
                    ", email='" + email + '\'' +
                    ", age=" + age +
                    ", date=" + date +
                    '}';
        }
    }
