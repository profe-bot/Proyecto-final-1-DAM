Overview:

New features:

-querys are stored up to a number on the database, say 50 or 100 and then the oldest entry is deleted to make space for the new one.

Questions: 

-Why is busquedas and usuarios connected? I think we could add a table that is limited in attributes but represents how the service makes the searches, so that nothing passes fk to users and makes it an independent table. searches can still be made without being registered, 

- in the same vein, are we sure we want users to be able to make changes and create mazos but without being registered? this to me defeats the requirements of the assignment of creating a service undermining the process of registration, a key feature of our assignment.


Some supplementary code i searched up:

import java.sql.*;

public class InsertData {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/your_database_name";
        String username = "your_username";
        String password = "your_password";

        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            // Generate values for busquedas table
            int idBusqueda = generateId();
            String detallesBusqueda = "Search: something"; // You can get this from user input
            Time horaBuscada = new Time(System.currentTimeMillis()); // Get current time
            
            // Insert data into busquedas table
            String insertBusquedas = "INSERT INTO busquedas (id_busqueda, detalles_busqueda, hora_buscada) VALUES (?, ?, ?)";
            PreparedStatement pstmtBusquedas = conn.prepareStatement(insertBusquedas);
            pstmtBusquedas.setInt(1, idBusqueda);
            pstmtBusquedas.setString(2, detallesBusqueda);
            pstmtBusquedas.setTime(3, horaBuscada);
            pstmtBusquedas.executeUpdate();
            
            // Generate values for historia_de_busquedas table
            int idHistoriaBusqueda = generateId();
            
            // Insert data into historia_de_busquedas table
            String insertHistoriaBusqueda = "INSERT INTO historia_de_busquedas (id_historia_busqueda, id_busqueda, detalles_buscada) VALUES (?, ?, ?)";
            PreparedStatement pstmtHistoriaBusqueda = conn.prepareStatement(insertHistoriaBusqueda);
            pstmtHistoriaBusqueda.setInt(1, idHistoriaBusqueda);
            pstmtHistoriaBusqueda.setInt(2, idBusqueda);
            pstmtHistoriaBusqueda.setString(3, detallesBusqueda);
            pstmtHistoriaBusqueda.executeUpdate();

            System.out.println("Data inserted successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to generate a unique ID (you can replace this with your own logic)
    private static int generateId() {
        return (int) (Math.random() * 1000000000); // Example of generating random ID
    }
}







High level structure for the site


GLOBAL

       


-User

	-Register
	
		-<HTML>
		-<JSP>
		-<JAV>
		-<MySQL>
	
	-Login
	https://www.javatpoint.com/login-form-in-jsp
	
		-<HTML> Display login screen
		-<JSP> Scans and sends the username and password input to the setters/getters
		-<JAV> Checks the database for the given username and password combination and enables the parts of the site that need user permissions to access
		-<MySQL> Contanins the password and username to check
		
	-Change password
	
		-<HTML>
		-<JSP>
		-<JAV>
		-<MySQL>
	
	-Logout
	
		-<HTML>
		-<JSP>
		-<JAV>
		-<MySQL>
	
	-Profile
	
		-<HTML>
		-<JSP>
		-<JAV>
		-<MySQL>
	
	-Change email/data
	
		-<HTML>
		-<JSP>
		-<JAV>
		-<MySQL>
	
-Search
	
	-Query


	-Change display



-Decks

	-Make deck
	
	
	-Edit deck
	
	
	-Delete deck
	
	
	-Import deck
	
	
	-Export deck



-Game log

	-Log game
	
	
	-Edit game
	
	
	-Delete game


	-See game


-Print

	-Get deck
	
	
	-Send to printer
