import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnectionTest {

    // database URL
    private static String dbUrl = "jdbc:mysql://localhost:3306/quackstagram";
    // database username
    private static String dbUsername = "root";
    // database password
    private static String dbPassword = "";
    public static void main(String[] args) {

        try {

            // establish connection
            Connection myCon = DriverManager.getConnection(
                dbUrl,
                dbUsername,
                dbPassword
            );

            System.out.println("Connection successful");

            // create statement
            Statement stmt = myCon.createStatement();

            // execute query
            ResultSet rs = stmt.executeQuery(
                "SELECT username FROM Users WHERE username='checkpointmember'"
            );

            if (rs.next()) {
                System.out.println(
                    "Checkpoint member found: " + rs.getString("username")
                );
            }

            myCon.close();

        } catch (Exception e) {

            System.out.println("Database connection failed");
            e.printStackTrace();

        }
    }
}