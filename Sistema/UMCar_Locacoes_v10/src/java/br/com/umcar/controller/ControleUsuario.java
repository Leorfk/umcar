package br.com.umcar.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.umcar.model.Usuario;
import br.com.umcar.model.DAO.UsuarioDAO;

@WebServlet(name = "ControleUsuario", urlPatterns = {"/ControleUsuario"})
public class ControleUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");  
        
        //parâmetro acao
        String acao = request.getParameter("acao");
        
        
        if(acao.equals("Cadastrar")){      

        String nome = request.getParameter("txtNomeUsuario");
        String email = request.getParameter("txtEmail");
        String senha = request.getParameter("txtSenha");

        Usuario usuario = new Usuario();
        usuario.setNomeUsuario(nome);
        usuario.setEmail(email);
        usuario.setSenha(senha);
        
        UsuarioDAO dao = new UsuarioDAO();
        dao.cadastrar(usuario);
        
        request.getRequestDispatcher("UserPanel.jsp").forward(request, response);
        
        } else if(acao.equals("Listar")){
                UsuarioDAO dao = new UsuarioDAO();
                List<Usuario> listaUsuario = dao.listar();

                request.setAttribute("listaUser", listaUsuario);
                request.getRequestDispatcher("listaUsuario.jsp").forward(request, response);
                
            } else if(acao.equals("Excluir")){
                    
                    int id = Integer.parseInt(request.getParameter("idUsuario"));
                    
                    Usuario usuario = new Usuario();
                    usuario.setIdUsuario(id);
                    
                    UsuarioDAO dao = new UsuarioDAO();
                    dao.Excluir(usuario); 
                                       
                    List<Usuario> listaUsuario = dao.listar();
                    request.setAttribute("listaUser", listaUsuario);
                    request.getRequestDispatcher("listaUsuario.jsp").forward(request, response);
                    
                } else if(acao.equals("Consultar")){
                    int id = Integer.parseInt(request.getParameter("idUsuario")); 
                    
                    Usuario usuario = new Usuario();
                    usuario.setIdUsuario(id);
                    
                    UsuarioDAO dao = new UsuarioDAO();
                    usuario = dao.Consulta(usuario);
                    
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("editaUsuario.jsp").forward(request, response);
                    
                    } else if (acao.equals("Atualizar")){
                        int id = Integer.parseInt(request.getParameter("idUsuario"));
                        String nome = request.getParameter("txtNomeUsuario");
                        String email = request.getParameter("txtEmail");
                        String senha = request.getParameter("txtSenha");
                        
                        Usuario usuario = new Usuario();
                        
                        usuario.setIdUsuario(id);
                        usuario.setNomeUsuario(nome);
                        usuario.setEmail(email);
                        usuario.setSenha(senha);
                    
                        UsuarioDAO dao = new UsuarioDAO();
                        dao.Atualizar(usuario);
                        
                        List<Usuario> listaUsuario = dao.listar();                                       
                        request.setAttribute("listaUser", listaUsuario);
                        request.getRequestDispatcher("listaUsuario.jsp").forward(request, response);                                                    
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
