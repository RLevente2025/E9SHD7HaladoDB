package E9SHD7;

import java.sql.*;

public class DbMethods {
    final static String url = "jdbc:sqlite:C:/sqlite/autodb";


    public static void Register() {
        try {
            Class.forName("org.sqlite.JDBC");
        } catch (ClassNotFoundException e) {
            System.out.println("Class not found exeption: " + e.getMessage());
        }
    }


    public static Connection Connect() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return conn;
    }

    public static void DisConnect(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            }
            catch (SQLException e)
            {
                System.out.println(e.getMessage());
            }
        }
    }


    public static void CommandExec(String command) {
        Connection conn = Connect();
        try {
            Statement s = conn.createStatement();
            s.execute(command);
        }
        catch (SQLException e) {
            System.out.println("Command" + command);
            System.out.println("Parancs hiba: " + e.getMessage());
        }
    }


    private static void ReadALLData() {
        String rendszam = "";
        String tipus = "";
        String szin = "";
        String tulaj = "";
        int kor = "";
        int ar = "";
        String sqlp = "SELETC Rendszam, Tipus, Szin, Kor, Ar, Tulaj, Tulaj FROm Auto";
        Connection conn = Connect();

        System.out.println("Autó tábla\n");

        try {
            Statement statement = conn.createStatement();
            ResultSet resoult_set = statement.executeQuery(sqlp);

            while(resoult_set.next()) {
                rendszam = resoult_set.getString("Rendszam");
                tipus = resoult_set.getString("Tipus");
                szin = resoult_set.getString("Szin")

            }

        }
    }
