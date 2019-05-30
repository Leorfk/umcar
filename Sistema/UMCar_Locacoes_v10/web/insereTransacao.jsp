<%-- 
    Document   : insereTransacao
    Created on : 13/05/2019, 16:24:00
    Author     : Diogo
--%>

<%@page import="br.com.umcar.model.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.umcar.model.Automovel"%>
<%@page import="br.com.umcar.model.Automovel"%>
<%@page import="br.com.umcar.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession L_sessao = request.getSession();
    if (L_sessao.getAttribute("usuario") == null)
    {
        response.sendRedirect("Login.jsp?erro=Faça%20o%20Login%20para%20continuar"); 
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Transação</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="css/favicon.png">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="css/local.css" />
        <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light-bootstrap/all.min.css" />
        <script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
        <script type="text/javascript" src="http://www.prepbootstrap.com/Content/js/gridData.js"></script>        
    </head>
    <body>
        <%  
            ArrayList<Automovel> listaAutomovel = (ArrayList<Automovel>) request.getAttribute("listaAutomovel");
            ArrayList<Cliente> listaCliente = (ArrayList<Cliente>) request.getAttribute("listaCliente");
        %>
        <div id="wrapper">
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="AdminPanel.jsp">Acesso Administrador</a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li><a href="UserPanel.jsp"><i class="fa fa-address-book-o"></i> Cadastro de Usuário</a></li>
                    <li><a href="AutomovelPanel.jsp"><i class="fa fa-car"></i> Cadastro de Automóveis</a></li>
                    <li><a href="clientePanel.jsp"><i class="fa fa-male"></i> Cadastro de Clientes</a></li>
                    <li><a href="movimentoPanel.jsp"><i class="fa fa-gear"></i> Movimentos</a></li>
                    <li><a href="relatorioPanel.jsp"><i class="fa fa-book"></i> Relatórios</a></li>
                    <li><a href="index.jsp"><i class="fa fa-arrow-left"></i> Voltar para Home</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right navbar-user">
                    <li class="dropdown messages-dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> Mensagens <span class="badge">2</span> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-header">2 Novas Mensagens</li>
                            <li class="message-preview">
                                <a href="#">
                                    <span class="avatar"><i class="fa fa-bell"></i></span>
                                    <span class="message">Security alert</span>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li class="message-preview">
                                <a href="#">
                                    <span class="avatar"><i class="fa fa-bell"></i></span>
                                    <span class="message">Security alert</span>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="#">Go to Inbox <span class="badge">2</span></a></li>
                        </ul>
                    </li>
                     <li class="dropdown user-dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><%=((Usuario)L_sessao.getAttribute("usuario")).getNomeUsuario()%><b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><i class="fa fa-user"></i> Perfil</a></li>
                            <li><a href="#"><i class="fa fa-gear"></i> Configurações</a></li>
                            <li class="divider"></li>
                            <li><a href="#"><i class="fa fa-power-off"></i> Log Out</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
            <div>    
            <div>    
            <div>    
                <div>
                    <h2 class="text-center">Nova Transação</h2>
                </div>
                <form action="ControleTransacao" method="POST" role="form" data-toggle="validator" class="container"> 
                    <fieldset>
                        <div class="row">
                            <div class="form-group col-md-2">
                                <label for="txtNumero" class="control-label">Número do Pedido</label>
                                <input type="number" name="txtNumero" required="" class="form-control" placeholder="Pedido Nº">
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label">Automovel </label>                               
                                <select name="cmbAutomovel" class="form-control">
                                    <%                                        
                                        for(Automovel a : listaAutomovel) {
                                    %>
                                    
                                    <option value="<%= a.getIdAutomovel()%>"><%= a.getModelo()%> - <%= a.getPlaca()%> - <%= a.getValorVenda()%></option>

                                    <%
                                        }
                                    %> 
                                </select>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label">Cliente </label>                               
                                <select name="cmbCliente" class="form-control">
                                    <%                                        
                                        for(Cliente c : listaCliente) {
                                    %>
                                    
                                    <option value="<%= c.getId()%>"><%= c.getNome()%> - <%= c.getCpf()%></option>

                                    <%
                                        }
                                    %> 
                                </select>    
                            </div>                   
                        </div>
                        <div class="row">
                            <div class="form-group col-md-5">
                                <label for="txtObservacoes" class="control-label">Observações</label>
                                <input type="text" name="txtObservacoes" required="" class="form-control" placeholder="observacoes">
                            </div>
                        </div>        
                            <div>
                                </br><button type="submit" value="Cadastrar" name="acao" class="btn btn-info">Confirmar</button>                                 
                                <a href="movimentoPanel.jsp"><input type="button" value="Cancelar" class="btn btn-info"/></a>
                            </div>                        
                    </fieldset>
                </form>               
            </div>
            </div>
            </div>    
        </div>
    </body>
</html>
