import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class FollowService {

    private static final String URL = "jdbc:mysql://localhost:3306/quackstagram";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    public static void followUser(int followerID, int followedID) {

        try {

            Connection conn = DriverManager.getConnection(URL, DB_USER, DB_PASSWORD);

            String sql = "INSERT INTO Follows (followerID, followedID) VALUES (?, ?)";

            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setInt(1, followerID);
            stmt.setInt(2, followedID);

            stmt.executeUpdate();

            System.out.println("User followed");

            conn.close();

        } catch (Exception e) {
            System.out.println("User already follows this account");

        }
    }
}