$(document).ready(function() {

  $.ajax({
    url: "/opentagv.1/tag",
    method: 'get',
    data: {
      "execute": "SearchProjects"
    },
    success: function(json) {
      $("#projetos").bootstrapTable({
        data: json,
        search: true,
        pagination: true,
        pageSize: 3,
        cache: false
      });

      myStyleTable();


    }
  });
});


function myStyleTable(){
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
  if ((value == "Esperando Confirmação") || (value == "Processando pagamento")) {
    label = '<span class="label label-info">' + value + '</span>';
  } else if (value == "Pagamento em aberto") {
    label = '<span class="label label-warning">' + value + '</span>'
  } else if ((value == "Em desenvolvimento") || (value == "Concluido")) {
    label = '<span class="label label-success">' + value + '</span>'
  } else {
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
    '<li><a href="#">Editar</a></li>' +
    '<li><a href="#">Ver</a></li>' +
    '</ul>' +
    '</div>';
  return more;
}
