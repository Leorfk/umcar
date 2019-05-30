<%-- 
    Document   : parametrosRelatorioPeriodo
    Created on : 11/05/2019, 18:15:36
    Author     : Diogo
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
        <title>Parâmetros do Relatório</title>
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
                    <h2 class="text-center">Relatório de Vendas por Período</h2>
                </div>
                <form action="ControleTransacao" method="POST" role="form" data-toggle="validator" class="container">
                    <fieldset>
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label for="txtDiaInicial" class="control-label">Dia Inicial</label>
                                <select name="txtDiaInicial" required="" class="form-control" placeholder="Dia Inicial">                                    
                                    <option selected value="01">01</option>
                                    <option selected value="02">02</option>
                                    <option selected value="03">03</option>
                                    <option selected value="04">04</option>
                                    <option selected value="05">05</option>
                                    <option selected value="06">06</option>
                                    <option selected value="07">07</option>
                                    <option selected value="08">08</option>
                                    <option selected value="09">09</option>
                                    <option selected value="10">10</option>
                                    <option selected value="11">11</option>
                                    <option selected value="12">12</option>
                                    <option selected value="13">13</option>
                                    <option selected value="14">14</option>
                                    <option selected value="15">15</option>
                                    <option selected value="16">16</option>
                                    <option selected value="17">17</option>
                                    <option selected value="18">18</option>
                                    <option selected value="19">19</option>
                                    <option selected value="20">20</option>
                                    <option selected value="21">21</option>
                                    <option selected value="22">22</option>
                                    <option selected value="23">23</option>
                                    <option selected value="24">24</option>
                                    <option selected value="25">25</option>
                                    <option selected value="26">26</option>
                                    <option selected value="27">27</option>
                                    <option selected value="28">28</option>
                                    <option selected value="29">29</option>
                                    <option selected value="30">30</option>
                                    <option selected value="31">31</option>
                                    <option selected value="" selected="selected"></option>
                                </select>    
                            </div>
                            <div class="form-group col-md-3">
                                <label for="txtMesInicial" class="control-label">Mês Inicial</label>
                                <select name="txtMesInicial" required="" class="form-control" placeholder="Mes Inicial">                                    
                                    <option selected value="01">Janeiro</option>
                                    <option selected value="02">Fevereiro</option>
                                    <option selected value="03">março</option>
                                    <option selected value="04">Abril</option>
                                    <option selected value="05">Maio</option>
                                    <option selected value="06">Junho</option>
                                    <option selected value="07">Julho</option>
                                    <option selected value="08">Agosto</option>
                                    <option selected value="09">Setembro</option>
                                    <option selected value="10">Outubro</option>
                                    <option selected value="11">Novembro</option>
                                    <option selected value="12">Dezembro</option>                                    
                                    <option selected value="" selected="selected"></option>
                                </select>    
                            </div>
                            <div class="form-group col-md-4">
                                <label for="txtAnoInicial" class="control-label">Ano Inicial</label>
                                <input type="text" name="txtAnoInicial" required="" class="form-control" placeholder="XXXX">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label for="txtDiaFinal" class="control-label">Dia Final</label>
                                <select name="txtDiaFinal" required="" class="form-control" placeholder="Dia Final">                                    
                                    <option selected value="01">01</option>
                                    <option selected value="02">02</option>
                                    <option selected value="03">03</option>
                                    <option selected value="04">04</option>
                                    <option selected value="05">05</option>
                                    <option selected value="06">06</option>
                                    <option selected value="07">07</option>
                                    <option selected value="08">08</option>
                                    <option selected value="09">09</option>
                                    <option selected value="10">10</option>
                                    <option selected value="11">11</option>
                                    <option selected value="12">12</option>
                                    <option selected value="13">13</option>
                                    <option selected value="14">14</option>
                                    <option selected value="15">15</option>
                                    <option selected value="16">16</option>
                                    <option selected value="17">17</option>
                                    <option selected value="18">18</option>
                                    <option selected value="19">19</option>
                                    <option selected value="20">20</option>
                                    <option selected value="21">21</option>
                                    <option selected value="22">22</option>
                                    <option selected value="23">23</option>
                                    <option selected value="24">24</option>
                                    <option selected value="25">25</option>
                                    <option selected value="26">26</option>
                                    <option selected value="27">27</option>
                                    <option selected value="28">28</option>
                                    <option selected value="29">29</option>
                                    <option selected value="30">30</option>
                                    <option selected value="31">31</option>
                                    <option selected value="" selected="selected"></option>
                                </select>    
                            </div>
                            <div class="form-group col-md-3">
                                <label for="txtMesFinal" class="control-label">Mês Final</label>
                                <select name="txtMesFinal" required="" class="form-control" placeholder="Mes Final">                                    
                                    <option selected value="01">Janeiro</option>
                                    <option selected value="02">Fevereiro</option>
                                    <option selected value="03">março</option>
                                    <option selected value="04">Abril</option>
                                    <option selected value="05">Maio</option>
                                    <option selected value="06">Junho</option>
                                    <option selected value="07">Julho</option>
                                    <option selected value="08">Agosto</option>
                                    <option selected value="09">Setembro</option>
                                    <option selected value="10">Outubro</option>
                                    <option selected value="11">Novembro</option>
                                    <option selected value="12">Dezembro</option>                                    
                                    <option selected value="" selected="selected"></option>
                                </select>    
                            </div>
                            <div class="form-group col-md-4">
                                <label for="txtAnoFinal" class="control-label">Ano Final</label>
                                <input type="text" name="txtAnoFinal" required="" class="form-control" placeholder="XXXX">
                            </div>
                        </div>
                    </fieldset>
                    <fieldset>
                        <div>
                            <button type="submit" value="gerarRelatorioPeriodo" name="acao" class="btn btn-info">Gerar</button> 
                            <a href="relatorioPanel.jsp"><input type="button" value="Cancelar" class="btn btn-info"/></a>
                        </div> 
                    </fieldset>
                </form>               
            </div>
            </div>
            </div>    
        </div>
    </body>
</html>
