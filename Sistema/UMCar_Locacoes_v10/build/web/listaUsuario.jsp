<%-- 
    Document   : listaUsuario
    Created on : 09/05/2019, 18:49:31
    Author     : Kirkh
--%>

<%@page import="br.com.umcar.model.Usuario"%>
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
        <title>Lista de Usuários</title>
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
   
        <% List<Usuario> listaUsuario = (List<Usuario>) request.getAttribute("listaUser"); %>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> Usuários Cadastrados</h3>
                </div>
                <div class="panel-body">
                    <div id="shieldui-grid1" class="sui-grid sui-grid-core" role="grid" aria-readonly="true">
                        <div class="sui-grid-header">                           
                            <div class="table-responsive container-fluid" style='width: auto'>
                                <table class="table-striped text-center" >
                                    <thead>
                                    <tr>
                                        <th class='col-xs-3'>Id Usuário</th>
                                        <th class='col-xs-3'>Nome</th>
                                        <th class='col-xs-3'>E-mail</th>
                                        
                                    </tr>
                                    </thead>
                                    <%
                                        for(Usuario usuario : listaUsuario){
                                    %>
                                    <tbody>
                                    <tr>
                                        <td> <%= usuario.getIdUsuario()%> </td>
                                        <td> <%= usuario.getNomeUsuario()%> </td>
                                        <td> <%= usuario.getEmail()%> </td>  
                                        <td width="auto" class="tCenter"></td>
                                        <td class='col-xs-1'>                                        
                                                <a href="ControleUsuario?acao=Consultar&idUsuario=<%=usuario.getIdUsuario()%>"><input type="button" value="Editar" class="btn btn-info"/></a>
                                        </td>                                  
                                        <td class='col-xs-1'>
                                                <a href="ControleUsuario?acao=Excluir&idUsuario=<%=usuario.getIdUsuario()%>"><input type="button" value="Excluir" class="btn btn-info"/></a>
                                        </td>
                                    </tr>                  
                                    <% } %>
                                    </tbody>
                                </table>
                                    
                            </div>        
                        </div>
                    </div>
                </div>
                <div>
                    <nav class="navbar-collapse ">
                    <div class="container-fluid">               
                        <div class="navbar-header">
                            <form action="ControleUsuario" method="POST" class="navbar-form navbar-left">           
                                <a href="cadastraUsuario.jsp"><input type="button" value="Cadastrar Novo Usuário" name="acao" class="btn btn-info"></a>
                                <button type="submit" class="btn btn-info" name="acao" value="Listar">Listagem de Usuários</button>                       
                            </form>
                        </div>
                    </div>
                    </nav>    
                </div>
            </div>    
          
            <script type="text/javascript">
            jQuery(function ($) {
                var performance = [12, 43, 34, 22, 12, 33, 4, 17, 22, 34, 54, 67],
                    visits = [123, 323, 143, 132, 274, 223, 143, 156, 223, 223],
                    budget = [23, 19, 11, 34, 42, 52, 35, 22, 37, 45, 55, 57],
                    sales = [11, 9, 31, 34, 42, 52, 35, 22, 37, 45, 55, 57],
                    targets = [17, 19, 5, 4, 62, 62, 75, 12, 47, 55, 65, 67],
                    avrg = [117, 119, 95, 114, 162, 162, 175, 112, 147, 155, 265, 167];

                $("#shieldui-chart1").shieldChart({
                    primaryHeader: {
                        text: "Visitors"
                    },
                    exportOptions: {
                        image: false,
                        print: false
                    },
                    dataSeries: [{
                        seriesType: "area",
                        collectionAlias: "Q Data",
                        data: performance
                    }]
                });

                $("#shieldui-chart2").shieldChart({
                    primaryHeader: {
                        text: "Login Data"
                    },
                    exportOptions: {
                        image: false,
                        print: false
                    },
                    dataSeries: [
                        {
                            seriesType: "polarbar",
                            collectionAlias: "Logins",
                            data: visits
                        },
                        {
                            seriesType: "polarbar",
                            collectionAlias: "Avg Visit Duration",
                            data: avrg
                        }
                    ]
                });

                $("#shieldui-chart3").shieldChart({
                    primaryHeader: {
                        text: "Sales Data"
                    },
                    dataSeries: [
                        {
                            seriesType: "bar",
                            collectionAlias: "Budget",
                            data: budget
                        },
                        {
                            seriesType: "bar",
                            collectionAlias: "Sales",
                            data: sales
                        },
                        {
                            seriesType: "spline",
                            collectionAlias: "Targets",
                            data: targets
                        }
                    ]
                });

                $("#shieldui-grid1").shieldGrid({
                    dataSource: {
                        data: gridData
                    },
                    sorting: {
                        multiple: true
                    },
                    paging: {
                        pageSize: 7,
                        pageLinksCount: 4
                    },                   
                    ]
                });
            });
        </script>                    
    </body>
</html>
