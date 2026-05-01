import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserService {

    private static final String URL = "jdbc:mysql://localhost:3306/quackstagram";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    public static boolean registerUser(String username, String password, String bio) {

        String sql = "INSERT INTO Users (username, password, bio) VALUES (?, ?, ?)";

        try {

            Connection conn = DriverManager.getConnection(URL, DB_USER, DB_PASSWORD);

            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, bio);

            stmt.executeUpdate();

            System.out.println("User created");

            conn.close();

            return true;

        } catch (SQLException e) {

            if(e.getMessage().contains("Duplicate entry")){
                System.out.println("Username already exists");
            }else{
                 System.out.println("User registration failed");
            }

        }

        return false;
    }
}