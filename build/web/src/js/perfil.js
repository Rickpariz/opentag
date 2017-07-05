$(document).ready(function() {

  var btn_edit = $("#btn-edit");
  var btn_confirmar = $("#btn-confirmar");
  var btn_cancelar = $("#btn-cancelar");
  var btn_confirmar_senha = $("#btn-confirmar-senha");
  var senha_atual = $("#senha-atual");
  var senha_nova = $("#senha-nova");
  var senha_novamente = $("#senha-novamente");

  // upload da imagem de perfil
  $("#perfil").change(function(){
    var fileName = $(this).val();
       if (fileName){
         $("#btn-perfil").attr("disabled", false);
       } else {
         $("#btn-perfil").attr("disabled", true);
       }
  });
  $("#upload").on("submit", function(e){
    e.preventDefault();
    $.ajax({
      url: $("#controller").val(),
      type: "POST",
      data: $(this).serialize(),
      success: function(json){
        
      },
      error: function(){

      }
    });
  });
  // validações dos campos de nova senha
  $("#form-edit-senha").on("submit", function(e) {
    e.preventDefault();

    if (senha_nova.val() == "" || senha_novamente.val() == "") {
      $("#erro").removeClass("hidden");
      $("#msg").text("Preencha todos os campos");
    } else if (senha_nova.val() != senha_novamente.val()) {
      $("#erro").removeClass("hidden");
      $("#msg").text("As senhas não são compatíveis");
    } else {
      // requisição ajax

      $.ajax({
        url: $("#controller").val(),
        type: "POST",
        data: {
          senha: senha_nova.val(),
          execute: "UpdatePassword",
          id: $("#id").val()
        },
        success: function(json) {
          if (json.status) {
            $("#btn-modal").click();
            $("#form-edit-senha").each(function() {
              this.reset();
            });
            iziToast.success({
              title: 'Ok',
              message: json.message,
              icon: "fa fa-check",
              timeout: 2500,
              position: "center",
            });
          } else {
            iziToast.error({
              title: 'Erro',
              message: json.message,
              icon: "fa fa-times"
            });
          }
        },
        error: function() {
          iziToast.error({
            title: 'Erro',
            message: "Erro ao fazer requisição",
            icon: "fa fa-times"
          });
        }
      });
    }
  });

  // quando digitar a senha atual fazer uma requisição ajax
  $("#senha-atual").blur(function() {
    console.log("FOi");
    var url = $("#controller").val();
    var data = {
      senha: senha_atual.val(),
      id: $("#id").val(),
      execute: "VerifyPassword"
    };

    $.ajax({
      url: url,
      type: "POST",
      data: data,
      success: function(json) {
        if (json.status == true) {
          $("#erro").addClass("hidden");
          senha_nova.attr("disabled", false);
          senha_novamente.attr("disabled", false);
        } else {
          $("#erro").removeClass("hidden");
          $("#msg").text(json.message);
          senha_nova.attr("disabled", true);
          senha_novamente.attr("disabled", true);
        }
      },
      error: function() {
        $("#erro").removeClass("hidden");
        $("#msg").text("Erro na requisição, verifique sua rede");
      }
    });
  });
  // Aticando os campos de edição
  btn_edit.click(function() {
    editActive();
  });
  // Ativando os campos Defaults
  btn_cancelar.click(function() {
    editDefault();
  });

  // Confirmação da edição e requisição ajax com o update
  btn_confirmar.click(function() {
    btn_confirmar.attr("disabled", true);
    btn_cancelar.attr("disabled", true);
    console.log("Clico em confirmar");
    var url = $("#controller").val();
    var data = {
      id: $("#id").val(),
      name: $("#nome").val(),
      email: $("#email").val(),
      execute: "EditProfile"
    };

    // Requisição ajax
    $.ajax({
      url: url,
      type: "POST",
      data: data,
      success: function(json) {
        console.log("requisição feita com sucesso");
        if (json.status === true) {
          console.log("status true");
          editDefault();
          iziToast.success({
            title: 'Ok',
            message: json.message,
            icon: "fa fa-check",
            timeout: 2500,
            position: "center",
            onClose: function() {
              location.reload();
            }
          });
        } else {
          iziToast.error({
            title: 'Erro',
            message: json.message,
            icon: "fa fa-times"
          });
        }
      },
      error: function() {
        iziToast.error({
          title: 'Erro',
          message: "Erro ao fazer requisição",
          icon: "fa fa-times"
        });
      },
      complete: function(json) {
        btn_confirmar.attr("disabled", false);
        btn_cancelar.attr("disabled", false);
      }
    });
  });

  function editActive() {
    $(".editActive").removeClass("hide");
    $(".editDefault").addClass("hide");
  }

  function editDefault() {
    $(".editDefault").removeClass("hide");
    $(".editActive").addClass("hide");
  }

});
