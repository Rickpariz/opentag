$(document).ready(function(){
  $("#div-modal-projeto").iziModal({
    title: 'Projeto', // reescrita
    subtitle: 'Descreva seu projeto e escolha o plano ideal !', // reescrita
    headerColor: '#b08064', // reescrita
    icon: "fa fa-folder-open-o", // reescrita
    history: false, // reescrita
  });

  $("#btn-modal-projeto").click(function(){
    $("#div-modal-projeto").iziModal("open");
  });

});
