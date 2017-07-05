$(document).ready(function () {
    $("#login-usuarios").on("submit", function (e) {
        e.preventDefault();
        $("#btn-login-usuario").attr("disabled", true);
        var dados = $(this).serialize();
        var url = "tag";

        $.ajax({
            url: url,
            type: "POST",
            data: dados,
            success: function (json) {
                if (json.status === true) {
                    window.location.href = json.message;
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
                $("#btn-login-usuario").attr("disabled", false);
            }
        });
    });
});