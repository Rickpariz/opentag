<!-- <%--
    Document   : dashboard.jsp
    Created on : 26/06/2017, 15:05:02
    Author     : Ricardo Ferreira Pariz Silva
    Dash ADM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'/>
      <title>Projetos - ADM
      </title>
      <link rel="icon" href="../../imgs/simbolo.png" type="image/x-icon"/>
      <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
      <link href="https://fonts.googleapis.com/css?family=Oswald:200" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"/>
        <link href="../../src/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="../../src/css/material-kit.css" rel="stylesheet"/>
        <link href="../../src/css/dashboard.css" rel="stylesheet"/>
        <link href="../../src/css/iziToast.min.css" rel="stylesheet"/>
        <link href="../../src/css/bootstrap-table.min.css" rel="stylesheet"/>
        <link href="../../src/css/admin_dash.css" rel="stylesheet"/>

        <style></style>
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
                <img src="" data-image="/opentagv.1/Image/${userSession.pictureProfile}">
                  ${userSession.name}
                </div>
                <span class="sidebar-brand">
                  ${userSession.email}
                </span>
              </div>
              <form action="../../tag" method="post" id="logout">
                <ul class="nav sidebar-nav">
                  <li>
                    <a href="../dashboard">
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
                  <li class="active">
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
                    <a href="perfil">
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
                  <br/>
                  <br/>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-11">
                  <div class="container-table">
                    <table id="projetos">
                      <thead>
                        <tr>
                          <th data-field="id" data-align="center" class="text-center hide">ID</th>
                          <th data-field="name" data-align="center">Nome</th>
                          <th data-field="user.name" data-align="center">Cliente</th>
                          <th data-field="description" data-align="center">Descrição</th>
                          <th data-field="status" data-formatter="myCustomStatus" data-align="center">Status</th>
                          <th data-field="priority" data-align="center">Prioridade</th>
                          <th data-field="plan" data-formatter="myCustomPlans" data-align="center">Plano</th>
                          <th data-field="deadline" data-align="center">prazo</th>
                          <th data-field="percentege" data-align="center">P. Geral</th>
                          <th data-formatter="myCustomButton" data-align="center">Ações</th>
                        </tr>
                      </thead>
                      <tbody></tbody>
                    </table>
                  </div>
                </div>
              </div>
              <br/>
              <br/>
              <div class="row">
                <div class="col-sm-5">
                  <div class="panel panel-default">
                    <div class="panel-heading"></div>
                    <div class="panel-body"></div>
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="panel panel-default">
                    <div class="panel-heading"></div>
                    <div class="panel-body"></div>
                  </div>
                </div>
              </div>
            </div>
          </body>
          <script src="../../src/js/jquery.min.js" type="text/javascript"></script>
          <script src="../../src/js/bootstrap.min.js" type="text/javascript"></script>
          <script src="../../src/js/material.min.js" type="text/javascript"></script>
          <script src="../../src/js/iziToast.min.js"></script>
          <script src="../../src/js/moment.js"></script>
          <script src="../../src/js/dashboard.js" type="text/javascript"></script>
          <script src="../../src/js/bootstrap-table.min.js" type="text/javascript"></script>
          <script src="../../src/js/projetos_admin.js" type="text/javascript"></script>

          <script></script>
        </html>
