package br.com.umcar.model.DAO;

import br.com.umcar.model.Automovel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import br.com.umcar.util.Conexao;


public class AutomovelDAO {

public void cadastrar(Automovel automovel){
        try{

            Connection conexao = Conexao.getConexao();

            String sql = "INSERT INTO automovel (placa, marca, modelo, chassi, observacoes, portas, passageiros, tipoAutomovel, cor, valorVenda, status)VALUES(?,?,?,?,?,?,?,?,?,?,'Disponível');";
             
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            pstmt.setInt(1, automovel.getPlaca());
            pstmt.setString(2, automovel.getMarca());
            pstmt.setString(3, automovel.getModelo());
            pstmt.setString(4, automovel.getChassi());
            pstmt.setString(5, automovel.getObservacoes());
            pstmt.setInt(6, automovel.getPortas());
            pstmt.setInt(7, automovel.getPassageiros());
            pstmt.setString(8, automovel.getTipoAutomovel());
            pstmt.setString(9, automovel.getCor());
            pstmt.setDouble(10, automovel.getValorVenda());
            
            pstmt.execute();

            conexao.close();
            
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }
    
    public List<Automovel> listar(){
        List<Automovel> listaAutomovel = null;
        try{
            Connection conexao = Conexao.getConexao();
            
            String sql = "SELECT * FROM automovel;";
            
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            
            ResultSet rs = pstmt.executeQuery();
            
            listaAutomovel = new ArrayList<>();
            
            while(rs.next()){
                Automovel automovel = new Automovel();
                
                automovel.setIdAutomovel(rs.getInt("idAutomovel"));
                automovel.setPlaca(rs.getInt("placa"));
                automovel.setMarca(rs.getString("marca"));
                automovel.setModelo(rs.getString("modelo"));
                automovel.setChassi(rs.getString("chassi"));
                automovel.setObservacoes(rs.getString("observacoes"));
                automovel.setPortas(rs.getInt("portas"));
                automovel.setPassageiros(rs.getInt("passageiros"));
                automovel.setTipoAutomovel(rs.getString("tipoAutomovel"));
                automovel.setCor(rs.getString("cor"));
                automovel.setValorVenda(rs.getDouble("valorVenda"));
                automovel.setStatus(rs.getString("status"));
                
                listaAutomovel.add(automovel);
            }
            
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return listaAutomovel;  
    }
    
    public List<Automovel> listarDisponivel(){
        List<Automovel> listaAutomovel = null;
        try{
            Connection conexao = Conexao.getConexao();
            
            String sql = "SELECT * FROM automovel WHERE status = 'Disponível';";
            
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            
            ResultSet rs = pstmt.executeQuery();
            
            listaAutomovel = new ArrayList<>();
            
            while(rs.next()){
                Automovel automovel = new Automovel();
                
                automovel.setIdAutomovel(rs.getInt("idAutomovel"));
                automovel.setPlaca(rs.getInt("placa"));
                automovel.setMarca(rs.getString("marca"));
                automovel.setModelo(rs.getString("modelo"));
                automovel.setChassi(rs.getString("chassi"));
                automovel.setObservacoes(rs.getString("observacoes"));
                automovel.setPortas(rs.getInt("portas"));
                automovel.setPassageiros(rs.getInt("passageiros"));
                automovel.setTipoAutomovel(rs.getString("tipoAutomovel"));
                automovel.setCor(rs.getString("cor"));
                automovel.setValorVenda(rs.getDouble("valorVenda"));
                automovel.setStatus(rs.getString("status"));
                
                listaAutomovel.add(automovel);
            }
            
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return listaAutomovel;  
    }
    
    public void atualizar(Automovel automovel){
        try{

            Connection conexao = Conexao.getConexao();

            String sql = "UPDATE automovel SET placa = ?,marca = ?,modelo = ?, chassi = ?,observacoes = ?,portas = ?, passageiros = ?,tipoAutomovel = ?, cor = ?, "
                    + "valorVenda = ? WHERE idAutomovel = ?;";           

            PreparedStatement pstmt = conexao.prepareStatement(sql);
            pstmt.setInt(1, automovel.getPlaca());
            pstmt.setString(2, automovel.getMarca());
            pstmt.setString(3, automovel.getModelo());
            pstmt.setString(4, automovel.getChassi());
            pstmt.setString(5, automovel.getObservacoes());
            pstmt.setInt(6, automovel.getPortas());
            pstmt.setInt(7, automovel.getPassageiros());
            pstmt.setString(8, automovel.getTipoAutomovel());
            pstmt.setString(9, automovel.getCor());
            pstmt.setDouble(10, automovel.getValorVenda());
            pstmt.setInt(11, automovel.getIdAutomovel());
            pstmt.executeUpdate();

            conexao.close();
            
        }catch(SQLException e){
            throw new RuntimeException(e);
        }        
    }
    
    
    public void excluir(Automovel automovel){
        try{

            Connection conexao = Conexao.getConexao();

            String sql = "DELETE FROM automovel WHERE idAutomovel=?;";
                  

            PreparedStatement pstmt = conexao.prepareStatement(sql);

            pstmt.setInt(1, automovel.getIdAutomovel());
            pstmt.execute();

            conexao.close();
            
        }catch(SQLException e){
            throw new RuntimeException(e);
        }        
    }
    
    public Automovel consulta(Automovel aut){
        Automovel automovel = new Automovel();
        try{
          
            Connection conexao = Conexao.getConexao();
            String sql = "SELECT * FROM automovel WHERE idAutomovel=?;";
            
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            pstmt.setInt(1, aut.getIdAutomovel());
            ResultSet rs = pstmt.executeQuery();

            while(rs.next()){
                
                automovel.setIdAutomovel(rs.getInt("idAutomovel"));
                automovel.setPlaca(rs.getInt("placa"));
                automovel.setMarca(rs.getString("marca"));
                automovel.setModelo(rs.getString("modelo"));
                automovel.setChassi(rs.getString("chassi"));
                automovel.setObservacoes(rs.getString("observacoes"));
                automovel.setPortas(rs.getInt("portas"));
                automovel.setPassageiros(rs.getInt("passageiros"));
                automovel.setTipoAutomovel(rs.getString("tipoAutomovel"));
                automovel.setCor(rs.getString("cor"));
                automovel.setValorVenda(rs.getDouble("valorVenda"));
                automovel.setStatus(rs.getString("status"));
                
                conexao.close();
            }
            return automovel;
            
        }catch (Exception e){
            throw new RuntimeException(e);
        }
        
    }
    
    public void baixar (Automovel automovel) {
        try{

            Connection conexao = Conexao.getConexao();

            String sql = "UPDATE automovel SET status = 'Vendido' WHERE idautomovel = ?;";
            
            PreparedStatement pstmt = conexao.prepareStatement(sql);            
            
            pstmt.setInt(1, automovel.getIdAutomovel());
            
            pstmt.executeUpdate();

            conexao.close();
            
        } catch(SQLException e){
            throw new RuntimeException(e);
        }
    }
    
    public void colocarTransacao (Automovel automovel) throws SQLException {
        
        Connection conexao = Conexao.getConexao();
        
        try{            

            String sql = "UPDATE automovel SET status = 'Em Transacao' WHERE idautomovel = ?;";
            
            PreparedStatement pstmt = conexao.prepareStatement(sql); 
            pstmt.setInt(1, automovel.getIdAutomovel());
            
            pstmt.executeUpdate();
            
        } catch(SQLException e){
            throw new RuntimeException(e);
        } finally {
            conexao.close();
        }
    }
    
    public double calculaTotal(Automovel automovel) {
        
        double total = 0;
        
        try {
            Connection conexao = Conexao.getConexao();

            String sql = "SELECT valorVenda FROM automovel WHERE idautomovel = ?;";
                    
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            pstmt.setInt(1, automovel.getIdAutomovel());
            pstmt.execute();
            ResultSet rs = pstmt.executeQuery();
            
            rs.next();
            
            total = rs.getDouble("valorVenda");           
            
        } catch(SQLException e){
            throw new RuntimeException(e);
        }
        return total;
    }
    
}
