import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class PostService {

    private static final String URL = "jdbc:mysql://localhost:3306/quackstagram";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    public static void createPost(int userID, String caption) {

        try {

            Connection conn = DriverManager.getConnection(URL, DB_USER, DB_PASSWORD);

            String sql = "INSERT INTO Posts (userID, caption) VALUES (?, ?)";

            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setInt(1, userID);
            stmt.setString(2, caption);

            stmt.executeUpdate();

            System.out.println("Post created");

            conn.close();

        } catch (Exception e) {

            System.out.println("Post creation failed");
            e.printStackTrace();

        }
    }
}