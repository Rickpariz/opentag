$(document).ready(function () {
  $.material.init();
  // renderização das imagens
  renderizarImagens();
  function renderizarImagens(){
    imgs = $("img");
    imgs.each(function(){
      var caminho = $(this).attr("data-image");
      $(this).attr("src", caminho + "?q=" + moment().millisecond());
    });
  }

  $("#button-nav").click(function(){
    console.log("foi");
    $(".struct .row .col-nav").toggleClass("sidenav-bar");
    $(".struct .row .col-nav").toggleClass("opening");
  });
});
