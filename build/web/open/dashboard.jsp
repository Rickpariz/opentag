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
        <link href="src/css/iziModal.css" rel="stylesheet" />
        <link href="src/css/iziToast.min.css" rel="stylesheet" />
        <link href="src/css/dashboard.css" rel="stylesheet" />
        <link href="src/css/cliente-dash.css" rel="stylesheet" />
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
                      <i class="sidebar-icon material-icons">description</i>
                      Projetos
                  </a>
              </li>
              <li>
                  <a href="#">
                      <i class="sidebar-icon material-icons">message</i>
                      Contato
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
            <br/>
            <br/>
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
        <div class="row">
          <div class="col-sm-11">
            <div class="panel panel-default">
              <div class="panel-heading">
                <i class="material-icons">chrome_reader_mode</i>
                Crie seu projeto !
              </div>
              <div class="panel-body">
                <div class="row">
                  <div class="col-sm-12 text-center">
                    <h4 class="description">
                      Inicie um novo projeto com 3 passos simples !
                    </h4>
                    <br/>
                  </div>
                </div>
                <div class="row">
                  <div class="tutorial col-md-4">
                    <div class="icon text-center">
                      <i class="material-icons">description</i>
                    </div>
                    <br/>
                    <div class="text-center">
                      <h4 class="title">Descreva o projeto !</h4>
                      <p class="description">
                        Descreva oque você precisa para a nossa equipe, iremos ler atentamente !
                      </p>
                    </div>
                  </div>
                  <div class="tutorial col-md-4">
                    <div class="icon text-center">
                      <i class="material-icons">attach_money</i>
                    </div>
                    <br/>
                    <div class="text-center">
                      <h4 class="title">Escolha o plano</h4>
                      <p class="description">Escolha o plano ideal para o seu projeto, temos as opções: ECO, PREMIUM e STARTER</p>
                    </div>
                  </div>
                  <div class="tutorial col-md-4">
                    <div class="icon text-center">
                      <i class="material-icons">assessment</i>
                    </div>
                    <br/>
                    <div class="text-center">
                      <h4 class="title">Gerencie </h4>
                      <p class="description">Após aprovarmos seu projeto, você vai poder gerencia-lo, vendo as datas de entrega e os progessos da nossa equipe !</p>
                    </div>
                  </div>
                </div>
                <br/>
                <div class="row text-center">
                  <button type="button" id="btn-modal-projeto" class="btn btn-custom">Criar</button>
                </div>

                <div class="iziModal" id="div-modal-projeto">
                  <div class="section-modal">
                    <form autocomplete="off" id="novo-projeto">
                      <input type="hidden" name="execute" value="NewProject">
                      <input type="hidden" name="id_user" value="${userSession.id}">
                      <div class="row">
                        <div class="col-sm-6">
                          <div class="input-group">
                        		<span class="input-group-addon">
                        			<i class="material-icons icon-tutorial ">assignment</i>
                        		</span>
                        		<input type="text" class="form-control" name="nome" placeholder="Digite o nome do projeto">
                        	</div>
                        </div>
                        <div class="col-sm-6">
                          <div class="input-group">
                        		<span class="input-group-addon">
                        			<i class="material-icons">perm_identity</i>
                        		</span>
                        		<input type="text" class="form-control" disabled="true" value="${userSession.name}">
                        	</div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-sm-offset-1 col-sm-10">
                          <textarea class="form-control" name="descricao" placeholder="Descreva o projeto, seja bem detalhado para melhor compreenção da equipe !" rows="5"></textarea>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-sm-offset-1 col-sm-3">
                          <div class="radio">
                          	<label>
                          		<input type="radio" name="plano" value="eco">
                          		ECO <br/> (R$ XX,XX)
                          	</label>
                          </div>
                        </div>
                        <div class="col-sm-3">
                          <div class="radio">
                          	<label>
                          		<input type="radio" name="plano" value="premium">
                          		PREMIUM <br/> (R$ XX,XX)
                          	</label>
                          </div>
                        </div>
                        <div class="col-sm-3">
                          <div class="radio">
                          	<label>
                          		<input type="radio" name="plano" value="starter">
                          		STARTER <br/> (R$ XX,XX)
                            </label>
                          </div>
                        </div>
                      </div>
                      <br/>
                      <div class="text-center">
                        <input type="submit" class="btn btn-custom" id="btn-solicitar" value="Solicitar">
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      </div>


    </body>
    <script src="src/js/jquery.min.js" type="text/javascript"></script>
    <script src="src/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="src/js/material.min.js"></script>
    <script src="src/js/iziModal.js"></script>
    <script src="src/js/iziToast.min.js"></script>
    <script src="src/js/moment.js" charset="utf-8"></script>
    <script src="src/js/dashboard.js"></script>
    <script src="src/js/cliente-dash.js"></script>
</html>
