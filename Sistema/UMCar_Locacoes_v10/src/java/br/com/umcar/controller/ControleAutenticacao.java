package br.com.umcar.controller;

import br.com.umcar.model.DAO.LoginDAO;
import br.com.umcar.model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "ControleAutenticacao", urlPatterns = {"/ControleAutenticacao"})
public class ControleAutenticacao extends HttpServlet {


    @SuppressWarnings("empty-statement")
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
         String acao = request.getParameter("acao");
         
         if (acao.equals("login"))
         {
            String usuario = request.getParameter("txtEmail");
            String senha = request.getParameter("txtSenha");
               
             LoginDAO ld = new LoginDAO();
             Usuario u;
             u = ld.Login(usuario, senha);
             
             if (u==null)
             {
               request.setAttribute("erro", "Usuário ou Senha inválidos");
               request.getRequestDispatcher("Login.jsp").forward(request, response);;
             }
             else
             {
                 session.setAttribute("usuario", u);
                 request.getRequestDispatcher("AdminPanel.jsp").forward(request, response);;
             }
         }
         else if (acao.equals("logout"))
         {
            session.invalidate();
            request.getRequestDispatcher("Login.jsp").forward(request, response);;
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
