<!-- <%--
    Document   : dashboard.jsp
    Created on : 26/06/2017, 15:05:02
    Author     : Ricardo Ferreira Pariz Silva
    Dash Cli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <title>Dashboard - Cli </title>
        <link rel="icon" href="imgs/simbolo.png" type="image/x-icon" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
        <link href="https://fonts.googleapis.com/css?family=Oswald:200" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
        <link href=" src/css/bootstrap.min.css" rel="stylesheet" />
        <link href="src/css/material-kit.css" rel="stylesheet" />
        <link href="src/css/dashboard.css" rel="stylesheet" />
    </head>
    <body>
      <nav class="navbar navbar-custom">
        <button type="button" class="navbar-toggle pull-left">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <div class="container">
          <a class="navbar-brand">OpenTag</a>
        </div>
      </nav>
      <div class="col-md-3 col-modify">
        <aside id="sidebar" class="sidebar sidebar-default open hidden-sm hidden-xs" role="navigation">
          <div class="sidebar-header header-cover">
              <div class="top-bar"></div>
              <div class="sidebar-image">
                  <img src="imgs/r1.jpg">
                   ${userSession.name}
              </div>
              <span class="sidebar-brand">
                  ${userSession.email}
              </span>
          </div>
          <form action="tag" method="post" id="logout">
          <ul class="nav sidebar-nav">
              <li class="active">
                  <a href="#">
                      <i class="material-icons sidebar-icon">dashboard</i>
                      Dashboard
                  </a>
              </li>
              <li>
                  <a href="#">
                      <i class="sidebar-icon material-icons">face</i>
                      Clientes
                  </a>
              </li>
              <li>
                  <a href="#">
                      <i class="sidebar-icon material-icons">description</i>
                      Projetos
                  </a>
              </li>
              <li>
                  <a href="#">
                      <i class="sidebar-icon material-icons">message</i>
                      Mensagens
                  </a>
              </li>
              <li class="divider"></li>
              <li>
                  <a href="dashboard/perfil">
                      Perfil
                  </a>
              </li>
              <li>
                <input type="hidden" name="execute" value="Logout">
                <a href="#" onClick="document.getElementById('logout').submit();">
                  Sair
                </a>
              </li>
          </ul>
          </form>
        </aside>
      </div>
      <div class="col-md-9 col-sm-12">
        <div class="row">
          <div class="title">
            <h2>Dashboard</h2>
          </div>
          <!-- <div class="alert alert-info col-md-12">
	            <div class="container-fluid">
      					<div class="alert-icon">
      						<i class="material-icons">info_outline</i>
      					</div>
      					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
      						<span aria-hidden="true"><i class="material-icons">clear</i></span>
      					</button>
	            	<b>Clientes:</b> Nas ultimas 24 Hrs, dois clientes se cadastraram
	            </div>
	        </div> -->
        </div>

      </div>


    </body>
    <script src="src/js/jquery.min.js" type="text/javascript"></script>
    <script src="src/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="src/js/material.min.js"></script>
    <script src="src/js/dashboard.js"></script>
</html>
