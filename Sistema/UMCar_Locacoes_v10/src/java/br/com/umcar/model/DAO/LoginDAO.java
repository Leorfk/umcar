package br.com.umcar.model.DAO;

import br.com.umcar.model.Automovel;
import br.com.umcar.model.Usuario;
import br.com.umcar.util.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.logging.Level;
import java.util.logging.Logger;


public class LoginDAO {
    
    
    public Usuario Login(String username, String pwd)
    {    
        try
        {
            Usuario u;
            Connection conexao = Conexao.getConexao();
            
            String sql = "SELECT * FROM usuario where email=?"; 
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery(); 
            
           if (rs.next())
           {
                Boolean r = (rs.getString("senha") == null ? pwd == null : rs.getString("senha").equals(pwd));
                if (r)
                {
                   u = new Usuario();
                   u.setIdUsuario(rs.getInt("idusuario"));
                   u.setNomeUsuario(rs.getString("nomeusuario"));
                   u.setEmail(rs.getString("email"));  
                   return u;
                }
                else
                {
                    return null;
                }
           }
           else
           {
            return null;
           }
         
        }catch(SQLException e){
                        Logger.getLogger(Automovel.class.getName()).
                                log(Level.SEVERE, "Erro ao fazer o login: {0}", e.getMessage());
        }
        return null;  
    }
    public void Logout()
    {
    
    }
    
}
