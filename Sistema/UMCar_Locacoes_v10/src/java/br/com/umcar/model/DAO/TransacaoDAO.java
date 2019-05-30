/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.umcar.model.DAO;

import br.com.umcar.model.Automovel;
import br.com.umcar.model.Cliente;
import br.com.umcar.model.Transacao;
import br.com.umcar.util.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;


public class TransacaoDAO {
    
    public void cadastrar(Transacao transacao){
        try{

            Connection conexao = Conexao.getConexao();

            String sql = "INSERT INTO transacao(numero, data, hora, idcliente, idautomovel, observacao, total, situacao) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
             
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            
            
            Calendar cal = Calendar.getInstance();
            cal.setTime(transacao.getData());
            java.sql.Date data = new java.sql.Date(cal.getTimeInMillis());
            
            pstmt.setInt(1, transacao.getNumero());
            pstmt.setDate(2, data);
            pstmt.setTime(3, transacao.getHora());
            pstmt.setInt(4, transacao.getCliente().getId());
            pstmt.setInt(5, transacao.getAutomovel().getIdAutomovel());
            pstmt.setString(6, transacao.getObservacao());
            pstmt.setDouble(7, transacao.getTotal());
            pstmt.setString(8, transacao.getSituacao());
            
            pstmt.execute();

            conexao.close();
            
        }catch(SQLException e){
            throw new RuntimeException(e);                                
        }
    }
    
    public ArrayList<Transacao> listar(){
        ArrayList<Transacao> listaTransacao = null;
        try{
            Connection conexao = Conexao.getConexao();
            
            String sql = "SELECT transacao.*, automovel.placa, automovel.marca, automovel.modelo, cliente.nome, cliente.cpf FROM transacao INNER JOIN automovel ON(transacao.idautomovel = automovel.idautomovel) INNER JOIN cliente ON(transacao.idcliente = cliente.idcliente) WHERE transacao.situacao <> 'Baixada';";
            
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            
            ResultSet rs = pstmt.executeQuery();
            
            listaTransacao = new ArrayList<>();
            
            while(rs.next()){
                Transacao transacao = new Transacao();
                
                transacao.setId(rs.getInt("id"));
                transacao.setNumero(rs.getInt("numero"));
                transacao.setData(rs.getDate("data"));
                transacao.setHora(rs.getTime("hora"));
                transacao.setAutomovel(new Automovel(rs.getInt("idautomovel"), rs.getInt("placa"), rs.getString("marca"), rs.getString("modelo")));
                transacao.setCliente(new Cliente(rs.getInt("idcliente"), rs.getString("nome")));
                transacao.setObservacao(rs.getString("observacao"));
                transacao.setTotal(rs.getDouble("total"));
                transacao.setSituacao(rs.getString("situacao"));
                listaTransacao.add(transacao);
            }
            
            conexao.close();
            
        }catch(SQLException e){
            throw new RuntimeException(e);
        } 
        return listaTransacao;  
    }   
     
    public void baixar(Transacao transacao) {        
    
        try{

            Connection conexao = Conexao.getConexao();

            String sql = "UPDATE transacao SET situacao = 'Baixada' WHERE id = ?;";
            
            PreparedStatement pstmt = conexao.prepareStatement(sql);            
            
            pstmt.setInt(1, transacao.getId());
            
            pstmt.executeUpdate();

            conexao.close();
            
        } catch(SQLException e){
            throw new RuntimeException(e);
        }
    }
    
    public void excluir(Transacao transacao){
        try{

            Connection conexao = Conexao.getConexao();

            String sql = "DELETE FROM transacao WHERE id=?";
                  

            PreparedStatement pstmt = conexao.prepareStatement(sql);

            pstmt.setInt(1, transacao.getId());
            pstmt.execute();

            conexao.close();
            
        } catch(SQLException e){
            throw new RuntimeException(e);                                
        }        
    }
    
    public ArrayList<Transacao> gerarRelatorioMensal(int mes, int ano){
        ArrayList<Transacao> listaTransacao = null;
        try{
            Connection conexao = Conexao.getConexao();
            
            String sql = "SELECT t.id,t.numero,t.data,t.hora,a.idautomovel,a.placa,a.marca,a.modelo,c.idcliente,c.nome,c.cpf,t.observacao,t.total,t.situacao FROM transacao t, cliente c, automovel a\n" +
                         "WHERE t.idcliente = c.idcliente AND t.idautomovel = a.idautomovel AND DATE_PART('MONTH', t.data) = ? AND DATE_PART('YEAR', t.data) = ? ORDER BY t.numero;";
            
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            
            pstmt.setInt(1, mes);
            pstmt.setInt(2, ano);            
            ResultSet rs = pstmt.executeQuery();
            
            listaTransacao = new ArrayList<>();
            
            while(rs.next()){
                Transacao transacao = new Transacao();
                
                transacao.setId(rs.getInt("id"));
                transacao.setNumero(rs.getInt("numero"));
                transacao.setData(rs.getDate("data"));
                transacao.setHora(rs.getTime("hora"));               
                transacao.setAutomovel(new Automovel(rs.getInt("idautomovel"), rs.getInt("placa"), rs.getString("marca"), rs.getString("modelo")));                
                transacao.setCliente(new Cliente(rs.getInt("idcliente"), rs.getString("nome"), rs.getString("cpf")));
                transacao.setObservacao(rs.getString("observacao"));
                transacao.setTotal(rs.getDouble("total"));
                transacao.setSituacao(rs.getString("situacao"));
                listaTransacao.add(transacao); 
            }
            
            conexao.close();
            
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return listaTransacao;  
    }
    
    public ArrayList<Transacao> gerarRelatorioAnual(int ano){
        ArrayList<Transacao> listaTransacao = null;
        try{
            Connection conexao = Conexao.getConexao();
            
            String sql = "SELECT t.id,t.numero,t.data,t.hora,c.idcliente,c.nome,c.cpf,a.idautomovel,a.placa,a.modelo,a.marca,t.observacao,t.total,t.situacao FROM transacao t, cliente c, automovel a\n" +
                         "WHERE t.idcliente = c.idcliente AND t.idautomovel = a.idautomovel AND DATE_PART('YEAR', t.data) = ? ORDER BY t.numero;";
            
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            
            pstmt.setInt(1, ano);          
            ResultSet rs = pstmt.executeQuery();
            
            listaTransacao = new ArrayList<>();
            
            while(rs.next()){
                Transacao transacao = new Transacao();
                
                transacao.setId(rs.getInt("id"));
                transacao.setNumero(rs.getInt("numero"));
                transacao.setData(rs.getDate("data"));
                transacao.setHora(rs.getTime("hora")); 
                transacao.setAutomovel(new Automovel(rs.getInt("idautomovel"), rs.getInt("placa"), rs.getString("marca"), rs.getString("modelo")));
                transacao.setCliente(new Cliente(rs.getInt("idcliente"), rs.getString("nome"), rs.getString("cpf")));
                transacao.setObservacao(rs.getString("observacao"));
                transacao.setTotal(rs.getDouble("total"));
                transacao.setSituacao(rs.getString("situacao"));
                listaTransacao.add(transacao);
            }
            
            conexao.close();
            
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return listaTransacao;  
    }
    
    /*public ArrayList<Transacao> gerarRelatorioPeriodo(int anoInicial, int mesInicial, int diaInicial, int anoFinal, int mesFinal, int diaFinal){
        ArrayList<Transacao> listaTransacao = null;
        try{
            Connection conexao = Conexao.getConexao();
                       
            String sql = "SELECT t.id,t.numero,t.data,t.hora,c.idcliente,c.nome,c.cpf,a.idautomovel,a.placa,a.modelo,a.marca,t.observacao,t.total,t.situacao FROM transacao t, cliente c, automovel a\n" +
"WHERE t.idcliente = c.idcliente AND t.idautomovel = a.idautomovel AND t.data BETWEEN ? AND ? ORDER BY t.numero;";
            
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            
            pstmt.setInt(1, anoInicial);
            pstmt.setInt(2, mesInicial);
            pstmt.setInt(3, diaInicial);
            pstmt.setInt(4, anoFinal);
            pstmt.setInt(5, mesFinal);
            pstmt.setInt(6, diaFinal);            
            ResultSet rs = pstmt.executeQuery();
            
            listaTransacao = new ArrayList<>();
            
            while(rs.next()){
                Transacao transacao = new Transacao();
                
                transacao.setId(rs.getInt("id"));
                transacao.setNumero(rs.getInt("numero"));
                transacao.setData(rs.getDate("data"));
                transacao.setHora(rs.getTime("hora")); 
                transacao.setAutomovel(new Automovel(rs.getInt("idautomovel"), rs.getInt("placa"), rs.getString("marca"), rs.getString("modelo")));
                transacao.setCliente(new Cliente(rs.getInt("idcliente"), rs.getString("nome"), rs.getString("cpf")));
                transacao.setObservacao(rs.getString("observacao"));
                transacao.setTotal(rs.getDouble("total"));
                transacao.setSituacao(rs.getString("situacao"));
                listaTransacao.add(transacao);
            }
            
            conexao.close();
            
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return listaTransacao;  
    }*/
}
