package br.com.wizard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.wizard.database.Database;
import br.com.wizard.database.DatabaseFactory;
import br.com.wizard.model.Aniversariantes;

public class AniversariantesDao {

	public Aniversariantes mesAtual(Aniversariantes aniversariantes) {
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "SELECT F_RETORNAMES() AS MES";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			aniversariantes.setMesAtual(rs.getString("MES"));
		} catch (SQLException ex) {
			System.out.println("Erro ao executar a função F_RETORNAMES! Erro: " + ex);
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return aniversariantes;
	}

	public List<Aniversariantes> listar() {
		List<Aniversariantes> c = new ArrayList<Aniversariantes>();
		Database database = DatabaseFactory.getDatabase("postgresql");
		String sql = "SELECT NOME, CARGO, ESPECIALIDADE, TO_CHAR(NASCIMENTO,'DD') AS DIA FROM CONSULTORES WHERE TO_CHAR(NASCIMENTO,'MM')=TO_CHAR(CURRENT_DATE, 'MM') ORDER BY NOME";
		Connection conn = database.conectar();
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Aniversariantes aniversariantes = new Aniversariantes();
				aniversariantes.setNome(rs.getString("NOME"));
				aniversariantes.setCargo(rs.getString("CARGO"));
				aniversariantes.setEspecialidade(rs.getString("ESPECIALIDADE"));
				aniversariantes.setDia(Integer.valueOf(rs.getString("DIA")));
				c.add(aniversariantes);
			}
			database.desconectar(conn);
		} catch (SQLException ex) {
			System.out.println("Erro ao listar os aniversariantes! Erro: " + ex);
			database.desconectar(conn);
		} finally {
			database.desconectar(conn);
		}
		return c;
	}

}
