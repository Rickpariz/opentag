$(document).ready(function() {
  var editar_modal = $("#modal-editar-projeto").iziModal({
    title: 'Projeto', // reescrita
    subtitle: 'Edite os projetos com cuidado', // reescrita
    headerColor: '#b08064', // reescrita
    focusInput: false,
    icon: "fa fa-briefcase", // reescrita
    history: false, // reescrita
    onOpening: function(modal) {
      var input = '<input class="form-control" id="prazo" data-date-format="dd/mm/yyyy" placeholder="dd/mm/aaaa" type="text" required="required" />';
      $("#date").prepend(input);
      $('#prazo').datepicker();
      $("#info2").click();
      setTimeout(function() {
        $('#progress').noUiSlider({
          start: 0,
          connect: "lower",
          tooltips: true,
          range: {
            min: 0,
            max: 100
          },
          format: {
            from: function(value) {
              return parseInt(value);
            },
            to: function(value) {
              return parseInt(value);
            }
          }
        });
      }, 1);

    },
    onClosing: function(modal) {
      $("#erro").addClass("hidden");
      $("#prazo").remove();
      $('#progress')[0].destroy();
      $("#link-info1").addClass("active");
      $("#link-info2").removeClass("active");
      $("#info1").addClass("active");
      $("#info2").removeClass("active");
      editar_modal.find(".iziModal-loader").css({
        "opacity": "1"
      });
      editar_modal.find(".iziModal-loader").toggle();

    }
  });

  $.ajax({
    url: "/opentag/tag",
    method: 'get',
    data: {
      "execute": "SearchProjects"
    },
    success: function(json) {
      $("#projetos").bootstrapTable({
        data: json,
        search: true,
        pagination: true,
        pageSize: 4,
        cache: false,
        sortOrder: "desc"
      });
      myStyleTable();
    }
  });

  function atualizaProjeto(idProjeto) {
    $("#btn-novo-projeto").on("click", function(e) {
      e.preventDefault();
      if (validaCampos()) {
        swal({
            title: "Você tem certeza ?",
            text: "Deseja mesmo editar o projeto ?!",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Sim",
            closeOnConfirm: false
          },
          function() {
            $("#email-usuario").val($("#email-usuario-projeto").val());
            $("#porcentagem-projeto").val(parseInt($("#progress").val()));
            $("#prazo-projeto").val($("#prazo").val());
            $("#id-projeto").val(idProjeto);
            var data = $("#novo-projeto").serialize();
            $.ajax({
              url: "/opentag/tag",
              method: "post",
              data: data,
              success: function(data) {
                var object = data.objects[0];
                $("#projetos").bootstrapTable("updateByUniqueId", {
                  id: object.id,
                  row: object
                });
                if (data.objects[1].status) {
                  swal({
                    title: "Editado !",
                    text: data.objects[1].message,
                    type: "success",
                    confirmButtonText: "Ok",
                  });
                } else {
                  sweetAlert("Oops...", data.objects[1].message, "error");
                }
              },
              error: function() {
                sweetAlert("Oops...", "Erro na requisição !", "error");
              }
            });
          });
      }
    });

  }

  window.actionEvents = {
    'click .btn-modal-editar-projeto': function(e, value, row, index) {
      editar_modal.iziModal("open");
      editar_modal.iziModal("startLoading");
      $.ajax({
        url: "/opentag/tag",
        method: 'get',
        cache: false,
        data: {
          "execute": "SearchProjectById",
          "id": row.id
        },
        success: function(json) {
          $("#nome-projeto").val(json.name);
          $("#nome-usuario-projeto").val(json.user.name);
          $("#descricao-projeto").val(json.description);
          $("#email-usuario-projeto").val(json.user.email);
          $("#progress").val(parseInt(json.percentege));
          $("#prazo").val(json.deadline);
          $("#prioridade").find("option").filter("[value='" + json.priority + "']").prop("selected", true);
          $("#plano").find("option").filter("[value='" + json.plan + "']").prop("selected", true);
          $("#status").find("option").filter("[value='" + json.status + "']").prop("selected", true);

          atualizaProjeto(row.id);
        },
        error: function() {
          alert("Erro ao carregar dados do projeto");
        },
        complete: function() {
          editar_modal.find(".iziModal-loader").css({
            "transition": "opacity 1s",
            "opacity": "0"
          });
          setTimeout(function() {
            editar_modal.find(".iziModal-loader").toggle();
          }, 1000);
        }
      });
    }
  }
});

function validaCampos() {
  if ($("#nome-projeto").val() == "" || $("#descricao-projeto").val() == "" || $("#prazo").val() == "") {
    $("#erro").removeClass("hidden");
    return false;
  } else {
    $("#erro").addClass("hidden");
    return true;
  }
}

function myStyleTable() {
  // $(".bootstrap-table").addClass("table-responsive");
  var input = $(".search input");
  var div = $(".search");
  var icon = '<span class="input-group-addon">' +
    '<i class="material-icons">search</i>' +
    '</span>';
  div.addClass("input-group");
  div.addClass("form-group");
  div.removeClass("pull-right");
  div.prepend(icon);
  input.attr("placeholder", "Filtrar");
  $(".fixed-table-toolbar").addClass("custom-header-table");
}

function myCustomStatus(value, row, index) {
  var label;
  if ((value == "Esperando confirmação") || (value == "Processando pagamento")) {
    label = '<span class="label label-info">' + value + '</span>';
  } else if (value == "Pagamento em aberto") {
    label = '<span class="label label-warning">' + value + '</span>'
  } else if ((value == "Em desenvolvimento") || (value == "Concluido")) {
    label = '<span class="label label-success">' + value + '</span>'
  } else if(value == "Cancelado"){
    label = '<span class="label label-danger">' + value + '</span>'
  }

  return label;
}

function myCustomPlans(value, row, index) {
  var content;

  if (value == "eco") {
    content = "<span style='color: #4caf50'>" + value + "</span>";
  } else if (value == "premium") {
    content = "<span style='color: #fbc02d'>" + value + "</span>";
  } else {
    content = "<span style='color: #03a9f4'>" + value + "</span>";
  }

  return content;
}

function myCustomButton(value, row, index) {
  var more = '<div class="col-md-3 dropdown">' +
    '<a href="#" class="btn btn-custom btn-fab btn-fab-mini btn-round dropdown-toggle" data-toggle="dropdown">' +
    '<i class="material-icons">settings</i>' +
    '</a>' +
    '<ul class="dropdown-menu">' +
    '<li><a class="btn-modal-editar-projeto">Editar</a></li>' +
    '<li><a >Ver</a></li>' +
    '</ul>' +
    '</div>';
  return more;
}
