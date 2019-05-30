package br.com.umcar.model.DAO;

import br.com.umcar.model.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import br.com.umcar.util.Conexao;


public class UsuarioDAO {
    
    public void cadastrar(Usuario usuario){

        try{
            
            Connection conexao = Conexao.getConexao();
            
            String sql = "INSERT INTO usuario (nomeUsuario,email,senha) VALUES(?,?,?) ";
                  
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            pstmt.setString(1, usuario.getNomeUsuario());
            pstmt.setString(2, usuario.getEmail());
            pstmt.setString(3, usuario.getSenha());
            pstmt.execute();

            conexao.close();
            
        }catch(SQLException e){
            
            throw new RuntimeException(e);                                
        }
    }
    
    public List<Usuario> listar(){
        List<Usuario> listaUsuario = null;
        try{
            Connection conexao = Conexao.getConexao();
            
            String sql = "SELECT * FROM usuario";
            
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            
            ResultSet rs = pstmt.executeQuery();
            
            listaUsuario = new ArrayList<>();
            
            while(rs.next()){
                Usuario usuario = new Usuario();
                
                usuario.setIdUsuario(rs.getInt("idUsuario"));
                usuario.setNomeUsuario(rs.getString("NomeUsuario"));
                usuario.setEmail(rs.getString("Email"));
                usuario.setSenha(rs.getString("Senha"));

                listaUsuario.add(usuario);
            }   
        }catch(SQLException e){
            
            throw new RuntimeException(e);                                
        }
        return listaUsuario; 
    } 
    
    public void Atualizar(Usuario usuario){
        try{
            
            Connection conexao = Conexao.getConexao();
            
            String sql = "UPDATE usuario SET nomeUsuario = ?,email = ?,senha = ? where idUsuario = ?";
                  
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            pstmt.setString(1, usuario.getNomeUsuario());
            pstmt.setString(2, usuario.getEmail());
            pstmt.setString(3, usuario.getSenha());
            pstmt.setInt(4, usuario.getIdUsuario());
            pstmt.executeUpdate();

            conexao.close();
            
        }catch(SQLException e){
            
            throw new RuntimeException(e);                                
        } 
    }
    
    public void Excluir(Usuario usuario){
        try{
            
            Connection conexao = Conexao.getConexao();
       
            String sql = "DELETE FROM usuario WHERE idUsuario=?";
                  
            PreparedStatement pstmt = conexao.prepareStatement(sql);

            pstmt.setInt(1, usuario.getIdUsuario());
            pstmt.execute();
            
            conexao.close();
            
        }catch(SQLException e){
            
            throw new RuntimeException(e);                                
        }
        
    }
    public Usuario Consulta(Usuario usuario){
        Usuario listaUsuario = new Usuario();
        try{
          
            Connection conexao = Conexao.getConexao();
            String sql = "SELECT * FROM usuario WHERE idUsuario=?";
            
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            pstmt.setInt(1, usuario.getIdUsuario());
            ResultSet rs = pstmt.executeQuery();

            while(rs.next()){
                
                listaUsuario.setIdUsuario(rs.getInt("idUsuario"));
                listaUsuario.setNomeUsuario(rs.getString("NomeUsuario"));
                listaUsuario.setEmail(rs.getString("Email"));
                listaUsuario.setSenha(rs.getString("Senha"));

                conexao.close();
            }
            return listaUsuario;
            
        } catch (Exception e){
            throw new RuntimeException(e);
        }
        
    }
}
    

