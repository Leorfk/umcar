<%-- 
    Document   : cadastraUsuario
    Created on : 12/05/2019, 18:56:01
    Author     : Kirkh
--%>

<%@page import="br.com.umcar.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession L_sessao = request.getSession();
    if (L_sessao.getAttribute("usuario") == null)
    {
        response.sendRedirect("Login.jsp?erro=Faça%20o%20Login%20para%20continuar"); 
    }
%>
<html lang="en">
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Usuário</title>
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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <%=((Usuario)L_sessao.getAttribute("usuario")).getNomeUsuario()%><b class="caret"></b></a>
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

       <div>
        <div class="row text-center">
            <h2>Novo Usuário</h2>
        </div>
        <form action="ControleUsuario" method="POST">   
        <div> 
            <label for="firstname" class="col-md-2">
                Nome do usuário:
            </label>
            <div class="col-md-9">
                <input type="text" class="form-control" id="firstname" placeholder="Nome do usuário" name="txtNomeUsuario">
                <p class="help-block">
                    Exemplo: nomedousuario
                </p>
            </div>
            <div class="col-md-1">
                <i class="fa fa-lock fa-2x"></i>
            </div>
        </div>               
        <div>
            <label for="emailaddress" class="col-md-2">
                Email:
            </label>
            <div class="col-md-9">
                <input type="email" class="form-control" id="emailaddress" placeholder="E-mail" name="txtEmail">
                <p class="help-block">
                    Exemplo: seunome@dominio.com
                </p>
            </div>
             <div class="col-md-1">
                <i class="fa fa-lock fa-2x"></i>
            </div>
        </div>
        <div>
            <label for="password" class="col-md-2">
                Senha:
            </label>
            <div class="col-md-9">
                <input type="password" class="form-control" id="password" placeholder="Senha" name="txtSenha">
                <p class="help-block">
                    Caracteres Alfanuméricos
                </p>
            </div>
             <div class="col-md-1">
                <i class="fa fa-lock fa-2x"></i>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
            </div>
            <div class="col-md-10">
                <button type="submit" value="Cadastrar" name="acao" class="btn btn-info">Salvar</button>
                <a href="UserPanel.jsp"><button type="button" value="Cancelar" class="btn btn-info">Cancelar</button></a>
                <script type="text/javascript">jAlert('Usuário Cadastrado com Sucesso');</script>
            </div>
        </div>
        </form>   
    </div>  
    </div>
    
</body>
</html>
