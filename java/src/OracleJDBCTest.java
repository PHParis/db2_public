package src;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class OracleJDBCTest {
    public static void main(String[] args) {
        // Connexion à la base de données Oracle dans un conteneur Docker
        String jdbcUrl = "jdbc:oracle:thin:@oracle-db:1521/MYPDB";
        String username = "PH";
        String password = "MySuperPassword2024";

        try {
            // Charger le driver JDBC Oracle
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Connexion à la base de données Oracle
            Connection conn = DriverManager.getConnection(jdbcUrl, username, password);

            System.out.println("Connexion réussie à Oracle!");

            // Fermer la connexion
            conn.close();
        } catch (ClassNotFoundException e) {
            System.out.println("Erreur : Le driver JDBC Oracle est introuvable.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Erreur de connexion à la base de données.");
            e.printStackTrace();
        }
    }
}
