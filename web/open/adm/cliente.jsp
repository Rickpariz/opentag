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
      <title>Clientes</title>
      <link rel="icon" href="../../imgs/simbolo.png" type="image/x-icon"/>
      <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
      <link href="https://fonts.googleapis.com/css?family=Oswald:200" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700"/>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"/>
      <link href="../../src/css/bootstrap.min.css" rel="stylesheet"/>
      <link href="../../src/css/material-kit.css" rel="stylesheet"/>
      <link href="../../src/css/dashboard.css" rel="stylesheet"/>
      <link href="../../src/css/iziModal.css" rel="stylesheet"/>
      <link href="../../src/css/sweetalert.css" rel="stylesheet"/>
      <link href="../../src/css/bootstrap-table.min.css" rel="stylesheet"/>
      <link href="../../src/css/admin_dash.css" rel="stylesheet"/>
      </head>
      <body>
        <nav class="navbar navbar-custom">
          <button type="button" id="button-nav" class="navbar-toggle pull-left">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="container">
            <a class="navbar-brand">OpenTag</a>
          </div>
        </nav>
        <div class="struct">
          <div class="row">
            <div class="col-md-3 col-nav sidenav-bar">
              <aside id="sidebar" class="sidebar sidebar-default" role="navigation">
                <div class="sidebar-header header-cover">
                  <div class="top-bar"></div>
                  <div class="sidebar-image">
                    <img src="" data-image="/opentag/Image/${userSession.pictureProfile}">
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
                      <li class="active">
                        <a href="#">
                          <i class="sidebar-icon material-icons">face</i>
                          Clientes
                        </a>
                      </li>
                      <li>
                        <a href="projetos">
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
                        <table id="clientes" data-unique-id="id">
                          <thead>
                            <tr>
                              <th data-field="id" data-align="center" class="text-center">ID</th>
                              <th data-field="name" data-align="center">Nome</th>
                              <th data-field="email" data-align="center">Email</th>
                              <th data-field="access" data-formatter="customAccess" data-align="center">Acesso</th>
                              <th data-formatter="customButton" data-events="actionEvents" data-align="center">Acesso</th>
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
          </div>
        </div>


            <div class="" id="modal-editar-cliente">
              <div class="section-modal">
                <form id="editar-cliente">
                  <input type="hidden" name="execute" value="UpdateAccessClient">
                  <input type="hidden" name="id" id="id-cliente">
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="input-group">
                        <span class="input-group-addon">
                          <i class="material-icons">perm_identity</i>
                        </span>
                        <input type="text" class="form-control" name="nome-usuario" id="nome-usuario" disabled="true">
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="input-group">
                        <span class="input-group-addon">
                          <i class="material-icons">email</i>
                        </span>
                        <input type="text" class="form-control" name="email-usuario" id="email-usuario" disabled="true">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="center-block">
                      <div class="form-group text-center">
                        <label for="plano">Acesso</label>
                        <select class="form-control" id="acesso" name="acesso">
                          <option class="form-control" value="liberado">Liberado</option>
                          <option class="form-control" value="bloqueado">Bloqueado</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="text-center">
                        <input class="btn btn-custom" type="submit" value="Editar"/>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </body>
          <script src="../../src/js/jquery.min.js" type="text/javascript"></script>
          <script src="../../src/js/bootstrap.min.js" type="text/javascript"></script>
          <script src="../../src/js/bootstrap-datepicker.js" type="text/javascript"></script>
          <script src="../../src/js/nouislider.min.js" type="text/javascript"></script>
          <script src="../../src/js/material.min.js" type="text/javascript"></script>
          <script src="../../src/js/bootstrap-table.min.js" type="text/javascript"></script>
          <script src="../../src/js/moment.js"></script>
          <script src="../../src/js/iziModal.js"></script>
          <script src="../../src/js/sweetalert.min.js"></script>
          <script src="../../src/js/dashboard.js" type="text/javascript"></script>
          <script src="../../src/js/clientes_admin.js" type="text/javascript"></script>
        </html>
