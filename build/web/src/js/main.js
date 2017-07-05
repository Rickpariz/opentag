$(document).ready(function () {

    // material kit
    // Init Material scripts for buttons ripples, inputs animations etc, more info on the next link https://github.com/FezVrasta/bootstrap-material-design#materialjs
    $.material.init();
    function validateEmail(email) {
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    }

    function mostraMsg(msg) {
        $("#msg").text(msg);
        $("#erro").removeClass("hidden");
        setTimeout(function () {
            $("#erro").addClass("hidden");
        }, 2000);
    }
    function verificaCadastroUsuario() {
        var nome = $("#nome");
        var email = $("#email");
        var senha = $("#senha");
        var senhaNovamente = $("#senha-novamente");
        var msg;

        if (nome.val() !== "") {
            if (nome.val().length <= 5) {
                msg = "Nome pequeno !";
                mostraMsg(msg);
                return false;
            }
        }

        if (email.val() !== "") {
            if (!validateEmail(email.val())) {
                msg = "Email invalido !";
                mostraMsg(msg);
                return false;
            }
        }

        if (senhaNovamente.val() !== "") {
            if (senha.val() === senhaNovamente.val()) {
                return true;
            } else {
                msg = "Senhas incompatíveis";
                mostraMsg(msg);
                return false;
            }
        }
    }

    // Izi Modais e suas configurações
    $("#div-modal-cadastro").iziModal({
        title: 'Cadastro', // reescrita
        subtitle: 'Faça seu cadastro para solicitar os nossos serviços', // reescrita
        headerColor: '#b08064', // reescrita
        focusInput: false,
        icon: "fa fa-user-circle", // reescrita
        history: false, // reescrita
        onOpened: function (modal) {
            var nome = $("#nome");
            var email = $("#email");
            var senha = $("#senha");
            var senhaNovamente = $("#senha-novamente");

            nome.blur(function () {
                console.log("Entrou no blur nome");
                if (nome.val() !== "") {
                    console.log("Nome Não está vazio");
                    if (verificaCadastroUsuario()) {
                        console.log("Passou pelas verificações");
                        $("#btn-cadastro-usuario").attr("disabled", false);
                    }
                } else {
                    var msg = "Preencha o usuario";
                    mostraMsg(msg);
                }
            });

            email.blur(function () {
                console.log("Entrou no blur email");
                if (nome.val() !== "") {
                    console.log("email Não está vazio");
                    if (verificaCadastroUsuario()) {
                        console.log("Passou pelas verificações");
                        $("#btn-cadastro-usuario").attr("disabled", false);
                    }
                } else {
                    var msg = "Preencha o Email";
                    mostraMsg(msg);
                }
            });

            senha.blur(function () {
                console.log("Entrou no blur senha");
                if (senha.val() !== "") {
                    console.log("Senha Não está vazio");
                    if (verificaCadastroUsuario()) {
                        console.log("Passou pelas verificações");
                        $("#btn-cadastro-usuario").attr("disabled", false);
                    }
                } else {
                    var msg = "Preencha a Senha";
                    mostraMsg(msg);
                }
            });

            senhaNovamente.blur(function () {
                console.log("Entrou no blur senhaNovamente");
                if (senhaNovamente.val() !== "") {
                    console.log("SenhaNovamente Não está vazio");
                    if (verificaCadastroUsuario()) {
                        console.log("Passou pelas verificações");
                        $("#btn-cadastro-usuario").attr("disabled", false);
                    }
                } else {
                    var msg = "Preencha a Senha Novamente";
                    mostraMsg(msg);
                }
            });
        }
    });

    $("#div-modal-login").iziModal({
        title: 'Login', // reescrita
        subtitle: 'Faça seu login e acompanhe nosso trabalho', // reescrita
        headerColor: '#b08064', // reescrita
        focusInput: false,
        icon: "fa fa-user-circle", // reescrita
        history: false, // reescrita
    });

    $("#btn-modal-cadastro").click(function () {
        console.log("abriu cadastro");
        $("#div-modal-cadastro").iziModal("open");
    });

    $("#btn-modal-login").click(function () {
        console.log("abriu login");
        $("#div-modal-login").iziModal("open");
    });


});
