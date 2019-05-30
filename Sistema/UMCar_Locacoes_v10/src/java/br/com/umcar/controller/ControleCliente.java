package br.com.umcar.controller;

import br.com.umcar.model.Cliente;
import br.com.umcar.model.DAO.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;


@WebServlet(name = "ControleCliente", urlPatterns = {"/ControleCliente"})
public class ControleCliente extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        String acao = request.getParameter("acao");
        
        try {
            if(acao.equals("Cadastrar")) {

                String nome = request.getParameter("txtNome");
                String cpf = request.getParameter("txtCpf");
                String telRel = request.getParameter("txtTelRes");
                String telCel = request.getParameter("txtTelCel");
                String email = request.getParameter("txtEmail");

                Cliente cliente = new Cliente();
                cliente.setNome(nome);
                cliente.setCpf(cpf);
                cliente.setTelRes(telRel);
                cliente.setTelCel(telCel);
                cliente.setEmail(email);

                ClienteDAO dao = new ClienteDAO();
                dao.cadastrar(cliente);
                
                List<Cliente> listaCliente = dao.listar();
                request.setAttribute("listaCliente", listaCliente);
                request.getRequestDispatcher("listaCliente.jsp").forward(request, response);

            } else if(acao.equals("Consultar")){
                
                    int id = Integer.parseInt(request.getParameter("id")); 
                    
                    Cliente cliente = new Cliente();
                    cliente.setId(id);
                    
                    ClienteDAO dao = new ClienteDAO();
                    cliente = dao.Consulta(cliente);
                    
                    request.setAttribute("cliente", cliente);
                    request.getRequestDispatcher("editaCliente.jsp").forward(request, response);
                    
            } else if(acao.equals("Atualizar")) {

                int id = Integer.parseInt(request.getParameter("id"));
                String nome = request.getParameter("txtNome");
                String cpf = request.getParameter("txtCpf");
                String telRes = request.getParameter("txtTelRes");
                String telCel = request.getParameter("txtTelCel");
                String email = request.getParameter("txtEmail");

                Cliente cliente = new Cliente(id);
                cliente.setNome(nome);
                cliente.setCpf(cpf);
                cliente.setTelRes(telRes);
                cliente.setTelCel(telCel);
                cliente.setEmail(email);

                ClienteDAO dao = new ClienteDAO();
                dao.alterar(cliente);
                
                List<Cliente> listaCliente = dao.listar();
                request.setAttribute("listaCliente", listaCliente);
                request.getRequestDispatcher("listaCliente.jsp").forward(request, response);

            } else if(acao.equals("Listar")) {

                ClienteDAO dao = new ClienteDAO();
                List<Cliente> clientes = dao.listar();
                request.setAttribute("listaCliente", clientes);
                request.getRequestDispatcher("listaCliente.jsp").forward(request, response);
                
            } 
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);     
         
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }    
}
