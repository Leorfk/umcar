<%-- 
    Document   : listaTransacao
    Created on : 03/05/2019, 21:19:16
    Author     : Diogo
--%>

<%@page import="java.util.Calendar"%>
<%@page import="br.com.umcar.model.Usuario"%>
<%@page import="br.com.umcar.model.Transacao"%>
<%
    HttpSession L_sessao = request.getSession();
    if (L_sessao.getAttribute("usuario") == null)
    {
        response.sendRedirect("Login.jsp?erro=Faça%20o%20Login%20para%20continuar"); 
    }
%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Transações</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="css/favicon.png">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="css/local.css" />
        <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

        <!-- you need to include the shieldui css and js assets in order for the charts to work -->
        <link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light-bootstrap/all.min.css" />
        <script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
        <script type="text/javascript" src="http://www.prepbootstrap.com/Content/js/gridData.js"></script>
    </head>
    <body>
            
    
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
                            <li><a href="ControleAutenticacao?acao=logout"><i class="fa fa-power-off"></i> Log Out</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav> 
        <% 
            List<Transacao> listaTransacao = (List<Transacao>) request.getAttribute("listaTransacoes");                 
        %>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> Listagem de Transações</h3>
                </div>
                <div class="panel-body">
                    <div id="shieldui-grid1" class="sui-grid sui-grid-core" role="grid" aria-readonly="true">
                        <div class="sui-grid-header">                           
                            <div class="table-responsive container-fluid" style='width: auto'>
                                <table class="table-striped text-center" >
                                    <thead>
                                    <tr>
                                        <th class='col-xs-1'>ID</th>
                                        <th class='col-xs-1'>Número da Transação</th>
                                        <th class='col-xs-1'>Data</th>
                                        <th class='col-xs-1'>Hora</th>
                                        <th class='col-xs-1'>Marca do Automovel</th>
                                        <th class='col-xs-1'>Modelo do Automovel</th>
                                        <th class='col-xs-1'>Placa do Automovel</th>
                                        <th class='col-xs-1'>Cliente</th>
                                        <th class='col-xs-1'>Observação</th>
                                        <th class='col-xs-1'>Total da Transação</th>
                                        <th class='col-xs-1'>Situação</th>
                                        <th width="auto" class="tCenter"></th>
                                    </tr>
                                    </thead>
                                    <%
                                        for(Transacao transacao : listaTransacao){
                                            Calendar cal = Calendar.getInstance();
                                            cal.setTime(transacao.getData());

                                            Calendar cal2 = Calendar.getInstance();
                                            cal2.setTime(transacao.getHora()); 
                                    %>
                                    
                                    <tr>
                                        <td> <%= transacao.getId()%> </td>
                                        <td> <%= transacao.getNumero()%> </td>
                                        <td><%= cal.get(Calendar.DAY_OF_MONTH) + "/" + (cal.get(Calendar.MONTH) + 1) + "/" + cal.get(Calendar.YEAR)%> </td>
                                        <td><%= cal2.get(Calendar.HOUR_OF_DAY) + ":" + cal2.get(Calendar.MINUTE) + ":" + cal2.get(Calendar.SECOND)%> </td>
                                        <td class="t<%= transacao.getAutomovel().getIdAutomovel() %>"> <%= transacao.getAutomovel().getMarca() %> </td>
                                        <td class="t<%= transacao.getAutomovel().getIdAutomovel() %>"> <%= transacao.getAutomovel().getModelo() %> </td>
                                        <td class="t<%= transacao.getAutomovel().getIdAutomovel() %>"> <%= transacao.getAutomovel().getPlaca() %> </td>
                                        <td class="t<%= transacao.getCliente().getId() %>"> <%= transacao.getCliente().getNome() %> </td>
                                        <td> <%= transacao.getObservacao()%> </td>
                                        <td> <%= transacao.getTotal()%> </td>
                                        <td> <%= transacao.getSituacao()%> </td>
                                        <td width="auto" class="tCenter"></td>
                                        <td class="col-xs-offset-1">                                   
                                            <a href="ControleTransacao?acao=Baixar&id=<%=transacao.getId()%>&idautomovel=<%=transacao.getAutomovel().getIdAutomovel()%>"><input type="button" value="Baixa" class="btn btn-info"/></a>
                                        </td> 
                                        <td class="col-xs-offset-1">
                                            <a href="ControleTransacao?acao=Excluir&id=<%=transacao.getId()%>"><input type="button" value="Excluir" class="btn btn-info"/></a>
                                        </td>
                                    </tr>                  
                                    <% } %>
                                    
                                </table> 
                            </div>        
                        </div>
                    </div>
                </div>
                <div>
                    <nav class="navbar-collapse">
                    <div class="container-fluid">               
                        <div class="navbar-header">
                            <form action="ControleTransacao" method="POST" class="navbar-form navbar-left">             
                                <a href="movimentoPanel.jsp"><input type="button" value="Voltar" class="btn btn-info"></a>                      
                            </form>
                        </div>                   
                    </div>
                    </nav>     
                </div>
            </div>                        
    </body>
</html>
