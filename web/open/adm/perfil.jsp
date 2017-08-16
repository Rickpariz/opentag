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
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <title>Perfil - ADM </title>
        <link rel="icon" href="imgs/simbolo.png" type="image/x-icon" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
        <link href="https://fonts.googleapis.com/css?family=Oswald:200" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
        <link href="../../src/css/bootstrap.min.css" rel="stylesheet" />
        <link href="../../src/css/material-kit.css" rel="stylesheet" />
        <link href="../../src/css/dashboard.css" rel="stylesheet" />
        <link href="../../src/css/upload-input.css" rel="stylesheet" />
        <link href="../../src/css/iziToast.min.css" rel="stylesheet" />

        <style>

        </style>
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
              <li class="active">
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
            <h2>Perfil</h2>
          </div>
          <div class="alert alert-info col-md-12">
	            <div class="container-fluid">
      					<div class="alert-icon">
      						<i class="material-icons">info_outline</i>
      					</div>
      					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
      						<span aria-hidden="true"><i class="material-icons">clear</i></span>
      					</button>
	            	<b>Plano:</b> Atualmente seu plano é o X2XXXX
	            </div>
	        </div>
          <div class="">
            <div class="col-md-3">
              <img src="" data-image="/opentag/Image/${userSession.pictureProfile}" class="img-rounded img-responsive img-raised">
              <br/>
              <form class="text-center" id="upload">
                <input type="hidden" id="UpdateProfile" value="/opentag/dashboard/updateProfile">
                <label class="file" title="">
                  <input type="file" id="perfil" name="perfil" onchange="this.parentNode.setAttribute('title', this.value.replace(/^.*[\\/]/, ''))" />
                </label>
                <input type="submit" id="btn-perfil" class="btn btn-custom btn-sm" value="Enviar" disabled/>
              </form>

              <br/>
              <br/>
            </div>
            <div class="col-md-9">
              <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading">
                  <i class="material-icons">settings</i>
                  Informações da Conta
                </div>
                <div class="panel-body">
                  <div class="alert alert-info editDefault col-md-12">
        	            <div class="container-fluid">
              					<div class="alert-icon">
              						<i class="material-icons">info_outline</i>
              					</div>
              					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
              						<span aria-hidden="true"><i class="material-icons">clear</i></span>
              					</button>
        	            	 Cuidado ao alterar suas informações
        	            </div>
        	        </div>
                  <!-- id do usuario -->
                  <input type="hidden" id="id" value="${userSession.id}">
                  <!-- url do controller -->
                  <input type="hidden" id="controller" value="../../tag">
                  <!-- Padrão -->
                  <p class="editDefault"> Nome: ${userSession.name}</p>
                  <p class="editDefault"> Email: ${userSession.email}</p>

                  <!-- Editar -->
                  <div class="input-group col-sm-11 editActive hide">
                    <span class="input-group-addon">
                        <i class="material-icons">account_box</i>
                      </span>
                    <input type="text" class="form-control" id="nome" required="required" value="${userSession.name}">
                  </div>
                  <div class="input-group col-sm-11 editActive hide">
                    <span class="input-group-addon">
                        <i class="material-icons">email</i>
                      </span>
                    <input type="email" class="form-control" id="email" value="${userSession.email}">
                  </div>
                  <%-- <label class="file hide editActive" title="">
                    <input type="file" id="perfil" onchange="this.parentNode.setAttribute('title', this.value.replace(/^.*[\\/]/, ''))" />
                  </label>
                  <label class="capa file hide editActive" title="">
                    <input type="file" id="capa" onchange="this.parentNode.setAttribute('title', this.value.replace(/^.*[\\/]/, ''))" />
                  </label> --%>

                </div>
                <div class="panel-footer">
                  <button type="button" id="btn-edit" class="btn btn-custom btn-sm editDefault">Editar</button>
                  <button type="button" id="btn-edit-senha" class="btn btn-custom btn-sm editDefault" data-toggle="modal" data-target="#myModal">Editar Senha</button>
                  <button type="button" id="btn-confirmar" class="btn btn-custom btn-sm hide editActive">Confirmar</button>
                  <button type="button" id="btn-cancelar" class="btn btn-custom btn-sm hide editActive">Cancelar</button>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-sm-6">
            <div class="panel panel-default">
              <!-- Default panel contents -->
              <div class="panel-heading">
                <i class="material-icons">assessment</i>
                Informações do Plano
              </div>
              <div class="panel-body">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusm
              </div>
              <div class="panel-footer">
                <button type="button" class="btn btn-custom btn-sm">Editar</button>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      	<div class="modal-dialog">
          <form id="form-edit-senha" method="post">
            <input type="hidden" id="id" value="${userSession.id}">
        		<div class="modal-content">
        			<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
        					<i class="material-icons">clear</i>
        				</button>
        				<h4 class="modal-title">Edição de senha</h4>
        			</div>
        			<div class="modal-body">
                <div class="alert alert-info">
      	            <div class="container-fluid">
            					<div class="alert-icon">
            						<i class="material-icons">info_outline</i>
            					</div>
            					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
            						<span aria-hidden="true"><i class="material-icons">clear</i></span>
            					</button>
      	            	 Digite sua senha corretamente, e os campos para a nova serão liberados
      	            </div>
      	        </div>
                <div class="alert alert-danger hidden" id="erro">
                    <div class="container-fluid">
                	  <div class="alert-icon">
                	    <i class="material-icons">error_outline</i>
                	  </div>
                	   <b>Error:</b> <span id="msg"></span>
                    </div>
                </div>
                <div class="col-sm-4">
                  <div class="form-group label-floating">
                		<label class="control-label">Senha Atual</label>
                		<input type="password" id="senha-atual" class="form-control">
                	</div>
                </div>
                <div class="col-sm-4">
                  <div class="form-group label-floating">
                		<label class="control-label">Nova Senha</label>
                		<input type="password" id="senha-nova" class="form-control" disabled>
                	</div>
                </div>
                <div class="col-sm-4">
                  <div class="form-group label-floating">
                		<label class="control-label">Nova novamente</label>
                		<input type="password" id="senha-novamente" class="form-control" disabled>
                	</div>
                </div>
        			</div>

        			<div class="modal-footer">
        				<input type="submit" class="btn btn-default btn-simple" value="Confirmar"/>
        				<button type="button" class="btn btn-danger btn-simple" id="btn-modal" data-dismiss="modal">Cancelar</button>
        			</div>
        		</div>
          </form>
      	</div>
      </div>

    </body>
    <script src="../../src/js/jquery.min.js" type="text/javascript"></script>
    <script src="../../src/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../src/js/material.min.js" type="text/javascript"></script>
    <script src="../../src/js/iziToast.min.js"></script>
    <script src="../../src/js/moment.js"></script>
    <script src="../../src/js/dashboard.js" type="text/javascript"></script>
    <script src="../../src/js/perfil.js" type="text/javascript"></script>

    <script>

    </script>
</html>
