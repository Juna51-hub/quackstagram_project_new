import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CheckPost {

    private static final String URL = "jdbc:mysql://localhost:3306/quackstagram";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    public static void getPostsByUser(int userID) {

        try {

            Connection conn = DriverManager.getConnection(URL, DB_USER, DB_PASSWORD);

            String sql = "SELECT caption FROM Posts WHERE userID = ?";

            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setInt(1, userID);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                System.out.println("Post: " + rs.getString("caption"));

            }

            conn.close();

        } catch (Exception e) {

            System.out.println("Query failed");
            e.printStackTrace();

        }
    }
}