/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    function cadastrarUsuario(url, dados){
        $.ajax({
            url: url,
            type: "POST",
            data: dados,
            success: function (json) {
                if (json.status === true) {
                    $("#cadastro-usuario").each(function () {
                        this.reset();
                    });
                    $("#div-modal-cadastro").iziModal("close");
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
            error: function () {
                iziToast.error({
                    title: 'Erro',
                    message: "Erro ao fazer requisição",
                    icon: "fa fa-times"
                });
            },
            complete: function () {
                $("#btn-cadastro-usuario").attr("disabled", false);
            }
        });
    }
    $("#cadastro-usuario").on("submit", function (e) {
        e.preventDefault();
        $("#btn-cadastro-usuario").attr("disabled", true);
        var dados = $(this).serialize();
        var url = "tag";        
        cadastrarUsuario(url, dados);
    });
});