package br.com.wizard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.com.wizard.database.Database;
import br.com.wizard.database.DatabaseFactory;
import br.com.wizard.model.Login;

public class LoginDao {

	public String logar(Login login) {
		String retorno = "falha";
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "SELECT USUARIO, SENHA FROM USUARIOS WHERE USUARIO=? AND SENHA=?";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, login.getUsuario());
			stmt.setString(2, login.getSenha());
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				retorno = "sucesso";
			}
		} catch (SQLException ex) {
			System.out.println("Erro ao consultar usuário: " + ex);
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return retorno;
	}

}
