package br.com.umcar.controller;

import br.com.umcar.model.Automovel;
import br.com.umcar.model.Cliente;
import br.com.umcar.model.DAO.AutomovelDAO;
import br.com.umcar.model.DAO.ClienteDAO;
import br.com.umcar.model.DAO.TransacaoDAO;
import br.com.umcar.model.Transacao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ControleTransacao extends HttpServlet {
       
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {    
            
            String acao = request.getParameter("acao");
            
            if (acao.equals("Cadastrar")) {
                
                int numeropedido = Integer.parseInt(request.getParameter("txtNumero"));
                int idautomovel = Integer.parseInt(request.getParameter("cmbAutomovel"));
                int idcliente = Integer.parseInt(request.getParameter("cmbCliente"));
                String obs = request.getParameter("txtObservacoes");
                double total;
                String situacao = "Em aberto";
                
                Automovel automovel = new Automovel(idautomovel);
                
                AutomovelDAO aDAO = new AutomovelDAO();
                aDAO.colocarTransacao(automovel);
                total = aDAO.calculaTotal(automovel);
                               
                Date datahora = new Date();
                Calendar cal = Calendar.getInstance();
                cal.setTime(datahora);
                
                SimpleDateFormat formato = new SimpleDateFormat("HH:mm:ss");            
                String hora = cal.get(Calendar.HOUR) + ":" + cal.get(Calendar.MINUTE) + ":" + cal.get(Calendar.SECOND);
                
                Transacao transacao = new Transacao();
                
                transacao.setNumero(numeropedido);
                transacao.setData(datahora);          
                transacao.setHora(new Time(formato.parse(hora).getTime()));
                transacao.setAutomovel(new Automovel(idautomovel));
                transacao.setCliente(new Cliente(idcliente));
                transacao.setObservacao(obs);
                transacao.setTotal(total);
                transacao.setSituacao(situacao);
                
                TransacaoDAO tDAO = new TransacaoDAO();
                tDAO.cadastrar(transacao);
                
                ArrayList<Transacao> transacoes = tDAO.listar();
                 
                request.setAttribute("listaTransacoes", transacoes);
                
                request.getRequestDispatcher("listaTransacao.jsp").forward(request, response);
                    
            } else if (acao.equals("Listar")) {
                
                TransacaoDAO tDAO = new TransacaoDAO();
                
                ArrayList<Transacao> transacoes = tDAO.listar();
                 
                request.setAttribute("listaTransacoes", transacoes);
                
                request.getRequestDispatcher("listaTransacao.jsp").forward(request, response);

            } else if (acao.equals("Baixar")) {

                int id = Integer.parseInt(request.getParameter("id"));
                int idautomovel = Integer.parseInt(request.getParameter("idautomovel"));

                Transacao transacao = new Transacao();
                transacao.setId(id);
                
                Automovel automovel = new Automovel(idautomovel);

                TransacaoDAO tDAO = new TransacaoDAO();
                tDAO.baixar(transacao);
                
                AutomovelDAO aDAO = new AutomovelDAO();
                aDAO.baixar(automovel);
                
                ArrayList<Transacao> transacoes = tDAO.listar();                 
                request.setAttribute("listaTransacoes", transacoes);
                
                request.getRequestDispatcher("listaTransacao.jsp").forward(request, response);

            
            } else if (acao.equals("Excluir")) {

                int id = Integer.parseInt(request.getParameter("id"));

                Transacao transacao = new Transacao();
                transacao.setId(id);

                TransacaoDAO tDAO = new TransacaoDAO();

                tDAO.excluir(transacao);
                
                ArrayList<Transacao> transacoes = tDAO.listar();                 
                request.setAttribute("listaTransacoes", transacoes);
                
                request.getRequestDispatcher("listaTransacao.jsp").forward(request, response);

            
            }  else if (acao.equals("gerarRelatorioMensal")) {
                
                int mes = Integer.parseInt(request.getParameter("txtMes"));
                int ano = Integer.parseInt(request.getParameter("txtAno"));
                
                TransacaoDAO tDAO = new TransacaoDAO();
                
                ArrayList<Transacao> transacoes = tDAO.gerarRelatorioMensal(mes, ano);
                 
                request.setAttribute("listaTransacoes", transacoes);
                
                request.getRequestDispatcher("relatorio.jsp").forward(request, response);

            } else if (acao.equals("gerarRelatorioAnual")) {
                
                int ano = Integer.parseInt(request.getParameter("txtAno"));
                
                TransacaoDAO tDAO = new TransacaoDAO();
                
                ArrayList<Transacao> transacoes = tDAO.gerarRelatorioAnual(ano);
                 
                request.setAttribute("listaTransacoes", transacoes);
                
                request.getRequestDispatcher("relatorio.jsp").forward(request, response);

            } /*else if (acao.equals("gerarRelatorioPeriodo")) {
                
                int diaInicial = Integer.parseInt(request.getParameter("txtDiaInicial"));
                int mesInicial = Integer.parseInt(request.getParameter("txtMesInicial"));
                int anoInicial = Integer.parseInt(request.getParameter("txtAnoInicial"));
                int diaFinal = Integer.parseInt(request.getParameter("txtDiaFinal"));
                int mesFinal = Integer.parseInt(request.getParameter("txtMesFinal"));
                int anoFinal = Integer.parseInt(request.getParameter("txtAnoFinal"));
                
                TransacaoDAO tDAO = new TransacaoDAO();
                
                ArrayList<Transacao> transacoes = tDAO.gerarRelatorioPeriodo(anoInicial, mesInicial, diaInicial, anoFinal, mesFinal, diaFinal);
                 
                request.setAttribute("listaTransacoes", transacoes);
                
                request.getRequestDispatcher("relatorio.jsp").forward(request, response);

            }*/ else if (acao.equals("interfaceTransacao")) {
                
                AutomovelDAO vDAO = new AutomovelDAO();
                List<Automovel> automoveis = vDAO.listarDisponivel(); 
                
                request.setAttribute("listaAutomovel", automoveis);
                
                ClienteDAO cDAO = new ClienteDAO();

                List<Cliente> clientes = cDAO.listar();                 
                request.setAttribute("listaCliente", clientes);
                                             
                request.getRequestDispatcher("insereTransacao.jsp").forward(request, response);
            }             
        } catch (Exception e) {
            request.setAttribute("erro", e);
            request.getRequestDispatcher("erro.jsp").forward(request, response);
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
    }// </editor-fold>
}
