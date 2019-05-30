package br.com.umcar.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Conexao {
    
    private static Connection conexao=null;
    
    public static Connection getConexao(){
        try{
            Class.forName("org.postgresql.Driver");            
            conexao = DriverManager.getConnection("jdbc:postgresql://localhost:5432/umcar", "postgres", "1234567");
      
        }catch(ClassNotFoundException e){
            Logger.getLogger(Conexao.class.getName()).
                    log(Level.SEVERE, "Falta de Driver de conexao: "+ e.getMessage());
        }catch(SQLException e){
             Logger.getLogger(Conexao.class.getName()).
                    log(Level.SEVERE, "Erro de conexao: "+ e.getMessage());
        }  
        return conexao;
       
    }
        
}
