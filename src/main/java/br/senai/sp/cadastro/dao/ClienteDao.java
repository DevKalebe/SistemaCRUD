package br.senai.sp.cadastro.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.management.RuntimeErrorException;

import br.senai.sp.cadastro.model.Cliente;

public class ClienteDao {
	private Connection conexao;

	public ClienteDao() {
		conexao = ConnectionFactory.conectar();
	}

	public void inserir(Cliente cliente) {
		String sql = "INSERT INTO CLIENTES (NOME, GENERO, EMAIL, ENDERECO, CELULAR, PRODUTO_INTERESSE, DATA_NASCIMENTO, DATA_CADASTRO) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
		PreparedStatement stmt;

		try {
			stmt = conexao.prepareStatement(sql);
			stmt.setString(1, cliente.getNome());
			stmt.setString(2, cliente.getGenero());
			stmt.setString(3, cliente.getEmail());
			stmt.setString(4, cliente.getEndereco());
			stmt.setString(5, cliente.getCelular());
			stmt.setString(6, cliente.getProduto());
			stmt.setDate(7, new Date(cliente.getDataNascimento().getTimeInMillis()));
			stmt.setTimestamp(8, new Timestamp(Calendar.getInstance().getTimeInMillis()));
			stmt.execute();
			stmt.close();
			conexao.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	// criando o metodo de chamar as informações para a tabela
	public List<Cliente> listar() {
		String sql = "SELECT * FROM CLIENTES ORDER BY ID ASC";
		PreparedStatement stmt;
		List<Cliente> lista = new ArrayList<Cliente>();
		try {
			stmt = conexao.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			// verifincando se possivel ir para a proxima linha no banco, se não ele executa
			// o select
			while (rs.next()) {
				Cliente c = new Cliente(rs.getLong("ID"), rs.getString("NOME"), rs.getString("GENERO"),
						rs.getString("EMAIL"), rs.getString("ENDERECO"), rs.getString("CELULAR"),
						rs.getString("PRODUTO_INTERESSE"));

				Calendar data = Calendar.getInstance();
				Date nascDb = rs.getDate("DATA_NASCIMENTO");
				data.setTimeInMillis(nascDb.getTime());
				c.setDataNascimento(data);

				Calendar date = Calendar.getInstance();
				Date cadastroDb = rs.getDate("DATA_CADASTRO");
				date.setTimeInMillis(cadastroDb.getTime());
				c.setDataCadastro(date);
				lista.add(c);
			}
			rs.close();
			stmt.close();
			conexao.close();
			return lista;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void excluir(long idCliente) {
		String sql = "DELETE FROM CLIENTES WHERE ID = ?";
		PreparedStatement stmt;
		try {
			stmt = conexao.prepareStatement(sql);
			stmt.setLong(1, idCliente);
			stmt.execute();
			stmt.close();
			conexao.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public void atualizar(Cliente cliente) {
		String sql = "UPDATE CLIENTES SET NOME = ?, GENERO = ?, EMAIL = ?, ENDERECO = ?, CELULAR = ?, PRODUTO_INTERESSE = ? WHERE ID = ?";
		PreparedStatement stmt;

		try {
			stmt = conexao.prepareStatement(sql);
			stmt.setString(1, cliente.getNome());
			stmt.setString(2, cliente.getGenero());
			stmt.setString(3, cliente.getEmail());
			stmt.setString(4, cliente.getEndereco());
			stmt.setString(5, cliente.getCelular());
			stmt.setString(6, cliente.getProduto());
			stmt.setLong(7, cliente.getId());
			stmt.execute();
			stmt.close();
			conexao.close();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public Cliente buscar(long idCliente) {
		String sql = "SELECT * FROM CLIENTES WHERE ID = ?";
		PreparedStatement stmt;
		Cliente c = null;

		try {
			stmt = conexao.prepareStatement(sql);
			stmt.setLong(1, idCliente);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				c = new Cliente(rs.getLong("ID"), rs.getString("NOME"), rs.getString("GENERO"), rs.getString("EMAIL"),
						rs.getString("ENDERECO"), rs.getString("CELULAR"), rs.getString("PRODUTO_INTERESSE"));

				Calendar data = Calendar.getInstance();
				Date nascDb = rs.getDate("DATA_NASCIMENTO");
				data.setTimeInMillis(nascDb.getTime());
				c.setDataNascimento(data);
			}
			rs.close();
			stmt.close();
			conexao.close();
			return c;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public int contar(String genero) {

		String sql = "SELECT COUNT(genero) AS contador FROM `clientes` WHERE genero = ?";
		PreparedStatement stmt;

		try {
			stmt = conexao.prepareStatement(sql);
			stmt.setString(1, genero);
			int qtd = 0;
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				qtd = rs.getInt("contador");
			}
			stmt.execute();
			stmt.close();
			conexao.close();
			return qtd;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public int diaSemana(String diaSemana) {

		String sql = "SELECT ID, DATA_CADASTRO AS DataCadastrada FROM `clientes`";
		PreparedStatement stmt;
		try {
			int qtdDiaSemana = 0;

			return qtdDiaSemana;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public int dia(Long idCliente) {
		String sql = "SELECT DATA_CADASTRO FROM `clientes` WHERE id = ?";
		PreparedStatement stmt;
		try {
			stmt = conexao.prepareStatement(sql);
			stmt.setLong(1, idCliente);

			ResultSet rs = stmt.executeQuery();
			int valorDiaSemana = 0;
			if (rs.next()) {
				Calendar dia = Calendar.getInstance();
				Date diaSql = rs.getDate("DATA_CADASTRO");
				dia.setTime(diaSql);
				valorDiaSemana = dia.get(Calendar.DAY_OF_WEEK);
			}
			stmt.execute();
			stmt.close();
			conexao.close();
			return valorDiaSemana;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public int hora(Long idCliente) {
		String sql = "SELECT HOUR(DATA_CADASTRO) AS HORA FROM clientes WHERE ID = ?";
		PreparedStatement stmt;
		try {
			stmt = conexao.prepareStatement(sql);
			stmt.setLong(1, idCliente);

			ResultSet rs = stmt.executeQuery();
			int hora = 0;
			if (rs.next()) {
//				Calendar hora = Calendar.getInstance();
//				Date horaSql = rs.getDate("DATA_CADASTRO");
//				hora.setTime(horaSql);
//				valorHora = hora;
				hora = rs.getInt("HORA");
			}
			stmt.execute();
			stmt.close();
			conexao.close();
			return hora;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
