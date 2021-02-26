package br.com.wizard.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DatabasePostgreSQL implements Database {
	private Connection connection;

	public Connection conectar() {
		try {						
			DriverManager.registerDriver(new org.postgresql.Driver());
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/wizard", "postgres",
					"admin");
			//System.out.println("Conectado no Banco!");
			return connection;
		} catch (SQLException | ClassNotFoundException ex) {
			Logger.getLogger(DatabasePostgreSQL.class.getName()).log(Level.SEVERE, null, ex);
			System.out.println("Não Conectado no Banco! Erro: " + ex);
			return null;
		}
	}
	
	public void desconectar(Connection connection) {
		try {
			connection.close();
			//System.out.println("Conexão Encerrada!");
		} catch (SQLException ex) {
			Logger.getLogger(DatabasePostgreSQL.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

}
