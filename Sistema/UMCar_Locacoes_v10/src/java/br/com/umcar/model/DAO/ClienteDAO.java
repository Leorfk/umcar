package br.com.umcar.model.DAO;

import br.com.umcar.model.Cliente;
import br.com.umcar.util.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ClienteDAO {
    
    public void cadastrar(Cliente cliente) throws SQLException{
        
            Connection conexao = Conexao.getConexao();
            
        try {
                        
            String sql = "INSERT INTO cliente(nome, cpf, tel_res, tel_cel, e_mail) VALUES (?,?,?,?,?);";
            
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            pstmt.setString(1, cliente.getNome());
            pstmt.setString(2, cliente.getCpf());
            pstmt.setString(3, cliente.getTelRes());
            pstmt.setString(4, cliente.getTelCel());
            pstmt.setString(5, cliente.getEmail());
            
            pstmt.execute();
            
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            conexao.close();
        }
    }
    
    public void alterar(Cliente cliente) throws SQLException {
    
        Connection conexao = Conexao.getConexao();
        
        try {
            
            String sql = "UPDATE cliente SET nome = ?, cpf = ?, tel_res = ?, tel_cel = ?, e_mail = ? WHERE idcliente = ?;";
            
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            pstmt.setString(1, cliente.getNome());
            pstmt.setString(2, cliente.getCpf());
            pstmt.setString(3, cliente.getTelRes());
            pstmt.setString(4, cliente.getTelCel());
            pstmt.setString(5, cliente.getEmail());
            pstmt.setInt(6, cliente.getId());
            
            pstmt.executeUpdate();
            
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            conexao.close();
        }
    }
    
    public List<Cliente> listar() throws SQLException{
        List<Cliente> clientes = null;
        Connection conexao = Conexao.getConexao();
        
        try {
            
            String sql = "SELECT * FROM cliente";
            
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            
            ResultSet rs = pstmt.executeQuery();
            
            clientes = new ArrayList<>();
            
            while(rs.next()) {
                Cliente cliente = new Cliente();
                
                cliente.setId(rs.getInt("idcliente"));
                cliente.setNome(rs.getString("nome"));
                cliente.setCpf(rs.getString("cpf"));
                cliente.setTelRes(rs.getString("tel_res"));
                cliente.setTelCel(rs.getString("tel_cel"));
                cliente.setEmail(rs.getString("e_mail"));
                
                clientes.add(cliente);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            conexao.close();
        }
        return clientes;
    }
    
    public Cliente Consulta(Cliente cliente){
        Cliente listaCliente = new Cliente();
        try{
          
            Connection conexao = Conexao.getConexao();
            String sql = "SELECT * FROM cliente WHERE idcliente=?";
            
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            pstmt.setInt(1, cliente.getId());
            ResultSet rs = pstmt.executeQuery();

            while(rs.next()){
                
                listaCliente.setId(rs.getInt("idcliente"));
                listaCliente.setNome(rs.getString("nome"));
                listaCliente.setCpf(rs.getString("cpf"));
                listaCliente.setTelRes(rs.getString("tel_res"));
                listaCliente.setTelCel(rs.getString("tel_cel"));
                listaCliente.setEmail(rs.getString("e_mail"));
                
                conexao.close();
            }
            return listaCliente;
            
        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }
}
