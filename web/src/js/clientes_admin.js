var modal = $("#modal-editar-cliente");
$(document).ready(function() {
  // iiziModal para editar cliente
  modal.iziModal({
    title: 'Cliente', // reescrita
    subtitle: 'Realize as edições com cuidado', // reescrita
    headerColor: '#b08064', // reescrita
    focusInput: false,
    icon: "fa fa-user", // reescrita
    history: false, // reescrita
    onClosing: function() {
      modal.find(".iziModal-loader").css({
        "opacity": "1"
      });
      modal.find(".iziModal-loader").toggle();
    }
  });

  // Criação do data table bootstrap
  $.ajax({
    url: "/opentag/tag",
    method: "get",
    data: {
      "execute": "SearchUsers"
    },
    success: function(json) {
      $("#clientes").bootstrapTable({
        data: json,
        search: true,
        pagination: true,
        pageSize: 4,
        cache: false
      });
      myStyleTable();
    }
  });

  function myStyleTable() {
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

});

window.actionEvents = {
  'click .btn-modal-editar-cliente': function(e, value, row, index) {
    modal.iziModal("open");
    modal.iziModal("startLoading");
    $.ajax({
      url: "/opentag/tag",
      method: "get",
      data: {
        "execute": "SearchUserById",
        "id": row.id
      },
      success: function(json) {
        $("#nome-usuario").val(json.name);
        $("#email-usuario").val(json.email);
        $("#acesso").find("option").filter("[value='" + json.access + "']").prop("selected", true);

        atualizaCliente(row);
      },
      error: function() {
        alert("Erro ao carregar dados do projeto");
      },
      complete: function() {
        modal.find(".iziModal-loader").css({
          "transition": "opacity 1s",
          "opacity": "0"
        });
        setTimeout(function() {
          modal.find(".iziModal-loader").toggle();
        }, 1000);
      }
    });
  }
}

function customAccess(value, row, index) {
  var label;
  if (value == "liberado") {
    label = '<span class="label label-success">' + value + '</span>';
  } else {
    label = '<span class="label label-danger">' + value + '</span>';
  }
  return label;
}

function customButton(value, row, index) {
  var more = '<div class="col-md-3 dropdown">' +
    '<a href="#" class="btn btn-custom btn-fab btn-fab-mini btn-round dropdown-toggle" data-toggle="dropdown">' +
    '<i class="material-icons">settings</i>' +
    '</a>' +
    '<ul class="dropdown-menu">' +
    '<li><a class="btn-modal-editar-cliente">Editar</a></li>' +
    '</ul>' +
    '</div>';
  return more;
}

function atualizaCliente(row) {
  $("#editar-cliente").on("submit", function(e) {
    e.preventDefault();
    swal({
        title: "Você tem certeza ?",
        text: "Deseja mesmo editar o cliente ?!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Sim",
        closeOnConfirm: false
      },
      function() {
        var data = {
          "execute": "UpdateAccessClient",
          "id": row.id,
          "nome": row.name,
          "email": row.email,
          "acesso": $("#acesso").val()
        };
        $.ajax({
          url: "/opentag/tag",
          method: "post",
          data: data,
          success: function(data) {
            var object = data.objects[0];
            $("#clientes").bootstrapTable("updateByUniqueId", {
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
          }
        });
      });
  });
}
