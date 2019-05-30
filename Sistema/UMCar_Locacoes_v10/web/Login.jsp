<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Acesso Administrador - UMCAR</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="css/favicon.png">
        <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="css/local.css" />
        <link rel="icon" href="../../favicon.ico">
        <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">        
        <link rel="icon" href="../../favicon.ico">
        <link href="../../dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
        <link href="signin.css" rel="stylesheet">
        <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
        <link rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light-bootstrap/all.min.css" />
        <script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
        <script type="text/javascript" src="http://www.prepbootstrap.com/Content/js/gridData.js"></script>
        <style type="text/css">
            * { margin: 0; padding: 0; font-family:Tahoma; font-size:9pt;}
                    #divCenter {
                    background-color: #e1e1e1;
                    width: 400px;
                    height: 250px;
                    left: 50%;
                    margin: -130px 0 0 -210px;
                    padding:10px;
                    position: absolute;
                    top: 50%; }
        </style>
    </head>
            <% 
                
                HttpSession L_sessao = request.getSession(true);
                if (!L_sessao.isNew()) {
                    String Mens_Login = (String) L_sessao.getAttribute("mensagem");
                        if (Mens_Login != null) {%>
                            <h1 style=""><%=Mens_Login%></h1>
                            <% }
                            }%>
                            
                            <%
                                 String msg = ((String)request.getAttribute("erro") == null) ? (String)request.getParameter("erro") : (String)request.getAttribute("erro");
                            
                            %>
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
                <a class="navbar-brand" href="Login.jsp">Acesso Administrador</a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li><a href="index.jsp"><i class="fa fa-arrow-left"></i> Voltar para Home</a></li>                    
                </ul>                 
            </div>
        </nav> 
    </div>    
    <div>
        <% 
            if (msg != null)
            {
            %>
              <h2 class="form-signin-heading text-center"><%=msg%></h2>   
            <%
            }
        %>
            <div class="container" id="divCenter">                
                <form action="ControleAutenticacao" method="POST" role="form" class="form-signin">
                  <h2 class="form-signin-heading text-center">Acessar</h2>
                    <label for="inputEmail" class="sr-only">E-mail</label>
                          <input id="inputEmail" class="form-control" placeholder="E-mail" required="" autofocus="" type="email" name="txtEmail">
                    <label for="inputPassword" class="sr-only">Senha</label>
                          <input id="inputPassword" class="form-control" placeholder="Senha" required="" type="password" name="txtSenha">
                    <div class="checkbox">
                      <label>
                        <input value="remember-me" type="checkbox"> Lembrar-me
                      </label>
                    </div>
                          <input type="hidden" value="login" name="acao" /> 
                          <input type="Submit" name="btn" value="Entrar" class="btn btn-lg btn-primary btn-block"/>
                </form>
            </div>
        
    </div> <!-- /container -->
              <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>    
    
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

