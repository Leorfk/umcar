<%-- 
    Document   : CadastraAutomovel
    Created on : 10/05/2019, 10:48:03
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
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Automóvel</title>
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
                    <h2 class="text-center">Novo Automóvel</h2>
                </div>
                <form action="ControleAutomovel" method="POST" role="form" data-toggle="validator" class="container">
                    <fieldset>
                        <div class="row">
                            <div class="form-group col-md-2">
                                <label for="txtPlaca" class="control-label">Número da Placa</label>
                                <input type="number" name="txtPlaca" required="" class="form-control" placeholder="Placa">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="txtModelo" class="control-label">Modelo</label>
                                <input type="text" name="txtModelo" required="" class="form-control" placeholder="Modelo">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="txtMarca" class="control-label">Marca</label>
                                <input type="text" name="txtMarca" required="" class="form-control" placeholder="Marca">                                      
                            </div>                   
                        </div>
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label for="txtTipo" class="control-label">Tipo do Automóvel</label>  
                                <input type="text" name="txtTipo" required="" class="form-control" placeholder="Tipo Do Automovel">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="txtPortas" class="control-label">Portas</label>
                                <select name="txtPortas" required="" class="form-control">
                                    <option value="0">1</option>
                                    <option value="1">2</option>
                                    <option value="2">3</option>
                                    <option value="3">4</option>
                                </select>   
                            </div>
                            <div class="form-group col-md-3">
                                <label for="txtPassageiros" class="control-label">Passageiros</label>
                                <select name="txtPassageiros" required="" class="form-control">
                                    <option value="0" >0</option>
                                    <option value="1" >1</option>
                                    <option value="2" >2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                </select>   
                            </div>    
                        </div> 
                        <div class="row">                            
                            <div class="form-group col-md-4">
                                <label for="txtCor" class="control-label">Cor</label>
                                <input type="text" name="txtCor" required="" class="form-control" placeholder="Cor">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="txtChassi" class="control-label">Nº Chassi</label>
                                <input type="text" name="txtChassi" step="any" required="" class="form-control" placeholder="Chassi">
                            </div>
                            <div class="form-group col-md-2">
                                <label for="txtVenda" class="control-label">Valor para Venda</label>
                                <input type="number" name="txtVenda" step="any" required="" class="form-control" placeholder="Valor para Venda">
                            </div>
                        </div>
                        <div class="row">                            
                            <div class="form-group col-md-5">
                                <label for="txtObservacoes" class="control-label">Observações</label>
                                <input type="text" name="txtObservacoes" step="any" class="form-control" placeholder="Observacoes">
                            </div>
                        </div> 
                        <div>
                            <button type="submit" value="Cadastrar" name="acao" class="btn btn-info">Salvar</button> 
                            <a href="AutomovelPanel.jsp"><input type="button" value="Cancelar" class="btn btn-info"/></a>
                        </div>                            
                    </fieldset>
                </form>               
            </div>
            </div>
            </div>    
        </div>
    </body>
</html>
