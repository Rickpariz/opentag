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
      <title>Projetos</title>
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
                      <li>
                        <a href="cliente">
                          <i class="sidebar-icon material-icons">face</i>
                          Clientes
                        </a>
                      </li>
                      <li class="active">
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
                        <table id="projetos" data-unique-id="id">
                          <thead>
                            <tr>
                              <th data-field="id" data-sort-order="desc" data-align="center" data-visible="false" class="text-center">ID</th>
                              <th data-field="name" data-align="center">Nome</th>
                              <th data-field="user.name" data-align="center">Cliente</th>
                              <th data-field="description" data-align="center">Descrição</th>
                              <th data-field="status" data-formatter="myCustomStatus" data-align="center">Status</th>
                              <th data-field="priority" data-align="center">Prioridade</th>
                              <th data-field="plan" data-formatter="myCustomPlans" data-align="center">Plano</th>
                              <th data-field="deadline" data-align="center">prazo</th>
                              <th data-field="percentege" data-align="center">P. Geral</th>
                              <th data-formatter="myCustomButton" data-align="center" data-events="actionEvents">Ações</th>
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


            <div class="iziModal" id="modal-editar-projeto">
              <div class="section-modal">
    						<div class="card card-nav-tabs">
    							<div class="header header-success">
    								<div class="nav-tabs-navigation nav-tabs-custom">
    									<div class="nav-tabs-wrapper">
    										<ul class="nav nav-tabs" data-tabs="tabs">
    											<li class="active" id="link-info1">
    												<a href="#info1"  data-toggle="tab">
    													<i class="material-icons">info_outline</i>
    													Info 1
    												</a>
    											</li>
    											<li id="link-info2">
    												<a href="#info2" data-toggle="tab">
    													<i class="material-icons">info </i>
    													Info 2
    												</a>
    											</li>
    										</ul>
    									</div>
    								</div>
    							</div>
                  <form autocomplete="off" id="novo-projeto">
                    <input type="hidden" name="execute" value="UpdateProject">
                    <input type="hidden" id="id-projeto" name="id-projeto">
    							<div class="content">
    								<div class="tab-content text-center">
    									<div class="tab-pane active" id="info1">
                        <div class="row">
                          <div class="col-sm-5">
                            <div class="input-group">
                              <span class="input-group-addon">
                                <i class="material-icons icon-tutorial ">assignment</i>
                              </span>
                              <input type="text" class="form-control" name="nome-projeto" id="nome-projeto" placeholder="Digite o nome do projeto" required="required">
                            </div>
                          </div>
                          <div class="col-sm-6">
                            <div class="input-group">
                              <span class="input-group-addon">
                                <i class="material-icons">perm_identity</i>
                              </span>
                              <input type="text" class="form-control" name="nome-usuario-projeto" id="nome-usuario-projeto" disabled="true" value="">
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-sm-offset-1 col-sm-10">
                            <textarea class="form-control" required="required" name="descricao-projeto" id="descricao-projeto" placeholder="Descreva o projeto, seja bem detalhado para melhor compreenção da equipe !" rows="5"></textarea>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-sm-offset-1 col-sm-5">
                            <div class="form-group">
                              <label for="plano">Plano</label>
                              <select class="form-control" id="plano" name="plano">
                                <option class="form-control" value="eco">ECO</option>
                                <option class="form-control" value="premium">PREMIUM</option>
                                <option class="form-control" value="starter">STARTER</option>
                              </select>
                            </div>
                          </div>
                          <div class="col-sm-5">
                            <div class="form-group">
                              <label for="prioridade">Prioridade</label>
                              <select class="form-control" id="prioridade" name="prioridade">
                                <option class="form-control" value="comum">Comum</option>
                                <option class="form-control" value="média">Média</option>
                                <option class="form-control" value="urgente">Urgente</option>
                              </select>
                            </div>
                          </div>
                        </div>
    									</div>
    									<div class="tab-pane" id="info2">
                        <div class="row">
                          <div class="col-sm-offset-1 col-sm-5">
                            <div class="form-group">
                              <label for="prazo">Prazo</label>
                              <span id="date">
                                <input type="hidden" id="prazo-projeto" name="prazo-projeto">
                              </span>
                            </div>
                          </div>
                          <div class="col-md-5">
                            <div class="form-group" style="padding-top: 10%;">
                              <label for="progresso geral"> P. Geral</label>
                              <input type="hidden" id="porcentagem-projeto" name="porcentagem-projeto">
                              <div id="progress" class="slider slider-success"></div>
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-sm-offset-1 col-sm-5">
                            <div class="form-group">
                              <label for="prioridade">Status</label>
                              <select class="form-control" id="status" name="status">
                                <option class="form-control" value="Esperando confirmação">Esperando confirmação</option>
                                <option class="form-control" value="Pagamento em aberto">Pagamento em aberto</option>
                                <option class="form-control" value="Processando pagamento">Processando pagamento</option>
                                <option class="form-control" value="Em desenvolvimento">Em desenvolvimento</option>
                                <option class="form-control" value="Cancelado">Cancelado</option>
                                <option class="form-control" value="Concluido">Concluido</option>
                              </select>
                            </div>
                          </div>
                          <div class="col-md-5">
                            <div class="form-group">
                              <label for="">Email do Cliente</label>
                              <input type="hidden" id="email-usuario" name="email-usuario" value="">
                              <input type="text" id="email-usuario-projeto" class="form-control" placeholder="example@gmail.com" disabled="true">
                            </div>
                          </div>
                        </div>
    									</div>
    								</div>
    							</div>
    						</div>
                <div class="row">
                  <div class="col-sm-8 text-center">
                    <input type="submit" class="btn btn-custom" id="btn-novo-projeto" value="editar">
                  </div>
                  <div class="col-sm-4">
                    <div class="chip hidden" id="erro">
                      <i class="fa fa-exclamation-circle"></i>
                      <span id="msg">preencha tudo</span>
                    </div>
                  </div>
                </div>
                </form>
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
          <script src="../../src/js/projetos_admin.js" type="text/javascript"></script>
        </html>
