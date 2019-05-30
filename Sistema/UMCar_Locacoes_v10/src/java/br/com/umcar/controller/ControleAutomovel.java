package br.com.umcar.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.com.umcar.model.Automovel;
import br.com.umcar.model.DAO.AutomovelDAO;


@WebServlet(name = "ControleAutomovel", urlPatterns = {"/ControleAutomovel"})
public class ControleAutomovel extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String acao = request.getParameter("acao");
        if(acao.equals("Cadastrar")){      
        
        int placa = Integer.parseInt(request.getParameter("txtPlaca"));
        String modelo = request.getParameter("txtModelo");
        String marca = request.getParameter("txtMarca");
        String tipo = request.getParameter("txtTipo");
        int porta = Integer.parseInt(request.getParameter("txtPortas"));
        int passageiro = Integer.parseInt(request.getParameter("txtPassageiros"));
        String cor = request.getParameter("txtCor");
        String chassi = request.getParameter("txtChassi");
        String observacoes = request.getParameter("txtObservacoes");
        double venda = Double.parseDouble(request.getParameter("txtVenda"));

        Automovel automovel = new Automovel();
        automovel.setPlaca(placa);
        automovel.setMarca(marca);
        automovel.setModelo(modelo);
        automovel.setChassi(chassi);
        automovel.setObservacoes(observacoes);
        automovel.setPortas(porta);
        automovel.setPassageiros(passageiro);
        automovel.setTipoAutomovel(tipo);
        automovel.setCor(cor);
        automovel.setValorVenda(venda);
                
        AutomovelDAO dao = new AutomovelDAO();
        dao.cadastrar(automovel);
        
        List<Automovel> listaAutomovel = dao.listar();
        request.setAttribute("lista", listaAutomovel);
        request.getRequestDispatcher("AutomovelPanel.jsp").forward(request, response);
        
        } else if(acao.equals("Listar")){
                AutomovelDAO dao = new AutomovelDAO();
                List<Automovel> listaAutomovel = dao.listar();
                
                request.setAttribute("lista", listaAutomovel);
                request.getRequestDispatcher("listaAutomoveis.jsp").forward(request, response);
                
            } else if(acao.equals("Excluir")){
                    
                int id = Integer.parseInt(request.getParameter("idAutomovel"));
                
                Automovel automovel = new Automovel();
                automovel.setIdAutomovel(id);
                
                AutomovelDAO dao = new AutomovelDAO();                    
                dao.excluir(automovel);
                                       
                List<Automovel> listaAutomovel = dao.listar();
                request.setAttribute("lista", listaAutomovel);
                request.getRequestDispatcher("listaAutomoveis.jsp").forward(request, response);
                    
              }else if(acao.equals("Consultar")){
                    int id = Integer.parseInt(request.getParameter("idAutomovel"));
                    
                    Automovel automovel = new Automovel();
                    automovel.setIdAutomovel(id);
                    
                    AutomovelDAO dao = new AutomovelDAO();
                    automovel = dao.consulta(automovel);
                    
                    request.setAttribute("automovel", automovel);
                    request.getRequestDispatcher("editaAutomovel.jsp").forward(request, response);
                    
                    }else if (acao.equals("Atualizar")){
                        
                        int id = Integer.parseInt(request.getParameter("idAutomovel"));  
                        int placa = Integer.parseInt(request.getParameter("txtPlaca"));
                        String modelo = request.getParameter("txtModelo");
                        String marca = request.getParameter("txtMarca");
                        String tipo = request.getParameter("txtTipo");
                        int porta = Integer.parseInt(request.getParameter("txtPortas"));
                        int passageiro = Integer.parseInt(request.getParameter("txtPassageiros"));
                        String cor = request.getParameter("txtCor"); 
                        String chassi = request.getParameter("txtChassi");
                        String observacoes = request.getParameter("txtObservacoes");
                        double venda = Double.parseDouble(request.getParameter("txtVenda"));
                    
                        Automovel automovel = new Automovel();                                                                          

                        automovel.setIdAutomovel(id);
                        automovel.setPlaca(placa);
                        automovel.setMarca(marca);
                        automovel.setModelo(modelo);
                        automovel.setTipoAutomovel(tipo);
                        automovel.setPortas(porta);
                        automovel.setPassageiros(passageiro);
                        automovel.setCor(cor);
                        automovel.setChassi(chassi);
                        automovel.setObservacoes(observacoes);
                        automovel.setValorVenda(venda);
                            
                        AutomovelDAO dao = new AutomovelDAO();
                        dao.atualizar(automovel);

                        List<Automovel> listaAutomovel = dao.listar();                                   
                        request.setAttribute("lista", listaAutomovel);
                        request.getRequestDispatcher("listaAutomoveis.jsp").forward(request, response);                                                                          
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
