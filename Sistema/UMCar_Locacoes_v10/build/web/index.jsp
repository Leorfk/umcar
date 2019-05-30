<%-- 
    Document   : index
    Created on : 10/03/2019, 15:51:09
    Author     : Kirkh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>UMCAR</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="icon" href="css/favicon.png">
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />

</head>
    <body>
            <div id="header-wrapper">
                    <div id="header" class="container-fluid">
                            <div id="logo">
                                <h1><a href="http://www.umc.br" target="_bank"><img src="images/LogoUMCar.png" width="150" height="150"/></a></h1>
                            </div>
                            <div id="menu">
                                    <ul>
                                            <li><a href="Login.jsp" accesskey="4" title="" class="fa fa-black-tie">Acesso Administrador</a></li>
                                            <li><a href="clientePanel.jsp" accesskey="5" title="">Login/Cadastro</a></li>
                                            <li><a href="listaAutomoveis.jsp">Lista de carros</a>
                                    </ul>
                            </div>
                    </div>
            </div>
    
                <div id="wrapper">

                        <div id="staff" class="container">
                            <div class="col-md-12">
                    <div class="row">
                        <div class="panel panel-default">
                            <div class="panel-heading title ">
                                <h3>Pesquisar a UMCar mais próxima de você (EM FASE DE TESTE)</h3>
                            </div>
                            <div class="panel-body">
                               Cidade: <select name="txtCidade" onchange="">
                                            <option value="0">Escolha uma Cidade</option>
                                            <option value="1">Suzano</option>
                                            <option value="2">Mogi das Cruzes</option>
                                            <option value="3">Poá</option>
                                            <option value="4">Arujá</option>
                                            <option value="selected"></option>
                                       </select>

                               Bairro: <select name="txtBairro" onchange="">
                                   <option value="0">Escolha um Bairro</option>
                                   <option value="selected"></option>
                               </select>

                               Transacao:
                               <select name="txtTransacao" onchange="">
                                   <option value="0">Escolha uma Transação</option>
                                   <option value="1" >Locação</option>
                                   <option value="2" >Compra</option>
                               </select>

                                Marca:
                               <select name="txtMarca" onchange="">
                                   <option value="0">Escolha uma Marca</option>
                                   <option value="1" >Toyota</option>
                                   <option value="2" >Volkswagen</option>
                                   <option value="3" >Ford</option>
                                   <option value="4" >Nissan</option>
                                   <option value="5" >Hyundai</option>
                                   <option value="6" >Fiat</option>
                               </select>
                                    <input type="submit" value="Pesquisar" class="btn btn-primary">
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
		<div class="title">
			<h2>Carros em destaque</h2>
                        <span>Aqui você encontra as melhores (ou não) opções para locação de automóveis</span> </div>
		<div class="boxA"><img src="images/pic01.jpg" width="100%" height="auto" alt="" /></div>
		<div class="boxB"><img src="images/pic02.jpg" width="100%" height="auto" alt="" /></div>
                <div class="boxC"><img src="images/pic03.jpg" width="100%" height="auto" alt="" /></div>
	</div>
	<div id="page" class="container">
		<div class="boxA">
                    <h2>VW Fox<p> Ano 2018</h2>
			<p>É um carro bem incrivél, pricipalmente para você assaláriado fodido na vida.</p>
		</div>
		<div class="boxB">
                    <h2>Toyota Corolla<p> Ano 2019</h2>
                    <p>Esse garotão mostra que japoneses sabem fazer mais coisas além de assistir desenhos pornograficos com tentáculos</p>
		</div>
		<div class="boxC">
                    <h2>Carro verde<p>Esquisito</h2>
                    <p>Achamos essa foto na internet e deidimos incluir nessa home page</p>
		</div>
	</div>
        </div>
        <div id="welcome-wrapper">
                <div id="welcome" class="container">
                        <div class="title">
                                <h2>Bem-Vindos ao nosso website</h2>
                        </div>
                    <p>Esse projeto é a prova de que estamos encerrando nossas atividades na UMC</p>
                    <h1>Glória a Deux</h1>
                </div>
        </div>
        <div id="copyright" class="container">
            <p>&copy; Todos os direitos reservados. | Imagens por <strong>Diogo Alves</strong>| Design por <strong>Leonardo Ferreira</strong></p>
        </div>
    </body>
</html>
