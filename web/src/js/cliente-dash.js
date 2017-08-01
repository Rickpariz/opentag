$(document).ready(function() {
  $("#div-modal-projeto").iziModal({
    title: 'Projeto', // reescrita
    subtitle: 'Descreva seu projeto e escolha o plano ideal !', // reescrita
    headerColor: '#b08064', // reescrita
    icon: "fa fa-folder-open-o", // reescrita
    history: false, // reescrita
    onOpened: function() {
      $("#novo-projeto").on("submit", function(e) {
        e.preventDefault();
        $("#btn-solicitar").attr("disabled", true);
        var data = $(this).serialize();
        console.log(data);
        $.ajax({
          url: "tag",
          method: "post",
          data: data,
          success: function(json) {
            if (json.status === true) {
              $("#novo-projeto").each(function() {
                this.reset();
              });
              $("#div-modal-projeto").iziModal("close");
              iziToast.success({
                title: 'Ok',
                message: json.message,
                icon: "fa fa-check"
              });
            } else {
              iziToast.error({
                title: 'Erro',
                message: json.message,
                icon: "fa fa-times"
              });
            }
          },
          error: function(json) {
            iziToast.error({
              title: 'Erro',
              message: "Erro ao fazer requisição",
              icon: "fa fa-times"
            });
          },
          complete: function() {
            $("#btn-solicitar").attr("disabled", false);
          }
        });
      });
    }
  });

  $("#btn-modal-projeto").click(function() {
    $("#div-modal-projeto").iziModal("open");
  });



});
